import express, { Request, Response, Application, response } from "express"
import dotenv from "dotenv"
import mongoose from "mongoose";
import UserRouter from "./router/UserRouter";

dotenv.config({path:"./.env"});
const hostName: string = "127.0.0.1";
const port: string | number | undefined = process.env.PORT || 9799;
const dbUrl: any = process.env.MONGO_DB_CLOUD_URL;
const dbName: string | undefined = process.env.MONGO_DB_DATABASE;


const app: Application = express();

app.get("/", (reuqest: Request, response: Response) => {
    response.status(200).json({
        msg: "welcome to express server"
    })
})


// configure the routers

app.use(express.json());
app.use("/users", UserRouter);


if (port) {
    app.listen(Number(port), () => {
        if (dbUrl && dbName) {
            mongoose.connect(dbUrl, { dbName: dbName })
                .then((dbResponse) => {
                    console.log("Connection Eshtablished..");

                }).catch((error) => {
                    console.log(error);
                    process.exit(0);
                })
        }
        console.log(`Express server started http://${hostName}:${port}`);

    })
}
