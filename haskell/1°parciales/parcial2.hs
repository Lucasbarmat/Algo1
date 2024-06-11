--1)
hayQueCodificar :: Char -> [(Char, Char)] -> Bool
hayQueCodificar _ [] = False
hayQueCodificar c ((a,b):xs) = (c == a) || (hayQueCodificar c xs)


-- 2)
cuantasVecesHayQueCodificar :: Char -> [Char] -> [(Char, Char)] -> Int
cuantasVecesHayQueCodificar c frase mapeo   | not(hayQueCodificar c mapeo) = 0
                                            | otherwise = cantidadDeVecesQueAparece c frase

cantidadDeVecesQueAparece :: Char -> [Char] -> Int
cantidadDeVecesQueAparece c [] = 0
cantidadDeVecesQueAparece c (x:xs)  | (c == x) = 1 + cantidadDeVecesQueAparece c xs 
                                    | otherwise = cantidadDeVecesQueAparece c xs                                            


--3) 
laQueMasHayQueCodificar :: [Char] -> [(Char, Char)] -> Char
laQueMasHayQueCodificar [x] _ = x
laQueMasHayQueCodificar (f1:f2:fs) mapeo    | f1 == f2 = laQueMasHayQueCodificar (f2:fs) mapeo
                                            | (cuantasVecesHayQueCodificar f1 (f1:f2:fs) mapeo) >= (cuantasVecesHayQueCodificar f2 (f1:f2:fs) mapeo) = laQueMasHayQueCodificar (f1:fs) mapeo
                                            | otherwise = laQueMasHayQueCodificar (f2:fs) mapeo


--4)
codificarFrase :: [Char] -> [(Char, Char)] -> [Char]
codificarFrase [] _ = []
codificarFrase (f:fs) mapeo | (hayQueCodificar f mapeo) = obtenerRemplazo f mapeo : codificarFrase fs mapeo
                            | otherwise = f : codificarFrase fs mapeo

obtenerRemplazo :: Char -> [(Char, Char)] -> Char
obtenerRemplazo x [] = x
obtenerRemplazo caracter ((a,b):xs) | caracter == a = b
                                    | otherwise = obtenerRemplazo caracter xs

