	#1. Вывести всю информацию об издательстве книги с id=1
    select * from publisher where publisher_id = 1;
    
	#2. Вывести все издательства, число выпущенных книг (тиражи) которых превышает среднее число
	select publisher_id, publisher from publisher as t1 where exists
		(select publisher_id from book group by publisher_id
			having sum(case when publisher_id = t1.publisher_id then copies end) > (select avg(copies) from book));
	# Проверка
	select publisher_id, sum(copies) from book as t1 group by publisher_id
			having sum(copies) > (select avg(copies) from book);
	
	select avg(copies) from book;
    
    #3.Вывести id_издательства и те его книги, которые были переизданы позже другими издательствами
	select distinct title, publisher_id from book as t1 where exists
		(select title, publisher_id from book as t2
			where t2.title = t1.title and t2.publisher_id <> t1.publisher_id and t2.publication_year > t1.publication_year) order by title;