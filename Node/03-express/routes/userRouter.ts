import express, { Application, Request, Response, Router } from 'express';

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

export default userRouter;