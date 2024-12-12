function minhaFuncao() {
  const id_partner = document.getElementById('campo_id').value;
  console.log(id_partner);

  if (id_partner >= 51) {
    alert('Escolha valores entre 0 e 50');
    document.getElementById('campo_id').value = '';
  } else {
    async function filtrarCords()  {
      //entrar em contato com a API
      const dados = await fetch("https://raw.githubusercontent.com/ab-inbev-ze-company/ze-code-challenges/refs/heads/master/files/pdvs.json");
      const dados_formatados = await dados.json();

      //filtrar dados 
      const coords_len = dados_formatados.pdvs[id_partner]['coverageArea']['coordinates'][0][0].length; //quantidade de coordenadas de um parceiro
      const partner_cordenadas =  [];

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
        zoom: 10,
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

