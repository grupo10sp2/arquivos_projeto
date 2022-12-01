function Focus(id_input){
    id_input.style.borderColor = "#000000"
    
}

var cor_erro = "#FF0000";

function verificarFazenda(){
  var nome = input_nome_fazenda.value;
   var cnpj = input_cnpj.value;
   var cep = input_cep.value;
   var logradouro = input_logradouro.value;
   var numero = input_numero.value;
   var complemento = input_complemento.value;

    var cadastro_valido = true;

    if (nome == "" || nome[0] == " "){
        input_nome.style.borderColor = "#FF0000";
        nome_fazenda.innerHTML =`Nome inválido`
        cadastro_valido = false;
    }    
    if (cnpj.length < 14){
        input_cnpj.style.borderColor = "#FF0000";
        cpnj_fazenda.innerHTML=`campo imcompleto `
        cadastro_valido = false;

    }else if(cnpj.length > 14){
        input_cnpj.style.borderColor = "#FF0000";
        cpnj_fazenda.innerHTML=`campo execede o limite`
        cadastro_valido = false;
    }

    if (cep.length < 8){
        input_cep.style.borderColor = "#FF0000";
        cep_fazenda.innerHTML=`campo imcompleto `
        cadastro_valido = false;

    }else if(cep.length > 8){
        input_cnpj.style.borderColor = "#FF0000";
        cep_fazenda.innerHTML=`campo execede o limite`
        cadastro_valido = false;
    }

    
   
    if (!cadastro_valido){
        return false;
    }

    return true
}




