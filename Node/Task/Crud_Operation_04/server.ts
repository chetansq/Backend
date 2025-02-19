import express, { Request, Response, Application, response } from "express"
import UserRouter from "./router/UserRouter";
import dotenv from "dotenv";
import mongoose from "mongoose";

dotenv.config({ path: "./.env" });

const hostName: string = '127.0.0.1';
const port: number | string | undefined = process.env.PORT || 9699;
const dbUrl: any = process.env.MONGO_DB_CLOUD_URL;
const dbName: string | null | undefined = process.env.MONGO_DB_DATABASE;

const app: Application = express();

app.get("/", (request: Request, response: Response) => {
    response.status(200).json({
        msg: "Welcome express server"
    });
});

if (port) {

    app.listen(Number(port), () => {

        if (dbUrl && dbName) {
            mongoose.connect(dbUrl, { dbName: dbName }).then((dbResponse) => {
                console.log('Connection Established...✅');
            }).catch((error: any) => {
                console.log(error);
                process.exit(0);
            });
        }

        console.log(`Express server started http://${hostName}:${port}`);
    });
}

app.use("/api/users", UserRouter);