# Zé Code <br> Desafio Backend
## 🍻 Apresentação

Zé Deliver é um aplicativo que nunca te deixa na mão quando acaba a cerveja, pois te permite pedir bebidas onde e como quiser. 

Além do aplicativo permitir essa dinâmica flexivel ao fazer seu pedido, você receberá sua cerveja sempre gelada, pronta para beber e no conforto de sua casa, uma vez que a empresa se baseia em uma rede de estabelecimentos e o aplicaitvo garente que o seu pedido sempre será encaminhado para o mais proximo de você para atender essas demandas. 

O projeto apresentando consiste na organização desses parceiros e construção de um programa que busque aquele que se encontra mais proximo da coordenada inserida pelo cliente. 

## 💾 Banco de Dados

O banco de dados do projeto tem como objetivo organizar em tabelas as inforamações dos parceiros neste arquivo [JSON](pdvs.json)

**Modelo Entidade Relacionamento:**

<br>
<img src="Diagrama.jpg">
<p> Diagrama que representa as relações entre as entidades no banco </p>

<br>
<img src="relacionamento.png">
<p> Representação ER do projeto no formato das tabelas </p>

**Tabelas:**
CoverageAreas.csv -> as informações seguem o padrão `GeoJSON MultiPolygon` para desenhar a area de atuação de cada parceiro. No JSON, essa tabela engloba os campos `coverageArea` e `type` para cada um dos clientes, representados pelo <sub> id </sub>	.
