-- 1) (a,b) (a1, b1) : xs  
--    todos los a son disitntos y todos los b son disitntos
--    TRUE --->  "palabra" == alguna "a"
hayQueCodificar :: Char ->[(Char, Char)] ->Bool
hayQueCodificar _ [] = False
hayQueCodificar caracter ((a,_):xs) = (caracter == a) || (hayQueCodificar caracter xs)


--2) 
-- LETRA pertenece a FRASE
-- FRASE > 0
--todos los a son disitntos y todos los b son disitntos
-- RES = si no hay que codificar == 0
--RES = si hay que codificar == cantidad de veces que LETRA aparece en FRASE
cuantasVecesHayQueCodificar :: Char -> [Char] -> [(Char, Char)] -> Int
cuantasVecesHayQueCodificar c frase mapeo   | (not(hayQueCodificar c mapeo)) = 0
                                            | otherwise = cuantasVecesAparece c frase
cuantasVecesAparece :: Char -> [Char] -> Int
cuantasVecesAparece _ [] = 0
cuantasVecesAparece n (x:xs)    | n == x = 1 + cuantasVecesAparece n xs
                                | otherwise = cuantasVecesAparece n xs


--3) 
--EXISTE SI O SI un caracter "c" que esta en frase y (hayQueCodificar c mapeo = True)
-- RES = la "C" que mas veces aparece en FRASE

laQueMasHayQueCodificar :: [Char] -> [(Char, Char)] -> Char
laQueMasHayQueCodificar frase mapeo = elQueMasAparece (caracteresValidos frase mapeo)

caracteresValidos :: [Char] -> [(Char, Char)] -> [Char]
caracteresValidos [] mapeo = []
caracteresValidos (x:xs) mapeo  | (hayQueCodificar x mapeo) = [x] ++ caracteresValidos xs mapeo
                                | otherwise = caracteresValidos xs mapeo
elQueMasAparece :: [Char] -> Char
elQueMasAparece [x] = x
elQueMasAparece (x1:x2:xs)  | (cuantasVecesAparece x1 xs) >= (cuantasVecesAparece x2 xs) = elQueMasAparece (x1:xs)
                            | otherwise = elQueMasAparece (x2:xs)


--4)  problemacodificarfrase 
codificarFrase :: [Char] -> [(Char, Char)] -> [Char]
codificarFrase [] _ = []
codificarFrase (x:xs) mapeo | (hayQueCodificar x mapeo) = (devolverElOtroElemento x mapeo) : (codificarFrase xs mapeo)
                            | otherwise = (x : codificarFrase xs mapeo)
devolverElOtroElemento :: Char -> [(Char, Char)] -> Char
devolverElOtroElemento x ((a, b):xs)    | x == a = b
                                        | otherwise = devolverElOtroElemento x xs

                                        