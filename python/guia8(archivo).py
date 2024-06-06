#ej1.1)
def contar_lineas(nombre_archivo:str)->int:
    x = open(nombre_archivo,"r")
    res = x.readlines()
    return len(res) 
#print(contar_lineas("prueba.py"))

#ej1.2)
def existePalabra(palabra: str, nombre_archivo : str) -> bool:
    f = open(nombre_archivo, "r")
    f.close
    lista = f.readlines
    word = f"{palabra}\n"
    word2 = f"{palabra} "
    print(word)
    if palabra in f or word in f or word2 in f: 
        return True
    return False
#print(existePalabra(2,"prueba.py"))

#ej2)
def clonar_sin_comentarios(nombre_archivo: str):
    o = open(nombre_archivo, "r")
    o2 = open("nuevo_archivo.py","x")



    o.close
    o2.close
#print(clonar_sin_comentarios("prueba.py"))
            
   
