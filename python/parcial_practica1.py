#ej1)
def ind_nesima_aparicion(s: list, n: int, colectivo: int) -> int:
    contador:int = 0
    for i in range(len(s)):
        if s[i] == colectivo:
            contador += 1     
            if contador == n:
                nro = i
    if contador >= n:
        return nro
    else:
        res = -1
    return res
#print(ind_nesima_aparicion([7, 1, 7, 7, 1, 1, 7],2,7))4


#ej2)
def es_par(numero:int)->bool:
    if numero == 0:
        return True
    if numero%2 == 0:
        return True
    return False
def mezclar(s1:list[int],s2:list[int])->list:
    res = []
    i = 0
    contadors1 = 0
    contadors2 = 0
    while (len(s1)+len(s2)) > i:
        if es_par(i):
            res.append(s1[contadors1])
            contadors1 += 1
        else:
            res.append(s2[contadors2])
            contadors2 += 1
        i += 1
    return res
#print(mezclar([1, 3, 0, 1],[4, 0, 2, 3]))



#ej3)
def frecuencia_posiciones_por_caballo(caballos:list[int], carreras:dict[str,str:list[str]])->dict[str,int:list[int]]:
    res:dict = {}
    for i in range(len(caballos)):
        lista_ceros = [0]*len(caballos)
        for e, v in carreras.items():
            for n in range(len(v)):
                if caballos[i] == v[n]:
                    lista_ceros[n] += 1
                    res[caballos[i]] = lista_ceros
    return print(res) 
#frecuencia_posiciones_por_caballo(["linda", "petisa", "mister", "luck" ],{"carrera1":["linda", "petisa", "petisa", "luck"],"carrera2":["linda", "mister", "petisa", "luck"]})


#ej4)
def fila_capicua (s:list[int]) -> bool:
    i = 0
    while (len(s)/2) > i:
        if s[i] != s[(len(s)) -1 - i]:
            return False
        i += 1
    return True
#print(fila_capicua([0,1,0]))

def matriz_capicua(s:list[list[int]]) -> bool:
    i = 0
    while len(s) > i:
        if fila_capicua(s[i]) == False:
            return False
        i += 1
    return True
#print(matriz_capicua([[1,2,2,1],[-5,6,-5],[1,1,1,1]]))


