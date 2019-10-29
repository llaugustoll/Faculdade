def datas(dia,mes,ano):
    if(diaAtual>diaNiver and mesNiver<mesAtual):
        dia = (diaAtual-diaNiver)
        ano = (anoAtual-anoNiver)
        mes = (mesAtual - mesNiver)
        print (dia,mes,ano)
        dia = int(ano*365+mes*30.416666667+dia+anobi)
        mes = (ano*12)+ mes
        print (dia)
        print (mes)
        print (ano)

    elif(diaAtual>diaNiver and mesNiver>mesAtual):
        dia = (diaAtual-diaNiver)
        ano = (anoAtual-anoNiver -1)
        mes = ((mesAtual + 12) - mesNiver)
        print (dia,mes,ano)
        dia = int(ano*365+mes*30.416666667+dia+anobi)
        mes = (ano*12)+ mes
        print (dia)
        print (mes)
        print (ano)

    elif diaAtual > diaNiver and mesNiver == mesAtual:
        dia = diaAtual - diaNiver 
        mes = 0
        ano = (anoAtual-anoNiver) 
        print (dia,mes,ano)
        dia = int(ano*365+mes*30.416666667+dia+anobi)
        mes = (ano*12)+ mes
        print (dia)
        print (mes)
        print (ano)
        
    #Refazer daqui
    elif(diaAtual<diaNiver and mesNiver<mesAtual):
        dia = ((diaAtual+30)-diaNiver)
        ano = (anoAtual-anoNiver)
        mes = (mesAtual-mesNiver-1)
        print (dia,mes,ano)
        print (dia,mes,ano)
        dia = int(ano*365+mes*30.416666667+dia+anobi)
        mes = (ano*12)+ mes
        print (dia)
        print (mes)
        print (ano)

    elif(diaAtual<diaNiver and mesNiver>mesAtual):
        dia = ((diaAtual+30)-diaNiver)
        mes = ((mesAtual + 12) - mesNiver)
        mes = (mes-1)
        ano = (anoAtual-anoNiver -1)
        print (dia,mes,ano)
        dia = int(ano*365+mes*30.416666667+dia+anobi)
        mes = (ano*12)+ mes
        print (dia)
        print (mes)
        print (ano)

    elif(diaAtual < diaNiver and mesNiver == mesAtual):
        dia = ((diaAtual+30)-diaNiver)
        ano = (anoAtual-anoNiver -1)
        mes = 11
        print (dia,mes,ano)
        dia = int(ano*365+mes*30.416666667+dia+anobi)
        mes = (ano*12) + mes
        print (dia)
        print (mes)
        print (ano)
    #até aqui
    elif diaAtual == diaNiver and mesNiver<mesAtual:
        dia = 0 
        mes = (mesAtual-mesNiver)
        ano = (anoAtual-anoNiver) 
        print (dia,mes,ano)
        dia = int(ano*365+mes*30.416666667+dia+anobi)
        mes = (ano*12)+ mes
        print (dia)
        print (mes)
        print (ano)

    elif(diaAtual == diaNiver and mesNiver>mesAtual):
        dia = 0
        ano = (anoAtual-anoNiver -1)
        mes = ((mesAtual + 12) - mesNiver)
        print (dia,mes,ano)
        dia = int(ano*365+mes*30.416666667+dia+anobi)
        mes = (ano*12) + mes
        print (dia)
        print (mes)
        print (ano)

    elif(diaAtual == diaNiver and mesNiver == mesAtual):
        dia = 0
        ano = anoAtual-anoNiver
        mes = 0
        print (dia,mes,ano)
        dia = int(ano*365+mes*30.416666667+dia+anobi)
        mes = (ano*12) + mes
        print (dia)
        print (mes)
        print (ano)

    print (anobi , )
    print(lista_ano_bisexto)


diaAtual = int(input('Coloque dia atual'))
mesAtual = int(input('coloco em numero o mes atual'))
anoAtual = int(input('coloque o ano atual'))
diaNiver = int(input('colocuqe dia do aniversario'))
mesNiver = int(input('coloque o mes em numero do seu aniversario'))
anoNiver = int(input('coloque o ano do seu aniversario'))
anobi = 0
idade = 0
somaAno = anoNiver
lista_ano_bisexto = []
anoTotal = anoAtual-anoNiver
contadorNiver = 0
contadorAtual = 0
a=0
b=0
c=0


    
if anoNiver % 400 == 0:
    contadorNiver = contadorNiver+1
elif anoNiver % 100 != 0:
    if anoNiver % 4 == 0:
        contadorNiver = contadorNiver+1

if anoAtual % 400 == 0:
    contadorAtual = contadorAtual+1
elif anoAtual % 100 != 0:
    if anoAtual % 4 == 0:
        contadorAtual = contadorAtual+1

if (anoNiver>=anoAtual or anoTotal>150) :

    print (anoTotal)
    print ('Ano Não pode ser consultado')

else:

    while (somaAno <= anoAtual):   
        if somaAno % 400 == 0:
            lista_ano_bisexto.append(somaAno)
            anobi = anobi+1
        elif somaAno % 100 != 0:
            if somaAno % 4 == 0:
                lista_ano_bisexto.append(somaAno)
                anobi = anobi+1

        somaAno += 1
        idade=idade+1
    if (diaNiver>31 or diaAtual>31):
        print ('erro')
    else:
        if (mesNiver ==2 and mesAtual != 2):
        
            if(contadorNiver == 1 and diaNiver<30):
                datas(a,b,c)
            elif(contadorNiver == 0 and diaNiver<29):
                datas(a,b,c)
            elif(contadorNiver == 1 and diaNiver>=30):
                print('erro')
            elif(contadorNiver == 0 and diaNiver>=29):
                print('erro')
        
        elif (mesNiver == 2 and mesAtual == 2): 

            if(contadorNiver == 1 and diaNiver<30):
                if(contadorAtual == 1 and diaAtual<30):
                    datas(a,b,c)
            elif(contadorNiver == 0 and diaNiver<29):
                if(contadorAtual == 0 and diaAtual<29):
                    datas(a,b,c)

            if(contadorNiver == 0 and diaNiver<29):
                if(contadorAtual == 1 and diaAtual<30):
                    datas(a,b,c)

            elif(contadorNiver == 1 and diaNiver<30):
                if(contadorAtual == 0 and diaAtual<29):
                    datas(a,b,c)

            elif(contadorNiver == 1 and diaNiver>=30):
                print('erro')
            elif(contadorAtual == 1 and diaAtual>=30):
                print('erro')
            elif(contadorNiver == 0 and diaNiver>=29):
                print('erro') 
            elif(contadorAtual == 0 and diaAtual>=29):
                print('erro')      

        elif (mesNiver !=2 and mesAtual == 2):

        
            if(contadorAtual == 1 and diaNiver<30):
                datas(a,b,c)
            elif(contadorAtual == 0 and diaNiver<29):
                datas(a,b,c)
            elif(contadorAtual == 1 and diaNiver>=30):
                print('erro')
            elif(contadorAtual == 0 and diaNiver>=29):
                print('erro')

        elif (mesNiver !=2 and mesAtual != 2):
            datas(a,b,c)