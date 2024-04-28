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
--problemamaximo :: [Integer] -> Integer 
--problemamaximo (x:xs) 


mayorlista :: Integer -> [Integer] ->Bool
mayorlista t (x:xs) | t < x = False
                    | xs == [] = True
                    | otherwise = mayorlista t xs
                    