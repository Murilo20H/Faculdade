
import { useEffect, useState } from "react"
import { ENDPOINTS } from "../../constantes/endpoints"
import { api } from "../../http/axios-instance"
import { Card } from "../../componentes/Card"

export const Publicacoes = () => {
  const [postagens, setPostagens] = useState([]);

  useEffect(() => {
    api.get(ENDPOINTS.POSTAGENS).then(resposta => setPostagens(resposta.data))
      .catch(erro => console.log(erro))
  }, [])

  return (
    <section className="overflow-y-auto max-h-[100vh] flex-1 bg-slate-300 scrollbar-hide">
      <div className="w-10/12 mx-auto gap-5 flex flex-col py-4">
      {postagens.map((postagem, index) => (
          <Card key={index} {...postagem} />
        ))}
      </div>      
    </section>
  )
}
