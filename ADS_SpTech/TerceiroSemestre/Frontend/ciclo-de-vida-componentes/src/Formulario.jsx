import { useEffect, useState } from "react"

export function Formulario(props){
  const [disabled,setDisabled] = useState(false);
  const [textoBotao,setTextoBotao] = useState("Desabilitar Formulario");

  useEffect(() => {
    setDisabled(props.desabilitarTodos);
    if (props.desabilitarTodos) {
      setTextoBotao("Habilitar Formulario");
    } else {
      setTextoBotao("Desabilitar Formulario");
    }
  }, [props.desabilitarTodos]); 

  const onClickForm = () => {
    setDisabled(!disabled);
    if (disabled) {
      setTextoBotao("Desabilitar Formulario");
    } else {
      setTextoBotao("Habilitar Formulario");
    }
  }
  
  return(
  <div>
    <div>
      <label htmlFor="nome">Nome</label>
      <input type="text" id="nome" disabled={disabled}/>
    </div>
    <div>
      <label htmlFor="profissao">Profissao</label>
      <input type="text" id="profissao" disabled={disabled}/>
    </div>
    <div>
      <label htmlFor="comentario">Comentario</label>
      <input type="text" id="comentario" disabled={disabled} />
    </div>

    <button onClick={onClickForm}>{textoBotao}</button>
  </div>)
}