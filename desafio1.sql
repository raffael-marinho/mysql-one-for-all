DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.planos(
    plano_id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(100) NOT NULL,
    valor decimal(5,2) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.artistas(
    artista_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    art_nome VARCHAR(100) NOT NULL    
) engine = InnoDB;

CREATE TABLE SpotifyClone.nome(
    nome_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,    
    usu_nome VARCHAR(100) NOT NULL,
    plano_id INT NOT NULL,
    data_assinatura DATE NOT NULL,
    idade INT NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.albums(
    album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    album VARCHAR(100) NOT NULL,
    artista_id INT NOT NULL,    
    ano YEAR NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.musicas(
    musica_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    duracao_seg INT NOT NULL,
    artista_id INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id),
    FOREIGN KEY (album_id) REFERENCES albums(album_id)    
) engine = InnoDB;

CREATE TABLE SpotifyClone.historico(
	CONSTRAINT his_id   PRIMARY KEY (data_reproducao, nome_id, musica_id),
    musica_id INT NOT NULL,
    data_reproducao DATETIME NOT NULL,
    nome_id INT NOT NULL,
    FOREIGN KEY(musica_id)  REFERENCES musicas(musica_id),
    FOREIGN KEY(nome_id) REFERENCES nome(nome_id)
    ) engine = InnoDB;

CREATE TABLE SpotifyClone.seguindo_artista(
    CONSTRAINT id   PRIMARY KEY (artista_id,nome_id),
    artista_id      INT NOT NULL,
    nome_id      INT NOT NULL,

    FOREIGN KEY(artista_id) REFERENCES artistas(artista_id),
    FOREIGN KEY(nome_id) REFERENCES nome(nome_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.planos (tipo, valor)
VALUES
('gratuito', 0), ('familiar', 7.99), ('universitário', 5.99), ('pessoal', 6.99);

INSERT INTO SpotifyClone.artistas (art_nome)
VALUES
('Walter Phoenix'), ('Peter Strong'), ('Lance Day'), ('Freedie Shannon'), ('Tyler Isle'), ('Fog');

INSERT INTO SpotifyClone.albums (album, artista_id, ano)
VALUES
('Envious',	1, 1990), ('Exuberant', 1, 1993), ('Hallowed Steam', 2, 1995), ('Incandescent', 3, 1998), ('Temporary Culture', 4, 2001), ('Library of liberty', 4, 2003), ('Chained Down', 5, 2007), ('Cabinet of fools', 5, 2012), ('No guarantees', 5, 2015), ('Apparatus', 6, 2015);

INSERT INTO SpotifyClone.nome (usu_nome, idade, plano_id, data_assinatura)
VALUES
 ('Thati', 23, 1,'2019-10-20'), ('Cintia', 35, 2,'2017-12-30'), ('Bill',20, 3,'2019-06-05'), ('Roger',45, 4, '2020-05-13'), ('Norman',58, 4, '2017-02-17'), ('Patrick',33, 2, '2017-01-06'), ('Vivian',26, 3, '2018-01-05'), ('Carol',19, 3, '2018-02-14'), ('Angelina', 42, 2, '2018-04-29'), ('Paul', 46, 2, '2017-01-17');

INSERT INTO SpotifyClone.musicas(titulo, duracao_seg, album_id, artista_id)
VALUES
('Soul For Us', 200, 1, 1), ( "Reflections Of Magic", 163, 1, 1), ("Dance With Her Own", 116, 1, 1), ('Troubles Of My Inner Fire', 203, 2, 1), ("Time Fireworks", 152, 2, 1), ('Magic Circus', 105, 3, 2), ("Honey, So Do I", 207, 3, 2), ("Sweetie, Let's Go Wild", 139, 3, 2), ("She Knows", 244, 3, 2), ("Fantasy For Me", 100, 4, 3), ("Celebration Of More", 146, 4, 3), ("Rock His Everything", 223, 4,	3), ("Home Forever", 231, 4, 3), ("Diamond Power", 241, 4, 3), ("Let's Be Silly", 132, 4, 3), ("Thang Of Thunder", 240, 5, 4), ("Words Of Her Life", 185, 5, 4), ("Without My Streets", 176, 5,	4), ("Need Of The Evening", 190, 6, 4), ("History Of My Roses", 222, 6, 4), ("Without My Love", 111, 6, 4), ("Walking And Game", 123, 6, 4), ("Young And Father", 197, 6, 4), ("Finding My Traditions", 179, 7, 5), ("Walking And Man", 229, 7, 5), ("Hard And Time", 135, 7, 5), ("Honey, I'm A Lone Wolf", 150, 7, 5), ("She Thinks I Won't Stay Tonight", 166, 8, 5), ("He Heard You're Bad For Me", 154, 8, 5), ("He Hopes We Can't Stay", 210, 8, 5), ("I Know I Know", 117, 8, 5), ("He's Walking Away", 159, 9, 5), ("He's Trouble", 138, 9, 5), ("I Heard I Want To Bo Alone", 120, 9, 5), ("I Ride Alone", 151, 9, 5), ("Honey", 79, 10, 6), ("You Cheated On Me", 95, 10, 6), ("Wouldn't It Be Nice", 213, 10, 6), ("Baby", 136, 10, 6), ("You Make Me Feel So..", 83, 10, 6);

INSERT INTO SpotifyClone.historico (musica_id, data_reproducao, nome_id)
VALUES
(36, "2020-02-28 10:45:55", 1), (25, "2020-05-02 05:30:35", 1), (23, "2020-03-06 11:22:33", 1), (14, "2020-08-05 08:05:17", 1), (15, "2020-09-14 16:32:22", 1), (34, "2020-01-02 07:40:33", 2), (24, "2020-05-16 06:16:22", 2), (21, "2020-10-09 12:27:48", 2), (39, "2020-09-21 13:14:46", 2), (6, "2020-11-13 16:55:13", 3), (3, "2020-12-05 18:38:30", 3), (26, "2020-07-30 10:00:00", 3), (2, "2021-08-15 17:10:10", 4), (35, "2021-07-10 15:20:30", 4), (27, "2021-01-09 01:44:33", 4), (7, "2020-07-03 19:33:28", 5), (12, "2017-02-24 21:14:22", 5), (14, "2020-08-06 15:23:43", 5), (1, "2020-11-10 13:52:27", 5), (38, "2019-02-07 20:33:48", 6), (29, "2017-01-24 00:31:17", 6), (30, "2017-10-12 12:35:20", 6), (22, "2018-05-29 14:56:41", 6), (5, "2018-05-09 22:30:49", 7), (4, "2020-07-27 12:52:58", 7), (11, "2018-01-16 18:40:43", 7), (39, "2018-03-21 16:56:40", 8), (40, "2020-10-18 13:38:05", 8), (32, "2019-05-25 08:14:03", 8), (33, "2021-08-15 21:37:09", 8), (16, "2021-05-24 17:23:45", 9), (17, "2018-12-07 22:48:52", 9), (8, "2021-03-14 06:14:26", 9), (9, "2020-04-01 03:36:00", 9), (20, "2017-02-06 08:21:34", 10), (21, "2017-12-04 05:33:43", 10), (12, "2017-07-27 05:24:49", 10), (13, "2017-12-25 01:03:57", 10);

INSERT INTO SpotifyClone.seguindo_artista(artista_id, nome_id)
VALUES
(1, 1), (4, 1), (3, 1), (1, 2), (3, 2), (2, 3), (1, 3), (4, 4), (5, 5), (6, 5), (6, 6), (3, 6), (1, 6), (2, 7), (5, 7), (1, 8), (5, 8), (6, 9), (4, 9), (3, 9), (2, 10), (6, 10);