import e from "express";
import { usuarioService } from "../services/usuariosService.mjs";


const usuariosRouter = e.Router();

usuariosRouter.post("",usuarioService.createUser)

export const usuarios = usuariosRouter;