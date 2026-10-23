-- Nagrand arena wander nodes (NagrandArena1-9), linked only to each other.
-- No hard-coded ids: the nodes are found by name, removed and re-added from the next free id,
-- so a re-run replaces them instead of duplicating them. On a fresh db they get 5147-5155.
DELETE FROM `creature_template_npcbot_wander_nodes` WHERE `mapid` = 559 AND `name` IN ('NagrandArena1', 'NagrandArena2', 'NagrandArena3', 'NagrandArena4', 'NagrandArena5', 'NagrandArena6', 'NagrandArena7', 'NagrandArena8', 'NagrandArena9');

SET @BASE := (SELECT COALESCE(MAX(`id`), 0) + 1 FROM `creature_template_npcbot_wander_nodes`);

INSERT INTO `creature_template_npcbot_wander_nodes`(`id`, `name`, `mapid`, `zoneid`, `areaid`, `minlevel`, `maxlevel`, `flags`, `x`, `y`, `z`, `o`, `links`) VALUES
(@BASE+0, 'NagrandArena1', 559, 3698, 3698, 10, 80, 5, 4084.11, 2869.94, 12.10, 2.3, CONCAT(@BASE+1, ':0 ')),
(@BASE+1, 'NagrandArena2', 559, 3698, 3698, 10, 80, 0, 4057.55, 2920.75, 13.53, 2.68, CONCAT(@BASE+0, ':0 ', @BASE+2, ':0 ', @BASE+5, ':0 ', @BASE+6, ':0 ')),
(@BASE+2, 'NagrandArena3', 559, 3698, 3698, 10, 80, 3, 4029.73, 2970.48, 12.16, 5.1, CONCAT(@BASE+1, ':0 ')),

-- New Nagrand arena nodes
(@BASE+3, 'NagrandArena4', 559, 3698, 3698, 10, 80, 0, 4053.06, 2876.17, 12.57, 3.50, CONCAT(@BASE+5, ':0 ', @BASE+4, ':0 ')), -- SW
(@BASE+4, 'NagrandArena5', 559, 3698, 3698, 10, 80, 0, 4094.84, 2900.31, 12.66, 2.23, CONCAT(@BASE+6, ':0 ', @BASE+3, ':0 ')), -- SE
(@BASE+5, 'NagrandArena6', 559, 3698, 3698, 10, 80, 0, 4022.66, 2905.60, 12.58, 3.80, CONCAT(@BASE+1, ':0 ', @BASE+3, ':0 ', @BASE+7, ':0 ')), -- CW
(@BASE+6, 'NagrandArena7', 559, 3698, 3698, 10, 80, 0, 4090.20, 2935.846, 13.02, 3.33, CONCAT(@BASE+1, ':0 ', @BASE+8, ':0 ', @BASE+4, ':0 ')), -- CE
(@BASE+7, 'NagrandArena8', 559, 3698, 3698, 10, 80, 0, 4016.42, 2939.98, 12.66, 3.48, CONCAT(@BASE+5, ':0 ', @BASE+8, ':0 ')), -- NW
(@BASE+8, 'NagrandArena9', 559, 3698, 3698, 10, 80, 0, 4061.11, 2963.52, 12.66, 2.50, CONCAT(@BASE+6, ':0 ', @BASE+7, ':0 ')); -- NE
