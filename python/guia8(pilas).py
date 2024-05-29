from queue import LifoQueue as Pila
import random

#ej8
def generar_numeros_al_azar(cantidad : int, desde : int, hasta : int)->Pila[int]:
    p = Pila()
    while cantidad > 0:
        numero = random.randint(desde,hasta)
        p.put(numero)
        cantidad -= 1
    return p
#print(generar_numeros_al_azar(5,10,15).queue)

#ej9
def cantidad_elementos(p:Pila)->int:
    cantidad = 0
    while p.empty() != True:
        p.get()
        cantidad += 1
    return cantidad
print(cantidad_elementos(generar_numeros_al_azar(6,10,20)))
#ej10
