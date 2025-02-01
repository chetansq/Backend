import express, { Request, Response, Application } from "express"
import recipesRouter from "./router/recipesRouter";
import dotenv from "dotenv"
import mongoose from "mongoose";


dotenv.config({ path: "./.env" });

// const hostName: string = "127.0.0.1";
// const port: number = 9790;

const port: string | number | undefined = process.env.PORT || 9988;
const hostName: string = "127.0.0.1";

const dbUrl: any = process.env.MONGO_DB_CLOUD_URL;
const dbName: string | undefined = process.env.MONGO_DB_DATABASE;

mongoose.connect(dbUrl, { dbName: dbName }).then(() => (console.log('Database Connection is readdy...')
)).catch((err) => {
    console.log(err);

})



const app: Application = express();

app.get('/', (request: Request, response: Response) => {
    response.status(200).json({
        msg: "welcome to express server"
    })
})

app.listen(Number(port), hostName, () => {
    console.log(`Express Server Started http://${hostName}:${port}`);

})

app.use("/api/users", recipesRouter)