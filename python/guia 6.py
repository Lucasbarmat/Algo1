import math 
#----------------------------------------------------
#1.1)
def problemaimprimir_hola_mundo (): 
    print("Hola Mundo") 
#problemaimprimir_hola_mundo()

#1.2)
def imprimir_un_verso():
    print("y dale dale bo \nquermos la copa \nla 12 esta loca")
#imprimir_un_verso()

#1.3)
def raizDe2() ->float:
    x: float = 2
    exponente: float = 0.5
    return round(x**exponente, 4)
#print(raizDe2())    

#1.4)
def factorial_de_dos ()-> int:
    return print(2)
#factorial_de_dos()

#1.5)
def problemaPerimetro()->float: 
    return 2*math.pi 
#print(problemaPerimetro()) 

#----------------------------------------------------
#2.1)
def imprimir_saludo (nombre: str):
    return print("hola", nombre)
#imprimir_saludo("lucas")

#2.2)
def raiz_cuadrada_de (numero: float):
    exponente: float = 0.5
    return round(numero**exponente, 4)
#print(raiz_cuadrada_de(2))

#2.3)
def fahrenheit_a_celsius(temp_en_far: int) -> int:
    return (temp_en_far - 32)*5/9
#print(fahrenheit_a_celsius(70))


#2.4)
def imprimir_dos_veces (estribillo: str):
    return print(estribillo * 2)
#imprimir_dos_veces ("esto es boca ")

#2.5)
def esMultiploDe (n:int, m:int) -> bool: 
    return n%m == 0 
#print (esMultiploDe (6,2)) 

#2.6)
def es_par(numero:int)->bool:
    return esMultiploDe(numero, 2)
#print(es_par(-2))

#2.7)
def cantidad_de_pizzas(comensales:int, min_cant_porciones:int):
    return math.ceil((comensales * min_cant_porciones)/8)
#print(cantidad_de_pizzas(10,2))

#----------------------------------------------------
#3.1)
def alguno_es_0 (n1:float,n2:float):
    if n1 == 0 or n2 == 0:
        return "true"
    return "false"
#print(alguno_es_0(1,2))

#3.2)
def ambos_son_0 (n1:float,n2:float):
    if n1 == 0 and n2 == 0:
        return "true"
    return "false"
#print(ambos_son_0(1,1))

#3.3)
def elNombreMasLargo (nombre:str) -> bool: 
    resultado:bool 
    resultado = 3<= len (nombre) <=8 
    return resultado 
#print(elNombreMasLargo ("hfo")) 

#3.4)
def es_bisieto(año:int):
    if esMultiploDe(año,4) and not(esMultiploDe(año,100)):
        return "true"
    return "false"
#print(es_bisieto(440))

#----------------------------------------------------
#4.1)
def peso_pino(altura:int):
    if altura <= 3:
        return altura*300
    else: return 900+((altura-3)*200)
#print(peso_pino(2))

#4.2)
def es_peso_util (peso:int):
    if 400 <= peso <= 1000:
        return "sirve"
    return "no sirve"
#print(es_peso_util(500))

#4.3)
def  sirve_pino(altura:int):
    peso = peso_pino(altura)
    return es_peso_util(peso)
#print(sirve_pino(3))

#----------------------------------------------------
#5.1)
def devolverElDobleSiesPar (numero:int) -> int: 
    espar:bool 
    espar = ((numero)%2) == 0 
    if espar: return numero * 2 
    else: return numero 
#print (devolverElDobleSiesPar (0)) 

#5.2)
def devolver_valor_si_es_par_sino_el_que_sigue(numero:int):
    if es_par(numero):
        return numero
    return numero+1
#print(devolver_valor_si_es_par_sino_el_que_sigue(3))

#5.3)
def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(numero:int):
    if esMultiploDe (numero,9):
        return numero * 3
    elif esMultiploDe(numero,3):
        return numero*2
    else: return numero 
#print(devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(80)) 

#5.4)
def lindo_nombre(nombre:str):
    if len(nombre) >= 5:
        return "Tu nombre tiene muchas letras!"
    return "Tu nombre tiene pocas letras"
#print(lindo_nombre("lucas"))

#5.5)
def elRango(nombre:int):
    if len(nombre) < 5: return print("Menor a 5")
    elif 10 <= len(nombre) <= 20: return print("entre 10 y 20")
    else: return print("Mayor a 20")
#elRango("lucas")

#5.6)
def vacaciones_o_trabajar(sexo:str,edad:int):
    if edad <= 18 or (sexo == "M" and edad >=65): return "Andá de vacaciones"
    elif sexo == "F" and edad >=60: return "Andá de vacaciones"
    else: return "Te toca trabajar"

#print(vacaciones_o_trabajar("M",60))

#----------------------------------------------------
#6.1)
def numero_del_1_al_10():
    x:int = 1
    while x<= 10:
        print(x)
        x += 1
#numero_del_1_al_10()

#6.2)
def numerosParesEntre10y40 (): 
    x:int = 10 
    while x<=40: 
        if x%2 == 0: 
            print (x) 
        x += 1 
#numerosParesEntre10y40 ()

#6.3)
def eco_10_veces():
    x:int = 1
    while x<=10:
        print("eco")
        x += 1
#eco_10_veces()

#6.4)
def cuentaRegre (numero:int): 
    while numero >0: 
        print(numero) 
        numero -= 1 
    print("despegue") 
#cuentaRegre (5)

#6.5)
def viaje_en_el_tiempo(año_partida:int,año_llegada:int):
    while año_partida > año_llegada:
        año_partida -= 1
        print(f"Viajo un año al pasado, estamos en el año: {año_partida}")
#viaje_en_el_tiempo(2010,2000)

#6.6)
def viaje_rapido(salida:int):
    while salida>= -384:
        salida -= 20
    return print("llegamos")
#viaje_rapido(1900)

#----------------------------------------------------
#7.1)
def AUXnumero_del_1_al_10():
    for num in range(1,11,1):
        print(num)
#AUXnumero_del_1_al_10()

#7.2)
def AUXnumerosParesEntre10y40 (): 
    for num in range(10,41,2):
        print(num)
#AUXnumerosParesEntre10y40()

#7.3)
def AUXeco_10_veces():
    for num in range(1,10,1):
        print("eco")
#AUXeco_10_veces()

#7.4)
def AUXcuentaRegre (numero:int):
    for num in range(numero,0,-1):
        print(num) 
    print("despegue")
#AUXcuentaRegre(4)

#7.5)
def AUXviaje_en_el_tiempo(año_partida:int,año_llegada:int):
    for año in range(año_partida-1,año_llegada-1,-1):
        print(f"Viajó un año al pasado, estamos en el año: {año}")
#AUXviaje_en_el_tiempo(2010,2005)

#7.6)
def AUXviaje_rapido(salida:int):
    for año in range(salida,-384,-20):
        print(f"Viajó 20 años al pasado, estamos en el año: {año}")
#AUXviaje_rapido(133)
   
#----------------------------------------------------
#8.1)
def uno():
    x = 5
    y = 7
    x = x + y
    return print(x)
#uno()

#8.2)
def dos():
    x=5
    y=7
    z=x+y
    y = z * 2
    return y
#print(dos())

#8.3)
def tres():
    x=5 
    y=7
    x="hora"
    y = x * 2
    return y
#print(tres())

#8.4)
def cuatro():
    x=False
    return not(x)
#print(cuatro())

#8.5)
def cinco():
    x=False
    x=not(x)
    return x
#print(cinco())

#8.6)
def seis ():
    x=True
    y=False
    res = x and y
    x = res and x
    return x
#print(seis())

#----------------------------------------------------
#9)
def rt(x: int, g: int) -> int:
    g = g +1
    return x + g

g:int = 0
def ro(x: int) -> int:
    global g
    g = g + 1
    return (x + g)
#9.1)
# 2  3  4 

#9.2)
# 2 2 2
