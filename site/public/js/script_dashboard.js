const user = sessionStorage.NOME_USUARIO;

/*if (user == null) {
    location = "index.html";
}*/

function logout(){
    sessionStorage.clear();
    location = 'index.html'
}

var periodo_intervalo = 10; //Quantidade de segundos para atualização de dados

periodo_intervalo *= 1000;

//Atribuindo intervalo a variável interval
var interval = setInterval(() => {}, periodo_intervalo);

//Definindo vetores que terão valores para o gráfico
var dias = [];
var temperaturas_minimas = [];
var temperaturas_medias = [];
var temperaturas_maximas = [];
var umidades_minimas = [];
var umidades_medias = [];
var umidades_maximas = [];

//Função para buscar anos existentes no banco de dados chamada inicialmente pelo atributo onload no body do html (quando a página carregar) e inserindo os anos no select_anos em ordem decrescente
function loadYearsData(){
    fetch(`/avisos/select_ano`).then(function (resposta) {
        if (resposta.ok) {
            resposta.json().then(function (resposta) {
            console.log("Dados recebidos: ", JSON.stringify(resposta));
                for (let index = 0; index < resposta.length; index++) {
                    select_anos.innerHTML += `<option value="${resposta[index].ano}">${resposta[index].ano}</option>`;
                }  
                loadMonthsData();//Chamando a função para buscar os meses do ano selecionado no select_ano (inicialmente o último ano)
            });
        } else {
            throw ('Houve um erro na API!');
        }
    }).catch(function (resposta) {
        console.error(resposta);
    });
}

function monthName(mes){ // Função para mostrar nome dos meses
  switch (mes) {
    case 1:
      return "Janeiro";
      break;
    case 2:
      return "Fevereiro";
      break;
    case 3:
      return "Março";
      break;
    case 4:
      return "Abril";
      break;
    case 5:
      return "Maio";
      break;
    case 6:
      return "Junho";
      break;
    case 7:
      return "Julho";
      break;
    case 8:
      return "Agosto";
      break;
    case 9:
      return "Setembro";
      break;
    case 10:
      return "Outubro";
      break;
    case 11:
      return "Novembro";
      break;
    default:
      return "Dezembro";
      break;
  }
}

//Função para buscar meses do select_ano registrados no banco de dados
function loadMonthsData(){
    const ano = select_anos.value;
    fetch(`/avisos/select_mes/${ano}`).then(function (resposta) {
      if (resposta.ok) {
          resposta.json().then(function (resposta) {
          console.log("Dados recebidos: ", JSON.stringify(resposta));
              select_meses.innerHTML = null;
              for (let index = 0; index < resposta.length; index++) {
                  select_meses.innerHTML += `<option value="${resposta[index].mes}">${monthName(resposta[index].mes)}</option>`;
              }  
              loadKpisData()//Chamando a função para buscar dadaos para as Kpis
          });
      } else {
          throw ('Houve um erro na API!');
      }
  }).catch(function (resposta) {
      console.error(resposta);
  });
}

function loadKpisData(by_interval = false) { //Informa a função se ela foi chamada pelo setInterval(). Parâmetro iniciando com false
  const mes = select_meses.value;
  const ano = select_anos.value;

  fetch(`/avisos/media/?mes=${mes}&ano=${ano}`).then(function (resposta) {
    if (resposta.ok) {
        resposta.json().then(function (resposta) {
          console.log("Dados recebidos: ", JSON.stringify(resposta));
          const dados = resposta[0];
          media_temp.innerHTML = dados.avg_temp + "°C";
          media_umidade.innerHTML = dados.avg_umidade + "%";
          const discrepancia_de_temperatura_maxima = dados.max_temp - 30;
          const discrepancia_de_temperatura_minima = 25 - dados.min_temp;
          const discrepancia_de_umidade_maxima = dados.max_umidade - 12;
          const discrepancia_de_umidade_minima = 10 - dados.min_umidade;
          var temperatura_discrepante = 0;
          var umidade_discrepante = 0;
          if (discrepancia_de_temperatura_minima > discrepancia_de_temperatura_maxima) {
            temperatura_discrepante = dados.min_temp;
          } else {
            temperatura_discrepante = dados.max_temp;
          }
          if (discrepancia_de_umidade_minima > discrepancia_de_umidade_maxima) {
            umidade_discrepante = dados.min_umidade;
          } else {
            umidade_discrepante = dados.max_umidade;
          }
          discrepancia_temp.innerHTML = temperatura_discrepante + "°C";
          discrepancia_umidade.innerHTML = umidade_discrepante + "%";

          if (dados.avg_temp >= 25 && dados.avg_temp <= 30) {
            box_media_temp.style.backgroundColor = "#02C252"; // Verde
          } else if(dados.avg_temp < 19 || dados.avg_temp > 34) {
            box_media_temp.style.backgroundColor = "#C20202"; //Vermelho
          } else if(dados.avg_temp < 21 || dados.avg_temp > 32) {
            box_media_temp.style.backgroundColor = "#EC8E00"; // Laranja
          } else if(dados.avg_temp < 23 || dados.avg_temp > 30) {
            box_media_temp.style.backgroundColor = "#ECD400"; //Amarelo
          }

          if (dados.avg_umidade >= 10 && dados.avg_umidade <= 12) {
            box_media_umidade.style.backgroundColor = "#02C252"; // Verde
          } else if(dados.avg_umidade < 7 || dados.avg_umidade > 14) {
            box_media_umidade.style.backgroundColor = "#C20202"; //Vermelho
          } else if(dados.avg_umidade < 8 || dados.avg_umidade > 13) {
            box_media_umidade.style.backgroundColor = "#EC8E00"; // Laranja
          } else if(dados.avg_umidade < 10 || dados.avg_umidade > 12) {
            box_media_umidade.style.backgroundColor = "#ECD400"; //Amarelo
          }
          
          if (temperatura_discrepante >= 25 && temperatura_discrepante <= 30) {
            box_discrepancia_temp.style.backgroundColor = "#02C252"; // Verde
          } else if(temperatura_discrepante < 19 || temperatura_discrepante > 34) {
            box_discrepancia_temp.style.backgroundColor = "#C20202"; //Vermelho
          } else if(temperatura_discrepante < 21 || temperatura_discrepante > 32) {
            box_discrepancia_temp.style.backgroundColor = "#EC8E00"; // Laranja
          } else if(temperatura_discrepante < 23 || temperatura_discrepante > 30) {
            box_discrepancia_temp.style.backgroundColor = "#ECD400"; //Amarelo
          }

          if (umidade_discrepante >= 25 && umidade_discrepante <= 30) {
            box_discrepancia_umidade.style.backgroundColor = "#02C252"; // Verde
          } else if(umidade_discrepante < 19 || umidade_discrepante > 34) {
            box_discrepancia_umidade.style.backgroundColor = "#C20202"; //Vermelho
          } else if(umidade_discrepante < 21 || umidade_discrepante > 32) {
            box_discrepancia_umidade.style.backgroundColor = "#EC8E00"; // Laranja
          } else if(umidade_discrepante < 23 || umidade_discrepante > 30) {
            box_discrepancia_umidade.style.backgroundColor = "#ECD400"; //Amarelo
          }
        });
    } else {
        throw ('Houve um erro na API!');
    }
  }).catch(function (resposta) {
    console.error(resposta);
  });

  fetch(`/avisos/atual`).then(function (resposta) {
    if (resposta.ok) {
        resposta.json().then(function (resposta) {
          console.log("Dados recebidos: ", JSON.stringify(resposta));
          const dados = resposta[0];
          atual_temp.innerHTML = dados.atual_temp + "°C";
          atual_umidade.innerHTML = dados.atual_umidade + "%";

          if (dados.atual_temp >= 25 && dados.atual_temp <= 30) {
            box_atual_temp.style.backgroundColor = "#02C252"; // Verde
          } else if(dados.atual_temp < 19 || dados.atual_temp > 34) {
            box_atual_temp.style.backgroundColor = "#C20202"; //Vermelho
          } else if(dados.atual_temp < 21 || dados.atual_temp > 32) {
            box_atual_temp.style.backgroundColor = "#EC8E00"; // Laranja
          } else if(dados.atual_temp < 23 || dados.atual_temp > 30) {
            box_atual_temp.style.backgroundColor = "#ECD400"; //Amarelo
          }

          if (dados.atual_umidade >= 10 && dados.atual_umidade <= 12) {
            box_atual_umidade.style.backgroundColor = "#02C252"; // Verde
          } else if(dados.atual_umidade < 7 || dados.atual_umidade > 14) {
            box_atual_umidade.style.backgroundColor = "#C20202"; //Vermelho
          } else if(dados.atual_umidade < 8 || dados.atual_umidade > 13) {
            box_atual_umidade.style.backgroundColor = "#EC8E00"; // Laranja
          } else if(dados.atual_umidade < 10 || dados.atual_umidade > 12) {
            box_atual_umidade.style.backgroundColor = "#ECD400"; //Amarelo
          }
        });
    } else {
        throw ('Houve um erro na API!');
    }
  }).catch(function (resposta) {
    console.error(resposta);
  });
  //Chamando a função para criar os gráficos com os dados recebidos
  const date = new Date();
  const mes_atual = date.getMonth() + 1;
  const ano_atual = date.getFullYear();
  const mes_select = select_meses.value;
  const ano_select = select_anos.value;

  if (!by_interval) { // Caso não tenha sido chamada pelo intervalo
    clearInterval(interval);//Limpando intervalo para começar do 0 após a troca de ano ou mês
    interval = setInterval(() => loadKpisData(true), periodo_intervalo); //Definindo novo intervalo após a troca
    loadChartsData();
  } else if (by_interval && mes_select == mes_atual && ano_select == ano_atual) {    
      loadChartsData();
  }  
}

//Função para buscar os dados para o gráfico conforme o mes e ano dos selects
function loadChartsData() {    
    dias = [];
    temperaturas_minimas = [];
    temperaturas_medias = [];
    temperaturas_maximas = [];
    umidades_minimas = [];
    umidades_medias = [];
    umidades_maximas = [];    

    const mes = select_meses.value;
    const ano = select_anos.value;

    fetch(`/avisos/listar/?mes=${mes}&ano=${ano}`).then(function (resposta) {
        if (resposta.ok) {
            resposta.json().then(function (resposta) {
            console.log("Dados recebidos: ", JSON.stringify(resposta));
                for (let index = 0; index < resposta.length; index++) {
                  dias.push(resposta[index].dia);
                  temperaturas_minimas.push(resposta[index].min_temp);
                  temperaturas_medias.push(resposta[index].avg_temp);
                  temperaturas_maximas.push(resposta[index].max_temp);
                  umidades_minimas.push(resposta[index].min_umidade);
                  umidades_medias.push(resposta[index].avg_umidade);
                  umidades_maximas.push(resposta[index].max_umidade);
                }  
                chartsGenerator();
            });
        } else {
            throw ('Houve um erro na API!');
        }
    }).catch(function (resposta) {
        console.error(resposta);
    });
}

//Função responsável por criar os gráficos
function chartsGenerator(){  
    chart_1.innerHTML = null;//Quebrando o canvas
    chart_1.innerHTML = `<canvas id="canvas_chart_1" style="position: relative; height: 40vh; width:36vw;"></canvas>`; //Recriando o canvas

    chart_2.innerHTML = null;//Quebrando o canvas
    chart_2.innerHTML = `<canvas id="canvas_chart_2" style="position: relative; height: 40vh; width:36vw;"></canvas>`;//Recriando o canvas

  const data = {
    labels: dias,
    datasets: [
    {
      label: 'Temp Mín',
      backgroundColor: 'rgb(84, 134, 232)',
      borderColor: 'rgb(84, 134, 232)',
      data: temperaturas_minimas,
    },
    {
      label: 'Temp Média',
      backgroundColor: 'rgb(122, 232, 84)',
      borderColor: 'rgb(122, 232, 84)',
      data: temperaturas_medias,
    },
    {
      label: 'Temp Max',
      backgroundColor: 'rgb(255, 90, 90',
      borderColor: 'rgb(255, 90, 90',
      data: temperaturas_maximas,
    }    
  ]};

  const data2 = {
    labels: dias,
    datasets: [
    {
      label: 'Umidade Mín',
      backgroundColor: 'rgb(84, 134, 232)',
      borderColor: 'rgb(84, 134, 232)',
      data: umidades_minimas,
    },
    {
      label: 'Umidade Média',
      backgroundColor: 'rgb(122, 232, 84)',
      borderColor: 'rgb(122, 232, 84)',
      data: umidades_medias,
    },
    {
      label: 'Umidade Max',
      backgroundColor: 'rgb(255, 90, 90',
      borderColor: 'rgb(255, 90, 90',
      data: umidades_maximas,
    }    
  ]};

  const config = {
    type: 'line',
    data: data
  };

  const config2 = {
    type: 'line',
    data: data2
  };

  const myChart = new Chart(
    document.getElementById('canvas_chart_1'),
    config
  );

  const myChart2 = new Chart(
    document.getElementById('canvas_chart_2'),
    config2
  );
}

function aparecerTexto(){
  boxHelpdesk.innerHTML=`Clique e acesse nossa <b>central de suporte!</b>`;
  boxHelpdesk.style.backgroundColor="#fff";
  boxHelpdesk.style.boxShadow="0 1px 5px rgba(0,0,0,.4)";
  boxHelpdesk.style.padding="15px";
  boxHelpdesk.style.border="2px solid  #603808";
  boxHelpdesk.style.borderRadius="4px";
}

function reset(){
  boxHelpdesk.innerHTML=""
  boxHelpdesk.style.backgroundColor="";
  boxHelpdesk.style.border="";
  boxHelpdesk.style.boxShadow="";
}