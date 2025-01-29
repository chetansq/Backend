import express, { Application, Request, Response } from 'express';
import userRouter from './routes/userRouter';
// import darshanRouter from './routes/darshanRouter';

const hostName: string = "127.0.0.1";
const port: number = 8866;

const app: Application = express();

app.get("/", (request: Request, response: Response) => {
    response.status(200);
    response.json({
        msg: "Welcome to Express Server"
    }); 
});


//router Configuration
app.use("/api/users",userRouter);
// app.use("/api/users",darshanRouter);

app.listen(port, hostName, () => {
    console.log(`Express Server is started at http://${hostName}:${port}`);
});

 