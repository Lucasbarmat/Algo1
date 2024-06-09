"""
Las billeteras virtuales son sistemas financieros (pero no necesariamente bancarios) en los cuales los usuarios pueden cargar dinero y utilizarlo "virtualmente", 
realizando pagos y recargas de forma sencilla. Éstas transacciones quedan registradas en el sistema de la billetera virtual. 
Por ejemplo, el Sistema Único de Boleto Electrónico (SUBE) es un sistema de billetera virtual.

En el presente ejercicio verificaremos el histórico de transacciones (el historial) de una billetera virtual. 
En esta billetera sólo se puede: recargar saldo (r), pagar un viaje (v), ver el balance actual (s), y salir (x). 
Cada transacción queda grabada con su correspondiente caracter en una lista que representa el historial. 
En historial tendremos una secuencia de caracteres donde:

v: Realiza un viaje (todos los viajes son de $56)
r: Recarga saldo (todas las recargas son de $350)
s: Visualiza el saldo actual (no modifica el saldo)
x: El usuario decide terminar el programa
Implementar la función verificar_transacciones() que dada una secuencia de caracteres s, devuelve el saldo de la billetera al momento de terminar el programa. 
La finalización del programa está determinada por: 
(1) aparición de una x,
(2) el usuario está intentando hacer un pago sin saldo suficiente (en esta billetera virtual no se permite saldo negativo), 
(3) no hay más transacciones en la lista.

problema verificar_transacciones (in s: String) : Z {
  requiere: {|s|>0}
  requiere: {s sólo puede contener los caracteres "r", "x", "v" o "s"}
  asegura: {res >= 0}
  asegura: {res = ($350 * #ap_antes_corte("r", s)) - ($56 * #ap_antes_corte("v", s))}
}
problema #ap_antes_corte(in c: char, in s: String): Z {
  requiere: {True}
  asegura: {res = cantidad de veces que aparece c desde el inicio hasta que: aparece una x, o que el cálculo del saldo se hace negativo}
}
Ejemplo 1: dado el siguiente historial
s = "ssrvvrrvvsvvsxrvvv"
se debería devolver res = 714


Ejemplo 2: dado el siguiente historial
s = "ssrvvvvsvvsvvv"
se debería devolver res = 14 (en este caso el programa termina porque el saldo no alcanza para realizar un viaje que está entre las transacciones)
"""

def verificar_transacciones(s:str)->int:
    res:int = 0
    for operacion in s:
        if operacion == "r":
            res += 350
        elif operacion == "v":
            if res < 56:
                return res
            res -= 56
        elif operacion == "s":
            print (f"el saldo actual es: {res} pesos")
        else: 
            return (f"el saldo final es: {res} pesos")
  
    return (f"el saldo final es: {res} pesos")
#print(verificar_transacciones("rvvvvvsvsvvvvvsvvvvvvvvvvvvvvvvsvvvvv"))
          

"""
2) Hace calor [2 puntos]

Implementar la función valor_minimo() que dado este listado de tuplas devuelva el valor mínimo, entre las mínimas alcanzadas.
problema valor_minimo (in s: seq<(R,R)>): R {
  requiere: {|s| > 0}
  requiere: {En cada tupla de s el primero valor es menor que el segundo}
  asegura: {res pertenece a alguna tupla de s, en la primera posición}
  asegura: {No existe ningún valor en las primeras posiciones de las tuplas de s que sea menor que res}
}
Por ejemplo, dado
s = [(1.0, 5.2), (10.4, 15.1), (19.7, 28.9), (25.4, 35.6), (-3.1, 1.3)]
se debería devolver res = -3.1
"""

def valor_minimo (s:list[tuple[float,float]]) -> float:
    res:float = s[0][0]
    for i in s:
        if i[0] < res:
            res = i[0]
    return print(res)
#valor_minimo([(1.0, 5.2), (10.4, 15.1), (19.7, 28.9), (25.4, 35.6), (-3.1, 1.3)])



"""
3) El MERVAL [3 puntos]


El diccionario tendrá como clave los nombres de las empresas y como valores, listas de tuplas, donde cada tupla (dupla) codifica el día (como entero) y el valor de la acción (como real). 
Es posible que exista más de un registro por día.

Implementar la función valores_extremos() que dado un diccionario valores_diarios devuelva un nuevo diccionario, con las mismas claves, pero que los valores sean tuplas que 
indiquen el mínimo y el máximo alcanzado durante el periodo registrado.

problema valores_extremos(in cotizaciones_diarias: dict⟨String,seq⟨(Z x R)⟩⟩): dict⟨String,(R x R)⟩ {
  requiere: {Cada valor de cotizaciones_diarias es una secuencia de tuplas, donde los primeros elementos de dichas tuplas son enteros del 1 al 31}
  requiere: {Cada valor de cotizaciones_diarias es una secuencia de tuplas, de longitud mayor estricto que 0}
  asegura: {res tiene como claves exactamente las mismas claves que cotizaciones_diarias}
  asegura: {Cada valor de res es una tupla de (mínimo, máximo), donde mínimo y máximo son los valores extremos alcanzados por las cotizaciones de cada empresa}
}
Por ejemplo, dada la siguiente cotización:

cotizaciones_diarias = {"YPF" : [(1,10),(15, 3), (31,100)], "ALUA" : [(1,0), (20, 50), (31,30)]}
resultado_esperado es: {"YPF" : (3,100), "ALUA" : (0,50)}
"""
def minimo_maximo(s:list[tuple[int,int]])->tuple[int,float]:
    res:tuple = (s[0][1],s[0][1])
    for i in s:
        if i[1] < res[0]:
            res = (i[1], res[1])
    for i in s:
        if i[1] > res[1]:
            res = (res[0], i[1])
    return res
def valores_extremos(valores_diarios:dict[str,list[tuple[int,float]]])-> dict[str,tuple[float,float]]:
    res:dict = {}
    for i in list(valores_diarios.keys()):
        res[i] = minimo_maximo(valores_diarios[i])
    return print(res)

#valores_extremos({"YPF" : [(1,10),(15, 3), (31,100)], "ALUA" : [(1,0), (20, 51), (31,30)]})
        



"""
4) Sudoku [3 puntos]


problema es_sudoku_valido(in m:seq⟨seq⟨Z⟩⟩ ) : Bool {
  requiere: {todos los elementos de m tienen longitud 9}
  requiere: {|m| = 9}
  requiere: {todos los elementos en todas las secuencias de m son números del 0 al 9}
  asegura: {(res = true) <=> en cada fila de m no se repiten números del 1 al 9}
  asegura: {(res = true) <=> en cada columna de m no se repiten números del 1 al 9}
}

Por ejemplo, dada la secuencia de secuencias:
m = [
[1, 2, 3, 4, 5, 6, 7, 8, 9],
[9, 8, 7, 6, 4, 5, 3, 2, 1],
[0, 0, 0, 0, 0, 0, 1, 0, 0],
[0, 0, 0, 0, 0, 4, 0, 0, 0],
[0, 0, 0, 0, 6, 0, 0, 0, 0],
[0, 0, 0, 5, 0, 0, 0, 0, 0],
[0, 0, 4, 0, 0, 0, 0, 0, 0],
[0, 3, 0, 0, 0, 0, 0, 0, 0],
[2, 0, 0, 0, 0, 0, 0, 0, 0]
]
se debería devolver res = true
Consejo: Para probar con matrices pueden usar:
matriz_ceros = [[0]*9]*9
matriz_fila_1_distinta = [list(range(1,10))] + [[0]*9]*8
"""
def hay_repetidos(s:list[int])->bool:
    lista:list = []
    for i in s:
        if i in lista:
            return True
        lista.append(i)
    return False
def es_sudoku_valido(m:list[list[int]])->bool:
    columnas_de_m:list[list[int]] = []
    p = []
    for j in range(9):
        for i in m:          
            p.append(i[j])
        columnas_de_m += [p]
        p = []
    for i in m:
        if hay_repetidos(i):
            return False    
    for i in columnas_de_m:
        if hay_repetidos(i):
            return False
        
    return True
print(es_sudoku_valido([
[1, 2, 3, 4, 5, 6, 7, 8, 9],
[2, 3, 4, 5, 6, 7, 8, 9, 1],
[3, 4, 5, 6, 7, 8, 9, 1, 2],
[4, 5, 6, 7, 8, 9, 1, 2, 3],
[5, 6, 7, 8, 9, 1, 2, 3, 4],
[6, 7, 8, 9, 1, 2, 3, 4, 5],
[7, 8, 9, 1, 2, 3, 4, 5, 6],
[8, 9, 1, 2, 3, 4, 5, 6, 7],
[9, 1, 2, 3, 4, 5, 6, 7, 8]
]))

