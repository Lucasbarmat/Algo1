--Ejercicio 1. Definir las siguientes funciones sobre listas:
--1.1) que dada una lista devuelve su cantidad de elementos.
longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs
--1.2)
ultimo :: [t] -> t
ultimo (x:xs) | longitud (x:xs) == 1 = x
              | otherwise = ultimo xs
--1.3)problema principio
principio :: [t] -> [t]
principio (x:xs)    | longitud (x:xs) == 1 = []
                    | otherwise = x : principio xs
--1.4) problema reverso 
reversoo :: (Eq t) => [t] -> [t]
reversoo (x:xs) | xs == [] = [x]
                | otherwise = (reversoo xs ) ++ [x]


--Ejercicio 2. Definir las siguientes funciones sobre listas:
--2.1) problema pertenece
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece e l   | longitud l == 0 = False
                | e == (head l) = True
                | otherwise = pertenece e (tail l)
--2.2) todosIguales
todosIguales ::  (Eq t) => [t] -> Bool
todosIguales (x:xs) | longitud (x:xs) == 1 = True
                    | x /= head xs = False
                    | otherwise = todosIguales xs
--2.3) todosDistintos
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos (x:xs)   | longitud (x:xs) <= 1 = True
                        | x == head xs = False
                        | otherwise = todosDistintos xs
-- 2.4) hayRepetidos :: (Eq t) => [t] -> Bool seg´un la siguiente especificaci´on:
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos (x:xs) = pertenece x xs  || hayRepetidos xs
--2.5)  quitar :: (Eq t) => t -> [t] -> [t], que dados un entero x y una lista xs, elimina la primera aparici´on de x en
--la lista xs (de haberla).
quitar :: (Eq t) => t -> [t] -> [t]
quitar e (x:xs) | e == x = xs
                | otherwise = x: quitar e xs
--2.6) quitarTodos :: (Eq t ) => t -> [t] -> [t], que dados un entero x y una lista xs, elimina todas las apariciones
--de x en la lista xs (de haberlas). Es decir:
quitarTodos :: (Eq t ) => t -> [t] -> [t]
quitarTodos e (x:xs)    | not (pertenece e (x:xs)) = (x:xs)
                        | otherwise = quitarTodos e (quitar e xs)
--2.7) eliminarRepetidos :: (Eq t) => [t] -> [t] que deja en la lista una ´unica aparici´on de cada elemento, eliminando
--las repeticiones adicionales.
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos (x:xs)    | xs == [] = (x:xs)
                            | pertenece x xs = eliminarRepetidos xs
                            | otherwise = (x: eliminarRepetidos xs)
--2.8)mismosElementos :: (Eq t) => [t] -> [t] -> Bool, que dadas dos listas devuelve verdadero s´ı y solamente s´ı
--ambas listas contienen los mismos elementos, sin tener en cuenta repeticiones, es decir:
mismosElementoss :: (Eq t) => [t] -> [t] -> Bool
mismosElementoss f s    | f == s = True
                        | (pertenecelistas f s) && (pertenecelistas s f) = True
                        | otherwise = False
pertenecelistas :: (Eq t) => [t] -> [t] -> Bool
pertenecelistas x t | x == [] = True
pertenecelistas (x:xs) t    | (pertenece x t) && (pertenecelistas xs t) = True
                            | otherwise = False
-- 2.9) capicua :: (Eq t) => [t] -> Bool seg´un la siguiente especificaci´on:
capicua :: (Eq t) => [t] -> Bool
capicua t   | t == [] = True
            | t == reversoo t = True
            | otherwise = False

--Ejercicio 3. Definir las siguientes funciones sobre listas de enteros:
--3.1) sumatoria :: [Integer] -> Integer seg´un la siguiente especificaci´on:
sumatoria :: [Integer] -> Integer 
sumatoria [] = 0
sumatoria (x:xs) = x + (sumatoria xs)

--3.2) productoria :: [Integer] -> Integer seg´un la siguiente especificaci´on:
productoria :: [Integer] -> Integer 
productoria [] = 1
productoria (x:xs) = x * (productoria xs)

--3.3) maximo :: [Integer] -> Integer seg´un la siguiente especificaci´on:
problemamaximo :: [Integer] -> Integer 
problemamaximo (x:xs)   | xs == [] = x
                        | mayorlista x xs = x
                        | otherwise = problemamaximo xs

mayorlista :: Integer -> [Integer] ->Bool
mayorlista t (x:xs) | t < x = False
                    | xs == [] = True
                    | otherwise = mayorlista t xs
                    
-- 3.4) sumarN :: Integer -> [Integer] -> [Integer] seg´un la siguiente especificaci´on
sumarN :: Integer -> [Integer] -> [Integer]
sumarN t [] = []
sumarN t (x:xs) | xs == [] = [t+x]
                | otherwise = [t+x] ++ (sumarN t xs)

--3.5) sumarElPrimero :: [Integer] -> [Integer] seg´un la siguiente especificaci´on
sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero [] = []
sumarElPrimero (x:xs) = (sumarN x (x:xs)) 

--3.6) sumarElUltimo :: [Integer] -> [Integer] seg´un la siguiente especificaci´on:
sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo [] = []
sumarElUltimo (x:xs) = (sumarN (ultimo xs) (x:xs))

--3.7)  pares :: [Integer] -> [Integer] seg´un la siguiente especificaci´on:
pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs)    | espar x = [x] ++ pares xs
                | otherwise = pares xs 
espar :: Integer ->Bool
espar 0 = False
espar x | mod x 2 == 0 = True
        | otherwise = False

-- 3.8) multiplosDeN :: Integer -> [Integer] -> [Integer] que dado un n´umero n y una lista xs, devuelve una lista
--con los elementos de xs m´ultiplos de n.
multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN t [] = []
multiplosDeN t (x:xs)   | esmultiplo x t = [x] ++ (multiplosDeN t xs)
                        | otherwise = multiplosDeN t xs
esmultiplo :: Integer->Integer->Bool
esmultiplo _ 0 = False
esmultiplo 0 _ = False
esmultiplo x y  | mod x y == 0 = True
                | otherwise = False

--3.9) ordenar :: [Integer] -> [Integer] que ordena los elementos de la lista en forma creciente. Sugerencia: Pensar
--c´omo pueden usar la funci´on m´aximo para que ayude a generar la lista ordenada necesaria.
ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar x = ordenar ((quitar (problemamaximo x) x)) ++ [problemamaximo x] 

--Ejercicio 4. a) Definir las siguientes funciones sobre listas de caracteres, interpretando una palabra como una secuencia de
--caracteres sin blancos:
--4.A) sacarBlancosRepetidos :: [Char] -> [Char], que reemplaza cada subsecuencia de blancos 
--contiguos de la primera lista por un solo blanco en la lista resultado.
sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos (x:xs)    | (x == ' ') && (head xs == ' ') = sacarBlancosRepetidos xs
                                | otherwise = x : sacarBlancosRepetidos xs

--4.B)  contarPalabras :: [Char] -> Integer, que dada una lista de caracteres devuelve la cantidad de palabras que
--tiene.
contarPalabras :: [Char] -> Integer
contarPalabras [] = 0
contarPalabras l = contarPalabrasSinRep (arrancaConBlanco(sacarBlancosRepetidos l))

contarPalabrasSinRep :: [Char] ->Integer
contarPalabrasSinRep [] = 0
contarPalabrasSinRep [x] = 1
contarPalabrasSinRep (x:xs) | x == ' ' = 1 +  contarPalabrasSinRep xs
                            | otherwise = contarPalabrasSinRep xs

arrancaConBlanco :: [Char] ->[Char]
arrancaConBlanco x  | head x == ' ' = tail x
                    | otherwise = x


--4.C) ) palabras :: [Char] -> [[Char]], que dada una lista arma una nueva lista con las palabras de la lista original.

palabras :: [Char] -> [[Char]]
palabras x = f1palabras x x                         

f1palabras :: [Char] ->[Char] ->[[Char]]
f1palabras [] t = [primerpalabra t]
f1palabras (x:xs) t | x == ' ' = primerpalabra t : f1palabras xs xs 
                    | otherwise = f1palabras xs t

primerpalabra :: [Char] ->  [Char]
primerpalabra [] = []
primerpalabra (x:xs)    | x == ' ' = []
                        | otherwise = x : primerpalabra xs



--4.D) palabraMasLarga :: [Char] -> [Char], que dada una lista de caracteres devuelve su palabra m´as larga.
--palabraMasLarga :: [Char] -> [Char]
--palabraMasLarga (x:xs)  | (contarletras (primerpalabra x)) 

--contarletras:: [Char] ->Integer
--contarletras [] = 0
--contarletras (x:xs)   | x == ' ' = 0
  --                      | otherwise = 1 + contarletras xs



--problemamaximo :: [Integer] -> Integer 
--problemamaximo (x:xs)   | xs == [] = x
--                        | mayorlista x xs = x
--                        | otherwise = problemamaximo xs

--mayorlista :: Integer -> [Integer] ->Bool
--mayorlista t (x:xs) | t < x = False
--                    | xs == [] = True
--                    | otherwise = mayorlista t xs


--Ejercicio 5. Definir las siguientes funciones sobre listas
--5.1) sumaAcumulada :: (Num t) => [t] -> [t] seg´un la siguiente especificaci´on:
sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada [] = []
sumaAcumulada x = sumaAcumulada (quitarultimo x) ++ [sumaAnteriores x]

sumaAnteriores :: (Num p) => [p] -> p
sumaAnteriores [] = 0
sumaAnteriores (x:xs) = x + sumaAnteriores xs

quitarultimo :: (Num t) => [t] ->[t]
quitarultimo (x:xs) | null xs = []
                    | otherwise = x : quitarultimo xs 


--5.2) descomponerEnPrimos :: [Integer] -> [[Integer]] seg´un la siguiente especificaci´on:





--funcionesAxuliares:

menorDivisor :: Integer ->Integer
menorDivisor n = menorDivisorHasta n 2

menorDivisorHasta :: Integer -> Integer -> Integer -- se requiere que q == 2
menorDivisorHasta n q | mod n q == 0 = q
                      | otherwise = menorDivisorHasta n (q+1)

esPrimo :: Integer ->Bool
esPrimo n | menorDivisor n == n = True
          | otherwise = False 
          
                
contarPalabrasIguales1 :: [String] -> Int
contarPalabrasIguales1 [] = 0
contarPalabrasIguales1 (x:xs) | x == (head xs) = 1 + contarPalabrasIguales1 (x :(tail xs))
                              | otherwise = contarPalabrasIguales1 (x :(tail xs))