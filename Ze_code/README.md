# Zé Code <br> Desafio Backend
## 🍻 Apresentação

Zé Deliver é um aplicativo que nunca te deixa na mão quando acaba a cerveja, pois te permite pedir bebidas onde e como quiser. 

Além do aplicativo permitir essa dinâmica flexivel ao fazer seu pedido, você receberá sua cerveja sempre gelada, pronta para beber e no conforto de sua casa, uma vez que a empresa se baseia em uma rede de estabelecimentos e o aplicaitvo garente que o seu pedido sempre será encaminhado para o mais proximo de você para atender essas demandas. 

O projeto apresentando consiste na organização desses parceiros e construção de um programa que busque aquele que se encontra mais proximo da coordenada inserida pelo cliente. 

## 💾 Banco de Dados

O banco de dados do projeto tem como objetivo organizar em tabelas as informações dos parceiros deste arquivo [JSON](pdvs.json)

**MODELO ENTIDADE RELACIONAMENTO**

<br>
<img src="Diagrama.jpg">
<p align="center"> Diagrama que representa as relações entre as entidades no banco </p>

<br>
<img src="relacionamento.png">
<p align="center"> Representação ER do projeto no formato das tabelas </p>
<br>

**TABELAS** <br>

Apresentação das tabelas presentes no banco de dados

- pdvs.csv → tabela bruta que é a versão convertida do JSON direto em csv. As próximas tabelas foram criadas derivadas dessa para criar as entidades do banco de dados.

- Parceiros.csv → armazena as informações principais de cada parceiro do Zé Deliver. No JSON, essa tabela engloba os campos `tradingName`, `ownerName` e `document`

- CoverageAreas.csv → as informações seguem o padrão `GeoJSON MultiPolygon` para desenhar a area de atuação de cada parceiro. No JSON, essa tabela engloba os campos `coverageArea` e `type` para cada um 
dos clientes, representados pelo <ins> id </ins>	

**Extra:** a pasta ['Popular_bancos'](BDs/Popular_bancos) dentro do diretorio 'BDs' possui os codigos python desenvolvidos para manipular a tabela pdvs.csv e popular as tabelas/entidades do banco de dados

As tabelas do banco de dados se encontram [aqui](BDs)
<br>

**MANIPULAR BANCO** 

No SQL, o usuario pode executar alguns comandos para ter uma leitura melhor do banco de dados e suas relações

1. Unir algum parceiro pelo seu id à sua respectiva coverageArea:
  ```
  SELECT Pdvs.trading, CoverageArea.type, CoverageArea.coordinates
  FROM Pdvs
  RIGHT JOIN CoverageArea
  ON Pdvs.id = CoverageArea.id
  WHERE Pdvs.id = [escolha_id];
  ```
## 🌐 Site

O site do Zé Code te permite escolher tanto entre adicionar o id de um parceiro e encontrar sua coverageArea no Google Maps quanto inserir um ponto em x e y para retornar aquele mais proximo de você.

Na construção desse sistema do site foi necessário um arquivo javascript que interpreta as informações de coordenada de cada parceiro a partir do arquivo json com todas as informações. Após manipular esses dados, as informações, salvas em uma lista de dicionários, são lidas pela API do Google Maps para criar o poligono com sua localização geografica no mapa. 

Além disso, o arquivo js também incorpora a função responsável por ler as coordenadas do ponto no plano cartesiano que o usuário passou e buscar qual coverage area de algum parceiro o contém. Vale ressaltar que caso a posição do ponto no espaço não esteja contida em alguma das coverages areas, o sistema não retornará nada. Portanto, insira uma coordenada que você tenha certeza que está contida em uma dessas aŕeas, como "-3.77,  -38.46". 

O codigo se encontra [aqui](scripts/index.js). Já para visitar o site, basta acessar o [arquivo html](templates/home.html) e abri-lo em seu navegador. 

## 👨‍💻 Desenvolvedor

Diego Penna Andrade Barros <br>
PDITA 274
