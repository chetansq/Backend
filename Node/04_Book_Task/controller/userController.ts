// import { Request, Response } from "express";
// import { IBooks } from "../models/IBooks";
// import { BookUtil } from "../util/BookUtil";

// export const getAllUsers = async (request: Request, response: Response) => {
//     try {
//         let bookData: IBooks[] = await BookUtil.getAllBookFromDB();

//         return response.status(200).json(bookData);
//     }
//     catch (error) {
//         return response.status(500).json({ msg: 'Server Error' })
//     }

// }

import { Request, Response } from "express";

import { IBooks } from "../models/IBooks";

import { BookUtil } from "../util/BookUtil";


export const getAllUsers = async (request: Request, response: Response) => {
    try {
        let bookData: IBooks[] = await BookUtil.getAllBookFromDB();

        return response.status(200).json(bookData)
    }
    catch (error) {
        return response.status(500).json({ msg: "ServerError" })
    }
}