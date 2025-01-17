import express from "express";

const hostName = "127.0.0.1";
const port = 9999;

const app = express();

app.get("/", (request, response) => {
  response.status(200);
  response.json({
    msg: "Welcome to Express Server",
  });
});
app.get("/home", (request, response) => {
  response.status(200);
//   response.json({
//     msg: "Welcome to Express Server",
//   });
  response.send(`<h1>Welcome to Express Server</h1>`);
});

app.listen(port, hostName, () => {
  console.log(` Express Server is Started at http://${hostName}:${port}`);
});
