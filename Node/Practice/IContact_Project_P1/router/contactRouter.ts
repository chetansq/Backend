import { Request, response, Response, Router } from "express"
import * as contactController from "../controller/contactController"
import { request } from "http";

const contactRouter: Router = Router();


// contactRouter.get("/home", (request: Request, response: Response) => {
//     response.status(200).json({ msg: "welcome home" })
// })

contactRouter.post("/insertContacts", (request: Request, response: Response) => {
    response.status(200).json({ msg: "Data Inserted ..>>" })
})


contactRouter.get("/", async (request: Request, response: Response) => {
    console.log('inside router');
    await contactController.getAllContacts(request, response)
})

export default contactRouter