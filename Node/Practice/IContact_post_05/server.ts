import express, { Request, Response, Application, response } from "express"

const hostName: string = "127.0.0.1"
const port: number = 9498

const app: Application = express();


app.get("/", (request: Request, response: Response) => {
    response.status(200).json({
        msg: "Welcome to Express Server"
    })
})

app.listen(port, hostName, () => {

    response.status(200)
    console.log(`Express server is started http://${hostName}:${port}`)

})


import GroupRouter from "./router/GroupRouter";

// configure the router

app.use("/api/groups", GroupRouter);