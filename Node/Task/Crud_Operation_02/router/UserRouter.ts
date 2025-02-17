import { Request, Response, Router } from "express";
import * as UserController from "../controller/UserController"
const UserRouter: Router = Router();


// UserRouter.get("/home", (request: Request, response: Response) => {
//     response.status(200).json({
//         msg: "Welcome to Home"
//     });
// });

// UserRouter.post("/insertUser", (request: Request, response: Response) => {
//     response.status(200).json({
//         msg: "Data inserted..."
//     })
// })

// get all users

UserRouter.get("/", async (request: Request, response: Response) => {
    await UserController.getAllUsers(request, response);
});


UserRouter.post("/", async (request: Request, response: Response) => {
    await UserController.createUser(request, response);
});



export default UserRouter