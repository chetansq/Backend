import { Request, Response, Router } from "express";
import * as userController from '../controller/userController'

const userRouter: Router = Router();

// userRouter.get("/", (request: Request, response: Response) => {
//     response.status(200).json({ msg: "welcome Home" })
// })

// userRouter.post("/insertUser", (request: Request, response: Response) => {
//     response.status(200).json({ msg: "inserted Data..." })
// })

userRouter.get('/', async (request: Request, response: Response) => {
    console.log("inside Router");

    await userController.getAllUsers(request, response)
})

export default userRouter