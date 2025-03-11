import { Sequelize } from "sequelize-typescript";
import { Todos } from "../model/TodoModel";

const connection = new Sequelize({
    dialect: "mysql",
    host: "localhost",
    username: "root",
    password: "admin@123",
    database: "todos",
    logging: false,
    models: [Todos]
});

export default connection