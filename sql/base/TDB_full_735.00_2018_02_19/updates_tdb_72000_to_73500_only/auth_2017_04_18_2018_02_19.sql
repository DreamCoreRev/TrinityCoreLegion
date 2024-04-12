-- E:\Repos\TrinityCore6x\sql\old\7\auth\01_2018_02_19\2017_04_19_00_auth.sql 
-- TDB 720.00 auth
DELETE FROM `updates_include` WHERE `path`='$/sql/old/7/auth';
INSERT INTO `updates_include` (`path`, `state`) VALUES ('$/sql/old/7/auth', 'ARCHIVED');
UPDATE `updates` SET `state`='ARCHIVED';
 
-- E:\Repos\TrinityCore6x\sql\old\7\auth\01_2018_02_19\2017_04_22_00_auth.sql 
UPDATE `realmlist` SET `gamebuild`=23937 WHERE `gamebuild`=23911;

ALTER TABLE `realmlist` CHANGE `gamebuild` `gamebuild` int(10) unsigned NOT NULL DEFAULT '23937';
 
-- E:\Repos\TrinityCore6x\sql\old\7\auth\01_2018_02_19\2017_04_27_00_auth.sql 
UPDATE `realmlist` SET `gamebuild`=24015 WHERE `gamebuild`=23937;

ALTER TABLE `realmlist` CHANGE `gamebuild` `gamebuild` int(10) unsigned NOT NULL DEFAULT '24015';
 
-- E:\Repos\TrinityCore6x\sql\old\7\auth\01_2018_02_19\2017_05_14_00_auth.sql 
DELETE FROM `rbac_permissions` WHERE `id` IN (853, 854);
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(853, 'Command: .reload conversation_template'),
(854, 'Command: .debug conversation');

DELETE FROM `rbac_linked_permissions` WHERE `id` = 192 AND `linkedId` IN (853, 854);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
(192, 853),
(192, 854);
 
-- E:\Repos\TrinityCore6x\sql\old\7\auth\01_2018_02_19\2017_06_15_00_auth.sql 
UPDATE `realmlist` SET `gamebuild`=24330 WHERE `gamebuild`=24015;

ALTER TABLE `realmlist` CHANGE `gamebuild` `gamebuild` int(10) unsigned NOT NULL DEFAULT '24330';
 
-- E:\Repos\TrinityCore6x\sql\old\7\auth\01_2018_02_19\2017_06_18_00_auth.sql 
UPDATE `realmlist` SET `gamebuild`=24367 WHERE `gamebuild`=24330;

ALTER TABLE `realmlist` CHANGE `gamebuild` `gamebuild` int(10) unsigned NOT NULL DEFAULT '24367';
 
-- E:\Repos\TrinityCore6x\sql\old\7\auth\01_2018_02_19\2017_06_25_00_auth.sql 
UPDATE `realmlist` SET `gamebuild`=24415 WHERE `gamebuild`=24367;

ALTER TABLE `realmlist` CHANGE `gamebuild` `gamebuild` int(10) unsigned NOT NULL DEFAULT '24415';
 
-- E:\Repos\TrinityCore6x\sql\old\7\auth\01_2018_02_19\2017_06_28_00_auth.sql 
UPDATE `realmlist` SET `gamebuild`=24430 WHERE `gamebuild`=24415;

ALTER TABLE `realmlist` CHANGE `gamebuild` `gamebuild` int(10) unsigned NOT NULL DEFAULT '24430';
 
-- E:\Repos\TrinityCore6x\sql\old\7\auth\01_2018_02_19\2017_06_30_00_auth.sql 
UPDATE `realmlist` SET `gamebuild`=24461 WHERE `gamebuild`=24430;

ALTER TABLE `realmlist` CHANGE `gamebuild` `gamebuild` int(10) unsigned NOT NULL DEFAULT '24461';
 
-- E:\Repos\TrinityCore6x\sql\old\7\auth\01_2018_02_19\2017_08_04_00_auth.sql 
UPDATE `realmlist` SET `gamebuild`=24742 WHERE `gamebuild`=24461;

ALTER TABLE `realmlist` CHANGE `gamebuild` `gamebuild` int(10) unsigned NOT NULL DEFAULT '24742';
 
-- E:\Repos\TrinityCore6x\sql\old\7\auth\01_2018_02_19\2017_08_13_00_auth_2016_09_22_00_auth.sql 
DELETE FROM `rbac_permissions` WHERE `id` = 698;
 
-- E:\Repos\TrinityCore6x\sql\old\7\auth\01_2018_02_19\2017_09_22_00_auth.sql 
ALTER TABLE `battlenet_accounts`
  ADD `LoginTicket` varchar(64),
  ADD `LoginTicketExpiry` int(10) unsigned;
 
-- E:\Repos\TrinityCore6x\sql\old\7\auth\01_2018_02_19\2017_11_11_01_auth.sql 
--
DELETE FROM `rbac_permissions` WHERE `id`=867;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(867, 'Command: modify power');

DELETE FROM `rbac_linked_permissions` WHERE `id`=198 AND `linkedId`=867;
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES (198, 867);
 
-- E:\Repos\TrinityCore6x\sql\old\7\auth\01_2018_02_19\2017_12_30_00_auth.sql 
ALTER TABLE `account` CHANGE `sessionkey` `sessionkey` varchar(128) NOT NULL DEFAULT '';

UPDATE `realmlist` SET `gamebuild`=25549 WHERE `gamebuild`=24742;

ALTER TABLE `realmlist` CHANGE `gamebuild` `gamebuild` int(10) unsigned NOT NULL DEFAULT '25549';
 
-- E:\Repos\TrinityCore6x\sql\old\7\auth\01_2018_02_19\2017_12_30_01_auth.sql 
--
DELETE FROM `rbac_linked_permissions` WHERE `id`=198 AND `linkedId`=867;
DELETE FROM `rbac_permissions` WHERE `id`=867;
--
DELETE FROM `rbac_linked_permissions` WHERE `id`=198 AND `linkedId`=868;
DELETE FROM `rbac_permissions` WHERE `id`=868;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(868, 'Command: modify power');

INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
(198, 868);
 
-- E:\Repos\TrinityCore6x\sql\old\7\auth\01_2018_02_19\2017_12_31_00_auth.sql 
DELETE FROM `rbac_permissions` WHERE `id`=869;
INSERT INTO `rbac_permissions` (`id`,`name`) VALUES
(869,'Command: debug send playerchoice');

DELETE FROM `rbac_linked_permissions` WHERE `linkedId`=869;
INSERT INTO `rbac_linked_permissions` (`id`,`linkedId`) VALUES
(196,869);
 
-- E:\Repos\TrinityCore6x\sql\old\7\auth\01_2018_02_19\2018_01_02_00_auth.sql 
SET @sql_mode = @@session.sql_mode;
SET SESSION sql_mode = '';

ALTER TABLE `account`
  CHANGE `last_login` `last_login` TIMESTAMP NULL;

UPDATE `account` SET `last_login`=NULL WHERE `last_login`='0000-00-00 00:00:00';

ALTER TABLE `battlenet_accounts`
  CHANGE `last_login` `last_login` TIMESTAMP NULL;

UPDATE `battlenet_accounts` SET `last_login`=NULL WHERE `last_login`='0000-00-00 00:00:00';

SET SESSION sql_mode = @@sql_mode;
 
-- E:\Repos\TrinityCore6x\sql\old\7\auth\01_2018_02_19\2018_02_18_00_auth.sql 
UPDATE `realmlist` SET `gamebuild`=25996 WHERE `gamebuild`=25549;

ALTER TABLE `realmlist` CHANGE `gamebuild` `gamebuild` int(10) unsigned NOT NULL DEFAULT '25996';
 
