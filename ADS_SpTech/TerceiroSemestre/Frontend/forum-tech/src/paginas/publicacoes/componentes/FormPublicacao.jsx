import { useRef } from "react";
import { Button } from "../../../componentes/Button";

export function FormPublicacao(props) {

    const titulo = useRef(null);
    const conteudo = useRef(null);

    function recuperarDados(){
        const dados = {
            titulo: titulo.current.value,
            conteudo: conteudo.current.value
        }
        props.onSubmit(dados);
    }

    return (
        <form className="mx-auto w-5/12 flex flex-col gap-y-4">
            <input type="text" name="titulo"
                ref={titulo}
                defaultValue={props?.titulo || ""}
                placeholder="Digite o título da postagem"
                className="border border-gray-300 px-4 py-2 rounded focus:outline-none focus:ring-2 focus:ring-ft-primary"
            />
            <textarea type="text" name="conteudo"
                ref={conteudo}
                defaultValue={props?.conteudo || ""}
                placeholder="Digite o conteúdo da postagem"
                className="border border-gray-300 px-4 py-2 rounded focus:outline-none focus:ring-2 focus:ring-ft-primary resize-none h-72"
            />
            <Button variant="secondary" onClick={recuperarDados}>Salvar</Button>
        </form>
    )
}