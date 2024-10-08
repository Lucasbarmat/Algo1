import random


#ej 1.1)
def pertenece (s:list ,e:int)->bool:
    for i in range (0,len(s),1):
        if (s[i] == e):
            return True
    return False
#print(pertenece([1,2,3,4,5,6],0))
#print(pertenece(['a','b','c','d'],'z'))
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
def vocales_distintas(palabra:str)->bool:
    palabra = palabra.lower()
    vocales = ['a','e','i','o','u']
    contador_de_vocales = 0
    i = 0
    while (i<len(palabra)) & (contador_de_vocales<3):
        if pertenece (vocales,palabra[i]):
            contador_de_vocales += 1
            vocales.remove(palabra[i])
        i += 1
    if contador_de_vocales >= 3:
        return True
    return False
#print(vocales_distintas("aiE"))

#----------------------------------------------------
#ej 2.1)

def cambiar_los_pares_por_0(lista: list[int]):
    for i in range(len(lista)):
        if i % 2 == 0:
            lista[i] = 0
    #print(cambiar_los_pares_por_0([1,2,3,4,5,6,7,8,9,10]))
    return lista
#print(cambiar_los_pares_por_0([0,1,2,3,4,5,6,7,8,9,10]))

#ej 2.2)
def cambiar_los_pares_por_0_version_2(lista:list[int]):
    nueva_lista = []
    for i in lista:
        if i % 2 == 0:
            nueva_lista.append(0)
        else:
            nueva_lista.append(i)
    return nueva_lista
#print(cambiar_los_pares_por_0_version_2([0,1,2,3,4]))

#ej 2.3)
def sacar_vocales(s:list[str])->list[str]:
   vocales = ['a','e','i','o','u']
   i = 0
   while (i<len(s)):
       if pertenece(vocales,s[i]):
           s.remove(s[i])
       else: i += 1
   return print(s) 
#sacar_vocales(['a',' ','i','a','p'])

#ej 2.4)
def remplazar_vocales(s:list)->list:
   vocales = ['a','e','i','o','u']
   res = []  
   for i in range(len(s)):
       if pertenece(vocales, s[i]):
           res.append("-")
       else: res.append(s[i])
   return res 
#print(remplazar_vocales("hola"))

#ej 2.5)
def da_vuelta_str(s:list)->list:
    nueva_palabra:str  = ""  
    for i in range(len(s)-1 , -1 , -1 ):
        nueva_palabra += (s[i])
    return nueva_palabra
#print(da_vuelta_str("aloh"))

#ej 2.6)
def eleminar_repetidos(s:list)->list:
    res = ""
    for i in range(len(s)):
        if not(s[i] in res):
            res += s[i]
    return res
#print(eleminar_repetidos("aadaaaadfe"))
#----------------------------------------------------
#ej 3)
def aprobado(notas:list)->int:
    promedio_notas = (suma_total(notas))/len(notas) 
    for i in range(len(notas)):
        if (notas[i] < 4) or (promedio_notas < 4):
            return 3
    if 4 <= promedio_notas <7:
            return 2
    else: return 1
#print(aprobado([10,4,9,9]))

#----------------------------------------------------
#ej 4.1)
def lista_de_nombres_hasta_listo()->list[str]:
    nombre:str = input("lista de estudiantes hatsa listo: ")
    res:list[str] = []

    while nombre != "listo":
        res.append(nombre)
        nombre = input("lista de estudiantes hatsa listo: ")
    return res
#print(lista_de_nombres_hasta_listo())

#ej 4.2)
def sube():
    saldo = 0
    historial:list = []
    tipo_de_operacion = ""
    while tipo_de_operacion != "X":
        tipo_de_operacion = input("OPERACION A REALIZAR: ")
        if tipo_de_operacion == "C":
            historial.append(("C", input("monto")))
        elif tipo_de_operacion == "D":
            historial.append(("D", input("monto")))
        else: tipo_de_operacion = "X"
    return historial
#print(sube())

#ej 4.3)
def siete_y_medio():
    numeros_posibles:list[int] = [0,1,2,3,4,5,6,7,10,11,12]
    suma_total:int = random.choice(numeros_posibles)
    historial:list[int] = []
    historial.append(suma_total)
    print("Tu carta es el",suma_total)
    if suma_total < 10:
        suma_total = suma_total
    else: suma_total = 0.5 

    while input("pedir o plantarse? ") == "pedir":
        x = random.choice(numeros_posibles)
        historial.append(x)
        print("Tu carta es el",x)
        if x < 10:
            x = x
        else: x = 0.5 
        suma_total += x
        print("La suma total es de",suma_total)

        if suma_total < 7.6:
            res = "ganaste"
        else: return f"""PERDISTE
suma total: {suma_total}
historial: {historial}"""

    return f"""{res}
historial: {historial}
suma total: {suma_total}"""

#print(siete_y_medio())


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
def es_matriz(s:list[list[int]])-> bool:
    if len(s) == 0: 
        return False
    modulo_para_todos = len(s[0])
    for lista in s:
        if len(lista) != modulo_para_todos:
            return False
    return True
#print(es_matriz([[1,1,1],[1,2,0],[5,5,4],[2,2,1,2]])) 

#ej 5.4)
def filas_ordenadas(m:list[list[int]]):
    res:list[bool] = []
    for i in range(len(m)):
        res.append(ordenanda(m[i]))
        res.pop 
    return res  
#print(filas_ordenadas([[1,2,3],[1],[5,5,4],[2,5,9,20]]))


