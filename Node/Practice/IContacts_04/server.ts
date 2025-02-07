import express, { Request, Response, Application } from "express";
import mongoose from "mongoose";
import dotenv from "dotenv"

dotenv.config({ path: "./.env" })
const hostName: string = "127.0.0.1";

const app: Application = express();

const port: string | number | undefined = process.env.PORT || 9394;
const dbUrl: any = process.env.MONGO_DB_CLOUD_URL;
const dbName: string | undefined = process.env.MONGO_DB_DATABASE;



app.get("/", (request: Request, response: Response) => {
    response.status(200).json({ msg: "Welcome to express server" })
})

import groupRouter from "./router/groupRouter";
import { dot } from "node:test/reporters";

/** 1
@usage : to get all groups
@methodm: GET
@params : no-params
@url : http://localhost:9494/groups
*/

app.use("/groups", groupRouter);

app.listen(Number(port), () => {

    if (dbUrl && dbName) {

        mongoose.connect(dbUrl, { dbName: dbName }).then((dbResponse) => {
            console.log("Connection Established..");
        }).catch((error) => {
            console.log(error);
            process.exit(0) // force the stop server
        })
    }

    console.log(`Express server started http://${hostName}:${port}`);

})

