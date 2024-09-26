
-- Selecionar todos os registros da tabela Album exibindo todas as colunas
SELECT *
  FROM Album a ;

-- Contar a quantidade de registros da tabela Album
SELECT count(*) AS Records
  FROM Album a;

-- Contar a quantidade de registros da tabela Album onde a coluna Column1 não é nula
SELECT count(*)
  FROM Album a
 WHERE Column1 IS NOT NULL;

-- Selecionar os regristos da tabela Album mostrando as colunas AlbumID e Title aonde a coluna Column1 é nula 
SELECT AlbumId
     , Title
  FROM Album a
 WHERE Column1 is NULL;

-- Selecionar todos os registros da tabela Artista exibindo todas as colunas
SELECT *
  FROM Artist a;

-- Selecionar todos os registros da tabela Album que tenham registro na tabela Artista mostrando as colunas ArtistId, 
-- Name e Records (Quantidade de Álbuns por Artista) utilizando NATURAL JOIN e em seguida agrupando pela coluna 1
-- *** NATURAL JOIN é utilizado para que o SQLite una as colunas com o mesmo nome
SELECT a2.ArtistId
     , a2.Name
     , count(*) AS Records
  FROM Album a
 NATURAL JOIN Artist a2
GROUP BY 1;

-- Mesmo select anterior, porém com acréscimo de de limite de registros 
SELECT a2.ArtistId
     , a2.Name
     , count(*) as Records
  FROM Album a
NATURAL JOIN Artist a2
GROUP BY 1
ORDER BY Records LIMIT 3;

-- Selecionar os registros da tabela Customer exibindo todas as colunas com o limite de 10 registros a serem exibidos
SELECT *
  FROM Customer c
 LIMIT 10;

-- Selecionar a quantidade de registros na tabela Customer
SELECT COUNT(*)
  FROM Customer c2;

-- Selecionar os registros da tabela Customer exibindo as colunas FirstName e Address
SELECT FirstName
     , Address 
  FROM Customer c;

-- Selecionar a quantidade de registros na tabela Customer onde a Coluna Addres contenha a palavra Broadway
SELECT count(*)
  FROM Customer c
 WHERE Address
  LIKE '%Broadway%';

-- Selecionar a quantidade de registros agrupados da coluna State ordenado pelas maiores totalizadores
-- limitado por 10 registros
SELECT State
     , COUNT(*) AS Total
  FROM Customer c
GROUP BY 1
ORDER BY Total DESC
LIMIT 10;

-- Selecionar a quantidade de registros da tabela Customer onde a coluna Company não seja nula
SELECT count(*)
  FROM Customer c
 WHERE Company IS NOT NULL;

-- Selecionar os registros da tabela Customer exibindo a coluna FirstName onde a coluna Company seja nula
SELECT FirstName
  FROM Customer c
 WHERE Company IS NULL;

-- Selecionar os registros e colunas da tabela Employee
SELECT * FROM Employee e ;

-- Selecionar os registros da tabela Customer exibindo as colunas Firstname e LastName onde a coluna Company seja nula
-- e a coluna FistName esteja no retorno da seleção dos registros da tabela Employee pela coluna FirstName
SELECT c.FirstName
     , c.LastName
  FROM Customer c 
 WHERE Company IS NULL
   AND c.FirstName IN (SELECT e.FirstName
                         FROM Employee e);

-- Selecionar os registros da tabela Customer exibindo o campo FirtName, LastName onde o relacionamento 
SELECT c.FirstName
     , c.LastName  
  FROM Customer c
 INNER JOIN Employee e
 WHERE c.FirstName = e.FirstName;


SELECT *
  FROM Invoice i
LIMIT 10;

SELECT *
  FROM InvoiceLine il
ORDER BY UnitPrice DESC
LIMIT 10;

SELECT UnitPrice
     , COUNT(*) AS Record 
  FROM InvoiceLine il
GROUP BY UnitPrice;

-- Clientes que possuem Invoice associados e a quantidade para cada cliente.

SELECT c.CustomerId
     , c.FirstName
     , COUNT(*) as Record
  FROM Invoice i 
 INNER JOIN Customer c ON c.CustomerId = i.CustomerId 
GROUP BY 1
ORDER BY Record;

SELECT i.InvoiceId
     , il.InvoiceLineId
  FROM Invoice i 
 INNER JOIN InvoiceLine il 
 INNER JOIN Customer c ON c.CustomerId = i.CustomerId 
GROUP BY 1
LIMIT 100;
