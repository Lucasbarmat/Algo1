divisoresPropios :: Int -> [Int]
divisoresPropios n = todosLosDivisoresDeN n (reverso(devolverListaDe0HastaN n)) 

esDivisorDeN :: Int -> Int -> Bool
esDivisorDeN _ 0 = False
esDivisorDeN n x    | mod n x == 0 = True
                    | otherwise = False

todosLosDivisoresDeN :: Int -> [Int] -> [Int]
todosLosDivisoresDeN _ [] = []
todosLosDivisoresDeN n (x:xs)   | esDivisorDeN n x = (x: todosLosDivisoresDeN n xs)
                                | otherwise = todosLosDivisoresDeN n xs

devolverListaDe0HastaN :: Int -> [Int]
devolverListaDe0HastaN 0 = []
devolverListaDe0HastaN n  = [n-1] ++ devolverListaDe0HastaN (n-1) 

reverso :: [Int] -> [Int]
reverso [] = []
reverso (x:xs) = reverso xs ++ [x]


--2
sonAmigos :: Int -> Int -> Bool
sonAmigos a b   | a == b = False
sonAmigos a b   | ((sumaDeNumerosEnUnaLista(divisoresPropios a)) == b) && ((sumaDeNumerosEnUnaLista(divisoresPropios b)) == a) = True
                | otherwise = False

sumaDeNumerosEnUnaLista :: [Int] -> Int
sumaDeNumerosEnUnaLista [] = 0
sumaDeNumerosEnUnaLista (x:xs) = x + sumaDeNumerosEnUnaLista xs


--3 
losPrimerosNPerfectos :: Int -> [Int]
losPrimerosNPerfectos 0 = []
losPrimerosNPerfectos n = listaPerfectos 0 n 


esUnNumeroPerfecto :: Int -> Bool
esUnNumeroPerfecto 0 = False
esUnNumeroPerfecto n    | (sumaDeNumerosEnUnaLista(divisoresPropios n)) == n = True
                        | otherwise = False

listaPerfectos :: Int -> Int -> [Int]
listaPerfectos _ 0 = []
listaPerfectos x n  | esUnNumeroPerfecto x = [x] ++ listaPerfectos (x+1) (n-1)
                    | otherwise = listaPerfectos (x+1) n



--4
listaDeAmigos :: [Int] -> [(Int,Int)]
listaDeAmigos [] = []
listaDeAmigos (x:xs) = (todosLosAmigosDeNEnUnaLista x xs) ++ listaDeAmigos xs

todosLosAmigosDeNEnUnaLista :: Int -> [Int] -> [(Int,Int)]
todosLosAmigosDeNEnUnaLista _ [] = []
todosLosAmigosDeNEnUnaLista n (x:xs)    | sonAmigos n x = ((n, x):todosLosAmigosDeNEnUnaLista n xs)
                                        | otherwise = todosLosAmigosDeNEnUnaLista n xs