import { Request, Response } from "express";
import { IRecipes } from "../models/IRecipes";
import { RecipesUtil } from "../util/RecipesUtil";

export const getAllRecipes = async (request: Request, response: Response) => {
    try {
        let recipesData: IRecipes[] = await RecipesUtil.getAllRecipesFromDB();

        return response.status(200).json(recipesData)
    }
    catch (error) {
        return response.status(500).json({
            msg: "Server Error"
        })
    }
}