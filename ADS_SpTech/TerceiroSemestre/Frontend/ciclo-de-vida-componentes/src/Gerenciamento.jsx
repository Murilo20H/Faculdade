import { useState } from "react";
import { Formulario } from "./Formulario";

export function Gerenciamento(){
  const [desabilitarTodos, setDesabilitarTodos] = useState(false);
  const [textoBotao, setTextoBotao] = useState("Desabilitar Todos os Formularios");

  const onClickButton = () => {
    setDesabilitarTodos(!desabilitarTodos);
    if (desabilitarTodos) {
      setTextoBotao("Desabilitar Todos os Formularios");
    } else {
      setTextoBotao("Habilitar Todos os Formularios");
    }
  }

  return(
    <div>
      <button onClick={onClickButton}>{textoBotao}</button>
      <Formulario desabilitarTodos={desabilitarTodos}/>

      <Formulario desabilitarTodos={desabilitarTodos}/>
      
      <Formulario desabilitarTodos={desabilitarTodos}/>
    </div>
  )
}

