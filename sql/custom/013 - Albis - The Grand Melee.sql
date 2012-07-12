
-- The Grand Melee
-- (13665,13745,13750,13756,13761,13767,13772,13777,13782,13787);

-- Remove Wrong Gossips :
DELETE FROM gossip_menu_option WHERE menu_id = 10458;

-- Set Scriptname, Dmg Multiplier for Valiants :
UPDATE creature_template SET ScriptName = 'npc_valiant' , dmg_multiplier = 2 , gossip_menu_id = 10464 WHERE entry IN (33285,33306,33382,33383,33384,33558,33559,33561,33562,33564);

-- Remove wrong ScriptName that was set by TC :
UPDATE creature_template SET ScriptName = '' , gossip_menu_id = 10457 WHERE entry IN (33738,33739,33740,33743,33744,33745,33746,33747,33748,33749);
