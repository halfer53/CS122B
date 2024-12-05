DROP  PROCEDURE IF EXISTs add_movie;
DELIMITER $$
CREATE PROCEDURE add_movie(in fname varchar(100),in lname varchar(100), in gname varchar(100), in atitle varchar(100),in ayear INT, in adirector varchar(100), out answer varchar(100)) 

BEGIN
	DECLARE voiceid Integer;
    DECLARE animeid Integer;
    DECLARE genreid Integer;
    DECLARE part1 varchar(100);
    DECLARE part2 varchar(100);
    DECLARE part3 varchar(100);

IF (select count(*) from voice_actors where first_name = fname and last_name = lname) = 0 THEN
    insert into voice_actors(first_name, last_name) values(fname, lname);
    set voice_actor_id = (select id from voice_actors where first_name = fname and last_name = lname limit 1);
	set part1 = 'voice_actors inserted |';
 ELSE
    set voice_actor_id = (select id from stars where first_name = fname and last_name = lname limit 1);
    set part1 = ' this voice actor has already existed |';
 END IF;
IF (select count(*) from genres where name = gname) = 0 THEN
    insert into genres(name) values(gname);
    set genreid = (select id from genres where name = gname limit 1);
    set part2 = ' genre inserted |';
 ELSE
    set genreid = (select id from genres where name = gname limit 1);
    set part2 = ' this genre has alreay existed |';
 END IF;
 
 IF (select count(*) from animes where title = atitle and director = adirector and year = ayear) = 0 THEN
    insert into animes(title, year, director) values(atitle, ayear, adirector);
    set animeid = (select id from animes where title = atitle and director = adirector and year = ayear limit 1);
    set part3 = ' anime inserted |';
 ELSE
    set animeid = (select id from animes where title = atitle and director = adirector and year = ayear limit 1);
    set part3 = ' this anime has already existed |';
 END IF;
 IF (select count(*) from genres_in_animes where anime_id = animeid and genre_id = genreid) = 0 THEN
 insert into genres_in_movies(anime_id, genre_id) values (animeid, genreid);
 END IF;
 IF (select count(*) from voice_actors_in_animes where voice_actor_id = voiceid and anime_id = animeid) = 0 THEN
 insert into stars_in_movies(voice_actor_id, anime_id) values (voiceid, animeid);
 END IF;
 set answer = concat(concat(part1, part2), part3);
 END;
 $$ 
 
 call add_movie('Y', 'WJ', 'funny','patirck at dallas', 1995, 'Ywj',@a);
 select @a;
