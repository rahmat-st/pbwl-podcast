CREATE TABLE tb_artist (
	artist_id SMALLINT(5) NOT NULL AUTO_INCREMENT,
	artist_name CHAR(128) NOT NULL,
	PRIMARY KEY (artist_id)
);

CREATE TABLE tb_album (
	artist_id SMALLINT(5),
	album_id SMALLINT(4) NOT NULL AUTO_INCREMENT,
	album_name CHAR(128),
	PRIMARY KEY (album_id),
	FOREIGN KEY (artist_id) REFERENCES tb_artist(artist_id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE tb_track (
	track_id SMALLINT(3) NOT NULL AUTO_INCREMENT,
	track_name CHAR(128) NOT NULL,
	artist_id SMALLINT(5),
	album_id SMALLINT(4),
	time DECIMAL(5,2) NOT NULL,
	PRIMARY KEY (track_id),
	FOREIGN KEY (artist_id) REFERENCES tb_artist(artist_id) ON UPDATE CASCADE ON DELETE RESTRICT,
	FOREIGN KEY (album_id) REFERENCES tb_album(album_id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE tb_played (
	artist_id SMALLINT(5),
	album_id SMALLINT(4),
	track_id SMALLINT(3),
	played TIMESTAMP NOT NULL,
	FOREIGN KEY (artist_id) REFERENCES tb_artist(artist_id) ON UPDATE CASCADE ON DELETE RESTRICT,
	FOREIGN KEY (album_id) REFERENCES tb_album(album_id) ON UPDATE CASCADE ON DELETE RESTRICT,
	FOREIGN KEY (track_id) REFERENCES tb_track(track_id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE tb_users (
  user_id INT NOT NULL AUTO_INCREMENT,
  user_nama_lengkap VARCHAR(50) NOT NULL,
  user_name VARCHAR(20) NOT NULL,
  user_password VARCHAR(255) NOT NULL,
  user_role ENUM('Admin', 'User') DEFAULT 'User',
  PRIMARY KEY (user_id)
);
