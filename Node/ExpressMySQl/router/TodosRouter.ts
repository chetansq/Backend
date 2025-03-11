import { Request, Response, Router } from "express";
import { createToDo, deleteToDo, getAllToDo, getByIdToDo, updateToDo } from "../controller/TodosController";


const todosRouter: Router = Router();


todosRouter.get("/", getAllToDo);
todosRouter.post("/inserttodos", createToDo);
todosRouter.get("/:todoId", getByIdToDo);
todosRouter.delete("/:deleteId", deleteToDo);
todosRouter.put("/:updateId", updateToDo);

export default todosRouter;