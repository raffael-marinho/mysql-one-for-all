SELECT COUNT(historico.musica_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.historico
INNER JOIN SpotifyClone.nome ON historico.nome_id = nome.nome_id
WHERE nome.usu_nome = 'Bill';