import { Request, Response, Router } from "express";
import * as UserController from "../controller/UserController"
import { body } from "express-validator";

const UserRouter: Router = Router();

// UserRouter.get("/home", (request: Request, response: Response) => {
//     response.status(200).json({
//         msg: "welcome to home"
//     })
// })


// UserRouter.post("/insertUser", (request: Request, response: Response) => {

//     response.status(200).json({
//         msg: "Data inserted .."
//     })
// })

// @usage  : get all users
// @method : get
// @params : no-params
// @url    :http://127.0.0.1:9889/users

UserRouter.get("/", async (request: Request, response: Response) => {
    await UserController.getAllUsers(request, response);
})


// @usage  : create user
// @method : post
// @params : no-params
// @url    :http://127.0.0.1:9889/users

UserRouter.post("/",
    [body('username').not().isEmpty().withMessage('UserName is required')],
    [body('email').not().isEmpty().withMessage('Email is required')],

    async (request: Request, response: Response) => {
        console.log("post");

        await UserController.createUser(request, response);
    })

export default UserRouter