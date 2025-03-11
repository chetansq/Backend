import express, { Request, Response, Application } from "express";
import todosRouter from "./router/TodosRouter";
import { urlencoded } from "body-parser";
import connection from "./db/config";



const port: number = 9879;
const app: Application = express();

app.use(express.json());
app.use(urlencoded({ extended: true }))
app.use("/todos", todosRouter);

// app.get("/", (request: Request, response: Response) => {
//     response.status(200).json({
//         msg: "Welcome Express server...🙏 "
//     });
// });

connection.sync().then(() => {
    console.log("Database connection successfully...");
}).catch((error) => {
    console.log("Error", error);
})

app.listen(port, () => {
    console.log(`Express server started http://localhost:${port}`);
});