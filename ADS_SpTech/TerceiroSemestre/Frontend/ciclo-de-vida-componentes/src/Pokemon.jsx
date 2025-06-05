import { useEffect, useState } from "react";

export function Pokemon() {
    const [informacoes, setInformacoes] = useState({
        nome: "",
        experiencia: 0,
        habilidades: []
    });

    useEffect(() => {
        fetch("https://pokeapi.co/api/v2/pokemon/ditto")
            .then(resposta => resposta.json())
            .then(json => {
                setInformacoes({
                    nome: json.name,
                    experiencia: json.base_experience,
                    habilidades:json.abilities
                });
            }).catch(erro => console.log("ERROR: " + erro));
    }, []);

    const onClickButton = () => {
        const nomePokemon = document.getElementById("pokemon").value;
        fetch(`https://pokeapi.co/api/v2/pokemon/${nomePokemon}`)
            .then(resposta => resposta.json())
            .then(json => {
                setInformacoes({
                    nome: json.name,
                    experiencia: json.base_experience,
                    habilidades:json.abilities
                });
            }).catch(erro => console.log("ERROR: " + erro));
    }

    return (
        <div>
            <h2>Nome do Pokemon: {informacoes.nome}</h2>
            <p>Experiência: {informacoes.experiencia}</p>
            <p>Habilidades: </p>
            {informacoes.habilidades.map((habilidade) => (
                <div>
                    <p>Nome da Habilidade: {habilidade.ability.name} ({habilidade.ability.url})</p>
                </div>
            ))}
            <input id="pokemon" type="text"/>
            <button onClick={onClickButton}>Procurar o Pokemon</button>
        </div>
    );
}