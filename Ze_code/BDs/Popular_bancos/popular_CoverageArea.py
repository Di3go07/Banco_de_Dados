import mysql.connector
import pandas as pd
import numpy as np
import json
from io import StringIO

data = pd.read_csv('/home/PDITA274/Documentos/SQL/Ze_code/pdvs.csv') #resgata o csv com as informações para o banco de dados
data = data.replace([np.nan, -np.inf], 0) #substitui os valores nulos por 0 para serem reconhecidos futuramente
rows, columns = data.shape

#CONECTANDO AO BANCO
connection = mysql.connector.connect(user='root', password='@Galo2013', host='127.0.0.1', database='Ze_Code')
mycursor = connection.cursor()

num_linha = 0
for linha in range(len(data)):

    """
    O looping itera em cada linha da tabela
    """
        
    c = 0 
    lista_cords = [] #lista como listas que armazena valores das coordenadas x e y para cada ponto no CoverageArea do elemento
    for c in range(110): 

        """
        O looping repte 110 vezes, valor que representa a maior quantidade de coordenadas armazenadas em uma linha, porém, caso atinja algum valor nulo, ele para 
        """

        linha = data.iloc[num_linha] #variavel que muda a linha acessada
        eixo_x = f'pdvs/coverageArea/coordinates/0/0/{c}/0' 
        if linha[eixo_x] == 0: #interrompe o for caso o valor seja 0, pois ele significa nulo
            break
        eixo_y = f'pdvs/coverageArea/coordinates/0/0/{c}/1'
        lista_cords.append([float(linha[eixo_x]), float(linha[eixo_y])])
        
    #Converter dados
    json_lista = json.dumps(lista_cords) #conveter a lista para a inserção no banco

    #Adicionar linha à tabela
    sql = "INSERT INTO CoverageArea(type, coordinates) VALUES (%s, %s)"
    values = ["MultiPolygon",json_lista,]
    mycursor.execute(sql, values)
    connection.commit()

    num_linha += 1 #garante que seguira para a proxima linha
    