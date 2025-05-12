import { hash } from "bcryptjs";
import { usuarioRespository } from "../repository/usuarioRespository.mjs";

export const UsuarioService = ()=>{

  const createUser = async (req, res) => {
    const { nome, email, senha } = req.body;

    if (!nome || !email || !senha) {
      return res
        .status(400)
        .json({ error: "All fields (nome, email, password) are required." });
    }

    if (typeof email !== "string" || !email.includes("@")) {
      return res.status(400).json({ error: "Invalid email format." });
    }

    if (senha.length < 6) {
      return res
        .status(400)
        .json({ error: "Password must be at least 6 characters long." });
    }
    
    if(usuarioRespository.existsByEmail(email)) return res.status(409).send();


    try {
      const senhaCriptograda = await hash(senha, 10);
      await usuarioRespository.save({
        nome,
        email,
        senha: senhaCriptograda,
      })
      return res.status(201).send();
    } catch (err) {
      return res
        .status(500)
        .json({ error: "An error occurred while creating the user." });
    }
  };

  return {
    createUser,
  }
}

export const usuarioService = UsuarioService(); 