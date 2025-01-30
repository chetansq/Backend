import express, { Application, Request, Response, Router } from 'express';
import * as userController from '../controller/userController';

const userRouter: Router = Router()

// http://127.0.0.1:9999/api/users/home
userRouter.get("/home", (request: Request, response: Response) => {
    response.json({
        msg: "Hello"
    })
})

// http://127.0.0.1:9999/api/users/insertuser
userRouter.post("/insertuser", (request: Request, response: Response) => {
    response.json({
        msg: "Record Inserted .. "
    })
})

userRouter.get("/", async (request: Request, response: Response) => {
    console.log("Inside Router");
    await userController.getAllUsers(request, response)
})

export default userRouter;