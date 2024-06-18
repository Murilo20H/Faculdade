sessionStorage.clear();

function validar_sessao() {
    if (sessionStorage.ID_USUARIO == undefined) {
        document.getElementById("botao_login").style.display = "block";
        document.getElementById("botao_cadastro").style.display = "block";
        document.getElementById("botao_apostar").style.display = "none";
        document.getElementById("botao_estatistica").style.display = "none";
    } else {
        document.getElementById("botao_apostar").style.display = "block";
        document.getElementById("botao_estatistica").style.display = "block";
        document.getElementById("botao_login").style.display = "none";
        document.getElementById("botao_cadastro").style.display = "none";
    }
}

const cartas = [
    { valor: 'Ás', naipe: 'Copas', pontuacao: 1 },
    { valor: 'Ás', naipe: 'Espadas', pontuacao: 1 },
    { valor: 'Ás', naipe: 'Ouros', pontuacao: 1 },
    { valor: 'Ás', naipe: 'Paus', pontuacao: 1 },

    { valor: '2', naipe: 'Copas', pontuacao: 2 },
    { valor: '2', naipe: 'Espadas', pontuacao: 2 },
    { valor: '2', naipe: 'Ouros', pontuacao: 2 },
    { valor: '2', naipe: 'Paus', pontuacao: 2 },

    { valor: '3', naipe: 'Copas', pontuacao: 3 },
    { valor: '3', naipe: 'Espadas', pontuacao: 3 },
    { valor: '3', naipe: 'Ouros', pontuacao: 3 },
    { valor: '3', naipe: 'Paus', pontuacao: 3 },

    { valor: '4', naipe: 'Copas', pontuacao: 4 },
    { valor: '4', naipe: 'Espadas', pontuacao: 4 },
    { valor: '4', naipe: 'Ouros', pontuacao: 4 },
    { valor: '4', naipe: 'Paus', pontuacao: 4 },

    { valor: '5', naipe: 'Copas', pontuacao: 5 },
    { valor: '5', naipe: 'Espadas', pontuacao: 5 },
    { valor: '5', naipe: 'Ouros', pontuacao: 5 },
    { valor: '5', naipe: 'Paus', pontuacao: 5 },

    { valor: '6', naipe: 'Copas', pontuacao: 6 },
    { valor: '6', naipe: 'Espadas', pontuacao: 6 },
    { valor: '6', naipe: 'Ouros', pontuacao: 6 },
    { valor: '6', naipe: 'Paus', pontuacao: 6 },

    { valor: '7', naipe: 'Copas', pontuacao: 7 },
    { valor: '7', naipe: 'Espadas', pontuacao: 7 },
    { valor: '7', naipe: 'Ouros', pontuacao: 7 },
    { valor: '7', naipe: 'Paus', pontuacao: 7 },

    { valor: 'Valete', naipe: 'Copas', pontuacao: 0.5 },
    { valor: 'Valete', naipe: 'Espadas', pontuacao: 0.5 },
    { valor: 'Valete', naipe: 'Ouros', pontuacao: 0.5 },
    { valor: 'Valete', naipe: 'Paus', pontuacao: 0.5 },

    { valor: 'Rainha', naipe: 'Copas', pontuacao: 0.5 },
    { valor: 'Rainha', naipe: 'Espadas', pontuacao: 0.5 },
    { valor: 'Rainha', naipe: 'Ouros', pontuacao: 0.5 },
    { valor: 'Rainha', naipe: 'Paus', pontuacao: 0.5 },

    { valor: 'Rei', naipe: 'Copas', pontuacao: 0.5 },
    { valor: 'Rei', naipe: 'Espadas', pontuacao: 0.5 },
    { valor: 'Rei', naipe: 'Ouros', pontuacao: 0.5 },
    { valor: 'Rei', naipe: 'Paus', pontuacao: 0.5 }
];
var pontuacao_jogador = 0;
var pontuacao_banca = 0;
var acabou = false;
var dinheiroAtual; // alterar os sessionStorage por dinheiro atual para manipulalo no indicador de cima

function pedir() {
    if (!acabou) {
        var posicao_pegada = Math.round(Math.random() * cartas.length);
        var carta_pegada = cartas[posicao_pegada];

        pontuacao_jogador += carta_pegada.pontuacao;

        if (carta_pegada.valor == "Ás") {
            var foto = "a" + carta_pegada.naipe[0].toLowerCase();
        } else if (posicao_pegada >= 28) {
            if (carta_pegada.valor == 'Valete') {
                var foto = "j" + carta_pegada.naipe[0].toLowerCase();
            } else if (carta_pegada.valor == 'Rainha') {
                var foto = "q" + carta_pegada.naipe[0].toLowerCase();
            } else {
                var foto = "k" + carta_pegada.naipe[0].toLowerCase();
            }
        } else {
            var foto = carta_pegada.valor + carta_pegada.naipe[0].toLowerCase();
        }
        moverCarta(foto);
        setTimeout(() => { jogador.innerHTML += `<img id="foto_carta" src="assets/icons/${foto}.png">` }, 1100);
        document.getElementById("span_pontuacao_jogador").innerHTML = pontuacao_jogador;
        if (pontuacao_jogador > 7.5) {
            acabou = true;
            verificar_ganhos("banca");
        } else if (pontuacao_jogador == 7.5) {
            acabou = true;
            verificar_ganhos("jogador");
        }

    }
}

function passar() {
    if (!acabou) {
        rodada_banca();
    }
}


function rodada_banca() {
    var posicao_pegada = Math.round(Math.random() * cartas.length);
    var carta_pegada = cartas[posicao_pegada];

    pontuacao_banca += carta_pegada.pontuacao;

    if (carta_pegada.valor == "Ás") {
        var foto = "a" + carta_pegada.naipe[0].toLowerCase();
    } else if (posicao_pegada >= 28) {
        if (carta_pegada.valor == 'Valete') {
            var foto = "j" + carta_pegada.naipe[0].toLowerCase();
        } else if (carta_pegada.valor == 'Rainha') {
            var foto = "q" + carta_pegada.naipe[0].toLowerCase();
        } else {
            var foto = "k" + carta_pegada.naipe[0].toLowerCase();
        }
    } else {
        var foto = carta_pegada.valor + carta_pegada.naipe[0].toLowerCase();
    }
    banca.innerHTML += `<img id="foto_carta" src="assets/icons/${foto}.png">`
    document.getElementById("span_pontuacao_banca").innerHTML = pontuacao_banca;

    if (pontuacao_banca > 7.5) {
        acabou = true;
        verificar_ganhos("jogador")
    } else if (pontuacao_banca == 7.5) {
        acabou = true;
        verificar_ganhos("banca")
    } else if (pontuacao_banca > pontuacao_jogador && pontuacao_banca < 7.5) {
        acabou = true;
        verificar_ganhos("banca")
    }

    if (!acabou) {
        setTimeout(() => {
            rodada_banca();
        }, 2000)
    }
}





function verificar_ganhos(vencedor) {
    var dinheiro = Number(sessionStorage.DINHEIRO_USUARIO);
    var ultimaAposta = Number(sessionStorage.ULTIMA_APOSTA);

    if (ultimaAposta <= 0 || ultimaAposta == undefined || isNaN(ultimaAposta)) {
        if (vencedor == "jogador") {
            span_pontuacao_jogador.style.color = "green";
            span_pontuacao_banca.style.color = "red";
            Swal.fire({
                icon: "success",
                background: "black",
                color: "white",
                title: "Parabéns",
                text: `Da próxima vez tente apostar!`
            });
        } else {
            span_pontuacao_jogador.style.color = "red";
            span_pontuacao_banca.style.color = "green";
            Swal.fire({
                icon: "error",
                background: "black",
                color: "white",
                title: "Infelizmente",
                text: `Mais sorte da próxima vez!`
            });
        }
    } else if (vencedor == "jogador") {
        registrarAcao(ultimaAposta, true);
        span_pontuacao_jogador.style.color = "green";
        span_pontuacao_banca.style.color = "red";
        Swal.fire({
            icon: "success",
            background: "black",
            color: "white",
            title: "Parabéns",
            text: `Você ganhou R$${ultimaAposta * 2}!`
        });

        fetch("/usuarios/movimentarDinheiro", {
            method: "PUT",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                idServer: sessionStorage.ID_USUARIO,
                dinheiroServer: (dinheiro + (ultimaAposta * 2))
            })
        }).then(function (resposta) {

            if (resposta.ok) {
                console.log(resposta);

                resposta.json().then(json => {
                    sessionStorage.ULTIMA_APOSTA = 0;
                    valor_aposta.innerHTML = sessionStorage.ULTIMA_APOSTA;
                    valor_dinheiro.innerHTML = sessionStorage.DINHEIRO_USUARIO;
                });
            } else {
                resposta.text().then(texto => {
                    console.error(texto);
                });
            }
        }).catch(function (erro) {
            console.log(erro);
        })
    } else {
        registrarAcao(ultimaAposta, false);
        sessionStorage.ULTIMA_APOSTA = 0;
        
        valor_aposta.innerHTML = sessionStorage.ULTIMA_APOSTA;

        span_pontuacao_jogador.style.color = "red";
        span_pontuacao_banca.style.color = "green";
        Swal.fire({
            icon: "error",
            background: "black",
            color: "white",
            title: "Infelizmente",
            text: `Você perdeu R$${ultimaAposta}!`
        });
    }

    setTimeout(() => {
        pontuacao_jogador = 0;
        pontuacao_banca = 0;
        acabou = false;

        document.getElementById("span_pontuacao_jogador").innerHTML = 0;
        document.getElementById("span_pontuacao_banca").innerHTML = 0;
        document.getElementById("valor_aposta").innerHTML = 0;
        document.getElementById("jogador").innerHTML = "";
        document.getElementById("banca").innerHTML = "";
        document.getElementById("span_pontuacao_jogador").style.color = "white";
        document.getElementById("span_pontuacao_banca").style.color = "white";
    }, 2000);
}




function registrarAcao(ultimaAposta, ganhou) {
    if (ganhou) {
        fetch("/usuarios/registrar", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                idUsuarioServer: sessionStorage.ID_USUARIO,
                valorServer: (ultimaAposta * 2)
            })
        }).then(function (resposta) {
            console.log(resposta);
            if (resposta.ok) {
            } else {
                resposta.text().then(texto => {
                    console.error(texto);
                });
            }
        }).catch(function (erro) {
            console.log(erro);
        })
    } else {
        fetch("/usuarios/registrar", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                idUsuarioServer: sessionStorage.ID_USUARIO,
                valorServer: (-1 * ultimaAposta)
            })
        }).then(function (resposta) {
            console.log(resposta);
            if (resposta.ok) {
            } else {
                resposta.text().then(texto => {
                    console.error(texto);
                });
            }
        }).catch(function (erro) {
            console.log(erro);
        })
    }
}







function moverCarta(foto) {
    const cartaDoCentro = document.getElementById('carta-do-centro');
    const novaCarta = cartaDoCentro.cloneNode(true);

    novaCarta.classList.add('moving');

    const rect = cartaDoCentro.getBoundingClientRect();
    novaCarta.style.top = rect.top + 'px';
    novaCarta.style.left = rect.left + 'px';

    document.body.appendChild(novaCarta);
    setTimeout(() => {
        novaCarta.src = `assets/icons-reverse/${foto}.png`;
    }, 500);

    novaCarta.addEventListener('animationend', () => {
        novaCarta.remove();
    });
}




function fazer_aposta() {
    document.getElementById("card-aposta").style.display = "flex";
}

function fazer_login() {
    document.getElementById("card-login").style.display = "flex";
}

function fazer_cadastro() {
    document.getElementById("card-login").style.display = "flex";
    container.classList.add("right-panel-active");
}



// CADASTRO
function cadastrar() {
    var nomeVar = nome_input_cadastro.value;
    var senhaVar = senha_input_cadastro.value;
    var confirmacaoSenhaVar = confirmar_senha_input_cadastro.value;

    console.log(nomeVar)
    console.log(nomeVar.length)
    if (nomeVar == "" || senhaVar == "" || confirmacaoSenhaVar == "") {
        document.getElementById("card-erro").style.display = "block";
        mensagem_erro.innerHTML = "Todos os campos devem ser prenchidos corretamente";
        return;
    } else if (nomeVar.length < 5) {
        document.getElementById("card-erro").style.display = "block";
        mensagem_erro.innerHTML = "O nome precisa ter pelo menos 5 caracteres";
        return;
    } else if (senhaVar != confirmacaoSenhaVar) {
        document.getElementById("card-erro").style.display = "block";
        mensagem_erro.innerHTML = "As senhas devem ser identicas";
        return;
    } else if (senhaVar.length < 6) {
        document.getElementById("card-erro").style.display = "block";
        mensagem_erro.innerHTML = "A senha precisa ter pelo menos 6 caracteres";
        return;
    } else {

        fetch("/usuarios/cadastrar", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                nomeServer: nomeVar,
                senhaServer: senhaVar
            }),
        }).then(function (resposta) {
            console.log("resposta: ", resposta);

            if (resposta.ok) {
                document.getElementById("card-erro").style = "display: block; color: green";
                mensagem_erro.innerHTML = "Cadastro realizado com sucesso";

                setTimeout(() => {
                    container.classList.remove("right-panel-active");
                    document.getElementById("card-erro").style = "color: red";
                }, 800);
            } else {
                throw "Houve um erro ao tentar realizar o cadastro!";
            }
        }).catch(function (resposta) {
            console.log(`#ERRO: ${resposta}`);
        });

        return;
    }
}



// LOGIN
function entrar() {
    var nomeVar = nome_input_login.value;
    var senhaVar = senha_input_login.value;

    if (nomeVar == "" || senhaVar == "") {
        document.getElementById("card-erro").style.display = "block";
        mensagem_erro.innerHTML = "Todos os campos devem ser prenchidos corretamente";
        return;
    }
    else {

        fetch("/usuarios/autenticar", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                nomeServer: nomeVar,
                senhaServer: senhaVar
            })
        }).then(function (resposta) {
            console.log("ESTOU NO THEN DO entrar()!")

            if (resposta.ok) {
                console.log(resposta);

                resposta.json().then(json => {
                    sessionStorage.NOME_USUARIO = json.nome;
                    sessionStorage.ID_USUARIO = json.id;
                    sessionStorage.DINHEIRO_USUARIO = json.dinheiro;
                    valor_dinheiro.innerHTML = sessionStorage.DINHEIRO_USUARIO;

                    document.getElementById("card-erro").style = "display: block; color: green";
                    mensagem_erro.innerHTML = "Login realizado com sucesso";

                    setTimeout(() => {
                        document.getElementById("card-login").style.display = "none";
                        document.getElementById("card-erro").style = "color: red";
                        validar_sessao();
                    }, 800);
                });
            } else {
                resposta.text().then(texto => {
                    console.error(texto);
                });
            }
        }).catch(function (erro) {
            console.log(erro);
        })
    }
}



// APOSTAR
function apostar() {
    var dinheiro = Number(sessionStorage.DINHEIRO_USUARIO);
    var apostaVar = Number(aposta_input.value);

    if (sessionStorage.ULTIMA_APOSTA != undefined || sessionStorage.ULTIMA_APOSTA > 0) {
        document.getElementById("card-erro-aposta").style.display = "block";
        erro_aposta.innerHTML = "Você já fez uma aposta antes";
        return;
    } else if (apostaVar > dinheiro) {
        document.getElementById("card-erro-aposta").style.display = "block";
        erro_aposta.innerHTML = "Você não tem dinheiro suficiente para esta aposta";
        return;
    } else if (apostaVar <= 0) {
        document.getElementById("card-erro-aposta").style.display = "block";
        erro_aposta.innerHTML = "O valor da aposta deve ser acima de 0 reais";
        return;
    } else {
        fetch("/usuarios/movimentarDinheiro", {
            method: "PUT",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                idServer: sessionStorage.ID_USUARIO,
                dinheiroServer: (dinheiro - apostaVar)
            })
        }).then(function (resposta) {
            console.log(resposta);

            if (resposta.ok) {
                sessionStorage.DINHEIRO_USUARIO = (dinheiro - apostaVar);
                valor_dinheiro.innerHTML = sessionStorage.DINHEIRO_USUARIO;
                sessionStorage.ULTIMA_APOSTA = apostaVar;
                valor_aposta.innerHTML = sessionStorage.ULTIMA_APOSTA;
                document.getElementById("card-erro-aposta").style = "display: block; color: green";
                erro_aposta.innerHTML = "Aposta realizada com sucesso";

                setTimeout(() => {
                    document.getElementById("card-login").style.display = "none";
                    document.getElementById("card-erro-aposta").style = "color: red";
                }, 800);
            }
        }).catch(function (erro) {
            console.log(erro);
        })
    }
}


const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
    container.classList.add("right-panel-active");
});
signInButton.addEventListener('click', () => {
    container.classList.remove("right-panel-active");
});




function fechar() {
    document.getElementById("card-login").style.display = "none";
    document.getElementById("card-aposta").style.display = "none";
}




function ver_estatistica() {
    fetch(`/usuarios/verRegistros/${sessionStorage.ID_USUARIO}`, {
        method: "GET",
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function (resposta) {

        if (resposta.ok) {
            console.log(resposta);

            resposta.json().then(json => {
                console.log(json)
            });
        } else {
            resposta.text().then(texto => {
                console.error(texto);
            });
        }
    }).catch(function (erro) {
        console.log(erro);
    })
}