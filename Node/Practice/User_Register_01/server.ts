import express, { Request, Response, Application } from "express"
import UserRouter from "./router/UserRouter";
import dotenv from "dotenv";
dotenv.config({ path: "./.env" });
import mongoose from "mongoose";

const port: number = 7878
const dbUrl: any = process.env.MONGO_DB_CLOUD_URL;
const dbName: string | undefined = process.env.MONGO_DB_DATABASE;

const app: Application = express();
app.use(express.json());

app.use("/users", UserRouter);

app.get("/", (request: Request, response: Response) => {
    response.status(200).json({
        msg: "welcome to express json"
    });
});

if (port) {
    app.listen(Number(port), () => {
        if (dbUrl && dbName) {
            mongoose
                .connect(dbUrl, { dbName: dbName })
                .then((dbResponse) => {
                    // console.log("Connection Established...", dbResponse);
                    console.log("Connection Established...✅");
                })
                .catch((error: any) => {
                    console.log(error);
                    process.exit(0); // force stop express server
                });
        }
        console.log(`Expresss server started http://localhost:${port}`);
    });
}