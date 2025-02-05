import express, { Application, Request, Response } from "express"
import dotenv from "dotenv"
import mongoose from "mongoose";
dotenv.config({ path: "./.env" })

import contactRouter from "./router/contactRouter";

// const port: number = 9889;

const port: string | number | undefined = process.env.PORT || 9889;
const hostName: string = "127.0.0.1";

const dbUrl: any = process.env.MONGO_DB_CLOUD_URL;
const dbName: string | undefined = process.env.MONGO_DB_DATABASE;


mongoose.connect(dbUrl, { dbName: dbName }).then(() => console.log('Database connection is ready...')
).catch((err) => console.log(err)
)



const app: Application = express();

// get all users

app.get("/", (request: Request, response: Response) => {
    response.status(200).json({ msg: "Welcome to Home" })
})

app.listen(Number(port), hostName, () => {
    console.log(`express server started http://${hostName}:${port}`);

})

app.use("/api/contacts", contactRouter);
