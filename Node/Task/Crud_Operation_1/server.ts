import express, { Response, Request, Application, response } from "express"
import UserRouter from "./router/UserRouter";
import dotenv from "dotenv"
import mongoose from "mongoose";
dotenv.config({ path: "./.env" });


const hostName: string = "127.0.0.1";
const port: string | number | undefined = process.env.PORT || 9889;
const dbUrl: any = process.env.MONGO_DB_CLOUD_URL;
const dbName: string | undefined = process.env.MONGO_DB_DATABASE;

const app: Application = express();

app.get("/", (request: Request, response: Response) => {
    response.status(200).json({
        msg: "welcome to express server"
    })
})


// app.listen(port, hostName, () => {

//     response.status(200)
//     console.log(`Express server started http://${hostName}:${port}`);

// })

app.use(express.json());
app.use("/users", UserRouter);


if (port) {
    app.listen(Number(port), () => {
        if (dbUrl && dbName) {
            mongoose.connect(dbUrl, { dbName: dbName }).then((dbResponse) => {
                console.log("Connection Established..");
            }).catch((error) => {
                console.log(error);
                process.exit(0);
            });
        }
        console.log(`Express server started http://${hostName}:${port}`);

    })
}
