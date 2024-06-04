from queue import LifoQueue as Pila
import random

#8

def generar_nros_al_azar(cantidad: int, desde: int, hasta: int) -> Pila[int]:
    p = Pila()
    while cantidad > 0:
        p.put(random.randint(desde, hasta))
        cantidad -= 1
    return p

#print(generar_nros_al_azar(1, 0, 4).queue)

#9

def cantidad_elementos(p: Pila) -> int:
    cantidad = 0
    pila_vacia: Pila = Pila()
    while not p.empty():
        sacar = p.get()
        cantidad += 1
        pila_vacia.put(sacar)
    while not pila_vacia.empty():
        sacar2= pila_vacia.get()
        p.put(sacar2)
    print(p.queue)
    return cantidad

#print(cantidad_elementos(generar_nros_al_azar(4, 0, 4)))

#10

def maximo(lista: list[int]) -> int:
    maximo = lista[0]
    for numero in lista:
         if numero >= maximo:
            maximo = numero
    return maximo

def buscar_el_maximo(p: Pila[int]) -> int:
    lista = []
    while not p.empty():
        sacar = p.get()
        lista.append(sacar)
    x = maximo(lista)
    while len(lista) > 0:
        sacar2 = lista.pop()
        p.put(sacar2)
    print(p.queue)
    return x


#ej11

def esta_bien_balanceada(formula:str)->bool:
    operaciones = ["+","-","x","/"]
    for i in range(len(formula)):
        if formula[i] in operaciones:
            if formula[i+1] != " " or formula[i+2] in operaciones:
                return False
        if formula[i] == ")":
            if "(" not in formula[:i]:
                return False
        if formula[i] == "(":
            if ")" not in formula[i:]:
                return False        
    return True
print(esta_bien_balanceada("1 + 2 2 x 3 = ( 2 0 / 5 ) )"))
     