import { Request, Response, Router } from "express";
import { body } from "express-validator";

const UserRouter: Router = Router();


// UserRouter.get("/home", (request: Request, response: Response) => {
//     response.status(200).json({
//         msg: "Welcome to home"
//     })
// })

// UserRouter.post("/insertUser", (request: Request, response: Response) => {
//     response.status(200).json({
//         msg: "DataInserted.."
//     })
// })

import * as UserController from "../controller/UserController"



// @usage  : get all users
// @method : get
// @params : no-params
// @url    :http://127.0.0.1:9797/users

UserRouter.get("/", async (request: Request, response: Response) => {
    await UserController.getAllUsers(request, response)
})


UserRouter.post("/", [body('username').not().isEmpty().withMessage("Name is Required")],
    [body('email').not().isEmpty().withMessage("Email is Required")],
    [body('password').not().isEmpty().withMessage("Password is Required")],
    [body('imageUrl').not().isEmpty().withMessage("Image is Required")],
    [body('isAdmin').not().isEmpty().withMessage("IsAdmin is Required")],

    async (request: Request, response: Response) => {
        console.log("post");
        await UserController.createUser(request, response);
    }

)


export default UserRouter