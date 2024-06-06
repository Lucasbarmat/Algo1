from queue import LifoQueue as Pila
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

#ej20)

#ej21)
def split_v2(frase: str) -> list[str]:
    palabra = ""
    res = []
    for letra in frase:
        if letra != " " and letra != "\n":
            palabra += letra
        else:
            if palabra:
                 res.append(palabra)
                 palabra = ""
    if palabra:
        res.append(palabra)
    return res

def maximo(lista: list[int]) -> int:
    maximo = lista[0]
    for numero in lista:
         if numero >= maximo:
            maximo = numero
    return maximo

def pene(palabra: str, d: dict) -> dict:
        if palabra in d:
            d[palabra] = d[palabra] + 1
        else:
            d[palabra] = 1

def lamasfrecuente(nombre_archivo: str) -> str:
    d = {}
    f = open(nombre_archivo, "r")
    txt = f.read()
    lista = split_v2(txt)

    for palabra in lista:
        pene(palabra, d)

    x = (list(d.items()))
    ñ = (maximo(list(d.values())))

    for i in x:
        if i[1] == ñ:
            print(d)
            return i[0]
#print(lamasfrecuente("ejem.txt"))

#ej22) SE BUGEA, PERO ESTA BIEN

def visitar_sitio(historiales: dict[str, Pila[str]], usuario: str, sitio: str):
    if usuario not in historiales:
        p: Pila = Pila()
        historiales[usuario] = p
        historiales[usuario].put(sitio)
    else: 
        historiales[usuario] = historiales[usuario].put(sitio)

    return historiales

historiales = {}
#print(visitar_sitio(historiales, "Usuario1", "google.com"))
#print(visitar_sitio(historiales, "Usuario1", "facebook.com"))
#print(visitar_sitio(historiales, "Usuario2", "youtube.com"))

#def navegacion_atras(historiales:dict[str, Pila[str]], usuario:str):




#ej23.1)
def agregar_productos(inventario: dict[str, dict[int, int]], nombre: str, precio: int, cantidad: int):
        inventario[nombre] = {"precio": precio, "cantidad": cantidad}

inventario = {}
agregar_productos(inventario, "lucas", 20, 1)
#print(inventario)

#ej23.2)

def actualizar_stock(inventario: dict[str, dict[int, int]], nombre: str, cantidad: int):
    inventario[nombre]["cantidad"] = cantidad

#actualizar_stock(inventario, "lucas", 40)
#print(inventario)

#ej23.3)

def actualizar_precio(inventario: dict[str, dict[int, int]], nombre: str, precio: int):
    inventario[nombre]["precio"] = precio

#actualizar_precio(inventario, "lucas", 200)
#print(inventario)

#ej23.4)

def calcular_valor(inventario: dict[str, dict[int, int]]) -> float:
    valor: float = 0
    for nombre in inventario:
        valor += inventario[nombre]["precio"] * inventario[nombre]["cantidad"]
    return valor

#print(calcular_valor({'lucas': {'precio': 200, 'cantidad': 1}, 'luqui': {'precio': 200, 'cantidad': 3}}))





