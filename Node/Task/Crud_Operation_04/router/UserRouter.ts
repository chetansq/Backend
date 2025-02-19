import { Request, Response, Router } from "express"

const UserRouter: Router = Router();


UserRouter.get("/home", (request: Request, response: Response) => {
    response.status(200).json({
        msg: "Welcome to Home"
    });
});


UserRouter.post("/insertUser", (request: Request, response: Response) => {
    response.status(200).json({
        msg: "Data Inserted....✅"
    });
});

export default UserRouter