import e from "express";
import { postagemService } from "../services/postagensService.mjs";

const postagemRouter = e.Router();

postagemRouter.get("", postagemService.getPostagens);
postagemRouter.get("/:id", postagemService.getPostagensPorId);
postagemRouter.post("", postagemService.postPostagens);
postagemRouter.patch("/:id", postagemService.updatePostagens);
postagemRouter.delete("/:id", postagemService.deletePostagens);

export const postagens = postagemRouter;