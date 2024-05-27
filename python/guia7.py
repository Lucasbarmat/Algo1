#ej 1.1)
def pertenece (s:list ,e:int)->bool:
    for i in range (0,len(s),1):
        if (s[i] == e):
            return True
    return False
#print(pertenece([1,2,3,4,5,6],0))
def pertenece_2 (s:list ,e:int)->bool:
    i = 0
    while i < len(s):
        if s[i] == e:
            return True
        i += 1
    return False
#print(pertenece_2([1,2,3,4,5,6],1))

#ej 1.2)
def divide_a_todos(s:list, e:int)->bool:
    for i in range(0,len(s),1):
        if s[i] % e != 0:
            return False
    return True
#print(divide_a_todos([3,0,6,2],2))

def divide_a_todos_dos(s:list, e:int) ->bool:
    i = 0
    res:bool = True
    while (i < len(s)) & (res == True):
        if s[i] % e != 0:
            res = False
        i += 1
    return res
#print(divide_a_todos_dos([1,81,6,8],2))

#ej 1.3)
def suma_total(s:list)->int:
    res:int=0
    for i in range(0,len(s),1):
        res += s[i]
    return res
#print(suma_total([1,2,4,8]))

#ej 1.4)
def ordenados(s:list)->bool:
    
#ej 1.5)
#ej 1.6)
#ej 1.7)
#ej 1.8)
#ej 1.9)
#ej 1.10)

#----------------------------------------------------
#ej 2.1)
#ej 2.2)
#ej 2.3)
#ej 2.4)
#ej 2.5)
#ej 2.6)

#----------------------------------------------------
#ej 3)

#----------------------------------------------------
#ej 4.1)
#ej 4.2)
#ej 4.3)

#----------------------------------------------------
#ej 5.1)
#ej 5.2)
#ej 5.3)
#ej 5.4)
#ej 5.5)