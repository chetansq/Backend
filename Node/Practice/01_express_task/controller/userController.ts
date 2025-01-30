import { UserUtil } from "../util/UserUtil";

import { IUser } from "../models/IUsers";
import { Request, Response } from "express";

export const getAllUsers = async (request: Request, response: Response) => {
    try {
        let UserData: IUser[] = await UserUtil.getAllUserFromDB();
        return response.status(200).json(UserData)
    }
    catch (error) {
        return response.status(500).json({ msg: "server error" })
    }
}