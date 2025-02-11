import { Request, Response, Router } from "express";
import { request } from "http";

const GroupRouter: Router = Router();

GroupRouter.get("/home", (request: Request, response: Response) => {
    response.status(200).json({
        msg: "Welcome home"
    })
})


GroupRouter.post("/insertGroups", (request: Request, response: Response) => {
    response.status(200).json({
        msg: "data inserted"
    })
})

import * as GroupController from "../controller/GroupController"

GroupRouter.get("/", async (request: Request, response: Response) => {
    await GroupController.getAllGroups(request, response);
})


export default GroupRouter