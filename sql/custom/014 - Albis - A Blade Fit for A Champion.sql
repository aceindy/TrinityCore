
-- A Blade Fit for a Champion DB Patch
-- (13603,13666,13673,13741,13746,13752,13757,13762,13768,13773,13778,13783)

UPDATE `creature_template` SET `npcflag` = 1 , ScriptName = 'npc_maiden_of_ashwood_lake' WHERE `entry` = 33220; -- Gossip Flag
UPDATE `creature_template` SET ScriptName = 'npc_lake_frog' WHERE `entry` = 33211;
