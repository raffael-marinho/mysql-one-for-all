SELECT usu_nome AS usuario,
COUNT(h.data_reproducao) qtde_musicas_ouvidas,
ROUND(SUM(m.duracao_seg/60),2) total_minutos FROM SpotifyClone.nome n
JOIN SpotifyClone.historico h ON h.nome_id = n.nome_id
JOIN SpotifyClone.musicas m ON m.musica_id = h.musica_id
GROUP BY usu_nome ORDER BY usu_nome;