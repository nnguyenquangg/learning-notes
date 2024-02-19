WITH combined_media AS (SELECT u.id         as user_id,
                               p.image_id   as p_media_id,
                               m.id         as media_id,
                               m.type       as media_type,
                               p.id         as post_id,
                               p.media_type as post_media_type,
                               m.file_size,
                               m.status,
                               NULL         as hm_media_id
                        FROM "user" u
                                 LEFT OUTER JOIN post p ON u.id = p.author_id
                                 LEFT OUTER JOIN media m ON m.id = p.image_id

                        UNION ALL

                        SELECT u.id         as user_id,
                               p.image_id   as p_media_id,
                               m.id         as media_id,
                               m.type       as media_type,
                               p.id         as post_id,
                               p.media_type as post_media_type,
                               m.file_size,
                               m.status,
                               hm.media_id  as hm_media_id
                        FROM "user" u
                                 LEFT OUTER JOIN post p ON u.id = p.author_id
                                 LEFT OUTER JOIN hotspot h ON h.post_id = p.id
                                 LEFT OUTER JOIN hotspot_media hm ON hm.hotspot_id = h.id
                                 LEFT OUTER JOIN media m ON m.id = hm.media_id
						)
select user_id,
       post_id,
       sum(CASE
               WHEN (
                   post_media_type = 1::INTEGER AND media_id = hm_media_id AND media_type = 1 OR
                   post_media_type = 1::INTEGER AND media_id = p_media_id AND media_type = 1::INTEGER)
                   THEN file_size
               ELSE 0::INTEGER END) AS image_size,
       SUM(CASE
               WHEN (p_media_id = media_id) THEN file_size
               ELSE 0::INTEGER
           END)                     AS primary_file_size
from combined_media
GROUP BY user_id, post_id
ORDER BY post_id IS NOT NULL DESC, user_id;