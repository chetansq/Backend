import { Request, Response, Router } from "express";
import * as groupController from "../controller/groupController"

const groupRouter: Router = Router();

groupRouter.get("/", async (request: Request, response: Response) => {
    await groupController.getAllGroups(request, response);
})

export default groupRouter