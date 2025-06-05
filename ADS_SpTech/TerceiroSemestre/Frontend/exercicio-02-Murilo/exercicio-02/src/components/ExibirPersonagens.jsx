import React from "react";

export function ExibirPersonagem() {
  const [personagens, setPersonagens] = React.useState([]);
  React.useEffect(() => {
    fetch("https://rickandmortyapi.com/api/character")
      .then(res => res.json())
      .then(data => setPersonagens(data.results));
  }, []);
  console.log(personagens);



  return (
    <div>
      <h1>Personagens</h1>
      <ul>
        {personagens.map((personagem) => (
          <li key={personagem.id}>
            Nome do personagem: {personagem.name} <br />
            <img src={personagem.image} alt={personagem.name} width={100} />
          </li>
        ))}
       
      </ul>
    </div>
  );
}

