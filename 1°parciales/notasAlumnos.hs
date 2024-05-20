--     [nombre, [notas]]   nombre     minimo de materias aprobadas para que devuelva TRUE
ej1 :: [(String, [Int])] -> String -> Int -> Bool
ej1 [] _ _ = False
ej1 ((nombre, notas):xs) x n    | x == nombre = corregir notas n 
                                | otherwise = ej1 xs x n 
        
corregir :: [Int] ->Int -> Bool
corregir x n    | (cuantasMateriasAprobadas x) >= n = True 
                | otherwise = False

cuantasMateriasAprobadas :: [Int] -> Int
cuantasMateriasAprobadas [] = 0
cuantasMateriasAprobadas (x:xs) | x >= 4 = 1 + cuantasMateriasAprobadas xs
                                | otherwise = cuantasMateriasAprobadas xs

--[(("lucas"),[5,6,8,4,3,6,8,0,5,3]), (("juan"),[9,9,9]), (("pedor"),[1,2,4,1,1,8,6,9])] "lucas" 4

-- RES = alumnos con promedio >= 8 y ninguna nota < 4
ej2 :: [(String, [Int])] -> [String]
ej2 [] = []
ej2 ((nombre,notas):xs) | (promedioAlumno notas >= 8) && (ningunaDesaprobada notas) = [nombre] ++ ej2 xs
                        | otherwise = ej2 xs

promedioAlumno :: [Int] -> Float
promedioAlumno [] = 0.0
promedioAlumno listaNotas = (fromIntegral (sumaNotas listaNotas)) / (fromIntegral (contarNotas listaNotas))

sumaNotas :: [Int] -> Int
sumaNotas [] = 0
sumaNotas (x:xs) = x + sumaNotas xs

contarNotas :: [Int] -> Int
contarNotas [] = 0
contarNotas (x:xs) = 1 + contarNotas xs

ningunaDesaprobada :: [Int] -> Bool
ningunaDesaprobada [] = True
ningunaDesaprobada (x:xs)   | x >= 4 = ningunaDesaprobada xs
                            | otherwise = False

    
ej3 :: [(String, [Int])] -> String
ej3 [(nombre,notas)] = nombre
ej3 ((nombre1,notas1):(nombre2,notas2):xs)  | (promedioAlumno notas1) >= (promedioAlumno notas2) = ej3 ((nombre1,notas1):xs)
                                            | otherwise = ej3 ((nombre2,notas2):xs)

--REQUISITOS:
 --1)aprobar  mas de (total -1) materias
 --2) cunplir con el ej2
 --3) (mejor promedio - promedio alumno) < 1
ej4 :: [(String, [Int])] -> Int -> String -> Bool
ej4 [] _ _ = False
ej4 registro totalMaterias alumno = (ej1 registro alumno (totalMaterias - 1)) && 
                                    (pertenece alumno (ej2 registro)) && 
                                    ((promedioAlumno(notasDelAlumno (ej3 registro) registro) - promedioAlumno(notasDelAlumno alumno registro)) < 1)


notasDelAlumno :: String ->[(String, [Int])] -> [Int]
notasDelAlumno alumno ((nombre,notas):registro) | alumno == nombre = notas  
                                                | otherwise = notasDelAlumno alumno registro    
                                        

pertenece :: String -> [String] -> Bool
pertenece _ [] = False
pertenece alumno (x:xs) | alumno == x = True
                        | otherwise = pertenece alumno xs



