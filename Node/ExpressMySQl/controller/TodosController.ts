import { Request, Response } from "express";
import { Todos } from "../model/TodoModel";


// get all todos

export const getAllToDo: any = async (request: Request, response: Response) => {
    let todos = await Todos.findAll();

    if (todos) {

        return response.status(200).json({
            msg: "Get All Todos! ✅",
            data: todos
        });
    }


    return response.status(500).json({
        msg: "not found..! ❌",
        data: null
    });


}


// get by id

export const getByIdToDo: any = async (request: Request, response: Response) => {


    let { todoId } = request.params;
    let todos = await Todos.findByPk(todoId);

    try {
        if (todos) {
            return response.status(200).json({
                msg: "Todo finded! ✅",
                data: todos
            });

        }
        return response.status(400).json({
            msg: "Todo id not found! ❌",
            data: null
        });

    } catch (error: any) {
        return response.status(500).json({
            msg: "Todo not find! ❌",
            data: error
        });
    }
}


// create todos

export const createToDo: any = async (request: Request, response: Response) => {
    let todos = await Todos.create({ ...request.body });
    try {
        return response.status(200).json({
            msg: "Todo created successfully! ✅",
            data: todos
        });
    } catch (error: any) {
        return response.status(500).json({
            msg: "Todo not create... ❌",
            data: error
        });
    }

}


// delete todos


export const deleteToDo: any = async (request: Request, response: Response) => {
    let { deleteId } = request.params;
    let todos = await Todos.destroy({ where: { deleteId } });

    if (todos) {
        return response.status(200).json({
            msg: "Todo  Deleted..! ✅",
            data: todos
        });
    }

    return response.status(500).json({
        msg: "Todo not delete..! ❌",
        data: null
    });
}

// update todos
export const updateToDo: any = async (request: Request, response: Response) => {
    let { updateId } = request.params;
    let todos = await Todos.findAll();

    if (todos) {
        return response.status(200).json({
            msg: "Todo  Deleted..! ✅",
            data: todos
        });
    }

    return response.status(500).json({
        msg: "Todo not delete..! ❌",
        data: null
    });
}