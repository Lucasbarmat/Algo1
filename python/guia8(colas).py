from queue import Queue as Cola
import random 


#ej13)




def generar_numeros_al_azar(cantidad:int,desde:int,hasta:int)->Cola[int]:
    c = Cola()
    for _ in range(cantidad):
        numero = random.randint(desde,hasta)
        c.put(numero)  
    return c

#print(generar_numeros_al_azar(5,0,10).queue)

def cantiad_de_elementos(c:Cola)->int:
    contador = 0
    while c.empty() != True:
        c.get()
        contador += 1
    return contador

#print(cantiad_de_elementos(generar_numeros_al_azar(9,40,50)))

#ej16)
def armar_secuencia_de_bingo()->Cola[int]:
    lista_del_0_al_99 = list(range(0,100))
    random.shuffle(lista_del_0_al_99)
    resultado = Cola()
    for bolilla in lista_del_0_al_99:
        resultado.put(bolilla)
    return resultado

#print(armar_secuencia_de_bingo().queue)
def pertenece(numero:int, lista:list[int])->bool:
    for i in range(len(lista)):
        if numero == lista[i]:
            return True
    return False
    
#print(pertenece(8,[1,2,8]))

def jugar_carton_de_bingo(carton:list[int], bolillero:Cola[int])->int:
    cantidad_sin_marcar:int = len(carton)
    jugadas:int = 0
    bolilleroAUX: Cola = Cola()
    
    while cantidad_sin_marcar>0:
        num:int = bolillero.get()
        bolilleroAUX.put(num)
        if pertenece(num,carton):
            cantidad_sin_marcar -= 1
        jugadas += 1
        
    while not bolillero.empty():
        num:int = bolillero.get()
        bolilleroAUX.put(num)

    while not bolilleroAUX.empty():
        num:int = bolilleroAUX.get()
        bolillero.put(num)

    return jugadas
print(jugar_carton_de_bingo([12,20,33,41,5,26,71,80,19,10,11,13], armar_secuencia_de_bingo()))



""""
    contador_de_tiradas = 0
    contador_de_carton = 12
    while contador_de_carton > 0:
        if pertenece(bolillero.get(),carton):
            contador_de_tiradas += 1
            contador_de_carton -= 1
        else: contador_de_tiradas += 1

    return contador_de_tiradas
"""



#ej19)
def agrupar_por_longitud(nombre_archivo:str)->dict:
    diccionario = {}
    f = open(nombre_archivo, "r")

    def in_dict(n:int, diccionario:dict):
        if n in diccionario:
            diccionario[n] = diccionario[n] + 1
        else: 
            diccionario[n] = 1
    lenPalabra = 0
    for line in f.readlines():
        for letra in line:
            if letra == " " or letra == "\n":
                in_dict(lenPalabra, diccionario)
                lenPalabra = 0
            else: 
                lenPalabra += 1

    if lenPalabra != 0:
        in_dict(lenPalabra, diccionario)
    
    f.close()
    return diccionario
