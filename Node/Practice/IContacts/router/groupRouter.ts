import { Router, Request, Response } from "express";
import * as groupController from "../controller/groupController";

const groupRouter: Router = Router();

groupRouter.get("/", async (requset: Request, response: Response) => {
    await groupController.getAllGroups(requset, response);
});

export default groupRouter;