--Ejercicio 1. Definir las siguientes funciones sobre listas:
--1) que dada una lista devuelve su cantidad de elementos.
longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs
--2)
ultimo :: [t] -> t
ultimo (x:xs) | longitud (x:xs) == 1 = x
              | otherwise = ultimo xs
--3)problema principio
principio :: [t] -> [t]
principio (x:xs)    | longitud (x:xs) == 1 = []
                    | otherwise = x : principio xs
--4) problema reverso 
reversoo :: (Eq t) => [t] -> [t]
reversoo (x:xs) | xs == [] = [x]
               | otherwise = (reversoo xs ) ++ [x]
            
--Ejercicio 2. Definir las siguientes funciones sobre listas:
--1) problema pertenece
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece e l   | longitud l == 0 = False
                | e == (head l) = True
                | otherwise = pertenece e (tail l)
--2) todosIguales
todosIguales ::  (Eq t) => [t] -> Bool
todosIguales (x:xs) | longitud (x:xs) == 1 = True
                    | x /= head xs = False
                    | otherwise = todosIguales xs
--3) todosDistintos
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos (x:xs)   | longitud (x:xs) <= 1 = True
                        | x == head xs = False
                        | otherwise = todosDistintos xs
-- 4) hayRepetidos :: (Eq t) => [t] -> Bool seg´un la siguiente especificaci´on:
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos (x:xs) = pertenece x xs  || hayRepetidos xs
--5)  quitar :: (Eq t) => t -> [t] -> [t], que dados un entero x y una lista xs, elimina la primera aparici´on de x en
--la lista xs (de haberla).
quitar :: (Eq t) => t -> [t] -> [t]
quitar e (x:xs) | e == x = xs
                | otherwise = x: quitar e xs
--6) quitarTodos :: (Eq t ) => t -> [t] -> [t], que dados un entero x y una lista xs, elimina todas las apariciones
--de x en la lista xs (de haberlas). Es decir:
quitarTodos :: (Eq t ) => t -> [t] -> [t]
quitarTodos e (x:xs)    | not (pertenece e (x:xs)) = (x:xs)
                        | otherwise = quitarTodos e (quitar e xs)
--7) eliminarRepetidos :: (Eq t) => [t] -> [t] que deja en la lista una ´unica aparici´on de cada elemento, eliminando
--las repeticiones adicionales.
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos (x:xs)    | todosDistintos (x:xs) = x:xs
                            | 
