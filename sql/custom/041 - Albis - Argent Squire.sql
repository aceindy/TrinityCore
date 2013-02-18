
-- Fix Argent Squire/Gruntling

SET @SQUIRE = 33238;
SET @GRUNTLING = 33239;
SET @GOSSIP = xxxxx;

-- Set Gossip and Vendor Flags & Scriptname
UPDATE creature_template SET npcflag = npcflag | 0x81, gossip_menu_id = @GOSSIP, ScriptName = 'npc_argent_squire' WHERE entry = @SQUIRE;
UPDATE creature_template SET npcflag = npcflag | 0x81, gossip_menu_id = @GOSSIP + 1, ScriptName = 'npc_argent_squire' WHERE entry = @GRUNTLING;

-- Add Gossip Menu, menu id is custom, Text Not Verified
DELETE FROM gossip_menu WHERE entry IN (@GOSSIP, @GOSSIP + 1);
INSERT INTO gossip_menu VALUES
(@GOSSIP, 14324),
(@GOSSIP + 1, 14372);

-- When the Errand Buff Times 0ut the Squire gets Tired
DELETE FROM spell_linked_spell WHERE spell_effect = 67401;
INSERT INTO spell_linked_spell VALUES
(-67368, 67401, 0, "Argent Squire - Bank"),
(-67377, 67401, 0, "Argent Squire - Shop"),
(-67376, 67401, 0, "Argent Squire - Mail");

-- Vendor Items
DELETE FROM npc_vendor WHERE entry IN (@SQUIRE, @GRUNTLING);
INSERT INTO npc_vendor VALUES
-- Squire
(@SQUIRE, 1, 3775, 0, 0, 0),
(@SQUIRE, 2, 5237, 0, 0, 0),
(@SQUIRE, 3, 5565, 0, 0, 0),
(@SQUIRE, 4, 16583, 0, 0, 0),
(@SQUIRE, 5, 17020, 0, 0, 0),
(@SQUIRE, 6, 17030, 0, 0, 0),
(@SQUIRE, 7, 17031, 0, 0, 0),
(@SQUIRE, 8, 17032, 0, 0, 0),
(@SQUIRE, 9, 17033, 0, 0, 0),
(@SQUIRE, 10, 21177, 0, 0, 0),
(@SQUIRE, 11, 37201, 0, 0, 0),
(@SQUIRE, 12, 41584, 0, 0, 0),
(@SQUIRE, 13, 41586, 0, 0, 0),
(@SQUIRE, 14, 43231, 0, 0, 0),
(@SQUIRE, 15, 43233, 0, 0, 0),
(@SQUIRE, 16, 43235, 0, 0, 0),
(@SQUIRE, 17, 43237, 0, 0, 0),
(@SQUIRE, 18, 44605, 0, 0, 0),
(@SQUIRE, 19, 44614, 0, 0, 0),
(@SQUIRE, 20, 44615, 0, 0, 0),
(@SQUIRE, 21, 33449, 0, 0, 0),
(@SQUIRE, 22, 33451, 0, 0, 0),
(@SQUIRE, 23, 33454, 0, 0, 0),
(@SQUIRE, 24, 33443, 0, 0, 0),
(@SQUIRE, 25, 35949, 0, 0, 0),
(@SQUIRE, 26, 35952, 0, 0, 0),
(@SQUIRE, 27, 35953, 0, 0, 0),
(@SQUIRE, 28, 35951, 0, 0, 0),
(@SQUIRE, 29, 35948, 0, 0, 0),
(@SQUIRE, 30, 35950, 0, 0, 0),
-- Gruntling
(@GRUNTLING, 1, 3775, 0, 0, 0),
(@GRUNTLING, 2, 5237, 0, 0, 0),
(@GRUNTLING, 3, 5565, 0, 0, 0),
(@GRUNTLING, 4, 16583, 0, 0, 0),
(@GRUNTLING, 5, 17020, 0, 0, 0),
(@GRUNTLING, 6, 17030, 0, 0, 0),
(@GRUNTLING, 7, 17031, 0, 0, 0),
(@GRUNTLING, 8, 17032, 0, 0, 0),
(@GRUNTLING, 9, 17033, 0, 0, 0),
(@GRUNTLING, 10, 21177, 0, 0, 0),
(@GRUNTLING, 11, 37201, 0, 0, 0),
(@GRUNTLING, 12, 41584, 0, 0, 0),
(@GRUNTLING, 13, 41586, 0, 0, 0),
(@GRUNTLING, 14, 43231, 0, 0, 0),
(@GRUNTLING, 15, 43233, 0, 0, 0),
(@GRUNTLING, 16, 43235, 0, 0, 0),
(@GRUNTLING, 17, 43237, 0, 0, 0),
(@GRUNTLING, 18, 44605, 0, 0, 0),
(@GRUNTLING, 19, 44614, 0, 0, 0),
(@GRUNTLING, 20, 44615, 0, 0, 0),
(@GRUNTLING, 21, 33449, 0, 0, 0),
(@GRUNTLING, 22, 33451, 0, 0, 0),
(@GRUNTLING, 23, 33454, 0, 0, 0),
(@GRUNTLING, 24, 33443, 0, 0, 0),
(@GRUNTLING, 25, 35949, 0, 0, 0),
(@GRUNTLING, 26, 35952, 0, 0, 0),
(@GRUNTLING, 27, 35953, 0, 0, 0),
(@GRUNTLING, 28, 35951, 0, 0, 0),
(@GRUNTLING, 29, 35948, 0, 0, 0),
(@GRUNTLING, 30, 35950, 0, 0, 0);
