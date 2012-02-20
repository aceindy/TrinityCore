-- Fix Hot on The Trail
-- By Albis

SET @QUEST_A               := 24849;
SET @QUEST_H               := 24851;

SET @TRIGGER_BANK_SW       := 5710;
SET @TRIGGER_AH_SW         := 5711;
SET @TRIGGER_BARBER_SW     := 5712;
SET @TRIGGER_BANK_ORG      := 5715;
SET @TRIGGER_AH_ORG        := 5714;
SET @TRIGGER_BARBER_ORG    := 5716;

DELETE FROM `areatrigger_involvedrelation` WHERE `id` IN (@TRIGGER_BANK_SW,@TRIGGER_AH_SW,@TRIGGER_BARBER_SW,@TRIGGER_BANK_ORG,@TRIGGER_AH_ORG,@TRIGGER_BARBER_ORG);
UPDATE `quest_template` SET `SpecialFlags`= 0 WHERE `Id` IN (@QUEST_A,@QUEST_H);