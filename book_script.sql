	#1. Вывести всю информацию по всем зарегистрированным книгам
    #(ISBN, Название, Автор, Жанр, Год публикации, Язык, Количество страниц, Вес, Тираж),
    #отсортированные по Названию и Автору
	select ISBN, title, author_name, genre, publisher, publication_year, publication_language, pages, weight, copies from book 
		natural join genre
		natural join publisher
        natural join (select ISBN, author_name from book_author natural join author) as auth
        order by title, author_name;
    
    #2. Вывести все Книги, тираж которых больше 4 тысяч экземпляров
    select ISBN, title, copies from book where (copies > 4000) order by copies;
    # Проверка
    select ISBN, title, copies from book where (copies <= 4000) order by copies;
    
	#3. Вывести книгу(и) с максимальным весом
    select ISBN, title, weight from book where weight = (select max(weight) from book);
    # Проверка
    select ISBN, title, weight from book order by weight desc;
    
	#4. Вывести книгу(и) с минимальным числом страниц
    select ISBN, title, pages from book where pages = (select min(pages) from book);
    select ISBN, title, pages from book order by pages;
    
	#5. Вывести все доступные языки и количество соответствующих им книг, отсортированные по числу книг
    select distinct publication_language, count(ISBN) as _count from book group by publication_language order by _count desc;
    
	#6. Вывести 3 самых богатых на книги года, отсортированные по возрастанию Года
    select * from (select publication_year, count(ISBN) as _count from book group by publication_year order by count(ISBN) desc, publication_year limit 3) as result
		order by publication_year;
	# Проверка
	select distinct publication_year, count(ISBN) from book group by publication_year;
    
	#7. Вывести автора, у которого книг больше, чем у остальных
    select author_id, author_name, count(ISBN) from author as t1 natural join book_author group by author_name
		having (count(ISBN) > all(select count(ISBN) from book_author as t2 group by author_id
										having t2.author_id <> t1.author_id));
                                        
	#8. Вывести книги, вес которой меньше любой книги с максимальным тиражом
    select ISBN, title from book
		where weight < any (select weight from book where copies = (select max(copies) from book))
        order by title;