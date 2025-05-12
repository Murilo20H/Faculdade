import { useEffect, useState } from 'react'
import './App.css'
import { api } from './provider/apiInstance'
import { Card } from './Card'
import { Form } from './Form'
import { Botao } from './Botao'

function App() {
  
  useEffect(()=>{},[])

  function adicionarUsuario(){

    // fetch("http://localhost:3000/usuarios",{
    //   headers:{
    //     "Content-type":"application/json"
    //   },
    //   method:"POST",
    //   body:JSON.stringify({
    //     nome:"Pedro",
    //     dataNascimento:"2001-08-19",
    //     profissao:"Professor"
    //   })
      
    // })

    api.post("/usuarios",{
      nome:"Pedro",
      dataNascimento:"2001-08-19",
      profissao:"Professor"
    })
  }


  function buscarUsuarios(){
   api.get("/usuarios")
   .then(response=>{
    console.log(response.data)
   }) 
  }

  function atualizarUsuario(){
    api.put("/usuarios/3c10",{
      nome:"Teste",
      dataNascimento:"2001-08-21",
      profissao:"Professor"
    })
  }

  function removerUsuario(){
    api.delete("/usuarios/3c10")
    .then(()=>console.log("Delete funcionou"))
  }

  return (
    <>
      {/* <button onClick={adicionarUsuario}>Adicionar Usuario</button>
      <button onClick={buscarUsuarios}>Buscar Usuarios</button>
      <button onClick={atualizarUsuario}>Atualizar usuario</button>
      <button onClick={removerUsuario}>Remover usuario</button> */}

    {/* <div className='flex w-full h-screen justify-center items-center'>
      <Card/>
    </div> */}

      {/* <Form/> */}

      <Botao>Teste</Botao>
    </>
  )
}

export default App
