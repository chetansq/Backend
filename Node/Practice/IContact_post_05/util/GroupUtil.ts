import { rejects } from "assert";
import { IGroup } from "../model/IGroup";
import path, { resolve } from "path";

const jsonfile = require("jsonfile");

export class GroupUtil {
    private static groupJsonPath = path.join(__dirname, "..", "db", "Groups.json");

    public static getAllGroupDB(): Promise<IGroup[]> {
        return new Promise(
            (resolve, rejects) => {
                jsonfile.readFile(this.groupJsonPath, (err: any, data: any) => {
                    if (err) {
                        rejects(err)
                    }
                    else {
                        resolve(data)
                    }
                })
            }
        )
    }
}