import express, { Request, Response, Application } from "express";
import dotenv from 'dotenv';
import mongoose from "mongoose";

dotenv.config({ path: "./.env" });

const hostName: string = "127.0.0.1";
const port: string | number | undefined = process.env.PORT || 9980;
const dbUrl: any = process.env.MONGO_DB_CLOUD_URL;
const dbName: string | undefined = process.env.MONGO_DB_DATABASE;

const app: Application = express();

app.get("/", (request: Request, response: Response) => {
    response.status(200).json({ msg: "Welcome to express server" });
})

import groupRouter from "./router/groupRouter";

app.use("/groups", groupRouter);

app.listen(Number(port), () => {
    if (dbUrl && dbName) {
        mongoose.connect(dbUrl, { dbName: dbName }).then((dbResponse) => {
            console.log("Connection Established...");
        }).catch((error) => {
            console.log(error);
            process.exit(0); // force the stop server

        });
    }
    console.log(` Express server started http://${hostName}:${port}`);

});