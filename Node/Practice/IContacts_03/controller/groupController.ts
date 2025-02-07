import { Request, Response } from "express";
import groupTable from "../database/groupSchema";
import { IGroup } from "../model/IGroup";

export const getAllGroups = async (request: Request, response: Response) => {
    try {
        let groups: IGroup[] | undefined = await groupTable.find();
        if (groups) {
            return response.status(200).json(groups)
        }
    }
    catch (error: any) {
        return response.status(500).json({ msg: "Data not found" });
    }
};