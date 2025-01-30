import { Request, Response } from "express";
import { IUser } from "../models/IUsers";
import { UserUtil } from "../util/UserUtil";


export const getAllUsers = async (request: Request, response: Response) => {
    try {
        let userData: IUser[] = await UserUtil.getAllUserFromDB();
        return response.status(200).json(userData);
    } catch (error) {
        return response.status(500).json({ msg: "Server Error" });
    }
};

// usage:get all users
// method: GET