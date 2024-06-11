from queue import LifoQueue as Pila
from queue import Queue as Cola


def reordenar_cola(filaClientes:Cola[tuple[str,str]])->Cola[tuple[str,str]]:
    res:Cola = Cola()
    colaAUX:Cola = Cola()
    while not filaClientes.empty():
        x = filaClientes.get()
        colaAUX.put(x)
        if x[1] == "vip":
            res.put(x) 
    while not colaAUX.empty():
        x = colaAUX.get()
        filaClientes.put(x)
        if x[1] == "comun":
            res.put(x)
    return res

c = Cola()
c.put(('matias', 'comun'))
c.put(('asd', 'vip'))
c.put(('juan', 'comun'))
c.put(('lara', 'vip'))
#print(reordenar_cola(c).queue)      

def contar_puntos(estrategia_jugador:str,estrategia_oponente:str)->int:
    res:int = 0
    if estrategia_jugador == "desvio" and estrategia_oponente == "desvio":
        res = -10
    elif estrategia_jugador == "desvio" and estrategia_oponente == "banco":
        res = -15
    elif estrategia_jugador == "banco" and estrategia_oponente == "desvio":
        res = 10
    elif estrategia_jugador == "banco" and estrategia_oponente == "banco":
        res = -5        
    return res    

def torena_gallinas(estrategias:dict[str,str])->dict[str,str]:
    res:dict[str,int] = {}

    for nombre, estrategia in estrategias.items():
        puntos:int = 0

        for nombre_rival, estrategia_rival in estrategias.items():
            if nombre != nombre_rival:
                puntos += contar_puntos(estrategia,estrategia_rival)
        res[nombre] = puntos
    return res

#print(torena_gallinas({'juan': 'banco','matias': 'desvio','luis': 'desvio'}))

def quien_gano_el_ta_te_ti(tablero:list[list[str]])->int:
    res:int = 0
    columnas_tablero:list[list[int]] = []
    for j in range(len(tablero)):
        x = []
        for i in tablero:
            x.append(i[j])
        columnas_tablero.append(x)
    for i in columnas_tablero:
        contador_X = 0
        contador_Y = 0
        for j in i:
            if j == "X":
                contador_X += 1
                contador_Y = 0
                if contador_X == 3:
                    res += 1
            elif j == "O":
                contador_X = 0
                contador_Y += 1
                if contador_Y == 3:
                    res += 2
    return res


def reverso(texto:str)->str:
    res:str=""
    for i in texto:
        res = i + res
    return res

def cuantos_sufijos_son_palindromos(texto:str)->int:
    sufijos:str = ""
    lista_de_sufijos:list = []
    res:int = 0
    palabra = ""
    listadepalabras:list[str] = list()
    for letra in texto:
        if letra != " ":
            palabra = palabra + letra
        if letra == " ":
            listadepalabras.append(palabra)
            palabra = ""
    if palabra != " ":
        listadepalabras.append(palabra)
    print(listadepalabras)
    for i in listadepalabras:
        x:list = []
        for j in range(len(i)-1,-1,-1):
            sufijos = texto[j] + sufijos
            x.append(sufijos) 
        lista_de_sufijos += x
        
            
    print(lista_de_sufijos)
    for i in lista_de_sufijos:
        if i == reverso(i):
            res += 1
    return res
print(cuantos_sufijos_son_palindromos("neuquen neuquen"))





"""
[['', '', '', '', ''],
 ['', '', '', '', ''],
 ['', '', '', '', ''],
 ['', '', '', '', ''],
 ['', '', '', '', '']]
 """