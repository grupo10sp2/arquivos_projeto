function login(){
    var email = input_email.value;
    var senha = input_senha.value;
    var login_valido = true;

    if (senha == "" || senha[0] == " "){
        mensagem_erro.innerHTML = `Usuário ou senha inválidos`
        login_valido = false;
    }


    if (login_valido && email == 'fernando.brandao@sptech.school'){
        location = "dashboard-admin.html";
    } else if (login_valido && email == 'rafa@sptech.school'){
        location = "dashboard.html"
    } else {
        mensagem_erro.innerHTML = `Usuário ou senha inválidos`
	}
}