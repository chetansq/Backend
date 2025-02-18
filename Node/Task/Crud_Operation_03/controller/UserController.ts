import { Request, response, Response } from "express"
import UserTable from "../database/UserSchema"
import { IUser } from "../model/IUser"
import mongoose from "mongoose";
import { request } from "http";

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

// @usage : get userId
// @method : GET
// @params : userId
// @url : http://127.0.0.1:9699/users/67b42a66725c3496c7a72d98

export const getUserId = async (request: Request, response: Response) => {
    let { userId } = request.params;

    let mongoUserID = new mongoose.Types.ObjectId(userId);

    let theUSer: IUser | null | undefined = await UserTable.findById(mongoUserID);

    if (!theUSer) {
        return response.status(500).json({
            data: null,
            msg: "UserID not Found...❌"
        });
    }

    return response.status(200).json(theUSer);
}

// @usage : update user
// @method : PUT
// @params : userId, username, email, password, imageUrl, isAdmin 
// @url : http://127.0.0.1:9699/users/67b453605014e3de0066e8f6 

export const updateUser = async (request: Request, response: Response) => {
    let { userId } = request.params;
    let { username, email, password, imageUrl, isAdmin } = request.body;

    let theUser: IUser | null | undefined = await UserTable.findByIdAndUpdate(userId, {
        username: username,
        email: email,
        password: password,
        imageUrl: imageUrl,
        isAdmin: isAdmin
    }, {
        new: true
    });


    if (!theUser) {
        return response.status(500).json({
            data: null,
            msg: "Data not Updated..❌"
        });
    }

    return response.status(200).json(theUser);
}

// @usage : delete user
// @method : DELETE
// @params : userId
// @url :

export const deleteUser = async (request: Request, response: Response) => {
    let { userId } = request.params;
    let theUser: IUser[] | null | undefined = await UserTable.findByIdAndDelete(userId);

    if (!theUser) {
        return response.status(500).json({
            data: null,
            msg: "Data not delete...❌"
        });
    }

    return response.status(200).json(theUser);
}