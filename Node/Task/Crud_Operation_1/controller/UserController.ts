import { Request, Response } from "express";
import UserTable from "../database/USerSchema";
import { IUser } from "../model/IUser";
import mongoose from "mongoose";
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

//get userid

export const getuser = async (request: Request, response: Response) => {
    let { userId } = request.params;
    const mongoUserId = new mongoose.Types.ObjectId(userId);
    let theuser: IUser[] | undefined | null = await UserTable.findById(
        mongoUserId
    );
    if (!theuser) {
        return response.status(500).json({
            data: null,
            error: "No Group is found",
        });
    }
    return response.status(200).json(theuser);
};

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


// update user

export const updateUser = async (request: Request, response: Response) => {
    let { userId } = request.params;
    let { username, email, password, imageUrl, isAdmin } = request.body;
    // const mongoUserId = new mongoose.Types.ObjectId(userId);
    let theuser: IUser | undefined | null = await UserTable.findByIdAndUpdate(
        userId,
        {
            username,
            email,
            password,
            imageUrl,
            isAdmin
        },
        {
            new: true
        }
    );
    if (!theuser) {
        return response.status(500).json({
            data: null,
            error: "No Group is found",
        });
    }
    return response.status(200).json(theuser);
};

// delete user

export const deleteUser = async (request: Request, response: Response) => {
    let { userId } = request.params;
    // const mongoUserId = new mongoose.Types.ObjectId(userId);
    let theuser: IUser[] | undefined | null = await UserTable.findByIdAndDelete(
        userId,
        
    );
    if (!theuser) {
        return response.status(500).json({
            data: null,
            error: "No Group is found",
        });
    }
    return response.status(200).json(theuser);
};