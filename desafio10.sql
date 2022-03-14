SELECT musicas.titulo AS nome,
COUNT(musicas.titulo) AS reproducoes
FROM nome
    INNER JOIN planos ON nome.plano_id = planos.plano_id
    INNER JOIN historico ON nome.nome_id = historico.nome_id
    INNER JOIN musicas ON historico.musica_id = musicas.musica_id
WHERE planos.tipo = 'gratuito'
    OR planos.tipo = 'pessoal'
GROUP BY musicas.titulo
ORDER BY musicas.titulo;