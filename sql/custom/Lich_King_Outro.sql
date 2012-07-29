
DELETE FROM `creature_text` WHERE `entry` = 38995 AND `groupid` = 4;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(38995, 4, 0, 'THE LICH KING...MUST...FALL!', 14, 0, 0, 0, 0, 17389, 'Highlord Tirion Fordring - SAY_TIRION_OUTRO_3');

UPDATE `creature_text` SET `sound` = 17352 WHERE `entry` = 36597 AND `groupid` = 3; -- Lich King's Agrro
