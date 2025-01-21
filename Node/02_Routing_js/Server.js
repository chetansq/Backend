import express from "express";
import userRouter from "./UserRouter.js";

const hostName = "127.0.0.1";
const port = 9999;

const app = express();

// Router Configuration
app.use("/api/users", userRouter);

app.get("/", (request, response) => {
  response.status(200);
  response.json({
    msg: "Welcome to express server in JS",
  });
});

app.listen(port, hostName, () => {
  console.log(`Express sever is started at http://${hostName}:${port}`);
});
