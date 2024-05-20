--1)             formulas            votos  totalvotos  votos en blanco  
votosEnBlanco :: [(String, String)] -> [Int] -> Int -> Int
votosEnBlanco formulas votosreales votostotales = (votostotales) - (sumaDeVotos votosreales)

sumaDeVotos :: [Int] -> Int
sumaDeVotos [] = 0
sumaDeVotos (x:xs) = x + sumaDeVotos xs

--2) no se repite ningun elemento
formulasValidas :: [(String, String)] -> Bool
formulasValidas [] = True
formulasValidas formulas = not(hayRepetidos(juntarLitas formulas))

juntarLitas :: [(String, String)] -> [String]
juntarLitas [(a,b)] = [a] ++ [b]
juntarLitas ((a,b):xs) = [a] ++ [b] ++ juntarLitas xs

perteneceALaLista :: String -> [String] -> Bool
perteneceALaLista _ [] = False
perteneceALaLista y (x:xs) = (y == x) || (perteneceALaLista y xs) 

hayRepetidos :: [String] -> Bool
hayRepetidos [] = False
hayRepetidos (x:xs) = (perteneceALaLista x xs) || hayRepetidos xs


--3) porcentaje de votos

porcentajeDeVotos :: String -> [(String, String)] -> [Int] -> Float
porcentajeDeVotos presidente formulas votos = (division (votosDePresidente presidente formulas votos) (sumaDeVotos votos)) *100

votosDePresidente :: String -> [(String, String)] -> [Int] -> Int
votosDePresidente presidente ((candidato, vice):xs) (v:vs)  | presidente == candidato = v 
                                                            | otherwise = votosDePresidente presidente xs vs

division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)

--4) proximo presidente

proximoPresidente :: [(String, String)] -> [Int] -> String
proximoPresidente [(a,b)] _ = a 
proximoPresidente ((a,b):xs) (v:vs) | numeroMaximo v vs = a
                                    | otherwise = proximoPresidente xs vs
            
numeroMaximo :: Int -> [Int] -> Bool
numeroMaximo _ [] = True
numeroMaximo n (x:xs)   | (n >= x) = (numeroMaximo n xs) 
                        | otherwise = False


