import React from 'react'

export function Calculadora() {

  const[valor1, setValor1] = React.useState(0);
  const[valor2, setValor2] = React.useState(0);
  const[operacao, setOperacao] = React.useState("MULTIPLICAR");
  const[resultado, setResultado] = React.useState(0);


  function calcular() {

    const num1 = Number(valor1);
    const num2 = Number(valor2);

    if (operacao === "MULTIPLICAR") {
      setResultado(num1 * num2);
    } else if (operacao === "SUBTRAIR") {
      setResultado(num1 - num2);
    } else if (operacao === "DIVIDIR") {
      setResultado(num2 === num1 / num2 );
    } else if (operacao === "SOMAR") {
      setResultado(num1 + num2);
    }
  }


  return (
    <div>
      <input type="number"  value={valor1}
        onChange={(e) => setValor1(e.target.value)}/>

      <input type="number" value={valor2}
        onChange={(e) => setValor2(e.target.value)} />

      <select value={operacao} onChange={(evento) => setOperacao(evento.target.value)}>
        <option value="MULTIPLICAR">MULTIPLICAR</option>
        <option value="SUBTRAIR">SUBTRAIR</option>
        <option value="DIVIDIR">DIVIDIR</option>
        <option value="SOMAR">SOMAR</option>
      </select>
      <button onClick={calcular}>Calcular</button>
     <p>Resultado da operação: {resultado}</p> 
    </div>
  )
}

