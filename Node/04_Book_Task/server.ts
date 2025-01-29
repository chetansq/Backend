import express, { Application, Request, Response } from 'express';

import userRouter from './router/UserRouter';

const hostName: string = '127.0.0.1';
const port: number = 9990;

const app: Application = express();

app.get('/', (request: Request, response: Response) => {
    try {
        response.status(200)
        response.json({
            msg: 'welcome to express server'
        })
    } catch (error) {
      console.log(error)  
      response.status(500).json({msg:'internal server error'})
    }
   
})

app.listen(port, hostName, () => {
    console.log(`Express server http://${hostName}:${port}`);

})

// Router Configuration

app.use("/api/users", userRouter)