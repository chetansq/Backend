import { Router, Request, Response } from "express";
import * as UserController from "../controller/UserController";
import { body } from "express-validator";

const UserRouter: Router = Router();

UserRouter.get("/", async (request: Request, response: Response) => {
    console.log("Get All Users");

    await UserController.getAllUsers(request, response);
});


UserRouter.post("/register",
    [
        body('username').not().isEmpty().withMessage("User name is required"),
        body('email').isEmail().withMessage("Email is required"),
        body('password').not().isStrongPassword().withMessage("Password is required"),
    ],
    async (request: Request, response: Response) => {
        console.log("User Register");

        await UserController.userRegister(request, response);
    })
export default UserRouter