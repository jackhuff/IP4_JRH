USE henry;

### 1. Authors first and last names
SELECT * FROM author;

SELECT firstname, lastname
FROM author;

### 2. Book title and relation
SELECT title, type
FROM book;

### 3. Publisher Codes
SELECT DISTINCT publisherCode
FROM book;

### 4. Title and Price of books. Additional column named discount that shows the price of books if there was a 25% discount
SELECT title, price, (price*.75) 
AS discount 
FROM book
LIMIT 5;

### 5. Title and Price of books with a price over $20
SELECT title, price
FROM book
WHERE price >= 20;

### 6. Publishers from New York
SELECT publisherName
FROM publisher
WHERE city = 'New York';

### 7. All publishers that are NOT from New York
SELECT publisherName
FROM publisher
WHERE city != 'New York';

### 8. bookCode and onHand for each book for which a branch has between 2 and 4 copies 
SELECT bookCode, onHand
FROM inventory
WHERE branchNum BETWEEN 2 and 4;

### 9. Getting a count of the number of books published by Penguin USA and making a new column called Penguin Books
SELECT publisherCode, COUNT(publisherCode) AS 'Penguin Books'
FROM book
WHERE publisherCode = 'PE'
GROUP BY publisherCode;

### 10. Number of books with a price below 20 dollars 
SELECT title, price
FROM book
WHERE price <= '20';

### 11. Joining the book and publisher relations using JOIN
SELECT * 
FROM book b
JOIN publisher AS p
WHERE p.publisherCode = b.publisherCode;

### 12. Joining the book and publisher relations using the ON keyword
SELECT book.publisherCode, publisherName, city, title, price, bookCode, paperback, TYPE 
FROM  book
JOIN publisher ON
book.publisherCode = publisher.publisherCode;

### 13. Getting the title from the book query and the city from the publisher query
SELECT b.title, p.city
FROM book b
JOIN publisher p ON p.publisherCode = b.publisherCode
ORDER BY title;

### 14. Getting tite from book relation and branchNum and onHand from inventory relation
SELECT b.title, i.branchNum, i.onHand
FROM book b 
JOIN inventory i ON i.bookCode = b.bookCode
ORDER BY title;  

### 15. Getting the title and the total number of onHand books there are. Placing this data in a new column called inventory
SELECT b.title, SUM(i.onHand) AS 'Inventory'
FROM  book b
JOIN inventory i ON i.bookCode = b.bookCode
GROUP BY b.title
ORDER BY Inventory
LIMIT 2;

### 16. First and last names from author relation and title from book relation. O
### Only showing paperback books. Orderd by authors last name and title.
SELECT firstname, lastname, title, paperback
FROM book, author
WHERE paperback = 'Y'
ORDER BY lastname, title; 

### BONUS!!!!!!!!!!!!!!!!!!!!!!!!
### Getting the title from the book relation and the authors last name from the author relation
SELECT title, lastname
FROM book, author
ORDER BY lastname
LIMIT 70;