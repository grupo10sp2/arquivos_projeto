var database = require("../database/config")

function listar() {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
        SELECT * FROM usuario;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function entrar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucao = `
        SELECT * FROM usuario WHERE email = '${email}' AND senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucao
function cadastrar(nome, email, senha, cpf) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, senha);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucao = `
        INSERT INTO usuario(nome, cpf, email, senha) VALUES ('${nome}', '${cpf}', '${email}', '${senha}');
    `;
    return database.executar(instrucao);
}

function cadastrarFazenda(nomeFazenda, cnpj, logradouro, cep, numero, complemento){
    var instrucao = `
    INSERT INTO fazenda(nomeFazenda, cnpj, logradouro, numero, complemento, cep) VALUES ('${nomeFazenda}', '${cnpj}', '${logradouro}', '${numero}', '${complemento}', '${cep}');`
    return database.executar(instrucao);
}

function cadastrarFuncionario(nome, cpf, email, senha, fkAdmin){
    var instrucao = `
    INSERT INTO usuario(nome, cpf, email, senha, fkAdmin) VALUES ('${nome}', '${cpf}', '${email}', '${senha}', ${fkAdmin});
    `

    return database.executar(instrucao)
}

function selectFazenda(){
    var instrucao = `select idFazenda from fazenda order by idFazenda desc limit 1;`

    return database.executar(instrucao)
}

function insertTabelaAssociativa(idFazenda, idUsuario){
    var instrucao = `
    INSERT INTO fazenda_tem_usuario VALUES (${idFazenda}, ${idUsuario})
    `
    return database.executar(instrucao)
}


module.exports = {
    entrar,
    cadastrar,
    listar,
    cadastrarFuncionario,
    cadastrarFazenda,
    selectFazenda,
    insertTabelaAssociativa
};