SELECT m.titulo AS cancao,
COUNT(*) AS reproducoes
FROM musicas m
INNER JOIN historico h ON m.musica_id = h.musica_id
GROUP BY m.titulo
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;