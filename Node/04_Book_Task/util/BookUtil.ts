// import path, { resolve } from "path";
// import { IBooks } from "../models/IBooks";
// const jsonfile = require('jsonfile')

// export class BookUtil {
//     private static bookJsonPath = path.join(__dirname, "..", "db", "book.json");

//     public static getAllBookFromDB(): Promise<IBooks[]> {
//         return new Promise((resolve, rejects) => {
//             jsonfile.readFile(this.bookJsonPath, (err: any, data: any) => {
//                 if (err) {
//                     rejects(err);
//                 }
//                 else {
//                     resolve(data);
//                 }
//             })
//         })
//     }
// }

import path, { resolve } from "path";
import { IBooks } from "../models/IBooks";

const jsonfile = require('jsonfile');

export class BookUtil {
    private static bookJsonPath = path.join(__dirname, "..", "db", "book.json");

    public static getAllBookFromDB(): Promise<IBooks[]> {
        return new Promise((resolve, rejects) => {
            jsonfile.readFile(this.bookJsonPath, (err: any, data: any) => {
                if (err) {
                    rejects(err)
                } else {

                    resolve(data)
                }
            })
        })
    }
}