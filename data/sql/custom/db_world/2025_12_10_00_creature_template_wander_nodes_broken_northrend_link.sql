--
-- Update links for node 4221
UPDATE `creature_template_npcbot_wander_nodes`
SET `links` = '4222:0 4063:0 '
WHERE `id` = 4221;

-- Update links for node 4063
UPDATE `creature_template_npcbot_wander_nodes`
SET `links` = '3831:0 4221:0 '
WHERE `id` = 4063;

