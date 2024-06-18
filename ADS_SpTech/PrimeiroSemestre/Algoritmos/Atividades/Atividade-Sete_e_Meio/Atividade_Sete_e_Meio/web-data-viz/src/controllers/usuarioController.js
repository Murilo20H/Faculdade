var usuarioModel = require("../models/usuarioModel");

function autenticar(req, res) {
    var nome = req.body.nomeServer;
    var senha = req.body.senhaServer;

    if (nome == undefined) {
        res.status(400).send("nome está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("senha está indefinida!");
    } else {

        usuarioModel.autenticar(nome, senha)
            .then(
                function (resultadoAutenticar) {
                    console.log(`\nResultados encontrados: ${resultadoAutenticar.length}`);
                    console.log(`Resultados: ${JSON.stringify(resultadoAutenticar)}`); // transforma JSON em String

                    if (resultadoAutenticar.length == 1) {
                        console.log(resultadoAutenticar);
                        res.json({
                            id: resultadoAutenticar[0].id,
                            nome: resultadoAutenticar[0].nome,
                            senha: resultadoAutenticar[0].senha,
                            dinheiro: resultadoAutenticar[0].dinheiro
                        });
                    } else if (resultadoAutenticar.length == 0) {
                        res.status(403).send("Nome e/ou senha inválido(s)");
                    } else {
                        res.status(403).send("Mais de um usuário com o mesmo login e senha!");
                    }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }

}

function cadastrar(req, res) {
    var nome = req.body.nomeServer;
    var senha = req.body.senhaServer;

    if (nome == undefined) {
        res.status(400).send("nome está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("senha está undefined!");
    } else {

        usuarioModel.cadastrar(nome, senha)
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
}

function movimentarDinheiro(req, res) {
    var id = req.body.idServer;
    var dinheiro = req.body.dinheiroServer;

    if (id == undefined) {
        res.status(400).send("id está undefined!");
    } else if (dinheiro == undefined) {
        res.status(400).send("dinheiro está undefined!");
    } else {

        usuarioModel.movimentarDinheiro(id, dinheiro)
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
}


function registrar(req, res) {
    var fkUsuario = req.body.idUsuarioServer;
    var valor = req.body.valorServer;

    if (fkUsuario == undefined) {
        res.status(400).send("fkUsuario está undefined!");
    } else if (valor == undefined) {
        res.status(400).send("valor está undefined!");
    } else {

        usuarioModel.registrar(fkUsuario, valor)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o registro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}



function verRegistros(req, res) {
    var fkUsuario = req.params.idUsuario;

    if (fkUsuario == undefined) {
        res.status(400).send("fkUsuario está undefined!");
    } else {

        usuarioModel.verRegistros(fkUsuario)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao ver os registros! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

module.exports = {
    autenticar,
    cadastrar,
    movimentarDinheiro,
    registrar,
    verRegistros
}