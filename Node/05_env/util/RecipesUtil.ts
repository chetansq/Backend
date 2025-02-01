import path from "path";
import { IRecipes } from "../models/IRecipes";

const jsonfile = require('jsonfile')

export class RecipesUtil {
    private static recipesJsonPath = path.join(__dirname, "..", "db", "recipes.json")

    public static getAllRecipesFromDB(): Promise<IRecipes[]> {
        return new Promise((resolve,rejects ) => {
            jsonfile.readFile(this.recipesJsonPath, (err: any, data: any) => {
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