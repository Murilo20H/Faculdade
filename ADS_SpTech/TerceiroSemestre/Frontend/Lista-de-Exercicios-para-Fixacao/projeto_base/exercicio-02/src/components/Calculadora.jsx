import React from 'react'

export function Calculadora() {

  return (
    <div>
      <input type="number" />
      <input type="number" />
      <select>
        <option value="MULTIPLICAR">MULTIPLICAR</option>
        <option value="SUBTRAIR">SUBTRAIR</option>
        <option value="DIVIDIR">DIVIDIR</option>
        <option value="SOMAR">SOMAR</option>
      </select>
      <button>Calcular</button>
      Resultado da operação: ____
    </div>
  )
}

