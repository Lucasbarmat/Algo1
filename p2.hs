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
 
    --problema personas (relaciones: seq⟨String x String⟩) : seq⟨String⟩ {
      --requiere: {relacionesValidas(relaciones)}
      --asegura: {res no tiene elementos repetidos}
      --asegura: {res tiene exactamente los elementos que figuran en alguna tupla de relaciones, en cualquiera de sus posiciones}
    --}
 
    --problema amigosDe (persona: String, relaciones: seq⟨String x String⟩) : seq⟨String⟩ {
      --requiere: {relacionesValidas(relaciones)}
      --asegura: {res tiene exactamente los elementos que figuran en las tuplas de relaciones en las que una de sus componentes es persona}
    --}
 
    --problema personaConMasAmigos (relaciones: seq⟨String x String⟩) : String {
      --requiere: {relaciones no vacía}
      --requiere: {relacionesValidas(relaciones)}
      --asegura: {res es el Strings que aparece más veces en las tuplas de relaciones (o alguno de ellos si hay empate)}
    --}


relacionesValidas :: [(String, String)] -> Bool
relacionesValidas [] = True
relacionesValidas (x:xs) = noRepetida x && not (relContenido x xs) && relacionesValidas xs
 
noRepetida :: (String, String) -> Bool
noRepetida (a, b) = a /= b
 
relContenido :: (String, String) -> [(String, String)] -> Bool
relContenido _ [] = False
relContenido j1 (j2:xs) = relacionEquivalente j1 j2 || relContenido j1 xs
 
relacionEquivalente :: (String, String) -> (String, String) -> Bool
relacionEquivalente (ax, ay) (bx, by) =
    (ax == bx && ay == by) || (ax == by && ay == bx)
 




-- 1) Atajaron Suplentes
atajaronSuplente :: [(String, String)] -> [Int] ->Int ->Int
atajaronSuplente _ goles totalgoles = totalgoles - golesASuplentes goles

golesASuplentes :: [Int] ->Int
golesASuplentes [] = 0
golesASuplentes (x:xs) = x + golesASuplentes xs
 
 --2) Equipos Validos
--no contiene nombres de clubes repetidos
--ni arqueros repetidos
--ni jugadores con nombre del club


equiposValidos :: [(String, String)] ->Bool
equiposValidos [] = True
equiposValidos ((a,b): xs) = (a /= b) && (nopertenece (a,b) xs) && (equiposValidos xs)

nopertenece :: (String, String) -> [(String, String)] ->Bool
nopertenece _ [] = True
nopertenece (a,b) ((a1,b1):xs) = (a /= a1) && (a /= b1) && (b /= a1) && (b /= b1) && (nopertenece (a,b) xs)

--3) porcentje de goles 
--                   arquero  [goles] totalgoles   porcentaje
porcentajeDeGoles :: String ->[(String, String)] -> [Int] -> Float
porcentajeDeGoles " " _ _ = 0.0
porcentajeDeGoles arquero ((a,b):xs) listagoles = division ((porcentajeAUX arquero ((a,b):xs) listagoles)*100) (cantidad listagoles)

porcentajeAUX :: String -> [(String, String)] ->[Int] -> Int
porcentajeAUX arquero ((a,b):xs) (t:ts) | arquero == b = t 
                                        | otherwise = porcentajeAUX arquero xs ts

cantidad :: [Int] ->Int
cantidad [] = 0
cantidad (x:xs) = x + cantidad xs

division :: Int -> Int -> Float
division a b = fromIntegral a / fromIntegral b

-- 
--4) Valla Menos Vencida
--problema vallaMenosVencida (arquerosPorEquipo: seq<String X String>, goles: seq<Z>): String {
--	requiere: {equiposValidos(arquerosPorEquipo)}
--	requiere: {|arquerosPorEquipo| = |goles|}
--	requiere: {Todos los elementos de goles son mayores o iguales a 0}
--	requiere: {|goles| > 0}
--	asegura: {
--	res es alguno de los arqueros de arquerosPorEquipo que menor goles recibió de acuerdo a goles

vallaMenosVencida :: [(String, String)] -> [Int] -> String
vallaMenosVencida [(x,y)][z] = y
vallaMenosVencida ((a,b):xs) (g:gs) | menornumero g gs = b
                                    | otherwise = vallaMenosVencida xs gs

menornumero :: Int ->[Int] ->Bool
menornumero _ [] = True
menornumero g (x:xs) = (g <= x) && (menornumero g xs)

