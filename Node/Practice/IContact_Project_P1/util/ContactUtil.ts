import path, { resolve } from "path";
import { IContact } from "../model/IContact";
import { rejects } from "assert";

const jsonfile = require("jsonfile");


export class ContactUtil {

    private static contactJsonPath = path.join(__dirname, "..", "db", "contact.json")

    public static getAllContactDB(): Promise<IContact[]> {
        return new Promise((resolve, rejects) => {
            jsonfile.readFile(this.contactJsonPath, (err: any, data: any) => {
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