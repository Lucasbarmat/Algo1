# Ejercicio 1
#
#  problema ultima_aparicion (s: seq⟨Z⟩, e: Z) : Z {
#    requiere: {e pertenece a s }
#    asegura: {res es la posición de la última aparición de e en s}
#  }

# Por ejemplo, dados
#   s = [-1,4,0,4,100,0,100,0,-1,-1]
#   e = 0
# se debería devolver res=7

#recorro la lista de atras para adelante para asegurarme de que la aparicion del elemento que busco sea la ultima en la lista

def ultima_aparicion(s:list[int], numero:int)->int:
    contador:int = 0
    res:int = 0
    while contador < len(s):
        if s[contador] == numero:
            res = contador
        contador += 1
    return res
#print(ultima_aparicion([-1,4,0,4,100,0,100,0,-1,0],-1))

# Ejercicio 2
#
#  problema elementos_exclusivos (s: seq⟨Z⟩, t: seq⟨Z⟩) : seq⟨Z⟩ {
#    requiere: -
#    asegura: {Los elementos de res pertenecen o bien a s o bien a t, pero no a ambas }
#    asegura: {res no tiene elementos repetidos }
#  }

# Por ejemplo, dados
#   s = [-1,4,0,4,3,0,100,0,-1,-1]
#   t = [0,100,5,0,100,-1,5]
# se debería devolver res = [3,4,5] ó res = [3,5,4] ó res = [4,3,5] ó res = [4,5,3] 
# ó res = [5,3,4] ó res = [5,4,3]

#defino una funcion auxiliar que me dice si un elemento pertenece o no a una lista

def elementos_exclusivos(s1:list[int],s2:list[int])->list[int]:
    res = [] 
    res_sin_repetir = []
    for i in s1:
        if not i in s2 and not i in res:
            res.append(i)
    for i in s2:
        if not i in s1 and not i in res:
            res.append(i)
    return res
#print(elementos_exclusivos([-1,4,0,4,3,0,100,0,-1,-1],[0,100,5,0,100,-1,5]))


# Ejercicio 3
#
# Se cuenta con un diccionario que contiene traducciones de palabras del idioma castellano (claves) a palabras
# en inglés (valores), y otro diccionario que contiene traducciones de palabras en castellano (claves) a palabras
# en alemán (valores). Se pide escribir un programa que dados estos dos diccionarios devuelva la cantidad de 
# palabras que tienen la misma traducción en inglés y en alemán.

#  problema contar_traducciones_iguales (ing: dicc⟨String,String⟩, ale: dicc⟨String,String⟩) : Z {
#    requiere: -
#    asegura: {res = cantidad de palabras que están en ambos diccionarios y además tienen igual valor en ambos}
#  }

#  Por ejemplo, dados los diccionarios
#    aleman = {"Mano": "Hand", "Pie": "Fuss", "Dedo": "Finger", "Cara": "Gesicht"}
#    inglés = {"Pie": "Foot", "Dedo": "Finger", "Mano": "Hand"}
#  se debería devolver res=2

# recorro las keys (claves) de ingles y me fijo a la vez si pertenece a la lista de keys (claves) de aleman Y si 
# el valor de la clave en ambas listas es igual. OJO: si pongo los dos operadores logicos en orden inverso (o sea
# digamos si pongo primero la igualdad y luego el pertenece), como no me estoy asegurando de que la clave EXISTE
# en el diccionario de palabras en aleman, el programa SE ROMPE o algo asi en realidad no se bien que pasa pero
#  no esta bueno.

def contar_traducciones_iguales(ingles:dict[str,str], aleman:dict[str,str])->int:
    lista_aleman:list = list(aleman.items())
    res:int = 0
    for i, a in lista_aleman:
        if i in ingles and a == ingles[i]:
            res += 1
    return print(res)
#contar_traducciones_iguales( {"a": "1", "b": "2", "c": "3", "d": "4"},{"a": "3", "b": "2", "c": "1", "a": "4", "d": "8", "d": "9"})

def nohayrepetidos(s:list[int])->bool:
    l:list[int] = []
    for i in s:
        if i in l:
            return False
        l.append(i)
    return True
#print(nohayrepetidos([3,2,3,3]))


# Ejercicio 4
#
# Dada una lista de enteros s, se desea devolver un diccionario cuyas claves sean los valores presentes en s, 
# y sus valores la cantidad de veces que cada uno de esos números aparece en s

#  problema convertir_a_diccionario (lista: seq⟨Z⟩) : dicc⟨Z,Z⟩) {
#    requiere: -
#    asegura: {res tiene como claves los elementos de lista y res[n] = cantidad de veces que aparece n en lista}
#  }

#  Por ejemplo, dada la lista
#  lista = [-1,0,4,100,100,-1,-1]
#  se debería devolver res={-1:3, 0:1, 4:1, 100:2}
#  
# RECORDAR QUE NO IMPORTA EL ORDEN DE LAS CLAVES EN UN DICCIONARIO

# primero defino una funcion auxiliar que me dice cuantas veces aparece un elemento en una lista
def contar_elementos(n:int,lista:list[int])->int:
    res = 0
    for i in lista:
        if i == n:
            res += 1
    return res
#print(contar_elementos(9,[1,2,3,8,7]))

def convertir_a_diccionario(s:list[int])->dict[int,int]:
    d:dict = {}
    for i in s:
        d[i] = contar_elementos(i,s)
    return (print (d))
#convertir_a_diccionario([1,2,3,4,5,5,5,1,1,1,1,1,1,1])

