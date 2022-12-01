function Focus(id_input){
    id_input.style.borderColor = "#000000"
}

function verificarContato(){
      var nome = input_nome.value;
      var email = input_email.value;
      var telefone = input_telefone.value;
      var assunto = input_assunto.value;
      var descricao = Textarea.value;

    var cadastro_valido = true;

    if (nome == "" || nome[0] == " " || nome.length < 3){
        input_nome.style.borderColor = "#FF0000";
        cadastro_valido = false;
    }    
    
    if (email == "" ||
        email.indexOf(" ") > -1 ||
        email.indexOf("@") < 3 ||
        (email.lastIndexOf(".") - email.indexOf("@")) < 4 ||
        (email.length - email.lastIndexOf(".")) < 3){
        input_email.style.borderColor = "#FF0000";
        cadastro_valido = false;
    }

    if(telefone.length < 10 ){
        input_telefone.style.borderColor = "#FF0000";
        cadastro_valido = false;
    }

    if (assunto == "" || assunto[0] == " "){
        input_assunto.style.borderColor = "#FF0000";
        cadastro_valido = false;
    } 

    if (descricao == "" || descricao[0] == " "){
        Textarea.style.borderColor = "#FF0000";
        cadastro_valido = false;
    } 
   

    if (!cadastro_valido){
        return false;
    }

  
    return true
}

