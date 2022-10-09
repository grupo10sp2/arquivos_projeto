function Focus(id_input){
    id_input.style.borderColor = "#000000"
}

function login(){
    var email = input_email.value;
    var senha = input_senha.value;
    var login_valido = true;
    
    /* Verificação do Email */
    if (email == "" ||
        email.indexOf(" ") > -1 ||
        email.indexOf("@") < 3 ||
        (email.lastIndexOf(".") - email.indexOf("@")) < 4 ||
        (email.length - email.lastIndexOf(".")) < 3){
        input_email.style.borderColor = "#FF0000";
        login_valido = false;
    }

    /* Verificação da Email */
    if (senha == "" || senha[0] == " " || senha.length < 5){
        input_senha.style.borderColor = "#FF0000";
        login_valido = false;
    }

    if (login_valido && email == 'fernando.brandao@sptech.school'){
        location = "dashboardAdmin.html";
    } else if (login_valido && email == 'rafa@sptech.school'){
        location = "dashboard.html"
    } else if (login_valido) {
		alert("E-mail ou senha inválidos");
	}
}