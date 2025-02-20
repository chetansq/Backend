import { Request, Response } from "express";
import UserTable from "../database/UserSchema";
import { IUser } from "../model/IUser";
import { log } from "console";
import mongoose from "mongoose";


// @usage : get all users
// @method : GET
// @params : no-params
// @url :http://127.0.0.1:9669/users

export const getAllUser = async (request: Request, response: Response) => {
    try {
        let users: IUser[] | undefined = await UserTable.find();

        if (users) {
            return response.status(200).json(users)
        }
    } catch (error: any) {
        return response.status(500).json({
            msg: "Data not found...❌"
        })
    }
}

// @usage : create user(Post)
// @method : POST
// @params : name, email, password, isAdmin
// @url :http://127.0.0.1:9669/users

export const createUser = async (request: Request, response: Response) => {
    console.log(" createUser : ", request.body)
    let { name, email, password, isAdmin } = request.body;

    let theUser: IUser | null | undefined = await new UserTable({
        name: name,
        email: email,
        password: password,
        isAdmin: isAdmin
    }).save();

    if (theUser) {
        return response.status(200).json({
            data: theUser,
            msg: "Data Inserted...✅"
        });
    }
}


// @usage : get userId
// @method : GET
// @params :userId
// @url : http://127.0.0.1:9669/users/67b6ad8ff050bd6cb1222d66

export const getUserId = async (request: Request, response: Response) => {
    let { userId } = request.params;
    console.log("userId");

    let mongoUserID = new mongoose.Types.ObjectId(userId);

    let theUser: IUser | undefined | null = await UserTable.findById(mongoUserID);

    if (!theUser) {
        return response.status(500).json({
            data: null,
            msg: "Data not found...❌"
        });
    }

    return response.status(200).json(theUser);
}

// @usage : update user
// @method : PUT
// @params : userId, name, email, password, isAdmin
// @url :http://127.0.0.1:9669/users/67b6ad8ff050bd6cb1222d66

export const updateUser = async (request: Request, response: Response) => {

    let { userId } = request.params;
    console.log("Update : userId");

    let { name, email, password, isAdmin } = request.body;

    let theUser: IUser | null | undefined = await UserTable.findByIdAndUpdate(userId, {
        name: name,
        email: email,
        password: password,
        isAdmin: isAdmin
    });

    if (!theUser) {
        return response.status(500).json({
            data: null,
            msg: "Data not Update...❌"
        });
    }

    return response.status(200).json({
        data: theUser,
        msg: "Data Updated...✅"
    });
}


export const deleteUser = async (request: Request, response: Response) => {
    let { userId } = request.params;

    let theUser: IUser | null | undefined = await UserTable.findByIdAndDelete(userId);

    if (!theUser) {
        return response.status(500).json({
            data: null,
            msg: "Data not Delete... ❌"
        });
    }

    return response.status(200).json({
        data: theUser,
        msg: "Data Deleted... ✅"
    });
}