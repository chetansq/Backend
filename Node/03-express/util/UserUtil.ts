import path from "path";
import { IUser } from "../models/IUsers";
const jsonfile = require('jsonfile')

export class UserUtil {

    private static usersJsonPath = path.join(__dirname, "..", "db", "users.json");

    public static getAllUserFromDB(): Promise<IUser[]> {
        return new Promise((resolve, reject) => {
            jsonfile.readFile(this.usersJsonPath, (err: any, data: any) => {
                if (err) {
                    reject(err);
                } else {
                    resolve(data);
                }
            })
        })
    }

    // public static getUserFromDB(useId:number):Promise<IUser | underfined>{
    //     return new Promise((resolve,reject)=>{
    //         jsonfile.readfile(this.usersJsonPath, (err:string,data:any)=>{
    //                     if(err){
    //                         reject(err);
    //                     }else{
    //                        const userList:IUser[]= data;
    //                        const user:IUser | undefined = userList
    //                     }
    //         })
    // })
    // }
}



