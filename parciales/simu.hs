--Ejercicio 1
-- NO SE REPITAN LAS TUPLAS
-- NO HAY TUPLAS CON LOS MISMOS COMPEONENETES EN OTRO ORDEN
relacionesValidas :: [(String, String)] ->Bool
relacionesValidas [] = True
relacionesValidas ((a,b):x) = (a /= b) && not(estaEnLaLista (a,b) x) && (relacionesValidas x) 

estaEnLaLista :: (String, String) ->[(String, String)] ->Bool
estaEnLaLista _ [] = False
estaEnLaLista (a,b) (x:xs) = ((a,b) == x) ||  ((b,a) == x) || (estaEnLaLista (a,b) xs)

--otra forma de hacerlo
relacionesValidas1 :: [(String, String)] ->Bool
relacionesValidas1 [] = True
relacionesValidas1 ((a,b):x) = (a /= b) && (noEstaEnLaLIsta(a,b) x) && relacionesValidas1 x 

noEstaEnLaLIsta :: (String, String) ->[(String, String)] ->Bool
noEstaEnLaLIsta _ [] = True
noEstaEnLaLIsta (a,b) ((a1,b1):x) = (a /= a1) && (a /= b1) && (b /= a1) && (b /= b1) && (noEstaEnLaLIsta (a1, b1) x)




--Ejercicio 2
    --problema personas (relaciones: seq⟨String x String⟩) : seq⟨String⟩ {
      --requiere: {relacionesValidas(relaciones)}
      --asegura: {res no tiene elementos repetidos}
      --asegura: {res tiene exactamente los elementos que figuran en alguna tupla de relaciones, en cualquiera de sus posiciones}
    --}

personas :: [(String, String)] -> [String]
personas [] = []
personas x = eliminarRepetidoss (juntarlista(x))

juntarlista :: [(String, String)] -> [String]
juntarlista [] = []
juntarlista ((a,b):x) = [a] ++ [b] ++ juntarlista x

eliminarRepetidoss :: [String] ->[String]
eliminarRepetidoss [] = []
eliminarRepetidoss (x:xs) | (pertenecee x xs) = eliminarRepetidoss xs 
                          | otherwise = [x] ++ eliminarRepetidoss xs

pertenecee :: String -> [String] ->Bool
pertenecee _ [] = False
pertenecee a (x:xs) | a == x = True
                    | otherwise = pertenecee a xs




--Ejercicio 3
    --problema amigosDe (persona: String, relaciones: seq⟨String x String⟩) : seq⟨String⟩ {
      --requiere: {relacionesValidas(relaciones)}
      --asegura: {res tiene exactamente los elementos que figuran en las tuplas de relaciones en las que una de sus componentes es persona}
    --}
amigosDe :: String -> [(String,String)] -> [String]
amigosDe _ [] = []
amigosDe persona ((a,b):x)  | persona == a = [b] ++ amigosDe persona x
                            | persona == b = [a] ++ amigosDe persona x
                            | otherwise = amigosDe persona x




 --Ejercicio 4
    --problema personaConMasAmigos (relaciones: seq⟨String x String⟩) : String {
      --requiere: {relaciones no vacía}
      --requiere: {relacionesValidas(relaciones)}
      --asegura: {res es el Strings que aparece más veces en las tuplas de relaciones (o alguno de ellos si hay empate)}
    --}
personaConMasAmigos :: [(String, String)]  -> String
personaConMasAmigos [] = " "
personaConMasAmigos ((a,b):x) = comparar (juntarlista(((a,b):x)))

comparar :: [String]-> String
comparar [] = " "
comparar [x] = x
comparar (x:xs) | (contarpalabras x (x:xs)) >= (contarpalabras (head xs) (x:xs)) = comparar (x: (tail xs ))
                | otherwise = comparar xs

contarpalabras :: String ->[String] ->Int
contarpalabras _ [] = 0
contarpalabras n (x:xs) | n == x = 1 + contarpalabras n xs
                        | otherwise = contarpalabras n xs
