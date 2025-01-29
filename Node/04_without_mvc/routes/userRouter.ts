import express, { Application, Request, Response, Router } from 'express';
const jsonfile = require('jsonfile')
import path from "path"
import { IUser } from '../models/IUsers';

const userRouter: Router = Router()

userRouter.get("/", (request: Request, response: Response) => {
    // response.json({
    //     msg: "Hello"
    // }); 
    const usersJsonPath = path.join(__dirname, "..", "db", "users.json");

    jsonfile.readFile(usersJsonPath, function (err: string, obj: IUser) {
        if (err) console.error(err)
        response.json(obj)
    })

})

export default userRouter;