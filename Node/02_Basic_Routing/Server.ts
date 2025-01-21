import express, { Application, Request, Response } from "express";
import { request } from "http";
import userRouter from "./UseRouter";

const hostName: string = "127.0.0.1";
const port: number = 9999;

const app: Application = express();

// Router Configuration
app.use("/api/users", userRouter);

app.get("/", (request: Request, response: Response) => {
  response.status(200);
  response.json({
    msg: "Welcome to express server",
  });
});

app.listen(port, hostName, () => {
  console.log(`Express sever is started at http://${hostName}:${port}`);
});
