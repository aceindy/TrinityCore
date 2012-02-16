 /*
* This program is free software; you can redistribute it and/or modify it
* under the terms of the GNU General Public License as published by the
* Free Software Foundation; either version 2 of the License, or (at your
* option) any later version.
*
* This program is distributed in the hope that it will be useful, but WITHOUT
* ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
* FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
* more details.
*
* You should have received a copy of the GNU General Public License along
* with this program. If not, see <http://www.gnu.org/licenses/>.
*/

#include "ScriptPCH.h"
#include "shadowfang_keep.h"
#include "LFGMgr.h"
#include "Group.h"

enum Yells
{
    SAY_AGGRO_1 = -1033020,
    SAY_AGGRO_2 = -1033021,
    SAY_AGGRO_3 = -1033022,
    SAY_CALL_BAXTER = -1033023,
    SAY_CALL_FRYE = -1033024,
    SAY_SUMMON_ADDS = -1033025,
    SAY_DEATH = -1033026,
	SAY_BAXTER_DEATH = -1033027,
	SAY_FRYE_DEATH = -1033028
};

enum Creatures
{
    NPC_CRAZED_APOTHECARY = 36568,
    NPC_VIAL_BUNNY = 36530,
};

enum Spells
{
    SPELL_ALLURING_PERFUME              = 68589,
    SPELL_ALLURING_PERFUME_SPRAY        = 68607,
    SPELL_ALLURING_PERFUME_IMMUNE       = 68529,

    SPELL_IRRESISTIBLE_COLOGNE          = 68946,
    SPELL_IRRESISTIBLE_COLOGNE_SPRAY    = 68948,
    SPELL_IRRESISTIBLE_COLOGNE_IMMUNE   = 68530,

    SPELL_TABLE_APPEAR                  = 69216,
    SPELL_SUMMON_TABLE                  = 69218,
    SPELL_CHAIN_REACTION                = 68821,
    SPELL_UNSTABLE_REACTION             = 68957,

    // Frye
    SPELL_THROW_PERFUME                 = 68799,
    SPELL_THROW_COLOGNE                 = 68841,
    SPELL_ALLURING_PERFUME_SPILL        = 68798,
    SPELL_IRRESISTIBLE_COLOGNE_SPILL    = 68614,
};

enum Action
{
    ACTION_START_INTRO,
    ACTION_START_FIGHT,
    ACTION_APOTHECARY_DIED,
};

enum Phase
{
    PHASE_NORMAL,
    PHASE_INTRO
};

enum Misc
{
    FACTION_HOSTIL = 14,
};

enum Points
{
    POINT_FRYE_MOVE     = 1,
    POINT_BAXTER_MOVE   = 2,
};

Position const FryeMove = {-197.142975f, 2198.747314f, 79.763405f, 5.1f};
Position const BaxterMove = {-220.508622f, 2205.820068f, 79.763405f, 3.7f};

static Position Loc[]=
{
    // Spawn
    {-215.776443f, 2242.365479f, 79.769257f, 0.0f},
    {-169.500702f, 2219.286377f, 80.613045f, 0.0f},
    {-200.056641f, 2152.635010f, 79.763107f, 0.0f},
    {-238.448242f, 2165.165283f, 89.582985f, 0.0f},
    // Move to
    {-210.784164f, 2219.004150f, 79.761803f, 0.0f},
    {-198.453400f, 2208.410889f, 79.762474f, 0.0f},
    {-208.469910f, 2167.971924f, 79.764969f, 0.0f},
    {-228.251511f, 2187.282471f, 79.762840f, 0.0f}
};

#define GOSSIP_ITEM_START "Begin the battle."

class npc_apothecary_hummel : public CreatureScript
{
    public:
        npc_apothecary_hummel() : CreatureScript("npc_apothecary_hummel") { }

        bool OnGossipHello(Player* player, Creature* creature)
        {
            if (creature->isQuestGiver())
                player->PrepareQuestMenu(creature->GetGUID());

            //if ((!player->GetGroup() || !player->GetGroup()->IsLeader(player->GetGUID())) && !player->isGameMaster())
                //return false;

            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_START, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
            return true;
        }

        bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
        {
            if (action == GOSSIP_ACTION_INFO_DEF + 1)
                creature->AI()->DoAction(ACTION_START_INTRO);

            player->CLOSE_GOSSIP_MENU();
            return true;
        }

        struct npc_apothecary_hummelAI : public ScriptedAI
        {
            npc_apothecary_hummelAI(Creature* creature) : ScriptedAI(creature), Summons(me)
            {
                Instance = creature->GetInstanceScript();
            }

            void Reset()
            {
                me->RestoreFaction();
                me->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
                Phase = PHASE_NORMAL;
                Step = 0;
                DeadCount = 0;
                SprayTimer = urand(4000, 7000);
                ChainReactionTimer = urand(10000, 25000);
                FirstCrazed = false;

                me->SetCorpseDelay(900);
                Summons.DespawnAll();

                if (!Instance)
                    return;

                Instance->SetData(TYPE_CROWN, NOT_STARTED);

                if (Creature* Baxter = ObjectAccessor::GetCreature(*me, Instance->GetData64(DATA_BAXTER)))
                {
                    if (Baxter->isAlive())
                        Baxter->AI()->EnterEvadeMode();
                    else
                        Baxter->Respawn();
                }

                if (Creature* Frye = ObjectAccessor::GetCreature(*me, Instance->GetData64(DATA_FRYE)))
                {
                    if (Frye->isAlive())
                        Frye->AI()->EnterEvadeMode();
                    else
                        Frye->Respawn();
                }
                me->CastSpell(me, SPELL_ALLURING_PERFUME);
            }

            void DoAction(int32 const action)
            {
                switch (action)
                {
                    case ACTION_START_INTRO:
                    {
                        me->CastSpell(me, SPELL_ALLURING_PERFUME);
                        if (Creature* Baxter = ObjectAccessor::GetCreature(*me, Instance? Instance->GetData64(DATA_BAXTER) : 0))
                            Baxter->AI()->DoAction(ACTION_START_INTRO);
                        if (Creature* Frye = ObjectAccessor::GetCreature(*me, Instance ? Instance->GetData64(DATA_FRYE) : 0))
                            Frye->AI()->DoAction(ACTION_START_INTRO);

                        Phase = PHASE_INTRO;
                        StepTimer = 1500;
                        me->SetReactState(REACT_PASSIVE);
                        me->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
                        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                        break;
                    }
                    case ACTION_START_FIGHT:
                    {
                        Phase = PHASE_NORMAL;
                        me->setFaction(FACTION_HOSTIL);
                        me->SetReactState(REACT_AGGRESSIVE);
                        me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                        Instance->SetData(TYPE_CROWN, IN_PROGRESS);
                        break;
                    }
                    case ACTION_APOTHECARY_DIED:
                    {
                        ++DeadCount;
                        if (DeadCount > 2)
                        {
                            Summons.DespawnAll();
                            me->setDeathState(JUST_DIED); // update delay
                            Instance->SetData(TYPE_CROWN, DONE);
                            me->SetFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_LOOTABLE);

                            Map* map = me->GetMap();
                            if (map && map->IsDungeon())
                            {
                                Map::PlayerList const& players = map->GetPlayers();
                                if (!players.isEmpty())
                                    for (Map::PlayerList::const_iterator i = players.begin(); i != players.end(); ++i)
                                        if (Player* player = i->getSource())
                                            if (player->GetDistance(me) < 120.0f)
                                                sLFGMgr->RewardDungeonDoneFor(288, player);
                            }
                        }
                        else
                        {
                            if (me->HasFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_LOOTABLE))
                                me->RemoveFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_LOOTABLE);
                        }
                        break;
                    }
                    case ACTION_SPAWN_CRAZED:
                    {
                        uint8 i = urand(0, 3);
                        if (Creature* crazed = me->SummonCreature(NPC_CRAZED_APOTHECARY, Loc[i], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 3*IN_MILLISECONDS))
                        {
                            crazed->setFaction(FACTION_HOSTIL);
                            crazed->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                            crazed->GetMotionMaster()->MovePoint(1, Loc[i + 4]);
                        }

                        if (!FirstCrazed)
                        {
                            DoScriptText(SAY_SUMMON_ADDS, me);
                            FirstCrazed = true;
                        }
                        break;
                    }
                }
            }

            void UpdateAI(uint32 const diff)
            {
                if (Phase == PHASE_INTRO)
                {
                    if (StepTimer <= diff)
                    {
                        ++Step;
                        switch (Step)
                        {
                            case 1:
                            {
                                DoScriptText(SAY_AGGRO_1, me);
                                StepTimer = 4000;
                                break;
                            }
                            case 2:
                            {
                                DoScriptText(SAY_AGGRO_2, me);
                                StepTimer = 5500;
                                break;
                            }
                            case 3:
                            {
                                DoScriptText(SAY_AGGRO_3, me);
                                StepTimer = 1000;
                                break;
                            }
                            case 4:
                            {
                                DoAction(ACTION_START_FIGHT);
                                break;
                            }
                        }
                    }
                    else
                        StepTimer -= diff;
                }
                else
                {
                    if (!UpdateVictim())
                        return;

                    if (me->HasUnitState(UNIT_STATE_CASTING))
                        return;

                    if (ChainReactionTimer <= diff)
                    {
                        DoCast(me, SPELL_TABLE_APPEAR, true);
                        DoCast(me, SPELL_SUMMON_TABLE, true);
                        DoCast(SPELL_CHAIN_REACTION);
                        ChainReactionTimer = urand(15000, 25000);
                    }
                    else
                        ChainReactionTimer -= diff;

                    if (SprayTimer <= diff)
                    {
                        DoCastVictim(SPELL_ALLURING_PERFUME_SPRAY);
                        SprayTimer = urand(3000, 5000);
                    }
                    else
                        SprayTimer -= diff;

                    DoMeleeAttackIfReady();
                }
            }

            void JustSummoned(Creature* summon)
            {
                Summons.Summon(summon);
            }

            void JustDied(Unit* /*killer*/)
            {
                DoAction(ACTION_APOTHECARY_DIED);
                DoScriptText(SAY_DEATH, me);
            }

        private:
            InstanceScript* Instance;
            SummonList Summons;
            uint8 DeadCount;
            uint8 Phase;
            uint8 Step;
            uint32 StepTimer;
            uint32 SprayTimer;
            uint32 ChainReactionTimer;
            bool FirstCrazed;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_apothecary_hummelAI(creature);
        }
};


class npc_apothecary_baxter : public CreatureScript
{
    public:
        npc_apothecary_baxter() : CreatureScript("npc_apothecary_baxter") { }

        struct npc_apothecary_baxterAI : public ScriptedAI
        {
            npc_apothecary_baxterAI(Creature* creature) : ScriptedAI(creature)
            {
                Instance = creature->GetInstanceScript();
            }

            void Reset()
            {
                me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_NONE);
                me->CastSpell(me, SPELL_IRRESISTIBLE_COLOGNE);
                me->RestoreFaction();
                SprayTimer = urand(4000, 7000);
                ChainReactionTimer = urand (10000, 25000);
                Phase = PHASE_NORMAL;

                if (Creature* Hummel = ObjectAccessor::GetCreature(*me, Instance ? Instance->GetData64(DATA_HUMMEL) : 0))
                {
                    if (Hummel->isAlive())
                        Hummel->AI()->EnterEvadeMode();
                    else
                        Hummel->Respawn();
                }
            }
            
            void MovementInform(uint32 type, uint32 id)
            {
                if (type != POINT_MOTION_TYPE)
                    return;

                switch (id)
                {
                    case POINT_BAXTER_MOVE:
                        me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_ONESHOT_SPELL_CAST);
                        break;
                    default:
                        break;
                }
            }

            void DoAction(int32 const action)
            {
                switch (action)
                {
                    case ACTION_START_INTRO:
                    {
						me->CastSpell(me, SPELL_IRRESISTIBLE_COLOGNE);
                        me->GetMotionMaster()->MovePoint(POINT_BAXTER_MOVE, BaxterMove);
                        WaitTimer = 20000;
                        Phase = PHASE_INTRO;
                        break;
                    }
                    case ACTION_START_FIGHT:
                    {
                        if (Creature* hummel = ObjectAccessor::GetCreature(*me, Instance ? Instance->GetData64(DATA_HUMMEL) : 0))
                            DoScriptText(SAY_CALL_BAXTER, hummel);

                        Phase = PHASE_NORMAL;
                        me->setFaction(FACTION_HOSTIL);
                        me->SetInCombatWithZone();
                        break;
                    }
                }
            }

            void UpdateAI(uint32 const diff)
            {
                if (Phase == PHASE_INTRO)
                {
                    if (WaitTimer <= diff)
                    {
                        DoAction(ACTION_START_FIGHT);
                    }
                    else
                        WaitTimer -= diff;
                }
                else
                {
                    if (!UpdateVictim())
                        return;

                    if (me->HasUnitState(UNIT_STATE_CASTING))
                        return;

                    if (ChainReactionTimer <= diff)
                    {
                        DoCast(me, SPELL_TABLE_APPEAR, true);
                        DoCast(me, SPELL_SUMMON_TABLE, true);
                        DoCast(SPELL_CHAIN_REACTION);
                        ChainReactionTimer = urand(15000, 25000);
                    }
                    else
                        ChainReactionTimer -= diff;

                    if (SprayTimer <= diff)
                    {
                        DoCastVictim(SPELL_IRRESISTIBLE_COLOGNE_SPRAY);
                        SprayTimer = urand(4000, 5000);
                    }
                    else
                        SprayTimer -= diff;

                    DoMeleeAttackIfReady();
                }
            }

            void JustDied(Unit* /*killer*/)
            {
                if (Creature* Hummel = ObjectAccessor::GetCreature(*me, Instance ? Instance->GetData64(DATA_HUMMEL) : 0))
                    Hummel->AI()->DoAction(ACTION_APOTHECARY_DIED);
					
				DoScriptText(SAY_BAXTER_DEATH, me);
            }

        private:
            InstanceScript* Instance;
            uint32 ChainReactionTimer;
            uint32 SprayTimer;
            uint32 WaitTimer;
            uint8 Phase;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_apothecary_baxterAI(creature);
        }
};

class npc_apothecary_frye : public CreatureScript
{
    public:
        npc_apothecary_frye() : CreatureScript("npc_apothecary_frye") { }

        struct npc_apothecary_fryeAI : public ScriptedAI
        {
            npc_apothecary_fryeAI(Creature* creature) : ScriptedAI(creature)
            {
                me->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_TAUNT, true);
                me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_ATTACK_ME, true);
                Instance = creature->GetInstanceScript();
            }

            void Reset()
            {
                me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_NONE);
                me->RestoreFaction();
                ThrowTimer = urand(2000, 4000);
                TargetSwitchTimer = urand(1000, 2000);
                Phase = PHASE_NORMAL;

                if (Creature* Hummel = ObjectAccessor::GetCreature(*me, Instance ? Instance->GetData64(DATA_HUMMEL) : 0))
                {
                    if (Hummel->isAlive())
                        Hummel->AI()->EnterEvadeMode();
                    else
                        Hummel->Respawn();
                }
            }

            void DoAction(int32 const action)
            {
                switch (action)
                {
                    case ACTION_START_INTRO:
                    {
                        me->GetMotionMaster()->MovePoint(POINT_FRYE_MOVE, FryeMove);
                        WaitTimer = 28000;
                        Phase = PHASE_INTRO;
                        break;
                    }
                    case ACTION_START_FIGHT:
                    {
                        if (Creature* Hummel = ObjectAccessor::GetCreature(*me, Instance ? Instance->GetData64(DATA_HUMMEL) : 0))
                            DoScriptText(SAY_CALL_FRYE, Hummel);

                        Phase = PHASE_NORMAL;
                        me->setFaction(FACTION_HOSTIL);
                        me->SetInCombatWithZone();
                        break;
                    }
                }
            }

            void MovementInform(uint32 type, uint32 id)
            {
                if (type != POINT_MOTION_TYPE)
                    return;

                switch (id)
                {
                    case POINT_FRYE_MOVE:
                        me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_ONESHOT_SPELL_CAST);
                        break;
                    default:
                        break;
                }
            }

            void SummonBunny(Unit* target, bool perfume)
            {
                if (!target)
                    return;

                if (Creature* Bunny = me->SummonCreature(NPC_VIAL_BUNNY, *target, TEMPSUMMON_TIMED_DESPAWN, 25*IN_MILLISECONDS))
                {
                    Bunny->setFaction(FACTION_HOSTIL);
                    Bunny->SetReactState(REACT_PASSIVE);
                    Bunny->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_NON_ATTACKABLE |UNIT_FLAG_NOT_SELECTABLE);
                    Bunny->CastSpell(Bunny, perfume ? SPELL_ALLURING_PERFUME_SPILL : SPELL_IRRESISTIBLE_COLOGNE_SPILL, true, NULL, NULL, me->GetGUID());
                }
            }

            void SpellHitTarget(Unit* target, SpellInfo const* spell)
            {
                switch (spell->Id)
                {
                    case SPELL_THROW_PERFUME:
                        SummonBunny(target, true);
                        break;
                    case SPELL_THROW_COLOGNE:
                        SummonBunny(target, false);
                        break;
                }
            }

            void UpdateAI(uint32 const diff)
            {
                if (Phase == PHASE_INTRO)
                {
                    if (WaitTimer <= diff)
                    {
                        DoAction(ACTION_START_FIGHT);
                    }
                    else
                        WaitTimer -= diff;
                }
                else
                {
                    if (!UpdateVictim())
                        return;

                    if (ThrowTimer <= diff)
                    {
                        if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                            DoCast(target, urand(0, 1) ? SPELL_THROW_PERFUME : SPELL_THROW_COLOGNE);
                        ThrowTimer = urand(5000, 7500);
                    }
                    else
                        ThrowTimer -= diff;

                    if (TargetSwitchTimer <= diff)
                    {
                        if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 1, 100, true))
                        {
                            me->getThreatManager().modifyThreatPercent(me->getVictim(), -100);
                            me->AddThreat(target, 9999999.9f);
                        }
                        TargetSwitchTimer = urand(5000, 10000);
                    }
                    else
                        TargetSwitchTimer -= diff;

                    DoMeleeAttackIfReady();
                }
            }

            void JustDied(Unit* /*killer*/)
            {
                if (Creature* Hummel = ObjectAccessor::GetCreature(*me, Instance ? Instance->GetData64(DATA_HUMMEL) : 0))
                    Hummel->AI()->DoAction(ACTION_APOTHECARY_DIED);
					
				DoScriptText(SAY_FRYE_DEATH, me);
            }

        private:
            InstanceScript* Instance;
            uint32 TargetSwitchTimer;
            uint32 ThrowTimer;
            uint32 WaitTimer;
            uint8 Phase;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_apothecary_fryeAI(creature);
        }
};

class npc_crazed_apothecary : public CreatureScript
{
    public:
        npc_crazed_apothecary() : CreatureScript("npc_crazed_apothecary") { }

        struct npc_crazed_apothecaryAI : public ScriptedAI
        {
            npc_crazed_apothecaryAI(Creature* creature) : ScriptedAI(creature) 
            { 
                me->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_TAUNT, true);
                me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_ATTACK_ME, true);
                me->SetReactState(REACT_PASSIVE);
            }

            void MovementInform(uint32 type, uint32 id)
            {
                if (type != POINT_MOTION_TYPE)
                    return;

                me->SetInCombatWithZone();

                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 150.0f, true))
                {
                    ExplodeTimer = urand (2500, 5000);
                    me->GetMotionMaster()->MoveFollow(target, 0.0f, float(2*M_PI*rand_norm()));
                }
                else
                    me->DespawnOrUnsummon();
            }

            void UpdateAI(uint32 const diff)
            {
                if (!UpdateVictim())
                    return;

                if (ExplodeTimer <= diff)
                {
                    DoCast(me, SPELL_UNSTABLE_REACTION, true);
                }
                else
                    ExplodeTimer -= diff;
            }

        private:
            uint32 ExplodeTimer;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_crazed_apothecaryAI(creature);
        }
};

void AddSC_boss_apothecary_trio()
{
    new npc_apothecary_hummel();
    new npc_apothecary_baxter();
    new npc_apothecary_frye();
    new npc_crazed_apothecary();
}