//Atribuindo intervalo a variável interval
var interval = setInterval(() => {}, 10000);

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

//Função para buscar meses do select_ano registrados no banco de dados
function loadMonthsData(){
    const ano = select_anos.value;
    fetch(`/avisos/select_mes/${ano}`).then(function (resposta) {
      if (resposta.ok) {
          resposta.json().then(function (resposta) {
          console.log("Dados recebidos: ", JSON.stringify(resposta));
              select_meses.innerHTML = null;
              for (let index = 0; index < resposta.length; index++) {
                  select_meses.innerHTML += `<option value="${resposta[index].mes}">${resposta[index].mes}</option>`;
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
  if (!by_interval) { // Caso não tenha sido chamada pelo intervalor
    clearInterval(interval);//Limpando intervalo para começar do 0 após a troca de ano ou mês
    interval = setInterval(()=>{loadKpisData(true)}, 10000); //Definindo novo intervalo após a troca
    loadChartsData();
  } else {
    if (mes_select == mes_atual && ano_select == ano_atual) {
      loadChartsData();
    }    
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
    chart_1.innerHTML = `<canvas id="canvas_chart_1" style="position: relative; height: 40vh; width:37vw;"></canvas>`; //Recriando o canvas

    chart_2.innerHTML = null;//Quebrando o canvas
    chart_2.innerHTML = `<canvas id="canvas_chart_2" style="position: relative; height: 40vh; width:37vw;"></canvas>`;//Recriando o canvas

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