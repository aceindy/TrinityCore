
SET @GUID := 209500;
SET @ENTRY := -1380561;
SET @GOSSIP = 56001;
SET @TEXT = 56001; 

-- NPC Text for Warden
DELETE FROM gossip_menu WHERE entry = @GOSSIP;
INSERT INTO gossip_menu VALUES (@GOSSIP, @TEXT);

DELETE FROM npc_text WHERE id = @TEXT;
INSERT INTO npc_text (ID, text0_0) VALUES (@TEXT, 'I will escort you into the Sunwell when you''re ready.');

-- ItemScripts
UPDATE item_template SET ScriptName = 'item_tainted_queldelar' WHERE entry IN (49879,49889);

-- Templates
DELETE FROM creature_template WHERE entry IN (37523, 36991, 37746, 37763, 37764, 37765, 37781, 38056);
INSERT INTO creature_template (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, mindmg, maxdmg, dmgschool, attackpower, dmg_multiplier, baseattacktime, rangeattacktime, unit_class, unit_flags, dynamicflags, family, trainer_type, trainer_spell, trainer_class, trainer_race, minrangedmg, maxrangedmg, rangedattackpower, type, type_flags, lootid, pickpocketloot, skinloot, resistance1, resistance2, resistance3, resistance4, resistance5, resistance6, spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, InhabitType, Health_mod, Mana_mod, Armor_mod, RacialLeader, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, movementId, RegenHealth, equipment_id, mechanic_immune_mask, flags_extra, ScriptName, WDBVerified) VALUES
(37523, 0, 0, 0, 0, 0, 30628, 30629, 30630, 30631, 'Warden of the Sunwell', '', '', @GOSSIP, 80, 80, 0, 35, 35, 1, 1, 1.14286, 1, 0, 0, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'npc_sunwell_warder', 12340), 
(36991, 0, 0, 0, 0, 0, 21460, 0, 0, 0, 'Sunwell Guardian', '', '', 0, 80, 80, 0, 35, 35, 0, 1, 1.14286, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 3.45002, 1, 1, 0, 0, 0, 0, 0, 0, 0, 144, 1, 0, 0, 0, '', 12340), 
(37746, 0, 0, 0, 0, 0, 20570, 17612, 0, 0, 'Sunwell Caster Bunny', '', '', 0, 1, 1, 0, 114, 114, 0, 1, 1.14286, 0.72, 0, 0, 0, 0, 0, 1, 0, 0, 1, 33554432, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 130, '', 12340), 
(37763, 0, 0, 0, 0, 0, 19706, 0, 0, 0, 'Grand Magister Rommath', '', '', 0, 80, 80, 0, 35, 35, 0, 1, 1.14286, 1, 2, 0, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 261.78, 15.8145, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 897, 0, 0, '', 12340), 
(37764, 0, 0, 0, 0, 0, 17122, 0, 0, 0, 'Lor\'themar Theron', 'Regent Lord of Quel\'Thalas', '', 0, 80, 80, 0, 35, 35, 0, 1, 1.14286, 1, 2, 0, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1305.56, 64.4067, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 2209, 0, 0, '', 12340), 
(37765, 0, 0, 0, 0, 0, 18146, 0, 0, 0, 'Captain Auric Sunchaser', 'High Elf Representative', '', 0, 80, 80, 0, 35, 35, 0, 1, 1.14286, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 3.45002, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '481', 0, 0, '', 12340), 
(37781, 0, 0, 0, 0, 0, 15511, 0, 0, 0, 'Sunwell Honor Guard', '', 'Directions', 0, 80, 80, 0, 35, 35, 0, 1, 1.14286, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 7.076, 1, 1, 0, 0, 0, 0, 0, 0, 0, 144, 1, 0, 0, 0, '', 12340), 
(38056, 0, 0, 0, 0, 0, 21008, 0, 0, 0, 'Chamberlain Galiros', '', '', 0, 80, 80, 0, 35, 35, 1, 1, 1.14286, 1, 0, 0, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 2.94806, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'npc_queldelar_sp', 12340);

DELETE FROM gameobject_template WHERE (entry=195682);
INSERT INTO gameobject_template (entry, type, displayId, name, IconName, castBarCaption, unk1, faction, flags, size, questItem1, questItem2, questItem3, questItem4, questItem5, questItem6, data0, data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15, data16, data17, data18, data19, data20, data21, data22, data23, AIName, ScriptName, WDBVerified) VALUES
(195682, 10, 8111, 'Portal to Dalaran', '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 68328, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_dalaran_portal_sunwell', 12340);

-- Spawns
DELETE FROM creature WHERE id IN (37523, 36991, 37746, 37763, 37765, 37765, 37781, 38056, 37764, 37000);
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags) VALUES
(@GUID, 37781, 580, 1, 2, 0, 0, 1720.53, 615.576, 28.0503, 5.59377, 300, 0, 0, 126, 0, 0, 0, 0, 0), 
(@GUID + 1, 37781, 580, 1, 2, 0, 0, 1686.59, 644.382, 28.1838, 2.15293, 300, 0, 0, 126, 0, 0, 0, 0, 0), 
(@GUID + 2, 37781, 580, 1, 2, 0, 0, 1658.78, 629.876, 28.3649, 5.07855, 300, 0, 0, 126, 0, 0, 0, 0, 0), 
(@GUID + 3, 36991, 580, 1, 2, 0, 0, 1739.09, 717.696, 71.1903, 4.4777, 300, 0, 0, 84, 0, 0, 0, 0, 0), 
(@GUID + 4, 36991, 580, 1, 2, 0, 0, 1761.82, 707.575, 71.1904, 3.84232, 300, 0, 0, 84, 0, 0, 0, 0, 0), 
(@GUID + 5, 36991, 580, 1, 2, 0, 0, 1778.09, 692.973, 71.1904, 3.73393, 300, 0, 0, 84, 0, 0, 0, 0, 0), 
(@GUID + 6, 37746, 580, 1, 2, 0, 0, 1698.45, 628.03, 28.1989, 3.47949, 300, 0, 0, 42, 0, 0, 0, 33554432, 0), 
(@GUID + 7, 36991, 580, 1, 2, 0, 0, 1653.57, 634.692, 28.0849, 0.171978, 300, 0, 0, 84, 0, 0, 0, 0, 0), 
(@GUID + 8, 36991, 580, 1, 2, 0, 0, 1693.99, 674.897, 28.0503, 4.67702, 300, 0, 0, 84, 0, 0, 0, 0, 0), 
(@GUID + 9, 36991, 580, 1, 2, 0, 0, 1745.8, 622.226, 28.0503, 3.07638, 300, 0, 0, 84, 0, 0, 0, 0, 0), 
(@GUID + 10, 36991, 580, 1, 2, 0, 0, 1704.76, 583.796, 28.1657, 1.71842, 300, 0, 0, 84, 0, 0, 0, 0, 0), 
(@GUID + 11, 36991, 580, 1, 2, 0, 0, 1612.32, 606.707, 33.3215, 0.314329, 300, 0, 0, 84, 0, 0, 0, 0, 0), 
(@GUID + 12, 36991, 580, 1, 2, 0, 0, 1621.18, 584.858, 33.3215, 0.42507, 300, 0, 0, 84, 0, 0, 0, 0, 0), 
(@GUID + 13, 36991, 580, 1, 2, 0, 0, 1634.67, 563.787, 33.3215, 0.774572, 300, 0, 0, 84, 0, 0, 0, 0, 0), 
(@GUID + 14, 36991, 580, 1, 2, 0, 0, 1651.28, 548.805, 33.3215, 0.998411, 300, 0, 0, 84, 0, 0, 0, 0, 0), 
(@GUID + 15, 37781, 580, 1, 2, 0, 0, 1680.19, 620.726, 28.1394, 3.53524, 300, 0, 0, 126, 0, 0, 0, 0, 0), 
(@GUID + 16, 37763, 580, 1, 2, 0, 897, 1662.56, 622.758, 28.0502, 4.86257, 300, 0, 0, 8200, 1200, 0, 0, 0, 0), 
(@GUID + 17, 38056, 580, 1, 2, 0, 0, 1671.49, 606.427, 28.0504, 3.83603, 300, 0, 0, 41, 60, 0, 0, 0, 0), 
(@GUID + 18, 37764, 580, 1, 2, 0, 0, 1665.9, 624.107, 28.0504, 5.00237, 300, 0, 0, 16400, 1800, 0, 0, 0, 0), 
(@GUID + 19, 37765, 580, 1, 2, 0, 0, 1703.85, 602.353, 28.0503, 2.64381, 300, 0, 0, 42, 0, 0, 0, 0, 0), 
(@GUID + 20, 37781, 580, 1, 2, 0, 0, 1666.81, 631.886, 28.0502, 4.56725, 300, 0, 0, 126, 0, 0, 0, 0, 0), 
(@GUID + 21, 37781, 580, 1, 2, 0, 0, 1659.63, 625.187, 28.2451, 1.65029, 300, 0, 0, 126, 0, 0, 0, 0, 0), 
(@GUID + 22, 37781, 580, 1, 2, 0, 0, 1671.96, 631.276, 28.0503, 4.46279, 300, 0, 0, 126, 0, 0, 0, 0, 0), 
(@GUID + 23, 37781, 580, 1, 2, 0, 0, 1671.33, 624.754, 28.0503, 1.472, 300, 0, 0, 126, 0, 0, 0, 0, 0), 
(@GUID + 24, 37781, 580, 1, 2, 0, 0, 1696.11, 608.161, 28.1093, 4.55154, 300, 0, 0, 126, 0, 0, 0, 0, 0),
(@GUID + 25, 37523, 530, 1, 1, 0, 0, 12556.4, -6779.72, 15.0437, 0.0119493, 300, 0, 0, 4274, 3994, 0, 0, 0, 0),
(@GUID + 26, 37000, 580, 1, 2, 0, 0, 1698.45, 628.03, 28.1989, 0.331613, 604800, 0, 0, 40, 0, 0, 0, 0, 0); 
-- Last one might be a wrong npc but since when we need a trigger to be there for sunwell aura we HAVE to use this one, name seems correct.


DELETE FROM gameobject WHERE id IN (195682);
INSERT INTO gameobject (guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
(463134, 195682, 580, 1, 2, 1669.68, 663.748, 28.0503, 5.2859, 0, 0, 0.478235, -0.878232, 300, 0, 1), 
(463136, 195682, 580, 1, 2, 1734.47, 596.174, 28.0503, 2.33751, 0, 0, 0.920264, 0.391297, 300, 0, 1);

-- Says
DELETE FROM script_texts WHERE entry BETWEEN @ENTRY - 13 AND @ENTRY;
INSERT INTO script_texts (entry, content_default, emote, type) VALUES
(@ENTRY, 'My lords and ladies, I present $N, bearer of Quel''Delar.', 0, 1),
(@ENTRY - 1, 'Can that really be Quel''Delar?', 0, 0),
(@ENTRY - 2, 'We shall see.', 0, 0),
(@ENTRY - 3, 'Look at it, Lor''themar. It is certainly Quel''Delar.', 1, 0),
(@ENTRY - 4, 'So it is. You have my thanks, $N, for restoring Quel''Delar to its rightful owners.', 0, 0),
(@ENTRY - 5, 'My Lord Regent! What have they done to you?', 0, 1),
(@ENTRY - 6, 'What is the meaning of this treachery?', 0, 0),
(@ENTRY - 7, 'Drop your weapon and surrender, traitor.', 0, 0),
(@ENTRY - 8, 'This is not my doing, Rommath. There is no treachery here.', 0, 0),
(@ENTRY - 9, 'Call off your men. Lor''themar''s own foolishness caused his injuries. Quel''Delar is not chosen; it chooses its master.', 0, 0),
(@ENTRY - 10, 'It seems the captain is correct. Quel''Delar is not to be ours after all.', 0, 0),
(@ENTRY - 11, 'Guards, return to your posts.', 0, 0),
(@ENTRY - 12, 'You will have what you have come for, $N. Take the sword and begone. And you, Auric, have a care for what you say in this sacred place.', 0, 0),
(@ENTRY - 13, 'Carry the sword back to Dalaran through that portal, $N. You have done what many quel''dorei have dreamt of for years. Quel''Delar has been restored at last.', 0, 0);

-- Set Phases for The Gate, so players can't explore sunwell while phased
UPDATE gameobject SET phaseMask = 3 WHERE guid = 50444;

-- Template Addon
DELETE FROM creature_template_addon WHERE entry = 37000;
INSERT INTO creature_template_addon (entry, path_id, mount, bytes1, bytes2, emote, auras) VALUES 
(37000, 0, 0, 0, 0, 0, '46410');

-- Quest Text
UPDATE quest_template SET RequestItemsText = 'What happened during your time in the Sunwell?' , OfferRewardText = 'This is unbelievable, $N. You''ve really done it! All of the quel''dorei have heard of Thalorien Dawnseeker and Quel''Delar, but no one ever thought the sword would be restored.' WHERE id IN (24553, 24595);
UPDATE quest_template SET RequestItemsText = 'What happened inside the Sunwell?' , OfferRewardText = 'Am I truly laying my eyes upon the weapon of Thalorien Dawnseeker? This is a wondrous day for the Sunreavers and for all sin''dorei!' WHERE id IN (24564, 24594, 24596, 24598);
