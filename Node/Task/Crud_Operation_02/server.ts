import express, { Request, Response, Application } from "express"
import UserRouter from "./router/UserRouter";
import dotenv from "dotenv"
import mongoose from "mongoose";
import { error } from "console";

dotenv.config({ path: "./.env" });

const hostName: string = "127.0.0.1";
const port: string | number | undefined = process.env.PORT || 9889;
const dbUrl: any = process.env.MONGO_DB_CLOUD_URL;
const dbName: string | undefined | null = process.env.MONGO_DB_DATABASE;

const app: Application = express();
app.use(express.json());
app.use('/users', UserRouter);

app.get("/", (request: Request, response: Response) => {
    response.status(200).json({
        msg: "Welcome to Express server"
    });
});

if (port) {

    app.listen(Number(port), () => {
        if (dbUrl && dbName) {
            mongoose.connect(dbUrl, { dbName: dbName }).then((dbResponse) => {
                console.log("connection established..");
            }).catch((error) => {
                console.log(error);
                process.exit(0);
            });
        }

        console.log(`Express server started http://${hostName}:${port}`);
    });
}



