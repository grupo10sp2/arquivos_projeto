function Focus(input){
    input.style.borderColor = "#000000"
}

function cadastrar(){
    var nome = input_nome.value;
    var cpf = input_cpf.value;
    var email = input_email.value;
    var senha = input_senha.value;
    var confirmacao_senha = input_confirmacao_senha.value;

    var cadastro_valido = true;

    if (nome == "" || nome[0] == " " || nome.length < 3){
        input_nome.style.borderColor = "#FF0000";
        cadastro_valido = false;
    }    
    if (cpf.length != 11){
        input_cpf.style.borderColor = "#FF0000";
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
    if (senha == "" || senha[0] == " " || senha.length < 5){
        input_senha.style.borderColor = "#FF0000";
        cadastro_valido = false;
    }
    if (confirmacao_senha == "" || confirmacao_senha[0] == " " || confirmacao_senha != senha){
        input_confirmacao_senha.style.borderColor = "#FF0000";
        cadastro_valido = false;
    }

    if (cadastro_valido){
        alert("Cadastro realizado com sucesso!")
        location = "login.html";
    }
}