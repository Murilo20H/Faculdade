import { useRef, useState } from "react"

export function Form(){
    const [data, setData] = useState({
        nome:"Nome",
        email:"dev@email.com",
        senha:"123456"
    })

    const contadorRef = useRef(0)
    const inputRef = useRef(undefined)

    function cliqueAqui(){
        contadorRef.current++
    }

    function habilitarFocus() {
        inputRef.current.focus()
    }

    return (
        <div className="flex flex-col gap-4">
            <div className="flex flex-col">
                <label htmlFor="nome">Nome</label>
                <input type="text" id="nome" defaultValue={data.nome} ref={inputRef} className="border border-black w-52 px-2 py-1" onChange={(e) => {
                    setData({...data, nome: e.target.value})
                }}/>
            </div>

            <div className="flex flex-col">
                <label htmlFor="email">Email</label>
                <input type="text" id="email" value={data.email} className="border border-black w-52 px-2 py-1" onChange={(e) => {
                    setData({...data, email: e.target.value})
                }}/>
            </div>

            <div className="flex flex-col">
                <label htmlFor="senha">Senha</label>
                <input type="password" id="senha" value={data.senha} className="border border-black w-52 px-2 py-1" onChange={(e) => {
                    setData({...data, senha: e.target.value})
                }}/>
            </div>

            <div>
                Nome: {data.nome}
                <br/>
                Email: {data.email}
                <br/>
                Senha: {data.senha}
            </div>

            <button onClick={habilitarFocus}>Clique aqui</button>
            <div>
                Contador: {contadorRef.current}
            </div>
        </div>
    )
}