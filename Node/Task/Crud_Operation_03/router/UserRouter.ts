import { Request, Response, Router } from "express"
import * as UserController from "../controller/UserController"

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
    await UserController.getAllUsers(request, response);
})


// @usage : create users
// @method : POST
// @params : username, email, password, imageUrl, isAdmin
// @url : http://127.0.0.1:9779/users

UserRouter.post("/", async (request: Request, response: Response) => {
    await UserController.createUser(request, response);
})


// @usage : get userId
// @method : GET
// @params : userId
// @url : http://127.0.0.1:9699/users/67b42a66725c3496c7a72d98

UserRouter.get("/:userId", async (request: Request, response: Response) => {
    await UserController.getUserId(request, response);
})


// @usage : update user
// @method : PUT
// @params : userId, username, email, password, imageUrl, isAdmin 
// @url : http://127.0.0.1:9699/users/67b453605014e3de0066e8f6

UserRouter.put("/:userId", async (request: Request, response: Response) => {
    await UserController.updateUser(request, response);
})


UserRouter.delete("/:userId", async (request: Request, response: Response) => {
    await UserController.deleteUser(request, response);
})

export default UserRouter   