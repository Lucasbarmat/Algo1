import math 

#1.1)
def problemaimprimir_hola_mundo (): 
    print("Hola Mundo") 
#problemaimprimir_hola_mundo()

#1.2)
#1.3)
#1.4)

#1.5)
def problemaPerimetro()->float: 
    return 2*math.pi 
#print(problemaPerimetro()) 

#2.1)
#2.2)
#2.3)
#2.4)

#2.5)
def esMultiploDe (n:int, m:int) -> bool: 
    return n%m == 0 
#print (esMultiploDe (6,4)) 

#2.6)
#2.7)
#3.1)
#3.2)

#3.3)
def elNombreMasLargo (nombre:str) -> bool: 
    resultado:bool 
    resultado = 3<= len (nombre) <=8 
    return resultado 
#print(elNombreMasLargo ("hfo")) 

#3.4)
#4.1)
#4.2)
#4.3)
#4.4)

#5.1)
def devolverElDobleSiesPar (numero:int) -> int: 
    espar:bool 
    espar = ((numero)%2) == 0 
    if espar: return numero * 2 
    else: return numero 
#print (devolverElDobleSiesPar (0)) 

#5.2)
#5.3)
#5.4)
#5.5)
#5.6)
#6.1)

#6.2)
def numerosParesEntre10y40 (): 
    x:int = 10 
    while x<=40: 
        if x%2 == 0: 
            print (x) 
            x += 1 
#print(numerosParesEntre10y40 ()) 

#6.3)

#6.4)
def cuentaRegre (numero:int): 
    while numero >0: 
        print(numero) 
    numero -= 1 
    print("despegue") 
    cuentaRegre (5)

#6.5)
#6.6)
#7)
#8.1)
#8.2)
#8.3)
#8.4)
#8.5)
#8.6)
#9.1)
#9.2)
#9.3)
#9.4)