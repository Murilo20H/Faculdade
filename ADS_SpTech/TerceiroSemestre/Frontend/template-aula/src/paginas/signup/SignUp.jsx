import React, { useRef } from 'react'
import { Button } from '../../componentes/Button'
import { useNavigate } from 'react-router-dom'
import { api } from '../../http/axios-instance'
import { ENDPOINTS } from '../../constantes/endpoints'
import { ROUTERS } from '../../constantes/routers'

export const SignUp = () => {
  const navigate = useNavigate()

  const nome = useRef(null)
  const email = useRef(null)
  const senha = useRef(null)

  const realizarCadastro = () => {
    const novoUsuario = {
      nome: nome.current.value,
      email: email.current.value,
      senha: senha.current.value,
    }

    api
      .post(ENDPOINTS.USERS, novoUsuario)
      .then(() => {
        alert('Cadastro realizado com sucesso!')
        setTimeout(() => {
          navigate(ROUTERS.LOGIN)
        }, 5000)
      })
      .catch((e) => {
        console.error(e)
        alert('Erro ao realizar cadastro. Tente novamente.')
      })
  }

  return (
  <main className="grid grid-cols-6 grid-rows-1 h-[calc(100vh-5rem)] bg-ft-background">
    <section className="col-span-3 h-full w-9/12 mx-auto flex flex-col gap-4 justify-center">
      <div>
        <h1 className="font-black mb-2 text-2xl">Crie sua conta</h1>
        <h2 className="font-light text-[1.2rem]">Crie uma conta para acessar o Forum.</h2>
      </div>

      <p className="text-xs font-light">
        Já possui uma conta? <b className="text-ft-secondary font-bold underline" onClick={() => navigate(ROUTERS.LOGIN)}>Acesse aqui</b>.
      </p>

      <form className="flex flex-col gap-y-4 w-full">
        <div className="flex flex-col gap-y-2">
          <label className="text-ft-gray-white">Nome</label>
          <input
            type={'text'}
            ref={nome}
            placeholder={'Insira seu nome'}
            className="border border-gray-300 px-4 py-2 rounded focus:outline-none focus:ring-2 focus:ring-ft-primary"
          />
        </div>
        <div className="flex flex-col gap-y-2">
          <label className="text-ft-gray-white">Email</label>
          <input
            type={'email'}
            ref={email}
            placeholder={'Insira seu e-mail'}
            className="border border-gray-300 px-4 py-2 rounded focus:outline-none focus:ring-2 focus:ring-ft-primary"
          />
        </div>
        <div className="flex flex-col gap-y-2">
          <label className="text-ft-gray-white">Senha</label>
          <input
            type={'password'}
            ref={senha}
            placeholder={'Insira sua senha'}
            className="border border-gray-300 px-4 py-2 rounded focus:outline-none focus:ring-2 focus:ring-ft-primary"
          />
        </div>
        <Button type="button" className="w-max mx-auto" onClick={realizarCadastro}>
          Cadastrar
        </Button>
      </form>
    </section>
    <section className="col-span-3 h-full">
      <img src="/images/background-signup.png" alt="" className="h-full w-full object-cover rounded-l-3xl" />
    </section>
  </main>)
}
