import path, { resolve } from "path";
import { IUser } from "../models/IUsers";
import { rejects } from "assert";

const jsonfile = require('jsonfile')

export class UserUtil {
    private static userJsonPath = path.join(__dirname, "..", "db", "users.json");

    public static getAllUserFromDB(): Promise<IUser[]> {
        return new Promise((resolve, rejects) => {
            jsonfile.readFile(this.userJsonPath, (err: any, data: any) => {
                if (err) {
                    rejects(err)
                }
                else {
                    resolve(data)
                }
            })
        })
    }
}