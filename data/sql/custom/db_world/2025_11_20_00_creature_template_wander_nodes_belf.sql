-- Eversong Woods wander nodes (BelfNode1-4), a chain linked only to each other.
-- No hard-coded ids: the nodes are found by name, removed and re-added from the next free id,
-- so a re-run replaces them instead of duplicating them. On a fresh db they get 5164-5167.
DELETE FROM `creature_template_npcbot_wander_nodes` WHERE `mapid` = 530 AND `name` IN ('BelfNode1', 'BelfNode2', 'BelfNode3', 'BelfNode4');

SET @BASE := (SELECT COALESCE(MAX(`id`), 0) + 1 FROM `creature_template_npcbot_wander_nodes`);

INSERT INTO `creature_template_npcbot_wander_nodes`
(`id`, `name`, `mapid`, `zoneid`, `areaid`, `minlevel`, `maxlevel`, `flags`, `x`, `y`, `z`, `o`, `links`) VALUES
(@BASE+0, 'BelfNode1', 530, 3430, 3467, 10, 80, 0, 8715.880, -7030.885, 47.941, 3.0, CONCAT(@BASE+1, ':0')),
(@BASE+1, 'BelfNode2', 530, 3430, 3430, 10, 80, 0, 8974.549, -6880.090, 28.854, 3.0, CONCAT(@BASE+0, ':0 ', @BASE+2, ':0')),
(@BASE+2, 'BelfNode3', 530, 3430, 3430, 10, 80, 0, 9093.646, -6781.424, 15.973, 3.0, CONCAT(@BASE+1, ':0 ', @BASE+3, ':0')),
(@BASE+3, 'BelfNode4', 530, 3430, 3430, 10, 80, 0, 9223.143, -6552.539, 31.774, 3.0, CONCAT(@BASE+2, ':0'));
