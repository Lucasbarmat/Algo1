import Distribution.Simple.Utils (xargs)
--Ejercicio 1. Implementar la funci´on fibonacci:: Integer ->Integer que devuelve el i-´esimo n´umero de Fibonacci. Recordar que la secuencia de Fibonacci se define como:
fib :: Integer ->Integer
fib n   | n == 0 = 0
        | n == 1 = 1
        | n >= 2 = (fib (n-1) + fib (n-2))
 
--Ejercicio 2. Implementar una funci´on parteEntera :: Float ->Integer seg´un la siguiente especificaci´on:
parteEntera :: Float ->Integer
parteEntera x   | x < 0 && x > (-1) = 0
                | x >= 0 && x < 1 = 0
                | x > (-1) && x < 0 = -1
                | x >= 1 =1 + parteEntera (x-1)
                | otherwise = (-1) + parteEntera (x+1)


--Ejercicio 3. Especificar e implementar la funci´on esDivisible :: Integer ->Integer ->Bool que dados dos n´umeros naturales determinar si el primero es divisible por el segundo. No est´a permitido utilizar las funciones mod ni div.
esDivisible :: Integer -> Integer -> Bool
esDivisible n x | n == 0 = True
                | n < x = False
                | x < 0 = esDivisible (n+x) x
                | otherwise = esDivisible (n-x) x



--Ejercicio 4. Especificar e implementar la funci´on sumaImpares :: Integer ->Integer que dado n ∈ N sume los primeros
--  numeros impares. Por ejemplo: sumaImpares 3 ; 1+3+5 ⇝ 9

sumaImpares :: Integer ->Integer
sumaImpares x   | x == 0 = 0
                | even x = sumaImpares (x-1) 
                | otherwise = (sumaImpares(x-1)) + x


-- Ejercicio 5. Implementar la funci´on medioFact :: Integer ->Integer que dado n ∈ N calcula n!! = n (n − 2)(n − 4) · · · .

medioFact :: Integer ->Integer
medioFact x | x == 0 = 1  
            | x == (-1) = 1
            | otherwise = x * (medioFact (x-2))

factorial :: Integer ->Float
factorial x | x == 0 = 1.0
            | otherwise = fromIntegral x * factorial (x-1)

-- Ejercicio 6. Especificar e implementar la funci´on sumaDigitos :: Integer ->Integer que calcula la suma de dıgitos de
-- un numero natural. Para esta funci´on pueden utilizar div y mod.

sumaDigitos :: Integer ->Integer
sumaDigitos x   | x < 10 = x
                | otherwise = ultimodigito (x) + sumaDigitos (sacarunidades (x)) 

--Ejercicio 7. Implementar la funci´on todosDigitosIguales :: Integer ->Bool que determina si todos los d´ıgitos de un
--n´umero natural son iguales, es decir
todosDigitosIguales :: Integer ->Bool
todosDigitosIguales x   | 0 < x && x < 10 = True
                        | ultimodigito (x) /= ultimodigito(sacarunidades(x)) = False
                        | otherwise = todosDigitosIguales (sacarunidades (x))

ultimodigito :: Integer ->Integer
ultimodigito x = mod x 10

sacarunidades :: Integer ->Integer
sacarunidades x = div x 10

primerdigito:: Integer ->Integer
primerdigito x  | cantidadigitos x == 1 = x
                | otherwise = primerdigito (sacarunidades (x))

--Ejercicio 8. Implementar la funci´on iesimoDigito :: Integer ->Integer ->Integer que dado un n ∈ Z mayor o igual
--a 0 y un i ∈ Z mayor o igual a 1 menor o igual a la cantidad de d´ıgitos de n, devuelve el i-´esimo d´ıgito de n.
-- x >= 0 
-- y >= 1
-- y <= cantidad de digitos de x
-- res: y-esimo digito de x 

yesimoDigito :: Integer ->Integer ->Integer
yesimoDigito x y = mod (div x (10^ ((cantidadigitos(x)) - y))) 10

cantidadigitos :: Integer ->Integer
cantidadigitos x    | x == 0 = 0
                    | otherwise = 1 + cantidadigitos (sacarunidades(x))

-- Ejercicio 9. Especificar e implementar una funcion esCapicua :: Integer ->Bool que dado n ∈ N≥0 determina si n es
-- un numero capicua.

esCapicua :: Integer -> Bool
esCapicua x     | cantidadigitos x == 1 = True
                | primerdigito (x) == ultimodigito (x) = esCapicua(sacarunidades(x - (primerdigito x * 10^(cantidadigitos x - 1)))) 
                | otherwise = False


--Ejercicio 10. Especificar, implementar y dar el tipo de las siguientes funciones (sımil Ejercicio 4 Pr´actica 2 de Algebra 1).
-- a)
f1 :: Integer ->Integer
f1 (-1) = 0
f1 x = 2^x + f1(x-1)

--b)
f2 :: Integer ->Integer ->Integer
f2 x y  | x == 0 = 0
        | otherwise = y^x + (f2 (x-1) y)

--c) 
f3 :: Integer ->Integer ->Integer
f3 n q = f2 (2*n) q

--d) 
f4 :: Integer ->Integer ->Integer
f4 n q = f3 n q - f2 (n-1) q

--Ejercicio 11. a) Especificar e implementar una funci´on eAprox :: Integer ->Float que aproxime el valor del n´umero e
--a partir de la siguiente sumatoria

eAprox :: Integer -> Float
eAprox x | x == 0 = 1
         | otherwise = (eAprox (x - 1)) + (1 / factorial x)

--Ejercicio 12. Para n ∈ N se define la sucesi´on
raizDe2Aprox :: Integer ->Float
raizDe2Aprox x  = susucesionA x - 1

susucesionA :: Integer ->Float
susucesionA x   | x == 0 = 2
                | otherwise = 2 + (1/ (raizDe2Aprox (x-1)))