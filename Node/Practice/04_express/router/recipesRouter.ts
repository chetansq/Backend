import { Request, Response, Router } from "express";
import * as recipesController from "../controller/recipesController"

const recipesRouter: Router = Router();

// recipesRouter.get("/home", (request: Request, response: Response) => {
//     response.status(200).json({
//         msg: "Welcome to Home"
//     })
// })

// recipesRouter.post("/insertUser", (request: Request, response: Response) => {
//     response.status(200).json({
//         msg: "Data Inserted..."
//     })
// })

recipesRouter.get("/", async (request: Request, response: Response) => {
    console.log("Inside Router");
    await recipesController.getAllRecipes(request, response)
})

export default recipesRouter