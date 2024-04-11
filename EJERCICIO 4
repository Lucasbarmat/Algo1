-- b) TodoMenor: dadas dos tuplas R × R, decide si es cierto que cada coordenada de la primera tupla es menor a la coordenada correspondiente de la segunda tupla.
todomenor :: (Float, Float) ->(Float, Float) ->Bool -- Float se usa para poner pares ordenados
todomenor t1 t2 = (fst t1 < fst t2) && (snd t1 < snd t2) -- fst (pimer elemento) y snd (segundo elemento)

todomenor1 :: (Flotante, Flotante) ->(Flotante, Flotante) ->Bool
todomenor1 (a,b) (c,d)= (a < b) && (c < d)


--d) sumaTerna: dada una terna de enteros, calcula la suma de sus tres elementos
sumaterna :: (Entero,Entero,Entero) ->Entero
sumaterna (a, b,c) = a + b + c

--f) posPrimerPar: dada una terna de enteros, devuelve la posición del primer número par si es que hay alguno, y devuelve 4 si son todos impares.
posPrimerPar :: (Entero,Entero,Entero) ->Entero
posPrimerPar (a,b,c) | mod a 2 == 0 = 1 -- mod es el resto de la división por 2 en este caso
                        | mod b 2 == 0 = 2
                        | módulo c 2 == 0 = 3
                        | de lo contrario = 4