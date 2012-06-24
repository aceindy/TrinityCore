-- Full Support for Incense for the Festival Scorchlings

SET @SCHORCHLING:= 26520;
SET @SCHORCHLINGA:= 26401;
SET @Talespinner:= 16818;
SET @Loremaster:= 16817;
SET @SCRIPT:= 2652000;
SET @SCRIPT1:= 2640100;
SET @Ragnaros:= 26502;
SET @SCRIPTMISP:=2650200;

-- Remove Wrong AI, Instead we change Quest_Template
UPDATE `creature_template` SET `AIName`= '' WHERE `entry`=16818;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=16818;

-- Remove Wrong AI, Instead we change Quest_Template
UPDATE `creature_template` SET `AIName`= '' WHERE `entry`=16817;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=16817;

-- Remove Wrong Condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=47104;

-- Remove Wrong Special Flags
UPDATE quest_template SET SpecialFlags = 0 WHERE Id IN (11966,11964);

-- SAI for Misp of Ragnaros, He should spawn at some point by the Schorchlings, then Extinguish and despawns.
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@RAGNAROS;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@RAGNAROS;
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=@SCRIPTMISP;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@RAGNAROS,0,0,0,54,0,100,0,0,0,0,0,80,@SCRIPTMISP,0,0,0,0,0,1,0,0,0,0,0,0,0,'Misp of Ragnaros - On Summon - Run Script'),
(@SCRIPTMISP,9,1,0,0,0,100,0,0,0,0,0,1,5,4000,0,0,0,0,1,0,0,0,0,0,0,0,'Misp of Ragnaros - Action 1 - Say Text 5'),
(@SCRIPTMISP,9,2,0,0,0,100,0,6000,6000,0,0,1,6,4000,0,0,0,0,1,0,0,0,0,0,0,0,'Misp of Ragnaros - Action 2 - Say text 6'),
(@SCRIPTMISP,9,3,0,0,0,100,0,1000,1000,0,0,11,45889,0,0,0,0,0,1,0,0,0,0,0,0,0,'Misp of Ragnaros - Action 3 - Cast Scorchling Blast'),
(@SCRIPTMISP,9,4,0,0,0,100,0,0,0,0,0,11,46660,0,0,0,0,0,1,0,0,0,0,0,0,0,'Misp of Ragnaros - Action 4 - Cast Extinguished'),
(@SCRIPTMISP,9,5,0,0,0,100,0,4000,4000,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Misp of Ragnaros - Action 5 - Despawn');

-- SAI For Schorchling Horde
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@SCHORCHLING;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@SCHORCHLING;
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=@SCRIPT;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@SCHORCHLING,0,0,0,20,0,100,0,11966,0,0,0,80,@SCRIPT,0,0,0,0,0,1,0,0,0,0,0,0,0,'Festival Scorchling - On Quest Reward - Run script 00'),
(@SCRIPT,9,1,0,0,0,100,0,0,0,0,0,831,2,0,0,0,0,0,0,1,0,0,0,0,0,0,'Actionlist - Action 1 - Remove Quest Flag'),
(@SCRIPT,9,2,0,0,0,100,0,0,0,0,0,1,0,1000,0,0,0,0,0,1,0,0,0,0,0,0,'Actionlist - Action 2 - Say text 0'),
(@SCRIPT,9,3,0,0,0,100,0,2000,2000,0,0,1,8,2000,0,0,0,0,1,0,0,0,0,0,0,0,'Actionlist - Action 3 - Say text 8'),
(@SCRIPT,9,4,0,0,0,100,0,3000,3000,0,0,11,47114,0,0,0,0,0,1,0,0,0,0,0,0,0,'Actionlist - Action 4 - Cast grow'),
(@SCRIPT,9,5,0,0,0,100,0,0,0,0,0,1,1,3000,0,0,0,0,1,0,0,0,0,0,0,0,'Actionlist - Action 5 - Say text 1'),
(@SCRIPT,9,6,0,0,0,100,0,4000,4000,0,0,11,47114,0,0,0,0,0,1,0,0,0,0,0,0,0,'Actionlist - Action 6 - Cast grow'),
(@SCRIPT,9,7,0,0,0,100,0,0,0,0,0,1,2,3000,0,0,0,0,1,0,0,0,0,0,0,0,'Actionlist - Action 7 - Say text 2'),
(@SCRIPT,9,8,0,0,0,100,0,4000,4000,0,0,11,47114,0,0,0,0,0,1,0,0,0,0,0,0,0,'Actionlist - Action 8 - Cast grow'),
(@SCRIPT,9,9,0,0,0,100,0,0,0,0,0,1,3,3000,0,0,0,0,1,0,0,0,0,0,0,0,'Actionlist - Action 9 - Say text 3'),
(@SCRIPT,9,10,0,0,0,100,0,2000,2000,0,0,1,9,1000,0,0,0,0,1,0,0,0,0,0,0,0,'Actionlist - Action 10 - Say text 9'),
(@SCRIPT,9,11,0,0,0,100,0,3000,3000,0,0,11,47114,0,0,0,0,0,1,0,0,0,0,0,0,0,'Actionlist - Action 11 - Cast grow'),
(@SCRIPT,9,12,0,0,0,100,0,0,0,0,0,1,4,2000,0,0,0,0,1,0,0,0,0,0,0,0,'Actionlist - Action 12 - Say text 4'),
(@SCRIPT,9,13,0,0,0,100,0,4000,4000,0,0,11,47114,0,0,0,0,0,1,0,0,0,0,0,0,0,'Actionlist - Action 13 - Cast grow'),
(@SCRIPT,9,14,0,0,0,100,0,4000,4000,0,0,11,47120,0,0,0,0,0,1,0,0,0,0,0,0,0,'Actionlist - Action 14 - Summon Misp of Ragnaros'),
(@SCRIPT,9,15,0,0,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Actionlist - Action 15 - Set Visibility'),
(@SCRIPT,9,16,0,0,0,100,0,0,0,0,0,28,47114,0,0,0,0,0,1,0,0,0,0,0,0,0,'Actionlist - Action 16 - Remove aura from grow'),
(@SCRIPT,9,17,0,0,0,100,0,12000,12000,0,0,47,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Actionlist - Action 17 - Set Visibility'),
(@SCRIPT,9,18,0,0,0,100,0,0,0,0,0,1,10,1000,0,0,0,0,1,0,0,0,0,0,0,0,'Misp of Ragnaros - Action 18 - Say text 10'),
(@SCRIPT,9,19,0,0,0,100,0,4000,4000,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,'Actionlist - Action 19 - Say text 7'),
(@SCRIPT,9,20,0,0,0,100,0,0,0,0,0,82,2,0,0,0,0,0,0,1,0,0,0,0,0,0,'Actionlist - Action 20 - Add Quest Flag');

-- SAI For Scorchling Alliance
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@SCHORCHLINGA;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@SCHORCHLINGA;
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=@SCRIPT1; -- Removes Old Script
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@SCHORCHLINGA,0,0,0,20,0,100,0,11964,0,0,0,80,@SCRIPT,0,0,0,0,0,1,0,0,0,0,0,0,0,'Festival Scorchling - On Quest Reward - Run script 00');


-- Creature Text :
DELETE FROM `creature_text` WHERE `entry` IN (@SCHORCHLING,@RAGNAROS);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@SCHORCHLING,0,0,'Thank you again, $N, for this delectable incense.',12,0,100,1,1000,0,'Scorchling event with incense'),
(@SCHORCHLING,1,0,'So good! So packed with energy!',12,0,100,1,1000,0,'Scorchling event with incense'),
(@SCHORCHLING,2,0,'It has everything a growing scorchling needs!',12,0,100,1,1000,0,'Scorchling event with incense'),
(@SCHORCHLING,3,0,'I can feel the power SURGING within me!',12,0,100,1,1000,0,'Scorchling event with incense'),
(@SCHORCHLING,4,0,'Now! Finally! Our plans can take effect!',12,0,100,1,1000,0,'Scorchling event with incense'),
(@RAGNAROS,5,0,'KNEEL, LITTLE MORTAL! KNEEL BEFORE THE MIGHT OF THE HERALD OF RAGNAROS!',12,0,100,1,1000,0,'Scorchling event with incense'),
(@RAGNAROS,6,0,'YOU WILL ALL PERISH IN FLAMES!',12,0,100,1,1000,0,'Scorchling event with incense'),
(@SCHORCHLING,7,0,'Ah. I was merely jesting...',12,0,100,1,1000,0,'Scorchling event with incense'),
(@SCHORCHLING,8,0,'Festival Scorchling devours the incense. It''s ravenous!',16,0,100,1,1000,0,'Scorchling event with incense'),
(@SCHORCHLING,9,0,'Festival Scorchling bellows with laughter!',16,0,100,1,1000,0,'Scorchling event with incense'),
(@SCHORCHLING,10,0,'Festival Scorchling blinks...',16,0,100,1,1000,0,'Scorchling event with incense');