import express, { Request, Response, Application } from 'express'

import userRouter from './router/UserRouter';

const hostName: string = '127.0.0.1';
const port: number = 9898;

const app: Application = express();

app.get('/', (request: Request, response: Response) => {
    response.status(200);
    response.json({ msg: "welcome to exress server" })
})

app.listen(port, hostName, () => {
    console.log(`express server started http://${hostName}:${port}`);
})

app.use("/api/users", userRouter)

