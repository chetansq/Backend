import { Response, Request } from "express";
import UserTable from "../database/UserSchema";
import { IUser } from "../model/IUser";


// @usage : to get all users
// @method : GET
// @params : no-params

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
};

export const createUser = async (request: Request, response: Response) => {
    let { username } = request.body;
    let { email } = request.body;
    let { password } = request.body;
    let { imageUrl } = request.body;
    let { isAdmin } = request.body;

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