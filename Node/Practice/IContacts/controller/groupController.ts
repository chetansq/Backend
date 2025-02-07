import { Request, Response } from "express";
import { IGroup } from "../model/IGroup";
import GroupTable from "../database/GroupSchema";


export const getAllGroups = async (request: Request, response: Response) => {
    try {
        let groups: IGroup[] | undefined = await GroupTable.find();
        if (groups) {
            return response.status(200).json(groups);
        }
    }
    catch (error: any) {
        return response.status(500).json({ msg: "Data not found" });
    }
};