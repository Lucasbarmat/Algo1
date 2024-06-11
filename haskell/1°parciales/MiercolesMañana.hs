module MiercolesMañana where

-- RES = cantidad de productos distintos que hay en PRODUCTOS
-- RES = ((ELEMENTO 1),(ELEMENTO 2))
--ELEMENTO 1: producto
--ELEMENTO 2: cantidad de veces que aparece "producto" en "productos"
generarSotck :: [[Char]] -> [([Char], Int)]
generarSotck [] = []
generarSotck (x:xs) | not(pertenece x xs) = (x , 1) : generarSotck xs
                    | otherwise = (x, contadorDeProductos x (x:xs)) : generarSotck (eliminarRepetidas x (x:xs))

contadorDeProductos :: [Char] -> [[Char]] -> Int
contadorDeProductos _ [] = 0
contadorDeProductos producto listaProductos = cantidadDeVecesQueAparece producto listaProductos

cantidadDeVecesQueAparece :: [Char] -> [[Char]] -> Int
cantidadDeVecesQueAparece _ [] = 0
cantidadDeVecesQueAparece n (x:xs)  | (n == x) = 1 + cantidadDeVecesQueAparece n xs
                                    | otherwise = cantidadDeVecesQueAparece n xs

eliminarRepetidas :: [Char] -> [[Char]] -> [[Char]]
eliminarRepetidas n x       | not(pertenece n x) = x
eliminarRepetidas n (x:xs)  | n == x = eliminarRepetidas n xs
                            | otherwise = x : eliminarRepetidas n xs

pertenece :: [Char] -> [[Char]] -> Bool
pertenece _ [] = False
pertenece n (x:xs) = (n == x) || (pertenece n xs )


--[(['a','b'], 6),(['a','o'], 2),(['b','b'], 5),(['a','a'], 10),(['a','c'], 1)] ['a','a']


--2)
stockDeProducto :: [([Char], Int)] -> [Char] -> Int
stockDeProducto stock producto  | not(pertenece producto (listaProductos stock)) = 0
stockDeProducto ((a,b):xs) producto | a == producto = b
                                    | otherwise = stockDeProducto xs producto

cantidadDeStock :: ([Char], Int) -> Int
cantidadDeStock (producto, numero) = numero

listaProductos :: [([Char], Int)] -> [[Char]]
listaProductos [] = []
listaProductos ((a,b):xs) = (a : listaProductos xs)
--3)                   stock             precios        RES = cantidad de producto "a" * su precio + cantidad de producto "b" * su precio ...
dineroEnStock :: [([Char], Int)] -> [([Char], Float)] -> Float
dineroEnStock [] _ = 0.0
dineroEnStock ((a,b):xs) precios = (plataTotalProducto a ((a,b):xs) precios) + dineroEnStock xs precios


plataTotalProducto :: [Char] -> [([Char], Int)] -> [([Char], Float)] -> Float
plataTotalProducto producto stock precios = (fromIntegral (cantidadDeStockDeProducto producto stock)) * (precioDeProducto producto precios) 

cantidadDeStockDeProducto :: [Char] -> [([Char], Int)] -> Int
cantidadDeStockDeProducto producto ((a,b):xs)   | (producto == a) = b 
                                                | otherwise = cantidadDeStockDeProducto producto xs

precioDeProducto :: [Char] -> [([Char], Float)] -> Float
precioDeProducto producto ((a,b):xs)    | (producto == a) = b 
                                        | otherwise = precioDeProducto producto xs

--dineroEnStock [(['a','b'], 9),(['a','o'], 1),(['b','b'], 56),(['a','a'], 45),(['a','c'], 4)] [(['a','b'], 100.0),(['a','o'], 90.0),(['b','b'], 21.0),(['a','a'], 1000.0),(['a','c'], 50.0)]

--4)
aplicarOferta :: [([Char], Int)] ->[([Char], Float)] -> [([Char], Float)]
aplicarOferta _ [] = []
aplicarOferta stock ((p1,precio):ps)    | (hayMasDeDiez p1 stock) =  ((p1, (precio * 0.8)) : aplicarOferta stock ps)
                                        | otherwise = ((p1 , precio) : aplicarOferta stock ps)

hayMasDeDiez :: [Char] -> [([Char], Int)] -> Bool
hayMasDeDiez producto stock | (cantidadDeStockDeProducto producto stock) > 10 = True
                            | otherwise = False