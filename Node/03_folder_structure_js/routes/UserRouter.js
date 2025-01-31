import express from "express";
import * as userController from "../controller/userController"

const userRouter = express.Router();

// Select Get Method

// http://127.0.0.1:9999/api/users/home

// userRouter.get("/home", (request, response) => {
//   response.json({
//     msg: "Hello, Welcome to Home Express Server  in JS",
//   });
// });

// Select Post Method
// http://127.0.0.1:9999/api/users/insertUser

// userRouter.post("/insertUser", (request, response) => {
//   response.json({
//     msg: "Record Inserted... JS",
//   });
// });

userRouter.get('/', async (request, response) => {
  console.log("Inside Router");
  await userController.getAllUsers(request, response)
})

export default userRouter;
