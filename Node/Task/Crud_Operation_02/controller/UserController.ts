import { Request, Response } from "express";
import UserTable from "../database/UserSchema";
import { IUser } from "../model/IUser";
import mongoose from "mongoose";
import { join } from "path";
import { json } from "stream/consumers";

// get all users

export const getAllUsers = async (request: Request, response: Response) => {
    try {
        let users: IUser[] | undefined = await UserTable.find();

        if (users) {
            response.status(200).json(users)
        }
    } catch (err: any) {
        return response.status(500).json({
            msg: "Data not Found.."
        });
    };
};

// create user (post)

export const createUser = async (request: Request, response: Response) => {
    let { username, email, password, imageUrl, isAdmin } = request.body;

    let theUser: IUser | null | undefined = await new UserTable({
        username: username,
        email: email,
        password: password,
        imageUrl: imageUrl,
        isAdmin: isAdmin

    }).save();

    if (theUser) {
        return response.status(200).json({
            data: theUser,
            msg: "user is created"
        });
    };
};

// get user id

export const getUserId = async (request: Request, response: Response) => {
    let { userId } = request.params;

    const mongoUserId = new mongoose.Types.ObjectId(userId);

    let theUser: IUser[] | null | undefined = await UserTable.findById(mongoUserId);

    if (!theUser) {
        return response.status(500).json({
            data: null,
            msg: "Data not found"
        });
    }

    return response.status(200).json(theUser);
}

// update user

// export const updateUser = async (request: Request, response: Response) => {
//     let { userId } = request.params;
//     let { username, email, password, imageUrl, isAdmin } = request.body;

//     let theUser: IUser[] | null | undefined = await UserTable.findByIdAndUpdate(userId, {
//         username: username,
//         email: email,
//         password: password,
//         imageUrl: imageUrl,
//         isAdmin: isAdmin
//     }, {
//         new: true
//     });

//     if (!theUser) {
//         return response.status(500).json({
//             data: null,
//             msg: "Data not update."
//         });
//     }


//     return response.status(200).json(theUser);

// }

export const updateUser = async (request: Request, response: Response) => {
    let { userId } = request.params;
    let { username, email, password, imageUrl, isAdmin } = request.body;

    let theUser: IUser[] | null | undefined = await UserTable.findByIdAndUpdate(userId, {
        username: username,
        email: email,
        password: password,
        imageUrl: imageUrl,
        isAdmin: isAdmin
    },
        {
            new: true
        });


    if (!theUser) {
        return response.status(500).json({
            data: null,
            msg: "Data not update"
        });
    }

    return response.status(200).json(theUser);
}

// delete user

// export const deleteUser = async (request: Request, response: Response) => {
//     let { userId } = request.params;

//     let theUser: IUser[] | null | undefined = await UserTable.findByIdAndDelete(userId);

//     if (!theUser) {
//         return response.status(500).json({
//             data: null,
//             msg: "Data not deleted.."
//         });
//     }

//     return response.status(200).json(theUser)
// }


export const deleteUser = async (request: Request, response: Response) => {
    let { userId } = request.params;

    let theUser: IUser[] | null | undefined = await UserTable.findByIdAndDelete(userId);

    if (!theUser) {
        return response.status(500).json({
            data: null,
            msg: "Data not deleted.."
        });

    }

    return response.status(200).json(theUser);
}