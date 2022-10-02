function Focus(input){
    input.style.borderColor = "#000000"
}

function login(){
    var email = input_email.value;
    var senha = input_senha.value;
    var login_valido = true;
    
    if (email == "" ||
        email.indexOf(" ") > -1 ||
        email.indexOf("@") < 3 ||
        (email.lastIndexOf(".") - email.indexOf("@")) < 4 ||
        (email.length - email.lastIndexOf(".")) < 3){
        input_email.style.borderColor = "#FF0000";
        login_valido = false;
    }
    if (senha == "" || senha[0] == " " || senha.length < 5){
        input_senha.style.borderColor = "#FF0000";
        login_valido = false;
    }
    if (login_valido){
        location = "dashboard.html";
    }
}