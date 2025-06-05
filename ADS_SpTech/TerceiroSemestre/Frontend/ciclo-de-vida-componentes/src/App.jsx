import { useState } from "react";
import "./App.css"
import Card from "./Card"
import { Gerenciamento } from "./Gerenciamento";
import { Pokemon } from "./Pokemon";

function App() {

// const [contadora, setContadora] = useState(0);

  // const contarNumero = ()=>{
  //   setContadora(contadora + 1);
  // }

  return (
    <div>

      {/* 
      Adicionando contadora
      {contadora}<br/>
      {contadora > 30 && "Maior que 30" } */}
      
      
      {/* 
      Adicionando Card
      <Card paragrafo={"Professor nota 10"}/>
      <Card titulo={"Pedro"} paragrafo={"Ele é inteligente"}/>
      <Card titulo={"Fernando"} paragrafo={"Ele é legal"}/> */}

    {/* 
    Adicionando Contadora
    <button onClick={contarNumero}>
      Contar
    </button> */}

    {/* <Gerenciamento/> */}

    <Pokemon/>

    </div>
  )
}

export default App
