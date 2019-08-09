/* all tables joined */
select  ar.name as artistname, a.name as albumname, s.name as songtitle,
		sw.name as writer, t.duration as lengthinsec, 
		t.number as tracknumber
from 	album a, artist ar, song s, songwriter sw, track t
where 	a.artist_id = ar.id and
		t.album_id = a.id and 
		s.songwriter_id = sw.id and 
		t.song_id = s.id;

/*  1.	What are tracks on a given album? */
select 	song.name
from 	song, track, album
where 	album.id=track.album_id and
		track.song_id = song.id and 			
		album.name='Master Of Puppets';

/*. 2.	What are the albums produced by a given artist? */

select 	album.name 
from 	artist, album 
where 	album.artist_id = artist.id
and 	artist.name='Metallica';

/*  3.	What is the track with the longest duration?  */

select 	s.name as songname, t.duration as durationseconds
from 	track as t, song as s
where 	t.song_id = s.id
order by duration desc
limit 	1;

/*	4.	What are the albums released in the 60s? 70s? 80s? 90s? */
/* Also 00s? 10s? */
select * from album 
where released >= '01/01/1960' and released < '01/01/1970';
select * from album 
where released >= '01/01/1970' and released < '01/01/1980';
select * from album 
where released >= '01/01/1980' and released < '01/01/1990';
select * from album 
where released >= '01/01/1990' and released < '01/01/2000';
select * from album 
where released >= '01/01/2000' and released < '01/01/2010';
select * from album 
where released >= '01/01/2010' and released < '01/01/2020';

/*	5.	How many albums did a given artist produce in the 90s? */
select * 
from 	album , artist
where 	album.artist_id = artist.id and
		released >= '01/01/1990' and 
		released < '01/01/2000' and
		artist.name = 'Pantera';


/*	6.	What is each artist's latest album? */
select 	distinct on (artist.name) artist.name, album.released 
from 	album , artist 
where 	album.artist_id = artist.id 
order by artist.name,released;


/*	7. List all albums along with its total duration based on summing the duration of its tracks. */

select 	album.name, sum(track.duration)
from 	album , track
where 	track.album_id = album.id
group by album.name;

/*	8.	What is the album with the longest duration? */
select 	album.name, sum(track.duration)
from 	album , track 
where 	track.album_id = album.id
group by album.name
order by sum(track.duration) desc limit 1;


/*
	9.	Who are the 5 most prolific artists based on the number of albums they have recorded?  */
select 	artist.name, count(album.id)
from 	album, artist
where 	artist.id = album.artist_id
group by artist.name
order by count(album.id) desc
limit 	5;
	
/*	10.	What are all the tracks a given artist has recorded?  */
select 	artist.name, song.name
from 	artist, album, track, song
where 	track.song_id = song.id and
		album.artist_id =artist.id and
		track.album_id =album.id and 
		artist.name='Foo Fighters';


/*	11.	What are the top 5 most often recorded songs? */
select 	song.name, count(song.id)
from 	song, songwriter
where 	song.songwriter_id = songwriter.id
group by song.name
order by count(song.id) desc
limit 	5;


/*	12.	Who are the top 5 song writers whose songs have been most often recorded? */
select 		songwriter.name, count(song.id)
from 		song, songwriter
where 		song.songwriter_id = songwriter.id
group by 	songwriter.name
order by 	count(song.id) desc
limit 		5;



/*
	13.	Who is the most prolific song writer based on the number of songs he has written? */
	
select 	songwriter.name, count(song.id)
from 	songwriter , song
where 	song.songwriter_id = songwriter.id
group by songwriter.name 
order by count(song.id) desc;

/*
	14.	What songs has a given artist recorded?  */
	
select 	artist.name, song.name
from 	artist, song , track, album
where 	track.song_id=song.id and
		track.album_id=album.id and 
		album.artist_id=artist.id and 
		artist.name='Metallica';


	
/*	15.	Who are the song writers whose songs a given artist has recorded?
*/

select 	artist.name, songwriter.name, song.name
from 	artist, songwriter, song, album, track
where 	artist.id = album.artist_id and
		songwriter.id = song.songwriter_id and
		track.album_id = album.id and
		track.song_id = song.id;

/*	16.	Who are the artists who have recorded a given song writers songs?
*/
select 	artist.name, songwriter.name, song.name
from 	artist, songwriter, song, album, track
where 	artist.id = album.artist_id and
		songwriter.id = song.songwriter_id and
		track.album_id = album.id and
		track.song_id = song.id and
		songwriter.name = 'Dave Grohl';







