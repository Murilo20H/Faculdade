var express = require("express");
var router = express.Router();

var usuarioController = require("../controllers/usuarioController");

router.post("/cadastrar", function (req, res) {
    usuarioController.cadastrar(req, res);
})

router.post("/autenticar", function (req, res) {
    usuarioController.autenticar(req, res);
});

router.put("/movimentarDinheiro", function (req, res) {
    usuarioController.movimentarDinheiro(req, res);
});

router.post("/registrar", function (req, res) {
    usuarioController.registrar(req, res);
});

router.get("/verRegistros/:idUsuario", function (req, res) {
    usuarioController.verRegistros(req, res);
});

module.exports = router;