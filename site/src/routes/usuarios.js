var express = require("express");
var router = express.Router();

var usuarioController = require("../controllers/usuarioController");

router.get("/", function (req, res) {
    usuarioController.testar(req, res);
});

router.get("/listar", function (req, res) {
    usuarioController.listar(req, res);
});

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrar", function (req, res) {
    usuarioController.cadastrar(req, res);
})

router.post("/cadastrarFuncionario", function(req, res){
    usuarioController.cadastrarFuncionario(req, res);
})

router.post("/autenticar", function (req, res) {
    usuarioController.entrar(req, res);
});

router.post("/cadastrarFazenda", function(req, res){
    usuarioController.cadastrarFazenda(req, res)
})

router.get("/selectFazenda", function(req, res){
    usuarioController.selectFazenda(req, res)
})

router.post("/insertTabelaAssociativa", function(req, res){
    usuarioController.insertTabelaAssociativa(req, res)
})

router.get("/mostrarFazendas/:idUsuario", function(req, res){
    usuarioController.mostrarFazendas(req, res)
})

router.get("/selectIdUsuario", function(req, res){
    usuarioController.selectIdUsuario(req, res)
})

router.post("/insertTabelaAssociativaFuncionario", function(req, res){
    usuarioController.insertTabelaAssociativaFuncionario(req, res)
})

router.get("/exibirTempMedia", function(req, res){
    usuarioController.exibirTempMedia(req, res)
})
router.get("/exibirFazendasDoUsuario/:idUsuario", function(req, res){
    usuarioController.exibirFazendasDoUsuario(req, res)
})

router.get("/verificarSilo/:idFazenda",  function(req, res){
    usuarioController.verificarSilo(req, res)
})


module.exports = router;