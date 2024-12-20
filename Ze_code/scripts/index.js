window.onload = opcaoSelecionada()

//BUSCA AS COORDENADAS DE UM ID
function minhaFuncao() {
  const id_partner = parseInt(document.getElementById('campo_id').value);
  console.log(id_partner);

  if (id_partner >= 51 || id_partner < 0) {
    alert('Escolha valores entre 0 e 50');
    document.getElementById('campo_id').value = '';
  } else {
    async function filtrarCords()  {
      //entrar em contato com a API
      const dados = await fetch("https://raw.githubusercontent.com/ab-inbev-ze-company/ze-code-challenges/refs/heads/master/files/pdvs.json");
      const dados_formatados = await dados.json();

      //filtrar dados 
      const coords_len = dados_formatados.pdvs[id_partner]['coverageArea']['coordinates'][0][0].length; //quantidade de coordenadas de um parceiro
      const partner_cordenadas =  []; //lista com as coordenadas

      for (let i = 0; i < coords_len; i++)  { //itera sobre cada coordenada de um parceiro, as separando
        eixo_x = dados_formatados.pdvs[id_partner]['coverageArea']['coordinates'][0][0][i][1]; //resgatar valor de uma coverageArea
        eixo_y = dados_formatados.pdvs[id_partner]['coverageArea']['coordinates'][0][0][i][0];
                  //dados_formatados[id_partner]['coverageArea']['coordinates'][0][0][coordenada][eixo(0,1)]
      partner_cordenadas.push({ lat: eixo_x, lng: eixo_y});
      }

      return partner_cordenadas

    }

    filtrarCords()
      .then(lista_coordenadas => {
        console.log(lista_coordenadas); // Exibe a lista de coordenadas no console
        initMap(lista_coordenadas); // Passa as coordenadas para a função initMap
      })
      .catch(error => {
        console.error("Erro ao obter coordenadas:", error);
      });

    function initMap(partnerCoords) {

      // Cria o mapa
      const map = new google.maps.Map(document.getElementById("map"), {
        zoom: 13,
        center: partnerCoords[0], //centraliza com base na posição de um dos pontos do poligono
        mapTypeId: "terrain",
      });

      // Construct the polygon.
      const partnerPolygon = new google.maps.Polygon({
        paths: partnerCoords, //cria o poligono com base nas coordenadas da lista
        strokeColor: "#FF0000",
        strokeOpacity: 0.8,
        strokeWeight: 2,
        fillColor: "#FF0000",
        fillOpacity: 0.35,
      });

      partnerPolygon.setMap(map);
    }
  }
}


//BUSCA UM ID PELAS COORDENADAS 

//Verifica se a coordenada fornecida está em alguma CoverageArea
async function acharPartner() {

  const coord_partner = (document.getElementById('campo_id').value);
  const array_coords = coord_partner.split(","); //converte as coordenadas digitas em uma lista de posição x e y
  console.log(array_coords)

  let achouParceiro = false;

  //itera sobre cada coordenada de usuario até achar uma onde o ponto está em uma CoverageArea
  for (let id = 0; id < 51 && !achouParceiro; id++) { 
    try {
      const lista_coordenadas = await filtrarCords(id); // Aguarda o retorno da função assíncrona

      //2° Após filtrar as coordenadas, transmite as informações para próxima função
      if (verificaProximidade(lista_coordenadas)) { // Verifica se o parceiro foi encontrado
        achouParceiro = true; // Marca como encontrado
        criarMapa(id); //cria um mapa mostrando a área do parceiro
        texto = `Você pode pedir deliver no nosso parceiro de id ${id}`
        elementoParceiro(texto); //cria um 'p' avisando que achou o parceiro
      } 
    } catch (error) {
      console.error("Erro ao obter coordenadas. Digite os valores numéricos para x e y separados por vírgula.", error);
    }
  }

  //Após o fim do looping, verifica se achou um parceiro
  if (achouParceiro !== true) { //caso não esteja na área de um parcceiro
    buscarProximo() //ativa a função que procura o parceiro mais próximo
  }

  //1° filtra as coordenadas de um parceiro
  async function filtrarCords(id)  {
    //entrar em contato com a API
    const dados = await fetch("https://raw.githubusercontent.com/ab-inbev-ze-company/ze-code-challenges/refs/heads/master/files/pdvs.json");
    const dados_formatados = await dados.json();

    //filtrar dados 
    const coords_len = dados_formatados.pdvs[id]['coverageArea']['coordinates'][0][0].length; //obter o número de coordenadas de um parceiro
    const partner_cordenadas =  []; //lista com as coordenadas

    for (let i = 0; i < coords_len; i++)  { //itera sobre cada coordenada de um parceiro, as separando
      eixo_x = dados_formatados.pdvs[id]['coverageArea']['coordinates'][0][0][i][1]; //resgatar valor de uma coverageArea
      eixo_y = dados_formatados.pdvs[id]['coverageArea']['coordinates'][0][0][i][0];
      partner_cordenadas.push([eixo_x, eixo_y]); //adiciona a coordenada obtida a lista
    }

    return partner_cordenadas //retorna a lista com todas as coordenadas de um parceiro específicio
  } 


  //3° ativar a função que verifica se a coordenada fornecida está na coverageArea do parceiro
  function verificaProximidade(partnerCoords) {
    // Coordenadas do polígono (array de arrays)
    const polygonCoords = partnerCoords

    // Criando o polígono com Turf.js
    const polygon = turf.polygon([polygonCoords]);

    // Coordenadas do ponto (latitude e longitude)
    const pointCoords = array_coords; //coordenada passada pelo user

    // Criando o ponto com Turf.js
    const point = turf.point(pointCoords);

    // Verificando se o ponto está dentro da área de cobertura
    if (turf.booleanPointInPolygon(point, polygon)) {
      return true; //avisa que achou um parceiro
    } 
  }

  }

//3.5 Buscar o parceiro mais próximo do user caso o user não esteja em alguma CoverageArea 
function buscarProximo(){
  console.log('buscando...')
}

//4° Cria um mapa com a coverage area do parceiro mais proximo
function criarMapa(id) {
  const id_partner = id

  if (id_partner >= 51 || id_partner < 0) {
    alert('Escolha valores entre 0 e 50');
    document.getElementById('campo_id').value = '';
  } else {
    async function filtrarCords()  {
      //entrar em contato com a API
      const dados = await fetch("https://raw.githubusercontent.com/ab-inbev-ze-company/ze-code-challenges/refs/heads/master/files/pdvs.json");
      const dados_formatados = await dados.json();
      const { AdvancedMarkerElement } = await google.maps.importLibrary("marker");

      //filtrar dados 
      const coords_len = dados_formatados.pdvs[id_partner]['coverageArea']['coordinates'][0][0].length; //quantidade de coordenadas de um parceiro
      const partner_cordenadas =  []; //lista com as coordenadas

      for (let i = 0; i < coords_len; i++)  { //itera sobre cada coordenada de um parceiro, as separando
        eixo_x = dados_formatados.pdvs[id_partner]['coverageArea']['coordinates'][0][0][i][1]; //resgatar valor de uma coverageArea
        eixo_y = dados_formatados.pdvs[id_partner]['coverageArea']['coordinates'][0][0][i][0];
                  //dados_formatados[id_partner]['coverageArea']['coordinates'][0][0][coordenada][eixo(0,1)]
      partner_cordenadas.push({ lat: eixo_x, lng: eixo_y});
      }

      return partner_cordenadas

    }

    filtrarCords()
      .then(lista_coordenadas => {
        console.log(lista_coordenadas); // Exibe a lista de coordenadas no console
        initMap(lista_coordenadas); // Passa as coordenadas para a função initMap
      })
      .catch(error => {
        console.error("Erro ao obter coordenadas:", error);
      });

  function initMap(partnerCoords) {

      // Cria o mapa
      const map = new google.maps.Map(document.getElementById("map"), {
        zoom: 13,
        center: partnerCoords[0], //centraliza com base na posição de um dos pontos do poligono
        mapTypeId: "terrain",
      });

      // Construct the polygon.
      const partnerPolygon = new google.maps.Polygon({
        paths: partnerCoords, //cria o poligono com base nas coordenadas da lista
        strokeColor: "#FF0000",
        strokeOpacity: 0.8,
        strokeWeight: 2,
        fillColor: "#FF0000",
        fillOpacity: 0.35,
      });

      partnerPolygon.setMap(map);
    }
  }
}



//ATUALIZA O HTML

//verificar qual opção foi marcada
function opcaoSelecionada(){
  const opcao1 = document.getElementById("idPartner");
  const opcao2 = document.getElementById("coordenada");


  if (opcao1.checked == true) {    
    console.log('marcou opcao 1')
    criarInterface1()
  }
  else if (opcao2.checked == true) {
    console.log('marcou opcao 2')
    criarInterface2()
  }
}

//personalizar os elementos caso seja selecionada a primeira opção
function criarInterface1() {
  //buscar elementos
  const label = document.getElementById("texto_campo");
  const input = document.getElementById("campo_id");
  const button = document.getElementById("buscaPartner");
  const div = document.getElementById("button_campo");

  input.value = "";
  input.setAttribute("placeholder", "Digite o id de um parceiro");
  label.textContent = "Id do parceiro:";
  button.setAttribute("onclick", "minhaFuncao()");

  // retira a mensagem da opção 'coordenadas' quando 'id' está ativado
  const paragraph = document.querySelector('#mensagem p');
  paragraph.textContent = '';

}

function criarInterface2() {
  //buscar elementos
  const label = document.getElementById("texto_campo");
  const input = document.getElementById("campo_id");
  const button = document.getElementById("buscaPartner");
  const div = document.getElementById("button_campo");

  input.value = "";
  input.setAttribute("placeholder", "x, y");
  label.textContent = "Digite uma coordenada:";
  button.setAttribute("onclick", "acharPartner()");

}

//criar uma mensagem avisando que achou o parceiro  
function elementoParceiro(mensagem) {
  // Seleciona o elemento <p> dentro do div com ID 'mensagem'
  const paragraph = document.querySelector('#mensagem p');

  paragraph.
  paragraph.textContent = mensagem;
}