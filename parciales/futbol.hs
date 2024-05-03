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

