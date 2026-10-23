-- Blade's Edge arena wander nodes, linked only to each other.
-- No hard-coded ids: the nodes are found by name, removed and re-added from the next free id,
-- so a re-run replaces them instead of duplicating them. On a fresh db they get 5156-5163.
DELETE FROM `creature_template_npcbot_wander_nodes` WHERE `mapid` = 562 AND `name` IN ('BladesEdgeSpawn1', 'BladesEdgeOutside1', 'BladesEdgeTop1', 'BladesEdgeTop2', 'BladesEdgeSpawn2', 'BladesEdgeOutside2', 'BladesEdgeOther1', 'BladesEdgeOther2');

SET @BASE := (SELECT COALESCE(MAX(`id`), 0) + 1 FROM `creature_template_npcbot_wander_nodes`);

INSERT INTO `creature_template_npcbot_wander_nodes`
(`id`,`name`,`mapid`,`zoneid`,`areaid`,`minlevel`,`maxlevel`,`flags`,`x`,`y`,`z`,`o`,`links`) VALUES
(@BASE+0, 'BladesEdgeSpawn1',     '562', '3702', '3702', '10', '80', '3', '6295', '289', '6',  '3.0', CONCAT(@BASE+1, ':0')),
(@BASE+1, 'BladesEdgeOutside1',   '562', '3702', '3702', '10', '80', '0', '6275', '266', '6',  '3.0', CONCAT(@BASE+0, ':0 ', @BASE+2, ':0 ', @BASE+3, ':0 ', @BASE+4, ':0 ', @BASE+5, ':0 ', @BASE+6, ':0 ', @BASE+7, ':0')),
(@BASE+2, 'BladesEdgeTop1',       '562', '3702', '3702', '10', '80', '0', '6274', '236', '12', '3.0', CONCAT(@BASE+1, ':0 ', @BASE+3, ':0 ', @BASE+4, ':0 ', @BASE+6, ':0 ', @BASE+7, ':0')),
(@BASE+3, 'BladesEdgeTop2',       '562', '3702', '3702', '10', '80', '0', '6211', '283', '12', '3.0', CONCAT(@BASE+1, ':0 ', @BASE+2, ':0 ', @BASE+4, ':0 ', @BASE+6, ':0 ', @BASE+7, ':0')),
(@BASE+4, 'BladesEdgeSpawn2',     '562', '3702', '3702', '10', '80', '5', '6181', '232', '6',  '3.0', CONCAT(@BASE+5, ':0')),
(@BASE+5, 'BladesEdgeOutside2',   '562', '3702', '3702', '10', '80', '0', '6189', '255', '5',  '3.0', CONCAT(@BASE+4, ':0 ', @BASE+1, ':0 ', @BASE+2, ':0 ', @BASE+3, ':0 ', @BASE+6, ':0 ', @BASE+7, ':0')),
(@BASE+6, 'BladesEdgeOther1',     '562', '3702', '3702', '10', '80', '0', '6234', '213', '7',  '3.0', CONCAT(@BASE+1, ':0 ', @BASE+2, ':0 ', @BASE+3, ':0 ', @BASE+5, ':0 ', @BASE+7, ':0')),
(@BASE+7, 'BladesEdgeOther2',     '562', '3702', '3702', '10', '80', '0', '6246', '312', '10', '3.0', CONCAT(@BASE+1, ':0 ', @BASE+2, ':0 ', @BASE+3, ':0 ', @BASE+5, ':0 ', @BASE+6, ':0'));
