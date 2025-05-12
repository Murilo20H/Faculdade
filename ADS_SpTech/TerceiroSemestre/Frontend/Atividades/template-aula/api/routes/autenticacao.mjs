import e from "express"
import { autenticacaoService } from "../services/autenticacaoService.mjs";
const autenticacaoRouter = e.Router();

autenticacaoRouter.post("/login",autenticacaoService.login)

export const autenticacao =  autenticacaoRouter;