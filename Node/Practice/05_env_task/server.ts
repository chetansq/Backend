import express, { Application, Request, Response } from "express"
import userRouter from "./router/userRouter";
import mongoose from "mongoose";
import dotenv from "dotenv"

// const port: number = 8899;

dotenv.config({path:"./.env"})

const port: string | number | undefined = process.env.PORT || 8899;
const hostName: string = '127.0.0.1';

const dbUrl: any = process.env.MONGO_DB_CLOUD_URL;
const dbName: string | undefined = process.env.MONGO_DB_DATABASE;

mongoose.connect(dbUrl, { dbName: dbName }).then(() => console.log("Database Connection Is Ready ....")).catch((err) => console.log(err))


const app: Application = express();

app.get("/", (request: Request, response: Response) => {
    response.status(200).json({ msg: "welcome express server" })
})

app.listen(Number(port), hostName, () => {
    console.log(` Express Server Started http://${hostName}:${port}`);
})

app.use('/api/users', userRouter);