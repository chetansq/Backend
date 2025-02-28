import { Request, Response } from "express";
import { IUser } from "../model/IUser";
import UserTable from "../database/UserSchema";
import mongoose from "mongoose";
import bcryptjs from "bcryptjs";
import gravatar from "gravatar";
import { validationResult } from "express-validator";


// @usage : to get all users
// @method : GET
// @params : no-params
// @url : http://127.0.0.1:9799/users

export const getAllUsers = async (request: Request, response: Response) => {
    try {
        let users: IUser[] | undefined = await UserTable.find();
        console.log("users", users);

        if (users) {
            console.log("if users", users);

            return response.status(200).json(users);
        }
    } catch (err: any) {
        return response.status(500).json({ msg: "Data not found..❌" })
    }
}

// export const registerUsers = async (request: Request, response: Response) => {

//     const errors = validationResult(request);

//     // express validation error handling
//     if (!errors.isEmpty()) {
//         return response.status(400).json({ errors: errors.array() });
//     }

//     try {

//         let { username, email, password } = request.body;
//         // check if the user exists
//         const userObj: IUser | undefined | null = await UserTable.findOne({ email: email });

//         if (userObj) {
//             return response.status(400).json({
//                 error: "The user is already exists"
//             });
//         }

//         // password encryption

//         const slat = await bcryptjs.genSalt(10);
//         const hashPassword = await bcryptjs.hash(password, slat);

//         // gravatar url

//         const imageUrl = gravatar.url(email, {
//             size: "200",
//             rating: "pg",
//             default: "mm"
//         });

//         // insert to db

//         const newUser: IUser = {
//             username: username,
//             email: email,
//             password: hashPassword,
//             imageUrl: imageUrl,
//             isAdmin: false
//         };

//         let theuser: IUser | null | undefined = await new UserTable(newUser).save();

//         if (theuser) {
//             return response.status(200).json({
//                 data: theuser,
//                 msg: "User is created"
//             });
//         }

//     } catch (error: any) {
//         response.status(500).json({
//             error: error.message
//         });
//     };
// };


export const registerUsers = async (request: Request, response: Response) => {
    const errors = validationResult(request);

    if (!errors.isEmpty()) {
        return response.status(400).json({ errors: errors.array() });
    }

    try {
        let { username, email, password } = request.body;

        // check if the user exists

        const userObj = await UserTable.findOne({ email: email });

        if (userObj) {
            return response.status(400).json({
                error: "The user is already exists"
            });
        }

        // password encryption

        const slat = await bcryptjs.genSalt(10);
        const hashPassword = await bcryptjs.hash(password, slat);

        // gravatar url

        const imageUrl = gravatar.url(email, {
            size: "200",
            rating: "pg",
            default: "mm"
        });

        // insert to db

        const newUser: IUser = {
            username: username,
            email: email,
            password: hashPassword,
            imageUrl: imageUrl,
            isAdmin: false
        };

        let theuser: IUser | null | undefined = await new UserTable(newUser).save();

        if (theuser) {
            return response.status(200).json({
                data: theuser,
                msg: "User is created ✅"
            });
        }
    } catch (error: any) {
        response.status(500).json({
            error: error.message
        });
    };
};