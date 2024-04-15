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


--Ejercicio 3. Especificar e implementar la funcion esDivisible :: Integer ->Integer ->Bool 
--que dados dos numeros naturales determinar si el primero es divisible por el segundo. 
--No esta permitido utilizar las funciones mod ni div.
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
                | x >= 1 = 1 + parteEntera (x-1)
                | otherwise = (-1) + parteEntera (x+1)


--Ejercicio 3. Especificar e implementar la funci´on esDivisible :: Integer ->Integer ->Bool que dados dos n´umeros naturales determinar si el primero es divisible por el segundo. No est´a permitido utilizar las funciones mod ni div.
esDivisible :: Integer ->Integer ->Bool
esDivisible x y | x == 0 = True
                | x > y = False
                | x > 0 = 0
