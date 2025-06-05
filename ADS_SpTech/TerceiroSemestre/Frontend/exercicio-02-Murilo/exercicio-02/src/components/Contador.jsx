import React from "react";

export function Contador() {

const [contador, setContador] = React.useState(0);
const [mensagem, setMensagem] = React.useState("");


function verificar() {
  if(contador <= 30) {
    setContador(contador + 1);

    if (contador < 10) {
      setMensagem("Você está longe de chegar ao 30");
    } else if (contador < 20) {
      setMensagem("Está quase lá!");
    } else if (contador < 30) {
      setMensagem("Falta pouco, você consegue!");
    } else {
      setMensagem("Você chegou em 30 cliques, parabéns!");
    }
  }
}


  return (
    <div>
      <h1>Contador: </h1>
      <p>Mensagem: </p>
      <button onClick={verificar} >
        Contar
      </button>
      <p>{contador}</p>
      <p>{mensagem}</p>
    </div>
  );
}