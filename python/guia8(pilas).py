from queue import LifoQueue as Pila
import random

#ej8)
def generar_nros_al_azar(cantidad: int, desde: int, hasta: int) -> Pila[int]:
    p = Pila()
    while cantidad > 0:
        p.put(random.randint(desde, hasta))
        cantidad -= 1
    return p
#print(generar_nros_al_azar(1, 0, 4).queue)

#ej9)
def cantidad_elementos(p: Pila) -> int:
    cantidad = 0
    pAUX:Pila = Pila()
    while not p.empty():
        x = p.get()
        pAUX.put(x)
        cantidad += 1
    while not pAUX.empty():
        x = pAUX.get()
        p.put(x)
    return cantidad
print(cantidad_elementos(generar_nros_al_azar(10, 0, 4)))


#ej10)
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


#ej11)
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
#print(esta_bien_balanceada("1 + 2 2 x 3 = ( 2 0 / 5 ) )"))

#ej12)
def evalucar_expresiones(s:str)->float:
    p:Pila = Pila()
    operaciones = ["+","-","*","/"]
    for i in range(len(s)):
        if s[i] not in operaciones and s[i] != " ":
            p.put((s[i]))
        elif s[i] in operaciones:
            segundo_elemento:float = p.get()
            primer_elemento:float = p.get()
            if s[i] == "+":
                res:float = (primer_elemento + segundo_elemento)
            elif s[i] == "-":
                res:float = primer_elemento - segundo_elemento
            elif s[i] == "*":
                res:float = primer_elemento * segundo_elemento
            elif s[i] == "/":
                res:float = primer_elemento / segundo_elemento
            p.put(res)
    return p.get()
#print(evalucar_expresiones("3 1 + 5 +"))


