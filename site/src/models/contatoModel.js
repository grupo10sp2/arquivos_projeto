var database = require("../database/config")

function listar() {
    console.log("ACESSEI O CONTATO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
        SELECT * FROM contato;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}



function cadastrar(nome, email, telefone, assunto, descricao) {
    console.log("ACESSEI O CONTATO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, senha);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucao = `
        INSERT INTO contato(nome, email, telefone, assunto, descricao) VALUES ('${nome}', '${email}', '${telefone}', '${assunto}', '${descricao}');
    `;
    return database.executar(instrucao);
}



module.exports = {
 
    cadastrar,
    listar,

};