import { Request, Response } from "express";
import { IContact } from "../model/IContact";
import { ContactUtil } from "../util/ContactUtil";
import { join } from "path";

export const getAllContacts = async (request: Request, response: Response) => {
    let contactData: IContact[] = await ContactUtil.getAllContactDB();

    try {
        return response.status(200).json(contactData)
    } catch (error) {
        return response.status(500).json({ msg: "server error" })
    }
}