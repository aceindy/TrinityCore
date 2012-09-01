
-- Yells :
-- Drakos the Interrogator

DELETE FROM script_texts WHERE npc_entry = 27654;
/* INSERT INTO script_texts VALUES 
(27654, -1578005, 'The prisoners shall not go free! The word of Malygos is law!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13594, 1, 0, 0, 'SAY_AGGRO'),
(27654, -1578006, 'A fitting punishment!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13602, 1, 0, 0, 'SAY_KILL_1'),
(27654, -1578007, 'Sentence: executed!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13603, 1, 0, 0, 'SAY_KILL_2'),
(27654, -1578008, 'Another casualty of war!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13604, 1, 0, 0, 'SAY_KILL_3'),
(27654, -1578009, 'The war... goes on.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13605, 1, 0, 0, 'SAY_DEATH'),
(27654, -1578010, 'It is too late to run!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13598, 1, 0, 0, 'SAY_PULL_1'),
(27654, -1578011, 'Gather ''round....', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13599, 1, 0, 0, 'SAY_PULL_2'),
(27654, -1578012, 'None shall escape!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13600, 1, 0, 0, 'SAY_PULL_3'),
(27654, -1578013, 'I condemn you to death!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13601, 1, 0, 0, 'SAY_PULL_4'),
(27654, -1578014, 'Tremble, worms!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13595, 1, 0, 0, 'SAY_STOMP_1'),
(27654, -1578015, 'I will crush you!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13596, 1, 0, 0, 'SAY_STOMP_2'),
(27654, -1578016, 'Can you fly?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13597, 1, 0, 0, 'SAY_STOMP_3'); */

DELETE FROM creature_text WHERE entry = 27654;
INSERT INTO creature_text (entry, groupid, id, text, type, language, probability, emote, duration, sound, comment) VALUES 
(27654, 0, 0, 'The prisoners shall not go free! The word of Malygos is law!', 14, 0, 0, 0, 0, 13594, 'Drakos the Interrogator - SAY_AGGRO'),
(27654, 1, 0, 'It is too late to run!', 14, 0, 0, 0, 0, 13598, 'Drakos the Interrogator - SAY_PULL_1'),
(27654, 1, 1, 'Gather ''round....', 14, 0, 0, 0, 0, 13599, 'Drakos the Interrogator - SAY_PULL_2'),
(27654, 1, 2, 'None shall escape!', 14, 0, 0, 0, 0, 13600, 'Drakos the Interrogator - SAY_PULL_3'),
(27654, 1, 3, 'I condemn you to death!', 14, 0, 0, 0, 0, 13601, 'Drakos the Interrogator - SAY_PULL_4'),
(27654, 2, 0, 'Tremble, worms!', 14, 0, 0, 0, 0, 13595, 'Drakos the Interrogator - SAY_STOMP_1'),
(27654, 2, 1, 'I will crush you!', 14, 0, 0, 0, 0, 13596, 'Drakos the Interrogator - SAY_STOMP_2'),
(27654, 2, 2, 'Can you fly?', 14, 0, 0, 0, 0, 13597, 'Drakos the Interrogator - SAY_STOMP_3'),
(27654, 3, 0, 'A fitting punishment!', 14, 0, 0, 0, 0, 13602, 'Drakos the Interrogator - SAY_KILL_1'),
(27654, 3, 1, 'Sentence: executed!', 14, 0, 0, 0, 0, 13603, 'Drakos the Interrogator - SAY_KILL_2'),
(27654, 3, 2, 'Another casualty of war!', 14, 0, 0, 0, 0, 13604, 'Drakos the Interrogator - SAY_KILL_3'),
(27654, 4, 0, 'The war... goes on.', 14, 0, 0, 0, 0, 13605, 'Drakos the Interrogator - SAY_DEATH');

 -- Varos Cloudstrider
 
DELETE FROM creature_text WHERE entry = 27447;
INSERT INTO creature_text (entry, groupid, id, text, type, language, probability, emote, duration, sound, comment) VALUES 
(27447, 0, 0, 'Intruders, your victory will be short-lived. I am Commander Varos Cloudstrider. My drakes control the skies and protect this conduit. I will see to it personnaly that the Oculus does not fall into your hands!', 14, 0, 0, 0, 0, 13648, 'Varos Cloudstrider - SAY_DRAKOS_DEATH'),
(27447, 1, 0, 'There will be no mercy!', 14, 0, 0, 0, 0, 13649, 'Varos Cloudstrider - SAY_AGGRO'),
(27447, 2, 0, 'Blast them! Destroy them!', 14, 0, 0, 0, 0, 13650, 'Varos Cloudstrider - SAY_AIR_STRIKE_1'),
(27447, 2, 1, 'Take no prisoners! Attack!', 14, 0, 0, 0, 0, 13651, 'Varos Cloudstrider - SAY_AIR_STRIKE_2'),
(27447, 2, 2, 'Strike now! Obliterate them!', 14, 0, 0, 0, 0, 13652, 'Varos Cloudstrider - SAY_AIR_STRIKE_3'),
(27447, 3, 0, 'You were warned!', 14, 0, 0, 0, 0, 13653, 'Varos Cloudstrider - SAY_KILL_1'),
(27447, 3, 1, 'The Oculus is ours!', 14, 0, 0, 0, 0, 13654, 'Varos Cloudstrider - SAY_KILL_2'),
(27447, 4, 0, 'They are... too strong! Underestimated their... fortitude.', 14, 0, 0, 0, 0, 13655, 'Varos Cloudstrider - SAY_DEATH'),
(27447, 5, 0, '%s calls an Azure Ring Captain!', 14, 0, 0, 0, 0, 0, 'Cloudstrider - AZURE_EMOTE');

-- Mage-Lord Urom

DELETE FROM script_texts WHERE npc_entry = 27655;
/* INSERT INTO script_texts VALUES 
(27655, -1578004, 'A taste... just a small taste... of the Spell-Weaver\'s power!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, ''),
(27655, -1578003, 'Poor blind fools!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, ''),
(27655, -1578002, 'Still you fight. Still you cling to misguided principles. If you survive, you\'ll find me in the center ring.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, ''),
(27655, -1578001, 'Clearly my pets failed. Perhaps another demonstration is in order.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, ''),
(27655, -1578000, 'What do we have here... those that would defy the Spell-Weaver? Those without foresight our understanding. How can i make you see? Malygos is saving the world from itself! Bah! You are hardly worth my time!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, ''); */

DELETE FROM creature_text WHERE entry = 27655;
INSERT INTO creature_text (entry, groupid, id, text, type, language, probability, emote, duration, sound, comment) VALUES 
(27655, 0, 0, 'What do we have here... those that would defy the Spell-Weaver? Those without foresight our understanding. How can i make you see? Malygos is saving the world from itself! Bah! You are hardly worth my time!', 14, 0, 0, 0, 0, 13635, 'Mage-Lord Urom - SAY_PLATFORM_1'),
(27655, 1, 0, 'Clearly my pets failed. Perhaps another demonstration is in order.', 14, 0, 0, 0, 0, 13636, 'Mage-Lord Urom - SAY_PLATFORM_2'),
(27655, 2, 0, 'Still you fight. Still you cling to misguided principles. If you survive, you''ll find me in the center ring.', 14, 0, 0, 0, 0, 13637, 'Mage-Lord Urom - SAY_PLATFORM_3'),
(27655, 3, 0, 'Poor blind fools!', 14, 0, 0, 0, 0, 13638, 'Mage-Lord Urom - SAY_PLATFORM_4'),
(27655, 4, 0, 'A taste... just a small taste... of the Spell-Weaver''s power!', 14, 0, 0, 0, 0, 13639, 'Mage-Lord Urom - SAY_EXPLOSION_1'),
(27655, 4, 1, 'So much unstable energy... but worth the risk to destroy you!', 14, 0, 0, 0, 0, 13640, 'Mage-Lord Urom - SAY_EXPLOSION_2'),
(27655, 5, 0, 'If only you understood!', 14, 0, 0, 0, 0, 13641, 'Mage-Lord Urom - SAY_KILL_1'),
(27655, 5, 1, 'Now do you see? Do you?!', 14, 0, 0, 0, 0, 13642, 'Mage-Lord Urom - SAY_KILL_2'),
(27655, 5, 2, 'Unfortunate, but necessary.', 14, 0, 0, 0, 0, 13643, 'Mage-Lord Urom - SAY_KILL_3'),
(27655, 6, 0, 'Everything I''ve done... has been for Azeroth...', 14, 0, 0, 0, 0, 13644, 'Mage-Lord Urom - SAY_DEATH');

-- Ley-Guardin Eregos
UPDATE creature_template SET modelid2 = 0, ScriptName = 'mob_planar_anomaly' WHERE entry = 30879;

DELETE FROM creature_text WHERE entry = 27656;
INSERT INTO creature_text (entry, groupid, id, text, type, language, probability, emote, duration, sound, comment) VALUES 
(27656, 0, 0, 'Simpletons! You cannot comprehend the forces you have set in motion. The ley line conduit will not be disrupted! Your defeat shall be absolute!', 14, 0, 0, 0, 0, 13622, 'Ley-Guardian Eregos - SAY_UROM_DEATH'),
(27656, 1, 0, 'You brash interlopers are out of your element! I will ground you!', 14, 0, 0, 0, 0, 13623, 'Ley-Guardian Eregos - SAY_AGGRO'),
(27656, 2, 0, 'It''s a long way down...', 14, 0, 0, 0, 0, 13628, 'Ley-Guardian Eregos - SAY_KILL_1'),
(27656, 2, 1, 'Back to the earth with you!', 14, 0, 0, 0, 0, 13629, 'Ley-Guardian Eregos - SAY_KILL_2'),
(27656, 2, 2, 'Enjoy the fall!', 14, 0, 0, 0, 0, 13630, 'Ley-Guardian Eregos - SAY_KILL_3'),
(27656, 3, 0, 'Such insolence... such arrogance... must be PUNISHED!', 14, 0, 0, 0, 0, 13624, 'Ley-Guardian Eregos - SAY_FRENZY'),
(27656, 4, 0, 'Savor this small victory, foolish little creatures. You and your dragon allies have won this battle. But we will win... the Nexus War.', 14, 0, 0, 0, 0, 13631, 'Ley-Guardian Eregos - SAY_DEATH');

-- Achievements :
DELETE FROM disables WHERE sourcetype = 4 AND entry IN (7323, 7324, 7325, 7177, 7178, 7179);
DELETE FROM achievement_criteria_data WHERE criteria_id IN (7323, 7324, 7325, 7177, 7178, 7179);
INSERT INTO achievement_criteria_data VALUES
(7323, 11, 0, 0, ''),
(7324, 11, 0, 0, ''),
(7325, 11, 0, 0, '');

-- Objects
UPDATE gameobject_template SET flags = flags| 32 WHERE entry IN (191349, 193603);
UPDATE gameobject SET spawntimesecs = 608400 WHERE id IN (191349, 193603);
UPDATE gameobject SET spawntimesecs = 608400 WHERE id = 191351;

-- Spell Scripts	
DELETE FROM spell_script_names WHERE spell_id IN (50341, 50344, 49840, 49838, 49592);	
INSERT INTO spell_script_names VALUES
(50341,'spell_oculus_touch_the_nightmare'),
(50344,'spell_oculus_dream_funnel'),
(49840, 'spell_oculus_shock_lance'),
(49838, 'spell_oculus_stop_time'),
(49592, 'spell_oculus_temporal_rift');

-- Script Names
UPDATE creature_template SET ScriptName = 'npc_oculus_drakes' WHERE entry IN (27756, 27755, 27692);
UPDATE creature_template SET scriptname = 'npc_oculus_centrifuge_construct' , AIName = '' WHERE entry = 27641;
UPDATE creature_template SET scriptname = 'npc_oculus_ringlord_conjurer' , AIName = '' WHERE entry = 27640;
UPDATE creature_template SET scriptname = 'npc_oculus_ringlord_sorceress' , AIName = '' WHERE entry = 27639;
