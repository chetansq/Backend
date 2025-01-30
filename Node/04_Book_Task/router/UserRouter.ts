import express, { Request, Response, Router } from 'express'
import path from 'path';
import { IBooks } from '../models/IBooks';
import { request } from 'http';

import * as userController from "../controller/userController"

const jsonfile = require('jsonfile')

const userRouter: Router = Router();
const usersJsonPath = path.join(__dirname, "..", "db", "book.json");


// const usersJsonPath = "D:/chetan/Backend/Node/db/book.json"


// userRouter.get("/home", (request: Request, response: Response) => {

//     jsonfile.readFile(usersJsonPath, function (err: string, obj: IBooks) {
//         if (err) console.log(err)
//         // response.json(err)

//     response.json(obj)
// })

// })



// userRouter.post('/insertUser', (request: Request, response: Response) => {
//     response.json({
//         msg: 'Record insertesd...'
//     })
// })

userRouter.get("/", async (request: Request, response: Response) => {
    console.log("inside Router");

    await userController.getAllUsers(request, response)
})

export default userRouter