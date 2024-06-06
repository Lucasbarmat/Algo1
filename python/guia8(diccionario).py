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
