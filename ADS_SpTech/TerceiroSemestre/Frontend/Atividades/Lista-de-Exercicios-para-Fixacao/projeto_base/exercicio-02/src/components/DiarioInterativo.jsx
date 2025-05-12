import React from "react";

export function DiarioInterativo() {
 
  return (
    <div>
      <h1>Diário Interativo</h1>
      <textarea
        placeholder="Escreva suas anotações aqui..."
        rows={10}
      />
    </div>
  );
}