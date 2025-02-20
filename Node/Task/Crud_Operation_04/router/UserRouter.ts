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

// @usage : create user(Post)
// @method : POST
// @params : name, email, password, isAdmin
// @url :http://127.0.0.1:9669/users

UserRouter.post("/", async (request: Request, response: Response) => {
    await UserController.createUser(request, response);
});

// @usage : get userId
// @method : GET
// @params :userId
// @url : http://127.0.0.1:9669/users/67b6ad8ff050bd6cb1222d66

UserRouter.get("/:userId", async (request: Request, response: Response) => {

    console.log("inside router userId");

    await UserController.getUserId(request, response);
});

// @usage : update user
// @method : PUT
// @params : userId, name, email, password, isAdmin
// @url :http://127.0.0.1:9669/users/67b6ad8ff050bd6cb1222d66

UserRouter.put("/:userId", async (request: Request, response: Response) => {
    await UserController.updateUser(request, response);
});


UserRouter.delete("/:userId", async (request: Request, response: Response) => {
    await UserController.deleteUser(request, response);
});

export default UserRouter