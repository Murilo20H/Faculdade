export function Botao(props) {

    return (
        <button className="p-2 bg-red-700 w-32 rounded-lg">
            Teste

            {props.children}
        </button>
    )
}