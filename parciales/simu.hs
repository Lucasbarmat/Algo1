--Ejercicio 1
    --Para empezar a diseñar la novedosa y rupturista red social Y el famoso Elio Mark nos ha pedido que desarrollemos algunas funciones básicas, 
    --que tendrán como objetido representar algunas relaciones e interacciones entre los usuarios. Para esto nos envió las siguientes especificaciones en lenguaje semiformal y 
    --nos pidió que hagamos el desarrollo enteramente en Haskell, utilizando los tipos requeridos 
    --y solamente las funciones que se ven en Introducción a la Programación de Exactas-UBA.
 
    --problema relacionesValidas (relaciones: seq⟨String x String⟩) : Bool {
      --requiere: {True}
      --asegura: {(res = true) <=> relaciones no contiene ni tuplas repetidas1, ni tuplas con ambas componentes iguales}
    --}
    --1 A los fines de este problema consideraremos que dos tuplas son iguales si el par de elementos que las componen (sin importar el orden) son iguales.
 
-- NO SE REPITAN LAS TUPLAS
-- NO HAY TUPLAS CON LOS MISMOS COMPEONENETES EN OTRO ORDEN

relacionesValidas :: [(String, String)] ->Bool
relacionesValidas [] = True
relacionesValidas ((a,b):x) = (a /= b) && not(estaEnLaLista (a,b) x) && (relacionesValidas x) 

estaEnLaLista :: (String, String) ->[(String, String)] ->Bool
estaEnLaLista _ [] = False
estaEnLaLista (a,b) (x:xs) = ((a,b) == x) ||  ((b,a) == x) || (estaEnLaLista (a,b) xs)



    --problema personas (relaciones: seq⟨String x String⟩) : seq⟨String⟩ {
      --requiere: {relacionesValidas(relaciones)}
      --asegura: {res no tiene elementos repetidos}
      --asegura: {res tiene exactamente los elementos que figuran en alguna tupla de relaciones, en cualquiera de sus posiciones}
    --}


personas :: [(String,String)] -> [String]
personas [] = []
personas x = eliminarRepetidoss (juntarlista(x))

juntarlista :: [(String,String)] -> [String]
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

    --problema amigosDe (persona: String, relaciones: seq⟨String x String⟩) : seq⟨String⟩ {
      --requiere: {relacionesValidas(relaciones)}
      --asegura: {res tiene exactamente los elementos que figuran en las tuplas de relaciones en las que una de sus componentes es persona}
    --}

amigosDe :: String -> [(String,String)] -> [String]
amigosDe _ [] = []
amigosDe persona ((a,b):x)  | persona == a = [b] ++ amigosDe persona x
                            | persona == b = [a] ++ amigosDe persona x
                            | otherwise = amigosDe persona x

 
    --problema personaConMasAmigos (relaciones: seq⟨String x String⟩) : String {
      --requiere: {relaciones no vacía}
      --requiere: {relacionesValidas(relaciones)}
      --asegura: {res es el Strings que aparece más veces en las tuplas de relaciones (o alguno de ellos si hay empate)}
    --}


personaConMasAmigos :: [(String, String)]  -> String
personaConMasAmigos [] = []
--personaConMasAmigos (x:xs)  | contarPalabrasIguales (x (juntarlista (xs))) 

contarPalabrasIguales :: String ->[String] -> Int
contarPalabrasIguales _ [] = 0
contarPalabrasIguales y (x:xs)  | y == x = 1 + contarPalabrasIguales y xs  
                                | otherwise = contarPalabrasIguales y xs

contarPalabrasIguales1 :: [String] -> Int
contarPalabrasIguales1 [] = 0
contarPalabrasIguales1 (x:xs) | x == (head xs) = 1 + contarPalabrasIguales1 (x :(tail xs))
                              | otherwise = contarPalabrasIguales1 (x :(tail xs))