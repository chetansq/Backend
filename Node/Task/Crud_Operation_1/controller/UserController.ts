import { Request, Response } from "express";
import UserTable from "../database/USerSchema";
import { IUser } from "../model/IUser";


//get all users 

export const getAllUsers = async (request: Request, response: Response) => {
    try {
        let users: IUser[] | undefined = await UserTable.find();

        if (users) {
            return response.status(200).json(users)
        }
    } catch (err: any) {
        return response.status(500).json({
            msg: "Data not Found"
        })
    }
}

// create user (post)

export const createUser = async (request: Request, response: Response) => {
    let { username, email, password, imageUrl, isAdmin } = request.body;

    let theuser: IUser | null | undefined = await new UserTable({
        username: username,
        email: email,
        password: password,
        imageUrl: imageUrl,
        isAdmin: isAdmin
    }).save();


    if (theuser) {
        return response.status(200).json({
            data: theuser,
            msg: "User is created"
        })
    }
}