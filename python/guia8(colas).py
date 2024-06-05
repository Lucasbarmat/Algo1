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

#ej14)
def cantiad_de_elementos(c:Cola)->int:
    contador = 0
    while c.empty() != True:
        c.get()
        contador += 1
    return contador

#print(cantiad_de_elementos(generar_numeros_al_azar(9,40,50)))

#ej15)
def maximo(lista: list[int]) -> int:
    maximo = lista[0]
    for numero in lista:
         if numero >= maximo:
            maximo = numero
    return maximo

def buscar_el_maximo(c: Cola[int]) -> int:
    lista = []
    while not c.empty():
        sacar = c.get()
        lista.append(sacar)
    x = maximo(lista)

    i = 0
    while i < len(lista):
        c.put(lista[i])
        i += 1
    print(c.queue)
    return x
#print(buscar_el_maximo(generar_numeros_al_azar(3,0,10)))



#ej16)
def armar_secuencia_de_bingo()->Cola[int]:
    lista_del_0_al_99 = list(range(0,100))
    random.shuffle(lista_del_0_al_99)
    resultado = Cola()
    for bolilla in lista_del_0_al_99:
        resultado.put(bolilla)
    return resultado

#print(armar_secuencia_de_bingo().queue)

def jugar_carton_de_bingo(carton:list[int], bolillero:Cola[int])->int:
    cantidad_sin_marcar:int = len(carton)
    jugadas:int = 0
    bolilleroAUX:Cola = Cola()
    
    while cantidad_sin_marcar>0:
        num:int = bolillero.get()
        bolilleroAUX.put(num)
        if num in carton:
            cantidad_sin_marcar -= 1
        jugadas += 1 

    while not bolillero.empty():
        num:int = bolillero.get()
        bolilleroAUX.put(num)

    while not bolilleroAUX.empty():
        num:int = bolilleroAUX.get()
        bolillero.put(num)
    
    return jugadas
#print(jugar_carton_de_bingo([12,20,33,41,5,26,71,80,19,10,11,13], armar_secuencia_de_bingo()))

#ej17)
def n_pacientes_urgentes(c:Cola[(int,str,str)])->int:
    contador_pacientes_casi_muertos = 0
    for i in c:
        if i[0] in [1,2,3]:
            contador_pacientes_casi_muertos += 1
    return contador_pacientes_casi_muertos
#print(n_pacientes_urgentes([(1,"f","f"),(1,"f","f"),(1,"f","f"),(2,"f","f"),(1,"f","f")]))


#ej18)
def generar_cola(lista:list[(str,int,bool,bool)])->Cola[(str,int,bool,bool)]:
    c:Cola = Cola()
    for i in lista:
        c.put(i)
    return c


def atencion_a_clientes(c:Cola[(str,int,bool,bool)])->Cola[(str,int,bool,bool)]:
    cAUX:Cola = Cola()
    res:Cola = Cola()
    lista = []
    while not c.empty():
        num = c.get()
        cAUX.put(num)
        lista.append(num)
    x = 0
    while x < len(lista):
        for i in lista:
            if i[2] == True and i[3] == True:
                res.put(i)
            x += 1
    x = 0
    while x < len(lista):
        for i in lista:
            if i[2] == False and i[3] == True:
                res.put(i)
            x += 1   
    x = 0
    while x < len(lista):
        for i in lista:
            if i[2] == True and i[3] == False:
                res.put(i)
            x += 1 
    x = 0
    while x < len(lista):
        for i in lista:
            if i[2] == False and i[3] == False:
                res.put(i)
            x += 1   
    print(res.queue)
    
    while not cAUX.empty():
        sacar = cAUX.get()
        c.put(sacar)
    #print(c.queue)
#atencion_a_clientes(generar_cola([("f",1,True,False),("f",2,False,True),("f",3,True,True),("f",4,False,False),("f",5,True,True),("f",6,False,True)]))


    









