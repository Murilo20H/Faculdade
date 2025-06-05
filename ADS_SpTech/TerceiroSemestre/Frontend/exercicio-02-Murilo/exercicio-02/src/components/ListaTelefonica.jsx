import React, { useState } from "react";

export function ListaTelefonica() {

  const [nome, setNome] = useState("");
  const [sobrenome, setSobrenome] = useState("");
  const [telefone, setTelefone] = useState("");
  const [contatos, setContatos] = useState([]);


  function cadastrarContato() {
    const novoContato = { nome, sobrenome, telefone };
    setContatos([...contatos, novoContato]);
  }


  function excluirContato(index) {
    const novaLista = contatos.filter((contato, i) => i != index);
    setContatos(novaLista);
  }
  
  return (
    <div>
      <h1>Lista Telefônica</h1>

      <input type="text" name="nome" placeholder="Nome" value={nome} onChange={(event) => setNome(event.target.value)} />
      <input type="text" name="sobrenome" placeholder="Sobrenome" value={sobrenome} onChange={(event) => setSobrenome(event.target.value)} />
      <input type="text" name="telefone" placeholder="Telefone" value={telefone} onChange={(event) => setTelefone(event.target.value)} />

      <button onClick={cadastrarContato}>Cadastrar</button>


      <ul>
        {contatos.map((contato, index) => (
          <li>
            Nome do contato: {contato.nome} Sobrenome do contato: {contato.sobrenome} Telefone do contato: {contato.telefone}
            <button onClick={() => excluirContato(index)}>Excluir</button>
          </li>
        ))}
      </ul>
    </div>
  );
}





