module Solucion where
import Data.Char
-- No se permite agrear nuevos imports
-- Sólo está permitido usar estas funciones:
-- https://campus.exactas.uba.ar/pluginfile.php/557895/mod_resource/content/1/validas_tp.pdf


-- Completar!
-- Nombre de grupo: La peor generacion
-- Integrante1: 46026517 Bilavsky Yago ybilavsky@gmail.com
-- Integrante2: 46214856 Barmat Lucas lucasbarmat@gmail.com
-- Integrante3: 36763336 Sousa Damian Ariel
-- Integrante4: 49487772 Zambrana Diego
-- Integrantes que abandonaron la materia: 49487772 Zambrana Diego

-- EJ 1
esMinuscula :: Char -> Bool
esMinuscula letra = ord letra >= 97 && ord letra <= 122 

-- EJ 2
letraANatural :: Char -> Int
letraANatural letra = ord letra - 97  

-- EJ 3
desplazar :: Char -> Int -> Char
desplazar letra espacios |esMinuscula letra == False = letra  
                         |otherwise = chr ((posicionEnRango letra espacios) + 97)
   
posicionEnRango :: Char -> Int -> Int
posicionEnRango letra posicion | posicionBuscada >25 = posicionEnRango letra (posicion - 26)
                               | posicionBuscada <0 = posicionEnRango letra (posicion + 26)
                               | otherwise = posicionBuscada
                            where posicionBuscada = letraANatural letra + posicion

-- EJ 4
cifrar :: String -> Int -> String
cifrar palabra espacios = cifrando palabra espacios 0

cifrando :: String -> Int -> Int -> String
cifrando (x:xs) num cont |xs == "" = desplazar x num:""    
                         |esMinuscula x == False = x : cifrando xs num (cont +1)
                         |otherwise = desplazar x num : cifrando xs num (cont +1)

-- EJ 5
descifrar :: String -> Int -> String
descifrar palabra espacios = cifrar palabra (26-espacios)

-- EJ 6
cifrarLista :: [String] -> [String]
cifrarLista lista = cifrandoLista lista 0

cifrandoLista :: [String] -> Int -> [String]
cifrandoLista (x:xs) index | xs == [] = cifrar x index : []
                           | otherwise = cifrar x index : cifrandoLista xs (index +1) 


-- EJ 7
frecuencia :: String -> [Float]
frecuencia x = porcentajes (cantidadDeLetras x) (listaLetras 97) x

listaLetras :: Int -> [Char]
listaLetras 123 = []
listaLetras n = [chr n] ++ listaLetras (n+1)

apariciones :: Char -> String -> Int
apariciones _ [] = 0
apariciones c (x:xs)
  | c == x = 1 + apariciones c xs
  | otherwise = apariciones c xs

cantidadDeLetras :: String -> Float
cantidadDeLetras [] = 0.0
cantidadDeLetras (x:xs)
  | esMinuscula x = 1.0 + cantidadDeLetras xs
  | otherwise = cantidadDeLetras xs

porcentajes :: Float -> [Char] -> String -> [Float]
porcentajes _ [] _ = []
porcentajes total (x:xs) palabra
      | total == 0 = 0 : porcentajes total xs palabra
      | otherwise  = ((fromIntegral (apariciones x palabra)) / total * 100) : porcentajes total xs palabra


-- Ej 8
cifradoMasFrecuente :: String -> Int -> (Char, Float)
cifradoMasFrecuente x y = (desplazar (masFrecuenteALetra (frecuencia x)) y , masFrecuenteFloat(frecuencia(x)) )

masFrecuenteFloat :: [Float] -> Float
masFrecuenteFloat [] = 0.0
masFrecuenteFloat [x] = x
masFrecuenteFloat (x:xs:xss)
   | x >= xs = masFrecuenteFloat (x:xss)
   | otherwise = masFrecuenteFloat (xs:xss)

masFrecuenteC :: [Float] -> Int
masFrecuenteC [] = 0
masFrecuenteC [x] = 1
masFrecuenteC xs = posicion (masFrecuenteFloat xs) xs 1

posicion :: Float -> [Float] -> Int -> Int
posicion _ [] _ = 0
posicion _ [_] pos = pos
posicion y (x:xs) pos
   | x == y = pos
   | otherwise = posicion y xs (pos + 1)

masFrecuenteALetra :: [Float] -> Char
masFrecuenteALetra x = chr ((masFrecuenteC x) + 96)


-- EJ 9
esDescifrado  :: String -> String -> Bool
esDescifrado  [a] [b] = (esMinuscula a) && (esMinuscula b)
esDescifrado  a b = esDescifradoAUX  a b (seTuvoQueDesplazarnLugares a b)

esDescifradoAUX :: String -> String -> Int -> Bool
esDescifradoAUX [] [] n = True
esDescifradoAUX (a1:ax) (b1:bx) n = (desplazar a1 n == b1) && (esDescifradoAUX ax bx n)

seTuvoQueDesplazarnLugares :: String -> String -> Int
seTuvoQueDesplazarnLugares [] [] = 0
seTuvoQueDesplazarnLugares (a:as) (b:bs)  | esMinuscula a = restaOrdenes a b 
                                          | otherwise = seTuvoQueDesplazarnLugares as bs

restaOrdenes :: Char -> Char -> Int
restaOrdenes a b  | (ord a > ord b) = 26 - (letraANatural a - letraANatural b)
                  | otherwise = -(letraANatural a - letraANatural b)

-- EJ 10

todosLosDescifrados :: [String] -> [(String, String)]
todosLosDescifrados lista = revisarCifrados lista lista 

revisarCifrados :: [String] -> [String] -> [(String, String)]
revisarCifrados [] (y:ys) = []
revisarCifrados (x:xs) (y:ys) = listaDeDuplasCifradas x (y:ys) ++ revisarCifrados xs (y:ys) 

listaDeDuplasCifradas :: String -> [String] -> [(String, String)]
listaDeDuplasCifradas palabra [] = []
listaDeDuplasCifradas palabra (x:xs)|palabra == x = listaDeDuplasCifradas palabra xs
                                    |esDescifrado palabra x == False = listaDeDuplasCifradas palabra xs
                                    |esDescifrado palabra x == True = (palabra, x) : listaDeDuplasCifradas palabra xs

-- EJ 11
expandirClave :: String -> Int -> String
expandirClave xs 0 = []
expandirClave (x:xs) n = x : expandirClave (xs ++ [x]) (n-1)

-- EJ 12
cifrarVigenere :: String -> String-> String
cifrarVigenere [] [] = []
cifrarVigenere palabra clave = cifrarVigenereAUX palabra (expandirClave clave (length palabra))

cifrarVigenereAUX :: String -> String -> String
cifrarVigenereAUX [] [] = []
cifrarVigenereAUX (s:sx) (c:cx)  | s == ' ' || not(esMinuscula s)  = (s : cifrarVigenereAUX sx cx)
                                 | otherwise = ((numeroNatural(letraANatural s + letraANatural c)) : cifrarVigenereAUX sx cx)


numeroNatural :: Int -> Char
numeroNatural numero | numero <= 25 = chr (numero + 97)
                     | otherwise = numeroNatural(numero - 26)



-- EJ 13
descifrarVigenere :: String -> String -> String
descifrarVigenere [] [] = []
descifrarVigenere palabra clave = descifrarVigenereAUX palabra (expandirClave clave (length palabra))

descifrarVigenereAUX :: String -> String -> String
descifrarVigenereAUX [] [] = []
descifrarVigenereAUX (s:sx) (c:cx)  | s == ' ' || not(esMinuscula s)  = (s : descifrarVigenereAUX sx cx)
                                    | otherwise = ((numeroNegativo(letraANatural s - letraANatural c)) : descifrarVigenereAUX sx cx)

numeroNegativo :: Int -> Char
numeroNegativo numero   | numero >= 0 = numeroNatural numero
                        | otherwise = numeroNegativo (numero + 26)

-- EJ 14
peorCifrado :: String -> [String] -> String
peorCifrado _ [x] = x 
peorCifrado palabra (c1:c2:cx)   | (distanciaEntreSecuencias palabra (cifrarVigenere palabra c1)) < (distanciaEntreSecuencias palabra (cifrarVigenere palabra c2)) = peorCifrado palabra (c1:cx)
                                 | otherwise = peorCifrado palabra (c2:cx)

distanciaEntreSecuencias :: String -> String -> Int
distanciaEntreSecuencias [] [] = 0
distanciaEntreSecuencias (a:as) (b:bs) = (moduloDeunNumero ((letraANatural a) - (letraANatural b))) + (distanciaEntreSecuencias as bs)

moduloDeunNumero :: Int -> Int
moduloDeunNumero numero | numero >= 0 = numero
                        | otherwise = (numero * (-1))

-- EJ 15
combinacionesVigenere :: [String] -> [String] -> String -> [(String, String)]
combinacionesVigenere [] _ _ = []
combinacionesVigenere (p:px) claves cifrado | (estaLaClaveONo p claves cifrado) = (cualEsLaClave p claves cifrado) ++ (combinacionesVigenere px claves cifrado)
                                            | otherwise = combinacionesVigenere px claves cifrado

estaLaClaveONo :: String -> [String] -> String -> Bool
estaLaClaveONo palabra claves cifrado   | cualEsLaClave palabra claves cifrado == [] = False
                                        | otherwise = True

cualEsLaClave :: String -> [String] -> String -> [(String, String)]
cualEsLaClave _ [] _ = []
cualEsLaClave palabra (c:cx) cifrado    | (cifrarVigenere palabra c == cifrado) = ((palabra, c): cualEsLaClave palabra cx cifrado) 
                                        | otherwise = cualEsLaClave palabra cx cifrado
