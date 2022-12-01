var express = require("express");
var router = express.Router();

var contatoController = require("../controllers/contatoController");

router.get("/", function (req, res) {
    contatoController.testar(req, res);
});

router.get("/listar", function (req, res) {
    contatoController.listar(req, res);
});

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrar", function (req, res) {
    contatoController.cadastrar(req, res);
})


module.exports = router;