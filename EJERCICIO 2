-- 2a) calcular en valor absoluto de un numero entero
absoluto :: Integer ->Integer
absoluto x  | x >= 0 = x
            | otherwise = (-x)
--2b)devuelve el m´aximo entre el valor absoluto de dos n´umeros enteros.
maximoabsoluto :: Integer ->Integer ->Integer
maximoabsoluto x y  | (absoluto x) >= (absoluto y)  = x
                    | otherwise = y
--2c) devuelve el maximo entre tres numeros enteros.
maximo3 :: Integer ->Integer ->Integer ->Integer
maximo3 x y z   | x >= y && x >= z = x
                | y >= x && y >= z = y
                | otherwise = z 
-- 2g) SumaDistintos: que dados tres n´umeros enteros calcule la suma sin sumar repetidos (si los hubiera).
sumadistintos :: Integer ->Integer ->Integer ->Integer
sumadistintos x y z | (x == y) && (x == z) = x
                    | x == y = x + z
                    | x == z = x + y
                    | y == z = y + y
                    | otherwise = x + y + z