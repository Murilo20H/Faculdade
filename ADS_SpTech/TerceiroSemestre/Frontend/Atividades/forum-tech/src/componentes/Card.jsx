import { CiChat1 } from "react-icons/ci";
import { IoMdMore } from "react-icons/io";

export function Card(props) {
    const calcularTempoRelativo = (dataCriacao) => {
        const agora = new Date();
        const data = new Date(dataCriacao);
        const diferenca = Math.abs(agora - data);

        const segundos = Math.floor(diferenca / 1000);
        const minutos = Math.floor(segundos / 60);
        const horas = Math.floor(minutos / 60);
        const dias = Math.floor(horas / 24);

        if (dias > 0) return `${dias} dia${dias > 1 ? 's' : ''} atrás`;
        if (horas > 0) return `${horas} hora${horas > 1 ? 's' : ''} atrás`;
        if (minutos > 0) return `${minutos} minuto${minutos > 1 ? 's' : ''} atrás`;
        return `${segundos} segundo${segundos > 1 ? 's' : ''} atrás`;
    };

    const tempoRelativo = calcularTempoRelativo(props.criadoEm);

    return (
        <div className="px-4 py-7 flex flex-col gap-4 bg-white rounded-md max-w-[550px]">
            <div className="flex justify-between items-center">
                <div className="flex gap-2">
                    <img src="/images/banner.png" className="w-10 h-10 rounded-full object-cover" />
                    <div className="flex flex-col justify-center">
                        <span className="text-[13px] font-medium">{props.usuario.nome}</span>
                        <span className="text-[10px] text-ft-gray-white">{tempoRelativo}</span>
                    </div>
                </div>
                <div>
                    <IoMdMore size={"20px"} />
                </div>
            </div>

            <div>
                <h3 className="text-sm font-semibold mb-1">{props.titulo}</h3>
                <p className="text-sm font-light">{props.conteudo}</p>
            </div>

            <div className="flex gap-2">
                <CiChat1 />
                <span className="text-xs text-ft-gray-white">
                    15
                </span>
            </div>
        </div>
    )
}