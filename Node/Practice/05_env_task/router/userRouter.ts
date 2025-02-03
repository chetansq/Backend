import { Request, Response, Router } from "express";
import * as userController from "../controller/userController"

const userRouter: Router = Router();


// userRouter.get("/home", (request: Request, response: Response) => {

//     response.status(200).json({
//         msg: "welcome home"
//     })
// })

// userRouter.post("/insertUser", (request: Request, response: Response) => {
//     response.status(200).json({
//         msg: "data inserted..."
//     })
// })

userRouter.get("/", async (request: Request, response: Response) => {
    console.log("Inside Server");

    await userController.getAllUsers(request, response)
})

export default userRouter