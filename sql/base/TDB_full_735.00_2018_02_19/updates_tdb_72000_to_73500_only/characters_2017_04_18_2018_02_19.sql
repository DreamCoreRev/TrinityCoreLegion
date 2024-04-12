-- E:\Repos\TrinityCore6x\sql\old\7\characters\01_2018_02_19\2017_04_19_00_characters.sql 
-- TDB 720.00 characters
DELETE FROM `updates_include` WHERE `path`='$/sql/old/7/characters';
INSERT INTO `updates_include` (`path`, `state`) VALUES ('$/sql/old/7/characters', 'ARCHIVED');
UPDATE `updates` SET `state`='ARCHIVED';
 
-- E:\Repos\TrinityCore6x\sql\old\7\characters\01_2018_02_19\2017_05_08_00_characters.sql 
ALTER TABLE `item_instance` ADD `context` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `battlePetDisplayId`;

ALTER TABLE `character_void_storage` ADD `context` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `artifactKnowledgeLevel`;

ALTER TABLE `item_loot_items`
  ADD `context` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `rnd_suffix`,
  ADD `bonus_list_ids` text COMMENT 'Space separated list of bonus list ids' AFTER `context`;
 
-- E:\Repos\TrinityCore6x\sql\old\7\characters\01_2018_02_19\2017_05_14_00_characters.sql 
-- Drop guild level
ALTER TABLE `guild` DROP `level`;
 
-- E:\Repos\TrinityCore6x\sql\old\7\characters\01_2018_02_19\2017_05_24_00_characters.sql 
ALTER TABLE `characters`
  ADD `playerFlagsEx` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `playerFlags`;
 
-- E:\Repos\TrinityCore6x\sql\old\7\characters\01_2018_02_19\2017_06_04_00_characters.sql 
ALTER TABLE `characters`
  ADD `honor` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `deleteDate`,
  ADD `honorLevel` INT(10) UNSIGNED NOT NULL DEFAULT '1' AFTER `honor`,
  ADD `prestigeLevel` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `honorLevel`,
  ADD `honorRestState` TINYINT UNSIGNED NOT NULL DEFAULT '2' AFTER `prestigeLevel`,
  ADD `honorRestBonus` FLOAT NOT NULL DEFAULT '0' AFTER `honorRestState`;
 
-- E:\Repos\TrinityCore6x\sql\old\7\characters\01_2018_02_19\2017_08_20_00_characters.sql 
--
-- Table structure for table `character_queststatus_objectives_criteria`
--
DROP TABLE IF EXISTS `character_queststatus_objectives_criteria`;
CREATE TABLE `character_queststatus_objectives_criteria` (
  `guid` bigint(20) unsigned NOT NULL,
  `questObjectiveId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`guid`,`questObjectiveId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `character_queststatus_objectives_criteria_progress`
--
DROP TABLE IF EXISTS `character_queststatus_objectives_criteria_progress`;
CREATE TABLE `character_queststatus_objectives_criteria_progress` (
  `guid` bigint(20) unsigned NOT NULL,
  `criteriaId` int(10) unsigned NOT NULL,
  `counter` bigint(20) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`criteriaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
-- E:\Repos\TrinityCore6x\sql\old\7\characters\01_2018_02_19\2017_08_20_01_characters.sql 
ALTER TABLE `auctionhouse`
  CHANGE `buyoutprice` `buyoutprice` bigint(20) unsigned NOT NULL DEFAULT '0',
  CHANGE `lastbid` `lastbid` bigint(20) unsigned NOT NULL DEFAULT '0',
  CHANGE `startbid` `startbid` bigint(20) unsigned NOT NULL DEFAULT '0',
  CHANGE `deposit` `deposit` bigint(20) unsigned NOT NULL DEFAULT '0';

ALTER TABLE `guild_member_withdraw` CHANGE `money` `money` bigint(20) unsigned NOT NULL DEFAULT '0';

ALTER TABLE `item_refund_instance` CHANGE `paidMoney` `paidMoney` bigint(20) unsigned NOT NULL DEFAULT '0';
 
-- E:\Repos\TrinityCore6x\sql\old\7\characters\01_2018_02_19\2017_10_29_00_characters.sql 
UPDATE `characters` SET `taxi_path`=CONCAT('0 ', `taxi_path`) WHERE LENGTH(`taxi_path`) > 0;
 
-- E:\Repos\TrinityCore6x\sql\old\7\characters\01_2018_02_19\2018_02_03_00_characters.sql 
ALTER TABLE `characters` ADD `inventorySlots` tinyint(3) unsigned NOT NULL DEFAULT '16' AFTER `customDisplay3`;

UPDATE `character_inventory` SET `slot`=`slot`+8 WHERE `slot`>=39 AND `bag`=0;
 
-- E:\Repos\TrinityCore6x\sql\old\7\characters\01_2018_02_19\2018_02_08_00_characters.sql 
ALTER TABLE `characters` ADD `lastLoginBuild` int(10) unsigned NOT NULL DEFAULT '0' AFTER `honorRestBonus`;
 
