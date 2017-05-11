	#1. Вывести жанры, по которым нет книг
    select genre from genre as t1 where not exists (select ISBN from book where genre_id = t1.genre_id);
	
    #2. Вывести любой жанр с минимальным числом книг    
	select
		case when (select count(*) from genre as t1 where not exists (select ISBN from book where genre_id = t1.genre_id)) > 0
		then (select genre from genre as t1 where not exists (select ISBN from book where genre_id = t1.genre_id) order by genre_id limit 1)
		else (select genre from genre where genre_id in
			 (select genre_id from book group by genre_id
			  having count(ISBN) = (select count(ISBN) from book group by genre_id order by count(ISBN) asc limit 1)) order by genre_id limit 1)
		end as _genre;
    
	#3. Вывести всех авторов, писавших в жанре с id=2
    select distinct author_name from author natural join book_author as t1 
		where exists (select ISBN from book where genre_id = 2 and ISBN = t1.ISBN);