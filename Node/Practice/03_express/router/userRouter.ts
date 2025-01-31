import { Request, Response, Router } from "express";
import { request } from "http";
import * as userController from '../controller/userController'
const userRouter: Router = Router();

// userRouter.get('/home', (request: Request, response: Response) => {
//     response.status(200).json({
//         msg: "welcome Home"
//     })
// })

// userRouter.post("/insertUser", (request: Request, response: Response) => {
//     response.status(200).json({
//         msg: "Data Inserted.."
//     })
// })

userRouter.get("/", async (request: Request, response: Response) => {
    await userController.getAllUsers(request, response)
})

export default userRouter