import { Request, Response } from "express";
import { IGroup } from "../model/IGroup";
import { GroupUtil } from "../util/GroupUtil";

export const getAllGroups = async (request: Request, response: Response) => {
    try {
        let groupData: IGroup[] = await GroupUtil.getAllGroupDB();

        return response.status(200).json(groupData)
    }
    catch (err) {
        response.status(500).json({
            msg: "server error"
        })
    }
}