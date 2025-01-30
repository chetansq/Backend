import { Request, Response } from "express";
import { IUser } from "../models/IUsers";
import { UserUtil } from "../util/UserUtil";

export const getAllUsers = async (request: Request, response: Response) => {
    try {
        let UserData: IUser[] = await UserUtil.getAllUserFromDB();
        return response.status(200).json(UserData)
    } catch (error) {
        return response.status(500).json("Server Error")
    }
}   