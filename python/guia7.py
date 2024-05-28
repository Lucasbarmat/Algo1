#ej 1.1)
def pertenece (s:list ,e:int)->bool:
    for i in range (0,len(s),1):
        if (s[i] == e):
            return True
    return False
#print(pertenece([1,2,3,4,5,6],0))
def pertenece_2 (s:list ,e:int)->bool:
    i = 0
    while i < len(s):
        if s[i] == e:
            return True
        i += 1
    return False
#print(pertenece_2([1,2,3,4,5,6],1))

#ej 1.2)
def divide_a_todos(s:list, e:int)->bool:
    for i in range(0,len(s),1):
        if s[i] % e != 0:
            return False
    return True
#print(divide_a_todos([3,0,6,2],2))
def divide_a_todos_dos(s:list, e:int) ->bool:
    i = 0
    res:bool = True
    while (i < len(s)) & (res == True):
        if s[i] % e != 0:
            res = False
        i += 1
    return res
#print(divide_a_todos_dos([1,81,6,8],2))

#ej 1.3)
def suma_total(s:list)->int:
    res:int=0
    for i in range(0,len(s),1):
        res += s[i]
    return res
#print(suma_total([1,2,4,8]))

#ej 1.4)
def ordenanda(s:list)->bool:
    for i in range(len(s) - 1):
        if (s[i] >= s[i + 1]):
            return False
    return True
#print(ordenanda([1, 2, 3, 1])) 

#ej 1.5)
def mayor_a_7(s:list)->bool:
    for i in range(len(s)):
        if len(s[i]) == 7:
            return True
    return False
#print(mayor_a_7(["fueeec","estageje","aaaaaaa"]))

#ej 1.6)
def palindromo(l:str)->bool:
    res:bool = True
    i:int = 0
    while i < len(l):
        if l[i] != l[len(l) - 1 - i]:
            return False
        i += 1
    return res
#print(palindromo("abvba"))

#ej 1.7)
def analizar_contra(contraseña:str)->str:
    if es_verde(contraseña):
        return "verde"
    else:
        if es_roja (contraseña):
            return "roja"
        else:
            return "amarilla"
        
def es_roja(contraseña:str)->bool:
    if len(contraseña) < 5:
        return True
    return False

def es_verde(contraseña:str)->bool:
    if (longitud_mayor_ocho (contraseña)) and (una_minuscula (contraseña)) and (una_mayucula (contraseña)) and (un_digito (contraseña)):
        return True
    return False

def longitud_mayor_ocho(contraseña:str)->bool:
    if len(contraseña) > 8:
        return True
    return False

def una_minuscula (contraseña:str)->bool:
    for letra in range(len(contraseña)):
        if 'a' <= contraseña[letra] <='z':
            return True
    return False

def una_mayucula (contraseña:str)->bool:
    for letra in range(len(contraseña)):
        if 'A' <= contraseña[letra] <='Z':
            return True
    return False

def un_digito (contraseña:str)->bool:
    for letra in range(len(contraseña)):
        if '0' <= contraseña[letra] <='9':
            return True
    return False
#print(analizar_contra("HolaG7holag"))

#ej 1.8)
def saldo(transacciones:float)->float:
    saldo_actual:float = 0.0
    for i in transacciones:
        if i[0] == "I":
            saldo_actual += i[1]
        else: 
            if i[0] == "R":
                saldo_actual -=i[1]
    return print(saldo_actual)
#saldo([("I",2000), ("R", 20),("R", 1000),("I", 300)])

#ej 1.9)
#ej 1.10)

#----------------------------------------------------
#ej 2.1)
def cambiar_los_pares_por_0(lista: list[int]) -> None:
    for i in range(len(lista)):
        if i % 2 == 0:
            lista[i] = 0
    #print(cambiar_los_pares_por_0([1,2,3,4,5,6,7,8,9,10]))

#ej 2.2)
#ej 2.3)
#ej 2.4)
#ej 2.5)
#ej 2.6)

#----------------------------------------------------
#ej 3)

#----------------------------------------------------
#ej 4.1)
#ej 4.2)
#ej 4.3)

#----------------------------------------------------
#ej 5.1)
#ej 5.2)
def pertenece_a_cada_uno_version_2(s:list[list[int]], e:int,res:list[bool])->None:
    res.clear()
    for i in s:
        res.append(pertenece(i, e))
e = 4
s = [[1,2,3],[33,55,10],[22,55,1,4]]
res = []
#pertenece_a_cada_uno_version_2(s,e,res)
#print(res)

#ej 5.3)
#ej 5.4)
