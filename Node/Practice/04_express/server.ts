import express, { Request, Response, Application } from "express"
import recipesRouter from "./router/recipesRouter";

const hostName: string = "127.0.0.1";
const port: number = 9797;

const app: Application = express();

app.get('/', (request: Request, response: Response) => {
    response.status(200).json({
        msg: "welcome to express server"
    })
})

app.listen(port, hostName, () => {
    console.log(`Express Server Started http://${hostName}:${port}`);

})

app.use("/api/users",recipesRouter)