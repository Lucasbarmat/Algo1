--1)

porcentaje :: [(String, String)] -> [Int] -> Int -> Float
porcentaje _ votosafirmativos votostotales = division ((cantidad votosafirmativos) * 100) votostotales

division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)

cantidad :: [Int] -> Int
cantidad [] = 0
cantidad (x:xs) = x + cantidad xs

--2)

formulasInvalidas :: [(String, String)] -> Bool
formulasInvalidas [(x1, x2)] | x1 == x2 = True
                             | otherwise = False
formulasInvalidas ((x1, x2)  : xs) | (x1 == x2) || pertenece x1 (juntarLista(xs)) || pertenece x2 (juntarLista(xs)) = True
                                   | otherwise = formulasInvalidas xs

juntarLista :: [(String, String)] -> [String]
juntarLista [] = []
juntarLista ((x1, x2) : xs) = x1 : x2 : juntarLista xs

pertenece :: String -> [String] -> Bool
pertenece _ [] = False
pertenece n (x:xs) | n == x = True
                   | otherwise = pertenece n xs


--3)

porcentajeDeVotos :: String -> [(String, String)] -> [Int] -> Float
porcentajeDeVotos n candidatos narva = division ((votosDe n candidatos narva) * 100) (cantidad narva)

votosDe :: String -> [(String, String)] -> [Int] -> Int
votosDe n ((x1, x2):(x3, x4):xs) (y1:y2:ys) | n == x2 = y1
                                            | otherwise = votosDe n ((x3, x4) : xs) (y2:ys)

--4)

menosVotado :: [(String, String)] -> [Int] -> String
menosVotado [(x1, x2)] _ = x1
menosVotado ((x1, x2):(x3, x4):xs) (y1:y2:ys) | y1 <= y2 = menosVotado ((x1, x2):xs) (y1:ys)
                                              | otherwise = menosVotado ((x3, x4) : xs) (y2:ys)