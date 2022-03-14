SELECT usu_nome AS usuario,
	CASE
		WHEN MAX(YEAR(h.data_reproducao)) = '2021' THEN 'Usuário ativo'
        ELSE 'Usuário inativo'
	END condicao_usuario
FROM SpotifyClone.nome n
JOIN SpotifyClone.historico h ON n.nome_id = h.nome_id
GROUP BY usuario
ORDER BY usuario;