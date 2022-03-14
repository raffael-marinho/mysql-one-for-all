SELECT COUNT( DISTINCT m.musica_id) cancoes,
COUNT( DISTINCT a.artista_id) artistas,
COUNT( DISTINCT al.album_id) albuns
FROM SpotifyClone.musicas m
JOIN SpotifyClone.artistas a ON m.artista_id = a.artista_id
JOIN SpotifyClone.albums al ON al.artista_id = a.artista_id;