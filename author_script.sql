	#1. Выбрать вывести книги автора с id=1 за последний год и книги автора с id=6 за 2013 год
    select title, author_id, publication_year from book natural join book_author
		where (publication_year = (select max(publication_year) from book)
				and author_id = 1)
	union select title, author_id, publication_year from book natural join book_author
		where (publication_year = 2013
				and author_id = 6);
    
	#2. Вывести 10 самых молодых авторов, отсортированных по увеличению возраста
    select author_name, dob from author where dob <> '0000-00-00' order by dob desc, author_name;
    
	#3. Вывести авторов, у которого есть книги, выпущенные в промежуток с 2015 по 2017 гг
    select distinct author_name from author natural join book_author as t1
		where exists (select ISBN from book natural join book_author as t2
						where publication_year >= 2015 and publication_year <= 2017 and t1.author_id = t2.author_id);
    
	#4. Вывести авторов, чьи книги издавались после 2016 года
    select distinct author_name from author left join book_author as t1 on author.author_id = t1.author_id
		where exists (select ISBN from book as t2 where publication_year > 2016 and t1.ISBN = t2.ISBN);
        
    select distinct author_name from author natural join book_author
		where (ISBN in (select ISBN from book where publication_year > 2016));
