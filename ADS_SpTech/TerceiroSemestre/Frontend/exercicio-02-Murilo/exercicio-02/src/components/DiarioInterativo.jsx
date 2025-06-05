import React from "react";

export function DiarioInterativo() {
  
 
const [texto, setTexto] = React.useState("");

React.useEffect(() => {
  const textoSalvo = localStorage.getItem("diario");

  if(textoSalvo){
    setTexto(textoSalvo);
  }
}, []);


React.useEffect(() => {
  localStorage.setItem("diario", texto);
}, [texto]);





  return (
    <div>
      <h1>Diário Interativo</h1>
      <textarea
        placeholder="Escreva suas anotações aqui..."
        rows={10}
        value={texto} onChange={(evento)=> setTexto(evento.target.value)}
      />
    </div>
  );
}





