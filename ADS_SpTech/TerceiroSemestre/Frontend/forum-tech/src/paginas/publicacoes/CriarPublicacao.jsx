import { FormPublicacao } from "./componentes/FormPublicacao";
import { ENDPOINTS } from "../../constantes/endpoints";
import { api } from "../../http/axios-instance"
import { ROUTERS } from "../../constantes/routers";
import { useNavigate } from "react-router-dom";

export function CriarPublicacao() {
    const navigate = useNavigate();

    function exibirDados(data) {
        api.post(ENDPOINTS.POSTAGENS, data)
            .then(() => {
                alert('Postagem criada com sucesso!');
                navigate(ROUTERS.POSTS);
            })
            .catch(error => {
                console.error('Erro ao criar publicação:', error);
            });
    }

    return (
        <FormPublicacao onSubmit={exibirDados} />
    )
}