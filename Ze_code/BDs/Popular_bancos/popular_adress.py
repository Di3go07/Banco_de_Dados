import mysql.connector
import pandas as pd
from io import StringIO

#CONECTANDO AO BANCO
connection = mysql.connector.connect(user='root', password='@Galo2013', host='127.0.0.1', database='Ze_Code')
mycursor = connection.cursor()

#FILTRANDO COLUNAS
data = pd.read_csv('/home/PDITA274/Documentos/SQL/Ze_code/BDs/pdvs.csv') #resgata o csv com as informações para o banco de dados
eixo_x = data['pdvs/address/coordinates/1'] #retorna a coluna com o eixo x de cada endereço 
eixo_y = data['pdvs/address/coordinates/0'] #retorna a coluna com o eixo x de cada endereço 

#PROCESSAMENTO
l = 0
for linha in range(len(data)):
    #Adicionar linha à tabela
    sql = "INSERT INTO Adress(type, eixo_x, eixo_y) VALUES (%s, %s, %s)"
    values = ['Point', eixo_x[l], eixo_y[l]] #passa por cada linha na tabela 'data'
    mycursor.execute(sql, values)
    connection.commit()

    l += 1;