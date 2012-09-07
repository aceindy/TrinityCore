
DELETE FROM trinity_string WHERE entry IN (9000, 9001, 9002);
INSERT INTO trinity_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8) VALUES 
(9000, '%s have been muted by %s for %u minutes. Reason: %s.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9001, '%s have been banned by %s for %s. Reason: %s.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9002, '%s have been permanently banned by %s. Reason: %s.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
