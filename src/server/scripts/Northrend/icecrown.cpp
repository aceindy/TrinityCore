/*
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2006-2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 *
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

/* ScriptData
SDName: Icecrown
SD%Complete: 100
SDComment: Quest support: 12807
SDCategory: Icecrown
EndScriptData */

/* ContentData
npc_arete
EndContentData */

#include "ScriptPCH.h"

/*######
## npc_arete
######*/

#define GOSSIP_ARETE_ITEM1 "Lord-Commander, I would hear your tale."
#define GOSSIP_ARETE_ITEM2 "<You nod slightly but do not complete the motion as the Lord-Commander narrows his eyes before he continues.>"
#define GOSSIP_ARETE_ITEM3 "I thought that they now called themselves the Scarlet Onslaught?"
#define GOSSIP_ARETE_ITEM4 "Where did the grand admiral go?"
#define GOSSIP_ARETE_ITEM5 "That's fine. When do I start?"
#define GOSSIP_ARETE_ITEM6 "Let's finish this!"
#define GOSSIP_ARETE_ITEM7 "That's quite a tale, Lord-Commander."

enum eArete
{
    GOSSIP_TEXTID_ARETE1        = 13525,
    GOSSIP_TEXTID_ARETE2        = 13526,
    GOSSIP_TEXTID_ARETE3        = 13527,
    GOSSIP_TEXTID_ARETE4        = 13528,
    GOSSIP_TEXTID_ARETE5        = 13529,
    GOSSIP_TEXTID_ARETE6        = 13530,
    GOSSIP_TEXTID_ARETE7        = 13531,

    QUEST_THE_STORY_THUS_FAR    = 12807
};

class npc_arete : public CreatureScript
{
public:
    npc_arete() : CreatureScript("npc_arete") { }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (creature->isQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if (player->GetQuestStatus(QUEST_THE_STORY_THUS_FAR) == QUEST_STATUS_INCOMPLETE)
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ARETE_ITEM1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
            player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_ARETE1, creature->GetGUID());
            return true;
        }

        player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*uiSender*/, uint32 uiAction)
    {
        player->PlayerTalkClass->ClearMenus();
        switch (uiAction)
        {
            case GOSSIP_ACTION_INFO_DEF+1:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ARETE_ITEM2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
                player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_ARETE2, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+2:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ARETE_ITEM3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
                player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_ARETE3, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+3:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ARETE_ITEM4, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
                player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_ARETE4, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+4:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ARETE_ITEM5, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);
                player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_ARETE5, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+5:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ARETE_ITEM6, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 6);
                player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_ARETE6, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+6:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ARETE_ITEM7, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 7);
                player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_ARETE7, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+7:
                player->CLOSE_GOSSIP_MENU();
                player->AreaExploredOrEventHappens(QUEST_THE_STORY_THUS_FAR);
                break;
        }

        return true;
    }
};

/*######
## npc_squire_david
######*/

enum eSquireDavid
{
    QUEST_THE_ASPIRANT_S_CHALLENGE_H                    = 13680,
    QUEST_THE_ASPIRANT_S_CHALLENGE_A                    = 13679,

    NPC_ARGENT_VALIANT                                  = 33448,

    GOSSIP_TEXTID_SQUIRE                                = 14407
};

#define GOSSIP_SQUIRE_ITEM_1 "I am ready to fight!"
#define GOSSIP_SQUIRE_ITEM_2 "How do the Argent Crusader raiders fight?"

class npc_squire_david : public CreatureScript
{
public:
    npc_squire_david() : CreatureScript("npc_squire_david") { }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (player->GetQuestStatus(QUEST_THE_ASPIRANT_S_CHALLENGE_H) == QUEST_STATUS_INCOMPLETE ||
            player->GetQuestStatus(QUEST_THE_ASPIRANT_S_CHALLENGE_A) == QUEST_STATUS_INCOMPLETE)//We need more info about it.
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SQUIRE_ITEM_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SQUIRE_ITEM_2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
        }

        player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_SQUIRE, creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*uiSender*/, uint32 uiAction)
    {
        player->PlayerTalkClass->ClearMenus();
        if (uiAction == GOSSIP_ACTION_INFO_DEF+1)
        {
            player->CLOSE_GOSSIP_MENU();
            creature->SummonCreature(NPC_ARGENT_VALIANT, 8575.451f, 952.472f, 547.554f, 0.38f);
        }
        return true;
    }
};

/*######
## npc_argent_valiant
######*/

enum eArgentValiant
{
    SPELL_CHARGE                = 63010,
    SPELL_SHIELD_BREAKER        = 65147,

    NPC_ARGENT_VALIANT_CREDIT   = 24108
};

class npc_argent_valiant : public CreatureScript
{
public:
    npc_argent_valiant() : CreatureScript("npc_argent_valiant") { }

    struct npc_argent_valiantAI : public ScriptedAI
    {
        npc_argent_valiantAI(Creature* creature) : ScriptedAI(creature)
        {
            creature->GetMotionMaster()->MovePoint(0, 8599.258f, 963.951f, 547.553f);
            creature->setFaction(35); //wrong faction in db?
        }

        uint32 uiChargeTimer;
        uint32 uiShieldBreakerTimer;

        void Reset()
        {
            uiChargeTimer = 7000;
            uiShieldBreakerTimer = 10000;
        }

        void MovementInform(uint32 uiType, uint32 /*uiId*/)
        {
            if (uiType != POINT_MOTION_TYPE)
                return;

            me->setFaction(14);
        }

        void DamageTaken(Unit* pDoneBy, uint32& uiDamage)
        {
            if (uiDamage > me->GetHealth() && pDoneBy->GetTypeId() == TYPEID_PLAYER)
            {
                uiDamage = 0;
                CAST_PLR(pDoneBy)->KilledMonsterCredit(NPC_ARGENT_VALIANT_CREDIT, 0);
                me->setFaction(35);
                me->DespawnOrUnsummon(5000);
                me->SetHomePosition(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), me->GetOrientation());
                EnterEvadeMode();
            }
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (uiChargeTimer <= uiDiff)
            {
                DoCastVictim(SPELL_CHARGE);
                uiChargeTimer = 7000;
            } else uiChargeTimer -= uiDiff;

            if (uiShieldBreakerTimer <= uiDiff)
            {
                DoCastVictim(SPELL_SHIELD_BREAKER);
                uiShieldBreakerTimer = 10000;
            } else uiShieldBreakerTimer -= uiDiff;

            DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_argent_valiantAI(creature);
    }
};

/*######
## npc_guardian_pavilion
######*/

enum eGuardianPavilion
{
    SPELL_TRESPASSER_H                            = 63987,
    AREA_SUNREAVER_PAVILION                       = 4676,

    AREA_SILVER_COVENANT_PAVILION                 = 4677,
    SPELL_TRESPASSER_A                            = 63986,
};

class npc_guardian_pavilion : public CreatureScript
{
public:
    npc_guardian_pavilion() : CreatureScript("npc_guardian_pavilion") { }

    struct npc_guardian_pavilionAI : public Scripted_NoMovementAI
    {
        npc_guardian_pavilionAI(Creature* creature) : Scripted_NoMovementAI(creature) {}

        void MoveInLineOfSight(Unit* who)
        {
            if (me->GetAreaId() != AREA_SUNREAVER_PAVILION && me->GetAreaId() != AREA_SILVER_COVENANT_PAVILION)
                return;

            if (!who || who->GetTypeId() != TYPEID_PLAYER || !me->IsHostileTo(who) || !me->isInBackInMap(who, 5.0f))
                return;

            if (who->HasAura(SPELL_TRESPASSER_H) || who->HasAura(SPELL_TRESPASSER_A))
                return;

            if (who->ToPlayer()->GetTeamId() == TEAM_ALLIANCE)
                who->CastSpell(who, SPELL_TRESPASSER_H, true);
            else
                who->CastSpell(who, SPELL_TRESPASSER_A, true);

        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_guardian_pavilionAI(creature);
    }
};

/*######
## npc_vereth_the_cunning
######*/

enum eVerethTheCunning
{
    NPC_GEIST_RETURN_BUNNY_KC   = 31049,
    NPC_LITHE_STALKER           = 30894,
    SPELL_SUBDUED_LITHE_STALKER = 58151,
};

class npc_vereth_the_cunning : public CreatureScript
{
public:
    npc_vereth_the_cunning() : CreatureScript("npc_vereth_the_cunning") { }

    struct npc_vereth_the_cunningAI : public ScriptedAI
    {
        npc_vereth_the_cunningAI(Creature* creature) : ScriptedAI(creature) {}

        void MoveInLineOfSight(Unit* who)
        {
            ScriptedAI::MoveInLineOfSight(who);

            if (who->GetEntry() == NPC_LITHE_STALKER && me->IsWithinDistInMap(who, 10.0f))
            {
                if (Unit* owner = who->GetCharmer())
                {
                    if (who->HasAura(SPELL_SUBDUED_LITHE_STALKER))
                        {
                            owner->ToPlayer()->KilledMonsterCredit(NPC_GEIST_RETURN_BUNNY_KC, 0);
                            who->ToCreature()->DisappearAndDie();

                    }
                }
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_vereth_the_cunningAI(creature);
    }
};

/*######
* npc_tournament_training_dummy
######*/
enum TournamentDummy
{
    NPC_CHARGE_TARGET         = 33272,
    NPC_MELEE_TARGET          = 33229,
    NPC_RANGED_TARGET         = 33243,

    SPELL_CHARGE_CREDIT       = 62658,
    SPELL_MELEE_CREDIT        = 62672,
    SPELL_RANGED_CREDIT       = 62673,

    SPELL_PLAYER_THRUST       = 62544,
    SPELL_PLAYER_BREAK_SHIELD = 62626,
    SPELL_PLAYER_CHARGE       = 62874,

    SPELL_RANGED_DEFEND       = 62719,
    SPELL_CHARGE_DEFEND       = 64100,
    SPELL_VULNERABLE          = 62665,

    SPELL_COUNTERATTACK       = 62709,

    EVENT_DUMMY_RECAST_DEFEND = 1,
    EVENT_DUMMY_RESET         = 2,
};

class npc_tournament_training_dummy : public CreatureScript
{
    public:
        npc_tournament_training_dummy(): CreatureScript("npc_tournament_training_dummy"){}

        struct npc_tournament_training_dummyAI : Scripted_NoMovementAI
        {
            npc_tournament_training_dummyAI(Creature* creature) : Scripted_NoMovementAI(creature) {}

            EventMap events;
            bool isVulnerable;

            void Reset()
            {
                me->SetControlled(true, UNIT_STATE_STUNNED);
                me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
                isVulnerable = false;

                // Cast Defend spells to max stack size
                switch (me->GetEntry())
                {
                    case NPC_CHARGE_TARGET:
                        DoCast(SPELL_CHARGE_DEFEND);
                        break;
                    case NPC_RANGED_TARGET:
                        me->CastCustomSpell(SPELL_RANGED_DEFEND, SPELLVALUE_AURA_STACK, 3, me);
                        break;
                }

                events.Reset();
                events.ScheduleEvent(EVENT_DUMMY_RECAST_DEFEND, 5000);
            }

            void EnterEvadeMode()
            {
                if (!_EnterEvadeMode())
                    return;

                Reset();
            }

            void DamageTaken(Unit* /*attacker*/, uint32& damage)
            {
                damage = 0;
                events.RescheduleEvent(EVENT_DUMMY_RESET, 10000);
            }

            void SpellHit(Unit* caster, SpellInfo const* spell)
            {
                switch (me->GetEntry())
                {
                    case NPC_CHARGE_TARGET:
                        if (spell->Id == SPELL_PLAYER_CHARGE)
                            if (isVulnerable)
                                DoCast(caster, SPELL_CHARGE_CREDIT, true);
                        break;
                    case NPC_MELEE_TARGET:
                        if (spell->Id == SPELL_PLAYER_THRUST)
                        {
                            DoCast(caster, SPELL_MELEE_CREDIT, true);

                            if (Unit* target = caster->GetVehicleBase())
                                DoCast(target, SPELL_COUNTERATTACK, true);
                        }
                        break;
                    case NPC_RANGED_TARGET:
                        if (spell->Id == SPELL_PLAYER_BREAK_SHIELD)
                            if (isVulnerable)
                                DoCast(caster, SPELL_RANGED_CREDIT, true);
                        break;
                }

                if (spell->Id == SPELL_PLAYER_BREAK_SHIELD)
                    if (!me->HasAura(SPELL_CHARGE_DEFEND) && !me->HasAura(SPELL_RANGED_DEFEND))
                        isVulnerable = true;
            }

            void UpdateAI(uint32 const diff)
            {
                events.Update(diff);

                switch (events.ExecuteEvent())
                {
                    case EVENT_DUMMY_RECAST_DEFEND:
                        switch (me->GetEntry())
                        {
                            case NPC_CHARGE_TARGET:
                            {
                                if (!me->HasAura(SPELL_CHARGE_DEFEND))
                                    DoCast(SPELL_CHARGE_DEFEND);
                                break;
                            }
                            case NPC_RANGED_TARGET:
                            {
                                Aura* defend = me->GetAura(SPELL_RANGED_DEFEND);
                                if (!defend || defend->GetStackAmount() < 3 || defend->GetDuration() <= 8000)
                                    DoCast(SPELL_RANGED_DEFEND);
                                break;
                            }
                        }
                        isVulnerable = false;
                        events.ScheduleEvent(EVENT_DUMMY_RECAST_DEFEND, 5000);
                        break;
                    case EVENT_DUMMY_RESET:
                        if (UpdateVictim())
                        {
                            EnterEvadeMode();
                            events.ScheduleEvent(EVENT_DUMMY_RESET, 10000);
                        }
                        break;
                }

                if (!UpdateVictim())
                    return;

                if (!me->HasUnitState(UNIT_STATE_STUNNED))
                    me->SetControlled(true, UNIT_STATE_STUNNED);
            }

            void MoveInLineOfSight(Unit* /*who*/){}
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_tournament_training_dummyAI(creature);
        }

};

/*######
## The Grand Melee Quests
######*/
enum Valiant
{
    QUEST_GRAND_MELEE_1                         = 13665,
    QUEST_GRAND_MELEE_2                         = 13745,
    QUEST_GRAND_MELEE_3                         = 13750,
    QUEST_GRAND_MELEE_4                         = 13756,
    QUEST_GRAND_MELEE_5                         = 13761,
    QUEST_GRAND_MELEE_6                         = 13767,
    QUEST_GRAND_MELEE_7                         = 13772,
    QUEST_GRAND_MELEE_8                         = 13777,
    QUEST_GRAND_MELEE_9                         = 13782,
    QUEST_GRAND_MELEE_10                        = 13787,
    MOUNTED_MELEE_VICTORY_GRAND                 = 62724,
    RIDE_VEHICLE                                = 63151,
    LANCE_EQUIPPED                              = 62853,
    CHARGE                                      = 63010,
    SHIELD_BREAKER                              = 65147,
    DEFEND                                      = 62719,
    THRUST                                      = 62544,
    YELLOW_ROSE_FIREWORK                        = 11544,
    PLAYER_ON_TOURNAMENT_MOUNT                  = 63034,
    SHIELD_LEVEL1                               = 63130,
    SHIELD_LEVEL2                               = 63131,
    SHIELD_LEVEL3                               = 63132, 
    
    NPC_STORMWIND_VALIANT                       = 33561,   
    NPC_DARNASSUS_VALIANT                       = 33559,
    NPC_EXODAR_VALIANT                          = 33562,
    NPC_GNOMEREGAN_VALIANT                      = 33558,
    NPC_IRONFORGE_VALIANT                       = 33564,
    NPC_ORGRIMMAR_VALIANT                       = 33306,
    NPC_SENJIN_VALIANT                          = 33285,
    NPC_SILVERMOON_VALIANT                      = 33382,
    NPC_UNDERCITY_VALIANT                       = 33384,
    NPC_THUNDER_BLUFF_VALIANT                   = 33383,
    
};

#define GOSSIP_VALIANT_1_GRAND "I am ready to fight."
#define SAY_START_1_GRAND "On your guard!"
#define SAY_START_2_GRAND "Prepare yourself!"
#define SAY_END_GRAND "I have been defeated. Good Fight !"

class npc_valiant : public CreatureScript
{
    public:
        npc_valiant() : CreatureScript("npc_valiant") { }
  
        struct npc_valiantAI : public ScriptedAI
        {
            Unit* target;
            uint32 SpellTimer,MoviTimer;
            int8 x,y;

            npc_valiantAI(Creature* creature) : ScriptedAI(creature){}
            
            void Reset()
            {
                me->setFaction(35);
                me->SetReactState(REACT_PASSIVE);
                // TODO : Make it reset Auras which are in creatur_addon
            }
         
            void EnterCombat(Unit* who)
            {
                SpellTimer = urand(1000,2000);
                MoviTimer = urand(1000,2000);
            }

            void DamageTaken(Unit* pDoneBy, uint32& uiDamage)
            {
                if (uiDamage > me->GetHealth() && pDoneBy->GetTypeId() == TYPEID_PLAYER)
                {
                    uiDamage = 0;
                    me->CastSpell(me,YELLOW_ROSE_FIREWORK , true);
                    me->MonsterSay(SAY_END_GRAND, LANG_UNIVERSAL, 0);
                    me->setFaction(35);
                    me->DespawnOrUnsummon(4000);
                    target->CastSpell(target, MOUNTED_MELEE_VICTORY_GRAND, true);
                }
            }
            void KilledUnit(Unit* victim)
            {
                Reset();
                EnterEvadeMode();
            }

            void UpdateAI(const uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;
                target = SelectTarget(SELECT_TARGET_TOPAGGRO, 0, 200, true);

                if (SpellTimer<=uiDiff)
                {
                    if (target && me->IsInRange(target,5,40,false))
                    {
                        switch (urand(0,7))
                        {
                            case 0:
                            case 1:
                            case 2:
                                DoCastAOE(SHIELD_BREAKER, true);
                                break;
                            case 3:
                            case 4:
                            case 5:
                            case 6:
                                DoCastAOE(CHARGE, true);
                                break;
                            case 7:
                                me->CastSpell(me, DEFEND, true);
                                break;
                        }
                    }
                    else
                    {
                        switch (urand(0,4))
                        {
                            case 0:
                                me->CastSpell(me, DEFEND, true);
                                break;
                            case 1:
                            case 2:
                            case 3:
                            case 4:
                                DoCastAOE(THRUST, true);
                                break;
                        }
                     }
                    SpellTimer= urand(1000,2000);
                } else
                    SpellTimer -= uiDiff;
                    
                if (MoviTimer<=uiDiff)
                {
                    x = urand(0,7);
                    y = urand(0,7);
                    
                    switch (urand(0,3))
                    {
                         case 0:
                            me->GetMotionMaster()->MovePoint(0, (target->GetPositionX()+x), (target->GetPositionY()+y), target->GetPositionZ());
                            break;
                        case 1:
                            me->GetMotionMaster()->MovePoint(0, (target->GetPositionX()-x), (target->GetPositionY()+y), target->GetPositionZ());
                            break;
                        case 2:
                            me->GetMotionMaster()->MovePoint(0, (target->GetPositionX()+x), (target->GetPositionY()-y), target->GetPositionZ());
                            break;
                        case 3:
                            me->GetMotionMaster()->MovePoint(0, (target->GetPositionX()-x), (target->GetPositionY()-y), target->GetPositionZ());
                            break;
                    } 

                    MoviTimer = urand(1000,2000);
                } else
                    MoviTimer -= uiDiff;

                    DoMeleeAttackIfReady();
                }
        };

        bool OnGossipHello(Player* player, Creature* creature)
        {
            if (creature->isQuestGiver())
                player->PrepareQuestMenu(creature->GetGUID());
            
            if (((player->GetQuestStatus(QUEST_GRAND_MELEE_1) == QUEST_STATUS_INCOMPLETE) ||
                (player->GetQuestStatus(QUEST_GRAND_MELEE_2) == QUEST_STATUS_INCOMPLETE) ||
                (player->GetQuestStatus(QUEST_GRAND_MELEE_3) == QUEST_STATUS_INCOMPLETE) ||
                (player->GetQuestStatus(QUEST_GRAND_MELEE_4) == QUEST_STATUS_INCOMPLETE) ||
                (player->GetQuestStatus(QUEST_GRAND_MELEE_5) == QUEST_STATUS_INCOMPLETE) ||
                (player->GetQuestStatus(QUEST_GRAND_MELEE_6) == QUEST_STATUS_INCOMPLETE) ||
                (player->GetQuestStatus(QUEST_GRAND_MELEE_7) == QUEST_STATUS_INCOMPLETE) ||
                (player->GetQuestStatus(QUEST_GRAND_MELEE_8) == QUEST_STATUS_INCOMPLETE) ||
                (player->GetQuestStatus(QUEST_GRAND_MELEE_9) == QUEST_STATUS_INCOMPLETE) ||
                (player->GetQuestStatus(QUEST_GRAND_MELEE_10) == QUEST_STATUS_INCOMPLETE)) &&
                (player->HasAura(RIDE_VEHICLE)) &&
                (player->HasAura(PLAYER_ON_TOURNAMENT_MOUNT)) &&
                (player->HasAura(LANCE_EQUIPPED)) &&
                (!player->isInCombat()))
            {
                if ((creature->GetEntry() == NPC_STORMWIND_VALIANT) || (creature->GetEntry() == NPC_DARNASSUS_VALIANT) ||
                    (creature->GetEntry() == NPC_EXODAR_VALIANT) || (creature->GetEntry() == NPC_GNOMEREGAN_VALIANT) ||
                    (creature->GetEntry() == NPC_IRONFORGE_VALIANT))
                {
                    if (player->GetTeam() == ALLIANCE)
                    {
                        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_VALIANT_1_GRAND, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
                        player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());                        
                    } else return false;
                
                }
                else 
                {
                    if (player->GetTeam() == HORDE)
                    {
                        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_VALIANT_1_GRAND, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
                        player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());                       
                    } else return false;
                }
                return true;
            }
            return false;
        }
        
        bool OnGossipSelect(Player* player, Creature* creature, uint32 /*uiSender*/, uint32 uiAction)
        {
            player->PlayerTalkClass->ClearMenus();
            if (uiAction == GOSSIP_ACTION_INFO_DEF+1)
            {
                player->CLOSE_GOSSIP_MENU();
                creature->setFaction(14);
                creature->SetReactState(REACT_AGGRESSIVE);
                creature->MonsterSay(urand(0,1) ? SAY_START_1_GRAND : SAY_START_2_GRAND, LANG_UNIVERSAL, 0);
                creature->AI()->AttackStart(player->GetVehicleCreatureBase());
            }
            return true;
        }
        
        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_valiantAI(creature);
        }
};

void AddSC_icecrown()
{
    new npc_arete;
    new npc_squire_david;
    new npc_argent_valiant;
    new npc_guardian_pavilion;
    new npc_vereth_the_cunning;
    new npc_tournament_training_dummy;
    new npc_valiant;
}
