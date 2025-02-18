import { Request, Response, Router } from "express"
import * as USerController from "../controller/UserController"

const UserRouter: Router = Router();

// UserRouter.get("/home", (request: Request, response: Response) => {
//     response.status(200).json({
//         msg: "Welcome to Home..🐱‍🐉"
//     })
// })

// UserRouter.post("/insert", (request: Request, response: Response) => {
//     response.status(200).json({
//         msg: "Data Inserted ... ✔"
//     })
// })

// @usage : to get all users
// @method : GET
// @params : no-params
// @url : http://127.0.0.1:9779/users

UserRouter.get("/", async (request: Request, response: Response) => {
    await USerController.getAllUsers(request, response);
})



// @usage : create users
// @method : POST
// @params : username, email, password, imageUrl, isAdmin
// @url : http://127.0.0.1:9779/users

UserRouter.post("/", async (request: Request, response: Response) => {
    await USerController.createUser(request, response);
})

export default UserRouter   