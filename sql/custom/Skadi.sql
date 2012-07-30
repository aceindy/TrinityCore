
DELETE FROM `script_texts` WHERE `npc_entry` = 26693;
/* INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES 
(26693, -1575009, '%s in within range of the harpoon launchers!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, 0, 0, 'Skadi - EMOTE_RANGE');
(26693, -1575007, '%s in within range of the harpoon launchers!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, 0, 0, 'Skadi - EMOTE_RANGE');
(26693, -1575008, 'ARGH! You call that... an attack? I\'ll... show... aghhhh...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13506, 1, 0, 0, 'Skadi - SAY_DEATH');
(26693, -1575013, 'Cleanse our sacred halls with flame!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13500, 1, 0, 0, 'Skadi - SAY_DRAKE_BREATH_3');
(26693, -1575012, 'Go now! Leave nothing but ash in your wake!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13499, 1, 0, 0, 'Skadi - SAY_DRAKE_BREATH_2');
(26693, -1575006, 'I\'ll mount your skull from the highest tower!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13505, 1, 0, 0, 'Skadi - SAY_KILL_2');
(26693, -1575005, 'Not so brash now, are you?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13504, 1, 0, 0, 'Skadi - SAY_KILL_1');
(26693, -1575011, 'Sear them to the bone!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13498, 1, 0, 0, 'Skadi - SAY_DRAKE_BREATH_1');
(26693, -1575004, 'What mongrels dare intrude here? Look alive, my brothers! A feast for the one that brings me their heads!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13497, 1, 0, 0, 'Skadi - SAY_AGGRO');
(26693, -1575010, 'You motherless knaves! Your corpses will make fine morsels for my new drake!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13507, 1, 0, 0, 'Skadi - SAY_DRAKE_DEATH'); */

DELETE FROM `creature_text` WHERE `entry` = 26693;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(26693, 0, 0, '%s in within range of the harpoon launchers!', 41, 0, 100, 0, 0, 0, 'Skadi - EMOTE_RANGE'),
(26693, 1, 0, 'What mongrels dare intrude here? Look alive, my brothers! A feast for the one that brings me their heads!', 14, 0, 100, 0, 0, 13497, 'Skadi - SAY_AGGRO'),
(26693, 2, 0, 'Sear them to the bone!', 14, 0, 100, 0, 0, 13498, 'Skadi - SAY_DRAKE_BREATH_1'),
(26693, 2, 1, 'Go now! Leave nothing but ash in your wake!', 14, 0, 100, 0, 0, 13499, 'Skadi - SAY_DRAKE_BREATH_2'),
(26693, 2, 2, 'Cleanse our sacred halls with flame!', 14, 0, 100, 0, 0, 13500, 'Skadi - SAY_DRAKE_BREATH_3'),
(26693, 3, 0, 'You motherless knaves! Your corpses will make fine morsels for my new drake!', 14, 0, 100, 0, 0, 13507, 'Skadi - SAY_DRAKE_DEATH'),
(26693, 4, 0, 'Not so brash now, are you?', 14, 0, 100, 0, 0, 13504, 'Skadi - SAY_KILL_1'),
(26693, 4, 1, 'I''ll mount your skull from the highest tower!', 14, 0, 100, 0, 0, 13505, 'Skadi - SAY_KILL_2'),
(26693, 5, 0, 'ARGH! You call that... an attack? I''ll... show... aghhhh...', 14, 0, 100, 0, 0, 13506, 'Skadi - SAY_DEATH');

DELETE FROM `creature` WHERE `id` = 26893; -- Grauf, Spawned by script.
/* INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(126052, 26893, 575, 3, 1, 27043, 0, 341.741, -516.955, 104.669, 3.12414, 3600, 0, 0, 1260000, 0, 0, 0, 0, 0); */