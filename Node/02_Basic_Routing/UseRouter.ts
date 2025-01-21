import express, { Application, Request, Response, Router } from "express";

const userRouter: Router = Router();

// Select Get Method

//http://127.0.0.1:9999/api/users/home

userRouter.get("/home", (request: Request, response: Response) => {
  response.json({
    msg: "Hello, Welcome to Home Express Server",
  });
});

// Select Post Method
//http://127.0.0.1:9999/api/users/insertUser

userRouter.post("/insertUser", (request: Request, response: Response) => {
  response.json({
    msg: "Record Inserted...",
  });
});

export default userRouter;
