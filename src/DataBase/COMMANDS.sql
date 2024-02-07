use bd_libreria;

-- INSERTAR EDITORIAL
SELECT * FROM tbl_cat_editorial;
CAll sp_AddEditorial('Ediatorial 1');

-- INSERTAR GENERO
SELECT * FROM tbl_cat_genero;
CALL sp_AddGender('Drama');

-- INSERTAR IDIOMA
SELECT * FROM tbl_cat_idioma;
CALL sp_AddLanguage('Spanish');

-- INSERTAR BOOK
-- (NOMBRE, COSTO, CANTIDAD, EDITORIAL, GENERO, IDIOMA)
CALL sp_AddBook('El niño con pijama de rayas', 120, 20, 1, 1, 1);

-- CONSULTA LIBROS
CALL sp_ShowAllBooks();

-- TABLE tbl_hist_ventas
SELECT * FROM tbl_hist_ventas;
CALL sp_ShowAllSales();

-- (ID_LIBRO, CANTIDAD)
CALL sp_AddSales(1,5);