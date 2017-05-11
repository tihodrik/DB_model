	#1. Вывести книги, которое есть в наличии (магазин не важен)
    select distinct ISBN, title from book as t1
		where ISBN in (select ISBN from book_shop where copies > 0) order by title;
    
	#2. Вывести информацию о магазине, в котором книга с ISBN = '978-5-17-090332-0' имеет наименьшую цену
    select * from shop where shop_id in
		(select shop_id from book_shop as t1
			where t1.ISBN = '978-5-17-090332-0' and cost = (select min(cost) from book_shop as t2 where t2.ISBN = '978-5-17-090332-0'));
	#Проверка
    select shop_id, shop_name, cost from book_shop natural join shop where ISBN = '978-5-17-090332-0';
    
	#3. Вывести общее число имеющихся экземпляров книги с ISBN = '978-5-17-090332-0'
    select sum(case when ISBN = '978-5-17-090332-0' then copies end) from book_shop;
    # Проверка
    select shop_id, copies from book_shop where ISBN = '978-5-17-090332-0';
	
    #4. Вывести все магазины, у которых есть email
    select shop_name, shop_mail from shop where shop_mail not like "";
    select shop_name, shop_mail from shop where shop_mail like "";
	
    #5. Вывести все книги, стоимость которых меньше любой книги 2017 года изданияalte
    
	
