var contatoModel = require("../models/contatoModel");

var sessoes = [];

function testar(req, res) {
    console.log("ENTRAMOS NA contatoController");
    res.json("ESTAMOS FUNCIONANDO!");
}

function listar(req, res) {
    contatoModel.listar()
        .then(function (resultado) {
            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(204).send("Nenhum resultado encontrado!")
            }
        }).catch(
            function (erro) {
                console.log(erro);
                console.log("Houve um erro ao realizar a consulta! Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );
        }

function cadastrar(req, res) {
    //nome, email, telefone, assunto, descrição
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var nome = req.body.nomeServer;
    var email = req.body.emailServer;
    var telefone = req.body.telefoneServer;
    var assunto = req.body.telefoneServer;
    var descricao = req.body.descricaoServer;

    // Faça as validações dos valores
        
    // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
    contatoModel.cadastrar(nome, email, telefone, assunto, descricao)
        .then(
            function (resultado) {
                res.json(resultado);
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log(
                    "\nHouve um erro ao realizar o cadastro! Erro: ",
                    erro.sqlMessage
                );
                res.status(500).json(erro.sqlMessage);
            }
        );
}



module.exports = {
    
    cadastrar,
    listar,
    testar,
}