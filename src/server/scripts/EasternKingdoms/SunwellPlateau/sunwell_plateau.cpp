/*
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
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
SDName: Sunwell_Plateau
SD%Complete: 0
SDComment: Placeholder, Epilogue after Kil'jaeden, Captain Selana Gossips
EndScriptData */

/* ContentData
npc_prophet_velen
npc_captain_selana
EndContentData */

#include "ScriptPCH.h"
#include "sunwell_plateau.h"

/*######
## npc_prophet_velen
######*/

enum ProphetSpeeches
{
    PROPHET_SAY1 = -1580099,
    PROPHET_SAY2 = -1580100,
    PROPHET_SAY3 = -1580101,
    PROPHET_SAY4 = -1580102,
    PROPHET_SAY5 = -1580103,
    PROPHET_SAY6 = -1580104,
    PROPHET_SAY7 = -1580105,
    PROPHET_SAY8 = -1580106
};

enum LiadrinnSpeeches
{
    LIADRIN_SAY1 = -1580107,
    LIADRIN_SAY2 = -1580108,
    LIADRIN_SAY3 = -1580109
};

/*######
## npc_captain_selana
######*/

#define CS_GOSSIP1 "Give me a situation report, Captain."
#define CS_GOSSIP2 "What went wrong?"
#define CS_GOSSIP3 "Why did they stop?"
#define CS_GOSSIP4 "Your insight is appreciated."

/*######
## Quel Delar Quest
######*/

enum Says
{
    SAY_QUELDELAR_1  = -1380561,  // My lords and ladies, I present $N, bearer of Quel'Delar.
    SAY_QUELDELAR_2  = -1380562,  // Can that really be Quel'Delar?
    SAY_QUELDELAR_3  = -1380563,  // We shall see.
    SAY_QUELDELAR_4  = -1380564,  // Look at it, Lor'themar. It is certainly Quel'Delar.
    SAY_QUELDELAR_5  = -1380565,  // So it is. You have my thanks, $N, for restoring Quel'Delar to its rightful owners.
    SAY_QUELDELAR_6  = -1380566,  // My Lord Regent! What have they done to you?
    SAY_QUELDELAR_7  = -1380567,  // What is the meaning of this treachery?
    SAY_QUELDELAR_8  = -1380568,  // Drop your weapon and surrender, traitor.
    SAY_QUELDELAR_9  = -1380569,  // This is not my doing, Rommath. There is no treachery here.
    SAY_QUELDELAR_10 = -1380570,  // Call off your men. Lor'themar's own foolishness caused his injuries. Quel'Delar is not chosen; it chooses its master.
    SAY_QUELDELAR_11 = -1380571,  // It seems the captain is correct. Quel''Delar is not to be ours after all.
    SAY_QUELDELAR_12 = -1380572,  // Guards, return to your posts.
    SAY_QUELDELAR_13 = -1380573,  // You will have what you have come for, $N. Take the sword and begone. And you, Auric, have a care for what you say in this sacred place.
    SAY_QUELDELAR_14 = -1380574,  // Carry the sword back to Dalaran through that portal, $N. You have done what many quel'dorei have dreamt of for years. Quel'Delar has been restored at last.
};
class npc_queldelar_sp : public CreatureScript
{
    public:
        npc_queldelar_sp() : CreatureScript("npc_queldelar_sp") { }

        struct npc_queldelar_spAI : public ScriptedAI
        {
            npc_queldelar_spAI(Creature* creature) : ScriptedAI(creature) {}

            void Reset()
            {
                uiRommath = 0;
                uiTheron = 0;
                uiAuric = 0;
                uiQuelDelar = 0;
                uiPlayer = 0;

				Announced = false;

                Events.Reset();
            }

            void MoveInLineOfSight (Unit* Who)
            {
                if (!Announced)
                {
                    if (me->IsInDist(Who, 60.0f))
                    {
                        Announced = true;
                        DoScriptText(SAY_QUELDELAR_1, me, Who);
                    }
                }
            }

            void UpdateAI(const uint32 diff)
            {
                Events.Update(diff);

                switch(Events.ExecuteEvent())
                {
                    case 1:
                        if (Creature* Rommath = me->FindNearestCreature(37763, 50, true))  // Rommath
                        {
                            Rommath->SetUnitMovementFlags(MOVEMENTFLAG_WALKING);
                            uiRommath = Rommath->GetGUID();
                        }
                        if (Creature* Theron = me->FindNearestCreature(37764, 50, true)) // Lor'Themar Theron
                        {
                            Theron->SetUnitMovementFlags(MOVEMENTFLAG_WALKING);
                            uiTheron = Theron->GetGUID();
                        }
                        if (Creature* Auric = me->FindNearestCreature(37765, 50, true)) //Auric
                        {
                            Auric->SetUnitMovementFlags(MOVEMENTFLAG_WALKING);
                            uiAuric = Auric->GetGUID();
                        }
                        if (GameObject* QuelDelar = me->SummonGameObject(201794, 1683.99f, 620.231f, 29.3599f, 0.410932f, 0, 0, 0, 0, 0))
                        {
                            uiQuelDelar = QuelDelar->GetGUID();
                            QuelDelar->SetFlag(GAMEOBJECT_FLAGS, 5);
                        }
                        Events.ScheduleEvent(2, 2000);
                        break;
                    case 2:
                        if (Creature* Guard = me->FindNearestCreature(37781, 20, true))
                            DoScriptText(SAY_QUELDELAR_2, Guard);
                        Events.ScheduleEvent(3, 1000);
                        break;
                    case 3:
                        if (Creature* Theron = me->GetCreature(*me, uiTheron))
                            DoScriptText(SAY_QUELDELAR_3, Theron);
                        Events.ScheduleEvent(4, 4000);
                        break;
                    case 4:
                        if (Creature* Rommath = me->GetCreature(*me, uiRommath))
                            Rommath->GetMotionMaster()->MovePoint(1, 1675.8f, 617.19f, 28.0504f);
                        if (Creature* Auric = me->GetCreature(*me, uiAuric))
                            Auric->GetMotionMaster()->MovePoint(1, 1681.77f, 612.084f, 28.4409f);
                        Events.ScheduleEvent(5, 6000);
                        break;
                    case 5:
                        if (Creature* Rommath = me->GetCreature(*me, uiRommath))
                        {
                            Rommath->SetOrientation(0.3308f);
                            DoScriptText(SAY_QUELDELAR_4, Rommath);
                        }
                        if (Creature* Auric = me->GetCreature(*me, uiAuric))
                            Auric->SetOrientation(1.29057f);
                        if (Creature* Theron = me->GetCreature(*me, uiTheron))
                            Theron->GetMotionMaster()->MovePoint(1, 1677.07f, 613.122f, 28.0504f);
                        Events.ScheduleEvent(6, 10000);
                        break;
                    case 6:
                        if (Creature* Theron = me->GetCreature(*me, uiTheron))
                        {
                            if (Player* player = me->GetPlayer(*me, uiPlayer))
                                DoScriptText(SAY_QUELDELAR_5, Theron, player);
                            Theron->GetMotionMaster()->MovePoint(1, 1682.3f, 618.459f, 27.9581f);
                        }
                        Events.ScheduleEvent(7, 5000);
                        break;
                    case 7:
                        if (Creature* Theron = me->GetCreature(*me, uiTheron))
                            Theron->HandleEmoteCommand(EMOTE_ONESHOT_POINT);
                        Events.ScheduleEvent(8, 800);
                        break;
                    case 8:
                        if (Creature* Theron = me->GetCreature(*me, uiTheron))
                            Theron->CastSpell(Theron, 70493, true);
                        if (Creature* Guard = me->FindNearestCreature(37781, 20))
                            DoScriptText(SAY_QUELDELAR_6, Guard);
                        Events.ScheduleEvent(9, 1000);
                        break;
                    case 9:
                        if (Creature* Rommath = me->GetCreature(*me, uiRommath))
                        {
                            if (Player* player = me->GetPlayer(*me, uiPlayer))
                            {
                                Rommath->CastSpell(player, 70540, true);
                            }
                            DoScriptText(SAY_QUELDELAR_7, Rommath);
                        }
                        if (Creature* Guard = me->FindNearestCreature(37781, 20))
                        {
                            Guard->GetMotionMaster()->MovePoint(0, 1681.1f, 614.955f, 28.4983f);
                            Guard->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_READY1H);
                        }
                        Events.ScheduleEvent(10, 4000);
                        break;
                    case 10:
                        if (Creature* Guard = me->FindNearestCreature(37781, 20))
                            DoScriptText(SAY_QUELDELAR_8, Guard);
                        Events.ScheduleEvent(11, 3000);
                        break;
                    case 11:
                        if (Creature* Auric = me->GetCreature(*me, uiAuric))
                            DoScriptText(SAY_QUELDELAR_9, Auric);
                        Events.ScheduleEvent(12, 6000);
                        break;
                    case 12:
                        if (Creature* Auric = me->GetCreature(*me, uiAuric))
                            DoScriptText(SAY_QUELDELAR_10, Auric);
                        Events.ScheduleEvent(17, 5000);
                        break;
                    case 13:
                        if (Creature* Rommath = me->GetCreature(*me, uiRommath))
                            DoScriptText(SAY_QUELDELAR_12, Rommath);
                        Events.ScheduleEvent(14, 2000);
                        break;
                    case 14:
                        if (Creature* Guard = me->FindNearestCreature(37781, 20))
                        {
                            Guard->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_STAND);
                            Guard->SetUnitMovementFlags(MOVEMENTFLAG_WALKING);
                            Guard->GetMotionMaster()->MovePoint(0, Guard->GetHomePosition());
                        }
                        if (Creature* Rommath = me->GetCreature(*me, uiRommath))
                        {
                            Rommath->HandleEmoteCommand(EMOTE_ONESHOT_POINT);
                            if (Player* player = me->GetPlayer(*me, uiPlayer))
                                DoScriptText(SAY_QUELDELAR_13, Rommath, player);
                        }
                        Events.ScheduleEvent(15, 7000);
                        break;
                    case 15:
                        if (Creature* Auric = me->GetCreature(*me, uiAuric))
                        {
                            Auric->HandleEmoteCommand(EMOTE_ONESHOT_POINT);
                            if (Player* player = me->GetPlayer(*me, uiPlayer))
                                DoScriptText(SAY_QUELDELAR_14, Auric, player);
                            if (GameObject* QuelDelar = me->FindNearestGameObject(201794, 20))
                                QuelDelar->RemoveFlag(GAMEOBJECT_FLAGS, 5);
                        }
                        Events.ScheduleEvent(16, 2000);
                        break;
                    case 16:
                         if (Creature* Auric = me->GetCreature(*me, uiAuric))
                             Auric->GetMotionMaster()->MovePoint(0, Auric->GetHomePosition());
                         if (Creature* Rommath = me->GetCreature(*me, uiRommath))
                             Rommath->GetMotionMaster()->MovePoint(0, Rommath->GetHomePosition());
                         if (Creature* Theron = me->GetCreature(*me, uiTheron))
                             Theron->GetMotionMaster()->MovePoint(0, Theron->GetHomePosition());
                        break;
                    case 17:
                        if (Creature* Rommath = me->GetCreature(*me, uiRommath))
                            DoScriptText(SAY_QUELDELAR_11, Rommath);
                        Events.ScheduleEvent(13, 5000);
                        break;
                }
            }

            void SetGUID(uint64 guid, int32 /*type*/)
            {
                uiPlayer = guid;
            }

            void DoAction(const int32 actionId)
            {
                switch(actionId)
                {
                    case 1:
                        me->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
                        Events.ScheduleEvent(1,0);
                        break;
                }
            }
            private:
                EventMap Events;
                uint64 uiRommath;
                uint64 uiTheron;
                uint64 uiAuric;
                uint64 uiQuelDelar;
                uint64 uiPlayer;

                bool Announced;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_queldelar_spAI(creature);
        }
};

class go_dalaran_portal : public GameObjectScript
{
    public:
        go_dalaran_portal() : GameObjectScript("go_dalaran_portal_sunwell") { }

        bool OnGossipHello(Player* player, GameObject* /*go*/)
        {
            player->SetPhaseMask(1, true);
            player->TeleportTo(571, 5804.15f, 624.771f, 647.767f, 1.64f);
            return false;
        }
};

class item_tainted_queldelar : public ItemScript
{
    public:
        item_tainted_queldelar() : ItemScript("item_tainted_queldelar") { }

        bool OnUse(Player* player, Item* item, SpellCastTargets const& /*targets*/)
        {
            InstanceScript* _instance = player->GetInstanceScript();

            if (_instance && player->FindNearestCreature(37746, 18.0f, true))
            {
				player->DestroyItemCount(49879, 1, true);
                player->DestroyItemCount(49889, 1, true);

                Creature* Introducer = NULL;
                Introducer = Unit::GetCreature((*player), _instance->GetData64(DATA_QUELDELAR_INTRODUCER));
                Introducer->AI()->SetGUID(player->GetGUID());
                Introducer->AI()->DoAction(1);
                return true;
            }
            else
                return false;
        }
};

void AddSC_sunwell_plateau()
{
    new npc_queldelar_sp();
    new go_dalaran_portal();
    new item_tainted_queldelar();
}
