-- spell_script_names

DELETE FROM `spell_script_names` WHERE `spell_id` = 131347 AND `ScriptName` = 'spell_dh_glide';
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES (131347, 'spell_dh_glide');

-- spell_linked_spell

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=131347 AND `spell_effect`=100086 AND `type`=0;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(131347, 100086, 0, 'Glide triggers Knockback Forward');