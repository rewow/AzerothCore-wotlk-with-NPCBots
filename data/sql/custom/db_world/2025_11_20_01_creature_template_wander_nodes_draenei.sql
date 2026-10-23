-- Azuremyst Isle wander nodes (DraeneiNode1-4), a chain linked only to each other.
-- No hard-coded ids: the nodes are found by name, removed and re-added from the next free id,
-- so a re-run replaces them instead of duplicating them. On a fresh db they get 5168-5171.
DELETE FROM `creature_template_npcbot_wander_nodes` WHERE `mapid` = 530 AND `name` IN ('DraeneiNode1', 'DraeneiNode2', 'DraeneiNode3', 'DraeneiNode4');

SET @BASE := (SELECT COALESCE(MAX(`id`), 0) + 1 FROM `creature_template_npcbot_wander_nodes`);

INSERT INTO `creature_template_npcbot_wander_nodes`
(`id`, `name`, `mapid`, `zoneid`, `areaid`, `minlevel`, `maxlevel`, `flags`, `x`, `y`, `z`, `o`, `links`) VALUES
(@BASE+0, 'DraeneiNode1', 530, 3524, 3524, 10, 80, 0, -3891.064, -12421.686, 3.071, 3.0, CONCAT(@BASE+1, ':0')),
(@BASE+1, 'DraeneiNode2', 530, 3524, 3524, 10, 80, 0, -3628.414, -12358.312, -1.137, 3.0, CONCAT(@BASE+0, ':0 ', @BASE+2, ':0')),
(@BASE+2, 'DraeneiNode3', 530, 3524, 3572, 10, 80, 0, -3410.904, -12370.770, 17.233, 3.0, CONCAT(@BASE+1, ':0 ', @BASE+3, ':0')),
(@BASE+3, 'DraeneiNode4', 530, 3524, 3524, 10, 80, 0, -3456.111, -12098.021, 27.502, 3.0, CONCAT(@BASE+2, ':0'));
