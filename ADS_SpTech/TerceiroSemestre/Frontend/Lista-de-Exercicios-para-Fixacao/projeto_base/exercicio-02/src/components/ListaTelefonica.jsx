import React from "react";

export function ListaTelefonica() {

  return (
    <div>
      <h1>Lista Telefônica</h1>

      <input type="text" name="nome" placeholder="Nome" />
      <input type="text" name="sobrenome" placeholder="Sobrenome" />
      <input type="text" name="telefone" placeholder="Telefone" />

      <button>Cadastrar</button>

      <ul>
          <li>
            Nome do contato: ___ Sobrenome do contato ___ Telefone do contato ___
            <button>Excluir</button>
          </li>
      </ul>
    </div>
  );
}