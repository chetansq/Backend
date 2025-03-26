import { Request, Response } from "express";
import { IUser } from "../model/IUser";
import UserTable from "../database/UserSchema";
import { validationResult } from "express-validator";
import bcryptjs from "bcryptjs"
import gravatar from "gravatar"

// get all users

export const getAllUsers = async (request: Request, response: Response) => {

    try {
        let users: IUser[] | undefined | null = await UserTable.find();
        if (users) {
            return response.status(200).json({
                data: users,
                msg: "All User Found! ✅"
            });
        }
    } catch (error: any) {
        return response.status(500).json({
            data: null,
            msg: "User Not found ❌"
        });
    }
}

// userRgister

export const userRegister = async (request: Request, response: Response) => {

    const errors = validationResult(request);

    if (!errors.isEmpty()) {
        return response.status(400).json({ errors: errors.array() });
    }

    try {
        // check if the user exists

        let { username, email, password } = request.body;

        const userObj = await UserTable.findOne({ email: email });

        if (userObj) {
            return response.status(400).json({ msg: "The user is already Exists ! ❌" });
        }

        // pasword bcrypt

        const salt = await bcryptjs.genSalt(10);
        const hashPassword = await bcryptjs.hash(password, salt);

        // gravatar url

        const imageUrl = gravatar.url(email, { size: "200", rating: "pg", default: "mm" });

        // new user 

        const newUser: IUser = {
            username: username,
            email: email,
            password: hashPassword,
            imageUrl: imageUrl,
            isAdmin: false
        }


        let users: IUser | undefined | null = await new UserTable(newUser).save();

        if (users) {
            return response.status(200).json({
                data: users,
                msg: "User is created"
            });
        }

    } catch (error: any) {
        return response.status(500).json({ error: error.message });
    }
}
