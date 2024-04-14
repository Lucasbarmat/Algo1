--1a)
f :: Integer ->Integer
f 1 = 8
f 4 = 131
f 16 = 16
--1b)
g :: Integer ->Integer
g 8 = 16
g 16 = 4
g 131 = 1
--1c)
h :: Integer ->Integer
h x = f(g x)
k :: Integer ->Integer
k x = g(f x)

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

--3) Implementar una funcion a y b no pueden ser 0. True solo si a*a + a*b*k =0 para algun K de los enteros, k distintos de 0
estanRelacionados :: Integer ->Integer ->Bool
estanRelacionados x y   | x == 0 && y == 0 = False
                        | mod y x == 0 = True
                        | otherwise = False
-- x es multiplo de y para que sea True

-- 4b) TodoMenor: dadas dos tuplas R × R, decide si es cierto que cada coordenada de la primera tupla es menor a la coordenada correspondiente de la segunda tupla.
todomenor :: (Float, Float) ->(Float, Float) ->Bool -- Float se usa para poner pares ordenados
todomenor t1 t2 = (fst t1 < fst t2) && (snd t1 < snd t2) -- fst (pimer elemento) y snd (segundo elemento)
todomenor1 :: (Float, Float) ->(Float, Float) ->Bool
todomenor1 (a,b) (c,d)= (a < b) && (c < d)


--4d) sumaTerna: dada una terna de enteros, calcula la suma de sus tres elementos
sumaterna :: (Integer,Integer,Integer) ->Integer
sumaterna (a, b,c) = a + b + c

--4f) posPrimerPar: dada una terna de enteros, devuelve la posición del primer número par si es que hay alguno, y devuelve 4 si son todos impares.
posPrimerPar :: (Integer,Integer,Integer) ->Integer
posPrimerPar (a,b,c) | mod a 2 == 0 = 1 -- mod es el resto de la división por 2 en este caso
                        | mod b 2 == 0 = 2
                        | mod c 2 == 0 = 3
                        | otherwise = 4
                        
--5) . Implementar la funci´on todosMenores 
todosMenores :: (int,int,int) ->Bool
todosMenores (a,b,c)   | f1 a > g1 a && f1 b > g1 b && f1 c > g1 c = True
                    | otherwise = False

f1 :: int ->int
f1 x    | x <= 7 = x*x
        | x > 7 = 2*x -1

g1 :: int ->int
g1 x    | mod x 2 == 0 = x / 2
        | otherwise = 3*x +1


-- EJERCICIO 6
problemabisiesto :: Integer -> Bool
problemabisiesto x | (mod x 4 /= 0) = False
                    | (mod x 100 ==0 && mod x 400 /=0) = False
                    | otherwise = True

                    
--Ejercicio 7. Implementar una funcion:
absoluto1 :: Float ->Float
absoluto1 x | x < 0 = -x
            | otherwise = x
distanciaManhattan :: (Float, Float, Float) ->(Float, Float, Float) ->Float
distanciaManhattan (a, b, c) (d, e, f) = absoluto1 (a-d) + absoluto1 (b-e) + absoluto1 (c-f)

--Ejercicio 8. Implementar una función comparar:
