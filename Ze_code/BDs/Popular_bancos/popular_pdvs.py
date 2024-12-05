import mysql.connector
import pandas as pd
from io import StringIO

#DADOS
data = pd.read_csv('/home/PDITA274/Documentos/SQL/Ze_code/pdvs.csv') #resgata o csv com as informações para o banco de dados
tradings = data['pdvs/tradingName'] #filtra os nomes das empresas
owners = data['pdvs/ownerName'] #filtra os nomes dos donos
document = data['pdvs/document'] #filtra os documentos


#LISTAS
lista_donos = [] #lista com o nome de todos os donos
lista_lugares = [] #lista com o nome de todos os estabelecimentos
lista_documentos = [] #lista com o texto de cada documento

for linha in owners:  #adiciona cada dono à lista
    lista_donos.append(linha)

for linha in tradings: #adiciona cada nome de estabelecimento à lista
    lista_lugares.append(linha)

for linha in document: #adiciona cada nome de estabelecimento à lista
    lista_documentos.append(linha)

#CONECTANDO AO BANCO
connection = mysql.connector.connect(user='root', password='@Galo2013', host='127.0.0.1', database='Ze_Code')
mycursor = connection.cursor()

#POPULAR
def popular_pdvs():
    for linha in range(len(data)):
        sql = "INSERT INTO Pdvs(trading,owner,document) VALUES (%s, %s, %s)"
        values = [(lista_donos[linha], lista_lugares[linha], lista_documentos[linha])]
        mycursor.executemany(sql, values)
        connection.commit()

    print('Elementos adicionados!')

#popular_pdvs() -> chame a função para popular