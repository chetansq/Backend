import { Request, Response, Router } from "express";
import * as UserController from "../controller/UserController";

const UserRouter: Router = Router();

// UserRouter.get("/home", (request: Request, response: Response) => {
//     response.status(200).json({
//         msg: "welcome to home...🙏"
//     });
// });

// UserRouter.post("/users", (request: Request, response: Response) => {
//     response.status(200).json({
//         msg: "Data inserted.>>> ✅"
//     });
// });

UserRouter.get("/", async (request: Request, response: Response) => {
    console.log("getAllUsers");
    
    await UserController.getAllUsers(request, response);
})

export default UserRouter