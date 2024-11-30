import mysql.connector
import random
import string
from datetime import date,timedelta
import pandas as pd
 
#DADOS
nomes = [
    "Ana", "Bruno", "Carlos", "Daniela", "Eduardo", "Fernanda", "Gabriel", "Helena", 
    "Igor", "Juliana", "Lucas", "Mariana", "Nicolas", "Olivia", "Pedro", "Quésia", 
    "Rafael", "Sofia", "Thiago", "Úrsula", "Valentina", "William", "Xavier", 
    "Yara", "Zeca"
]

sobrenomes = [
    "Silva", "Santos", "Oliveira", "Souza", "Pereira", "Costa", "Ferreira", 
    "Rodrigues", "Almeida", "Nascimento", "Lima", "Araújo", "Martins", 
    "Barbosa", "Ribeiro", "Cardoso", "Teixeira", "Gomes", "Mendes", 
    "Vieira", "Monteiro", "Carvalho", "Correia", "Duarte", "Freitas"
]

alfabeto = [
    "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", 
    "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"
]

ruas = [
    "Acácias", "Brasil", "XV de Novembro", "Paz", 
    "Paulista", "José de Alencar", "Três Irmãos", 
    "Sol", "Jasmins", "Flores", "Liberdade", 
    "Comércio", "Bosque", "Bandeirantes", 
    "Santa Catarina", "Lazer", "Imperador", 
    "Independência", "Moinho", "Palmeiras"
]

bairros = [
    "Centro", "Jardim das Flores", "Vila Nova", "Morumbi", 
    "Pinheiros", "Tucuruvi", "Santa Teresa", "Itaim Bibi", 
    "Brooklin", "Vila Progredior", "Parque das Nações", 
    "Vila Mariana", "Campo Belo", "São João", "Avenida Paulista", 
    "Liberdade", "Bela Vista", "Tatuapé", "Vila Madalena", 
    "Cidade Jardim", "Alto da Boa Vista"
]

data_inicial = date(2000,1,1)

carga_horaria = [30,45,60,90]

departamento = [("Engenharia Civil",1), ("Medicina",2), ("Direito",3), ("Ciência da Computação",4), ("Psicologia",5)]

disciplinas = [
    ("Cálculo Diferencial e Integral", 1), ("Mecânica dos Solos", 1), ("Estruturas de Concreto", 1), ("Anatomia Humana", 2), ("Fisiologia",2), ("Farmacologia", 2), ("Direito Constitucional", 3), ("Direito Penal", 3),("Direito Civil", 3), ("Algoritmos e Estruturas de Dados", 4), ("Programação Orientada a Objetos", 4), ("Inteligência Artificial", 4), ("Psicologia do Desenvolvimento", 5), ("Neuropsicologia", 5), ("Teorias da Personalidade", 5)
]

#GERAR DADOS
def random_nome(): 
    return random.choice(nomes) + " " +  random.choice(sobrenomes)

def random_date(): 
    return str(data_inicial + timedelta(days=int(random.randrange(0,3000))))

def random_cpf():
    return str(random.randrange(10000000000, 99999999999))

def random_matricula():
    return str(random.choice(alfabeto) + random.choice(alfabeto) + random.choice(alfabeto) + str(random.randrange(0000, 9999))) 

def random_endereco():
    return str("Rua" + " " + random.choice(ruas) + "," + str(random.randrange(0,100)) + "," + random.choice(bairros))

def random_telefone():
    return str("(31)" + str(random.randrange(100000000, 999999999)))

def random_carga_horaria():
    return random.choice(carga_horaria)

def random_curso():
    return str(random.choice(departamento)[1])

def random_text():
    return ''.join([random.choice(string.ascii_letters + string.digits) for e in range(30)])

#CONECTANDO AO BANCO
connection = mysql.connector.connect(user='root', password='@Galo2013', host='127.0.0.1', database='Faculdade')
mycursor = connection.cursor()

#INSERINDO DADOS
#tabela alunos
def criar_alunos():
    sql = "INSERT INTO Alunos(nome,matricula,data_nascimento,endereco,curso) VALUES (%s, %s, %s, %s, %s)"
    values = [(random_nome(), random_matricula(), random_date(), random_endereco(), random_curso()) for i in range(50)];
    mycursor.executemany(sql, values)
    connection.commit()
    print(mycursor.rowcount, " novos registro(s) de alunos(s) inserido(s)")
#tabela professores
def criar_profs():
    sql = "INSERT INTO Professores(nome,cpf,contato,inicio_contrato,id_depto) VALUES (%s, %s, %s, %s, %s)"
    values = [(random_nome(), random_cpf(), random_telefone(), random_date(), random_curso()) for i in range(20)];
    mycursor.executemany(sql, values)
    connection.commit()
    print(mycursor.rowcount, " novos registro(s) de professores(s) inserido(s)")
#tabela disciplina
def adicionar_disciplinas():
    for i in disciplinas:
        sql = "INSERT INTO Disciplinas(nome,carga_horaria,ementa,pre_requisito,curso) VALUES (%s, %s, %s, %s, %s)"
        values = [(i[0], random_carga_horaria(), random_text(), "-", i[1])]
        mycursor.executemany(sql, values)
        connection.commit()
#tabela departamento
def adicionar_departamentos():
    for i in departamento:
        sql = "INSERT INTO Departamento(nome,id,local) VALUES (%s, %s, %s)"
        nome = "Departamento de " + i[0]
        local = "Prédio " + random.choice(alfabeto).upper()
        values = [(nome, i[1], local)]
        mycursor.executemany(sql, values)
        connection.commit()
#tabela aluno_disciplina
def adicionar_aluno_disciplina():
    df = pd.read_csv('/home/PDITA274/Documentos/SQL/tabela_alunos.csv') #resgata as matriculas já registradas no banco de dados
    for row in range(len(df)):
        sql = "INSERT INTO aluno_disciplina(aluno,disciplina) VALUES (%s,%s)"
        values = [(df['matricula'][row], random.choice(disciplinas)[0])]
        try:
            mycursor.executemany(sql, values)
            connection.commit()
        except: #encerra o processo quando um aluno não pode se inscrever na disciplina
            continue
        row += 1;
        
adicionar_aluno_disciplina()
#adicionar_disciplinas() -> chame a função quando desejar popular o banco
