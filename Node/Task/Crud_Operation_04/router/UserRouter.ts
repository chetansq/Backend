import { Request, Response, Router } from "express"
import * as UserController from "../controller/UserController"

const UserRouter: Router = Router();


// UserRouter.get("/home", (request: Request, response: Response) => {
//     response.status(200).json({
//         msg: "Welcome to Home"
//     });
// });


// UserRouter.post("/insertUser", (request: Request, response: Response) => {
//     response.status(200).json({
//         msg: "Data Inserted....✅"
//     });
// });

// @usage : get all users
// @method : GET
// @params : no-params
// @url :http://127.0.0.1:9669/users

UserRouter.get("/", async (request: Request, response: Response) => {
    await UserController.getAllUser(request, response);
});


UserRouter.post("/", async (request: Request, response: Response) => {
    await UserController.createUser(request, response);
});


export default UserRouter