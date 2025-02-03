import { IUser } from "../models/IUsers";
import { Request, Response } from "express";
import { UserUtil } from "../util/UserUtil";


export const getAllUsers = async (request: Request, response: Response) => {
    try {

        let userData: IUser[] = await UserUtil.getAllUserJsonDB()

        return response.status(200).json(userData)

    } catch (error) {

        return response.status(500).json({ msg: "server error" })
    }
}