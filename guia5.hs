--Ejercicio 1. Definir las siguientes funciones sobre listas:

--a) que dada una lista devuelve su cantidad de elementos.
longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1+ longitud xs
--b)
ultimo :: [t] -> t
ultimo (x:xs) | longitud (x:xs) == 1 = x
              | otherwise = ultimo xs
--c)problema principio
principio :: [t] -> [t]
principio (x:xs)    | longitud (x:xs) == 1 = []
                    | otherwise = x : principio xs


--d) problema reverso 
reverso :: (Eq t) => [t] -> [t]
reverso (x:xs) | xs == [] = [x]
               | otherwise = (reverso xs ) ++ [x]