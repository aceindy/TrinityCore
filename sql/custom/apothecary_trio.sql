-- RDF Reward
UPDATE `quest_template` SET `SpecialFlags`=9 WHERE `Id`=25485;

DELETE FROM `item_template` WHERE `entry`=54537;
INSERT INTO `item_template` (`entry`, `class`, `subclass`, `unk0`, `name`, `displayid`, `Quality`, `Flags`, `FlagsExtra`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `StatsCount`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `ScalingStatDistribution`, `ScalingStatValue`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `RandomSuffix`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `TotemCategory`, `socketColor_1`, `socketContent_1`, `socketColor_2`, `socketContent_2`, `socketColor_3`, `socketContent_3`, `socketBonus`, `GemProperties`, `RequiredDisenchantSkill`, `ArmorDamageModifier`, `Duration`, `ItemLimitCategory`, `HolidayId`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `WDBVerified`) VALUES
(54537,15,0,-1,'Heart-Shaped Box',40293,3,4,0,1,0,0,0,-1,-1,80,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,1,'',0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,'',0,0,0,0,12340);

DELETE FROM `item_loot_template` WHERE `entry`=54537;
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(54537,49715,0,1,1,1,1),
(54537,50446,0,1,1,1,1),
(54537,50741,0,1,1,1,1),
(54537,50471,6,1,0,1,1),
(54537,40753,100,1,0,2,2),
(54537,50250,1,1,0,1,1);

-- Script texts
DELETE FROM `script_texts` WHERE `npc_entry` IN (36296,36565,36272);
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(36296,-1033020,'Did they bother to tell you who I am and why I am doing this?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,6,'Hummel - Aggro 1'),
(36296,-1033021,'...or are they just using you like they do everybody else?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,'Hummel - Aggro 2'),
(36296,-1033022,'But what does it matter. It is time for this to end.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,5,'Hummel - Aggro 3'),
(36296,-1033023,'Baxter! Get in there and help! NOW!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'Hummel - Calling Baxter'),
(36296,-1033024,'It is time, Frye! Attack!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'Hummel - Calling Frye'),
(36296,-1033025,'Apothecaries! Give your life for the Crown!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'Hummel - Summon Adds'),
(36296,-1033026,'...please don''t think less of me.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'Hummel - Death'),
(36565,-1033027,'It has been the greatest honor of my life to serve with you, Hummel.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'Baxter - Death'),
(36272,-1033028,'Great. We''re not gutless, we''re incompetent.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'Frye - Death');

-- Spawns Gobjects, By Albis
-- TODO : I Didnt find the entry for cages, some red shit on the last wagon. (Got no idea what is the second one. So i couldnt search for anything)

SET @OGUID = xxxxxx;
SET @EVENT = 8;

DELETE FROM `gameobject` WHERE `id` IN (181075,200337,190678,200338,200333,200334,200335,200336,201716) AND `guid` BETWEEN @OGUID AND @OGUID+25;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES 
(@OGUID, 181075, 33, 1, 1, -203.337, 2178.97, 79.7654, 0.00792723, 0, 0, 0.00396361, 0.999992, 300, 0, 1),
(@OGUID+1, 200334, 33, 1, 1, -203.337, 2178.97, 80.7554, 0.00792723, 0, 0, 0.00396361, 0.999992, 300, 0, 1),
(@OGUID+2, 200335, 33, 1, 1, -197.077, 2197.05, 79.7638, 5.89068, 0, 0, 0.194995, -0.980804, 300, 0, 1),
(@OGUID+3, 200333, 33, 1, 1, -195.365, 2200.28, 79.7638, 3.39708, 0, 0, 0.991852, -0.127395, 300, 0, 1),
(@OGUID+4, 200336, 33, 1, 1, -196.831, 2204.91, 79.7632, 1.20367, 0, 0, 0.566156, 0.824298, 300, 0, 1),
(@OGUID+5, 200336, 33, 1, 1, -219.536, 2218.93, 79.7617, 2.44437, 0, 0, 0.939848, 0.341594, 300, 0, 1),
(@OGUID+6, 200337, 33, 1, 1, -216.174, 2218.16, 79.9943, 2.39331, 0, 0, 0.930822, 0.365474, 300, 0, 1),
(@OGUID+7, 200337, 33, 1, 1, -220.695, 2219.07, 80.7342, 2.3461, 0, 0, 0.921937, 0.387341, 300, 0, 1),
(@OGUID+8, 200337, 33, 1, 1, -219.984, 2220.02, 80.7347, 2.45614, 0, 0, 0.941842, 0.336056, 300, 0, 1),
(@OGUID+9, 200337, 33, 1, 1, -219.411, 2219.55, 80.734, 2.45614, 0, 0, 0.941842, 0.336056, 300, 0, 1),
(@OGUID+10, 200337, 33, 1, 1, -218.696, 2218.98, 80.7338, 2.43482, 0, 0, 0.938207, 0.346076, 300, 0, 1),
(@OGUID+11, 200337, 33, 1, 1, -220.442, 2218.74, 81.8496, 4.05555, 0, 0, 0.897389, -0.441239, 300, 0, 1),
(@OGUID+12, 200337, 33, 1, 1, -218.131, 2218.47, 80.7339, 2.43482, 0, 0, 0.938207, 0.346076, 300, 0, 1),
(@OGUID+13, 200337, 33, 1, 1, -220.107, 2218.57, 80.7338, 2.45614, 0, 0, 0.941842, 0.336056, 300, 0, 1),
(@OGUID+14, 200337, 33, 1, 1, -219.518, 2218.09, 80.7338, 2.45614, 0, 0, 0.941842, 0.336056, 300, 0, 1),
(@OGUID+15, 200337, 33, 1, 1, -218.841, 2217.53, 80.7338, 2.45614, 0, 0, 0.941842, 0.336056, 300, 0, 1),
(@OGUID+16, 181075, 33, 1, 1, -223.666, 2214.37, 79.7599, 2.89395, 0, 0, 0.992344, 0.123505, 300, 0, 1),
(@OGUID+17, 200337, 33, 1, 1, -223.277, 2213.37, 80.7509, 2.89395, 0, 0, 0.992344, 0.123505, 300, 0, 1),
(@OGUID+18, 181075, 33, 1, 1, -223.096, 2204.93, 79.7616, 3.3362, 0, 0, 0.99527, -0.0971497, 300, 0, 1),
(@OGUID+19, 181075, 33, 1, 1, -224.753, 2209.89, 79.7607, 2.9058, 0, 0, 0.993058, 0.117623, 300, 0, 1),
(@OGUID+20, 200338, 33, 1, 1, -196.769, 2193.22, 79.7586, 5.98932, 0, 0, 0.146407, -0.989224, 300, 0, 1),
(@OGUID+21, 190678, 33, 1, 1, -222.919, 2204.94, 80.7517, 6.06659, 0, 0, 0.108085, -0.994142, 300, 0, 1),
(@OGUID+22, 200338, 33, 1, 1, -197.379, 2193.94, 79.7642, 5.86051, 0, 0, 0.209768, -0.977751, 300, 0, 1),
(@OGUID+23, 200338, 33, 1, 1, -197.695, 2193, 79.7642, 5.86051, 0, 0, 0.209768, -0.977751, 300, 0, 1),
(@OGUID+24, 200336, 33, 1, 1, -200.482, 2165.69, 79.7476, 0.409809, 0, 0, 0.203474, 0.97908, 300, 0, 1),
(@OGUID+25, 201716, 33, 1, 1, -225.964, 2172.72, 79.7658, 4.39995, 0, 0, 0.808512, -0.58848, 300, 0, 1);

DELETE FROM `game_event_gameobject` WHERE `eventEntry` = @EVENT AND `guid` BETWEEN @OGUID AND @OGUID+25;
INSERT INTO `game_event_gameobject` (`eventEntry`,`guid`) VALUES
(@EVENT, @OGUID),
(@EVENT, @OGUID+1),
(@EVENT, @OGUID+2),
(@EVENT, @OGUID+3),
(@EVENT, @OGUID+4),
(@EVENT, @OGUID+5),
(@EVENT, @OGUID+6),
(@EVENT, @OGUID+7),
(@EVENT, @OGUID+8),
(@EVENT, @OGUID+9),
(@EVENT, @OGUID+10),
(@EVENT, @OGUID+11),
(@EVENT, @OGUID+12),
(@EVENT, @OGUID+13),
(@EVENT, @OGUID+14),
(@EVENT, @OGUID+15),
(@EVENT, @OGUID+16),
(@EVENT, @OGUID+17),
(@EVENT, @OGUID+18),
(@EVENT, @OGUID+19),
(@EVENT, @OGUID+20),
(@EVENT, @OGUID+21),
(@EVENT, @OGUID+22),
(@EVENT, @OGUID+23),
(@EVENT, @OGUID+24),
(@EVENT, @OGUID+25);

-- Removes the trashes during Event : 
DELETE FROM `game_event_creature` WHERE `eventEntry` = -8 AND `guid` BETWEEN 16262 AND 18720;
INSERT INTO `game_event_creature` (`eventEntry`,`guid`) VALUES
(-@EVENT, 18697),
(-@EVENT, 16272),
(-@EVENT, 16273),
(-@EVENT, 18713),
(-@EVENT, 18705),
(-@EVENT, 16268),
(-@EVENT, 16267),
(-@EVENT, 16269),
(-@EVENT, 18703),
(-@EVENT, 16275),
(-@EVENT, 16271),
(-@EVENT, 18712),
(-@EVENT, 16263),
(-@EVENT, 16264),
(-@EVENT, 16276),
(-@EVENT, 18702),
(-@EVENT, 18698),
(-@EVENT, 18701),
(-@EVENT, 16265),
(-@EVENT, 16266);

-- Spawns boss : 
SET @CGUID = xxxxxx;

INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(@CGUID, 36296, 33, 1, 1, 0, 0, -209.913, 2215.72, 79.7638, 4.5131, 300, 0, 0, 269620, 0, 0, 0, 0, 0), -- Hummel
(@CGUID+1, 36272, 33, 1, 1, 0, 0, -207.418, 2213.8, 79.7638, 3.03106, 300, 0, 0, 269620, 0, 0, 0, 0, 0), -- Frye
(@CGUID+2, 36565, 33, 1, 1, 0, 0, -213.266, 2214.05, 79.7638, 0.470783, 300, 0, 0, 269620, 0, 0, 0, 0, 0); -- Baxter

DELETE FROM `game_event_creature` WHERE `eventEntry` = 8 AND `guid` BETWEEN @CGUID AND @CGUID+1;
INSERT INTO `game_event_creature` (`eventEntry`,`guid`) VALUES
(@EVENT, @CGUID),
(@EVENT, @CGUID+1),
(@EVENT, @CGUID+2);

-- Moves the Crown Apothecarys
UPDATE `creature` SET `position_x` = -200.286 , `position_y` = 2201.6 , `position_z` = 79.765 , `orientation` = 0.5373 WHERE `guid` = 208793;
UPDATE `creature` SET `position_x` = -220.992 , `position_y` = 2212.8 , `position_z` = 79.761 , `orientation` = 5.8945 WHERE `guid` = 208794;
UPDATE `creature` SET `position_x` = -205.850 , `position_y` = 2178.9 , `position_z` = 79.766 , `orientation` = 0.0274 WHERE `guid` = 208792;

-- Some Template fix
UPDATE `creature_template`  SET `mechanic_immune_mask` = 583744383 , `flags_extra` = 1 WHERE `entry` IN (36296,36565,36272);

-- Faction :
UPDATE `creature_template` SET `faction_A` = 35 , `faction_H` = 35 WHERE `entry` IN (36296, 36565, 36272);

-- Damage : (Yes, they should hit for 300-600. not for 2000-3000)
UPDATE `creature_template` SET dmg_multiplier = 1 WHERE `entry` IN (36296, 36565, 36272);
 
-- Scriptname :
UPDATE `creature_template` SET `ScriptName` = "npc_apothecary_hummel" WHERE `entry` = 36296;
UPDATE `creature_template` SET `ScriptName` = "npc_apothecary_baxter" WHERE `entry` = 36565;
UPDATE `creature_template` SET `ScriptName` = "npc_apothecary_frye" WHERE `entry` = 36272;
UPDATE `creature_template` SET `ScriptName` = "npc_crazed_apothecary" WHERE `entry` = 36568;

-- Makes Apothecary Table Untargetable :
UPDATE `creature_template` SET `unit_flags` = 33554432 WHERE `entry`= 36710;

-- Weapons : 
DELETE FROM  `creature_equip_template` WHERE `entry` = 3000;
INSERT INTO `creature_equip_template` (`entry`,`itemEntry1`,`itemEntry2`,`itemEntry3`) VALUES
(3000,45214,0,0);
UPDATE `creature_template` SET `equipment_id` = 285 WHERE `entry` = 36272; -- Not exactly the same, but it is two botle. tho for frye it is green-purple, this one is green-orange.
UPDATE `creature_template` SET `equipment_id` = 3000 WHERE `entry` IN (36296,36565); -- Flamethrower ? Cant find the id for that (frye has it on the modelid)

-- Some spell scripts :
-- Spills shouldn't be reisistible. (Or no?)
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (68530,68529);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(68530, -68948, 2,"Cologne Immunity to Spray"),
(68530, -68946, 2,"Cologne Immunity to Aura"),
(68530, -68947, 2,"Cologne Immunity to Aura Effect"),
(68529, -68607, 2,"Perfume Immunity to Spray"),
(68529, -68589, 2,"Perfume Immunity to Aura"),
(68529, -68641, 2,"Perfume Immunity to Aura Effect"),
(68530, -68529, 1,"Cologne removes Perfume"),
(68529, -68530, 1,"Perfume removes Cologne");