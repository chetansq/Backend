import { Request, Response } from "express"
import UserTable from "../database/UserSchema"
import { IUser } from "../model/IUser"
import mongoose from "mongoose";
import { isatty } from "tty";

// @usage : to get all users
// @method : GET
// @params : no-params
// @url : http://127.0.0.1:9779/users

export const getAllUsers = async (request: Request, response: Response) => {

    try {
        let users: IUser[] | undefined = await UserTable.find();

        if (users) {
            return response.status(200).json(users)
        }
    } catch (error: any) {
        return response.status(500).json({
            msg: "Data not found..❌"
        });
    }
};

// @usage : create users
// @method : POST
// @params : username, email, password, imageUrl, isAdmin
// @url : http://127.0.0.1:9779/users

export const createUser = async (request: Request, response: Response) => {
    let { username, email, password, imageUrl, isAdmin } = request.body;

    let theUser: IUser | undefined | null = await new UserTable({
        username: username,
        email: email,
        password: password,
        imageUrl: imageUrl,
        isAdmin: isAdmin
    }).save();


    if (theUser) {
        return response.status(200).json({
            data: theUser,
            msg: "Data created.. ✅"
        })
    }
}

