-- [("boca","orion"),("riber","burro"),("colon","yo"),("velez", "sara")] [4,9,4,2] 40

--1) ATAJARON SUPLENTES
--[(equipo  arquero)]      arqueros titulares de cada equipo
-- [goles] 
-- totalgolestorneo  
-- cantidad de goles recibidos por arqueros suplentes
atajaronSuplentes :: [(String, String)] ->[Int] ->Int -> Int
atajaronSuplentes [] _ _ = 0
atajaronSuplentes _ goles totalgolestorneo = (totalgolestorneo) - (sumatotal goles) 

sumatotal :: [Int] -> Int
sumatotal [] = 0
sumatotal (x:xs) = x + sumatotal xs


--2) EQUIPOS VALIDOS
-- NO SE REPITAN CLUBES
-- NO SE REPITAN ARQUEROS
-- ARQUERO /= CLUB

equiposValidos :: [(String, String)] ->Bool
equiposValidos [] = True
equiposValidos ((a,b):xs) = (a /= b) && (not(pertenece a xs)) && (not(pertenece b xs)) && (equiposValidos xs)

pertenece :: String -> [(String, String)] -> Bool
pertenece _ [] = False
pertenece x ((a,b):xs) = (x == a) || (x == b) || (pertenece x xs)

--3) PORCENTAJE DE GOLES
-- arquero - (equipo, arquero) - lista de goles a cada arquero - PORCENTAJE
-- res: goles recibidos de arquero / goles totales

porcentajeDeGoles :: String -> [(String, String)] -> [Int] -> Float
porcentajeDeGoles _ [] _ = 0.0
porcentajeDeGoles arquero equiposYarqueros listagoles = division ((golesRecibidosArquero arquero equiposYarqueros listagoles)*100) (sumatotal listagoles) 

golesRecibidosArquero :: String -> [(String, String)] -> [Int] -> Int
golesRecibidosArquero arquero ((a,b):x) (t:ts)  | arquero == b = t 
                                                | otherwise = golesRecibidosArquero arquero x ts

division :: Int -> Int -> Float
division a b = fromIntegral a / fromIntegral b

--4) 