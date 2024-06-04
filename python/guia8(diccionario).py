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
