import express, { Application, Request, Response } from "express"
import { upload } from "./multer/upload";
import { cloudinary_img_upload } from "./uploads/cloudinary/Cloudinary_img_upload";


const port: number = 9779;
const app: Application = express();

app.use(express.json());
// configurates how the files are gonna be stored

app.post("/upload", upload.single("myfile"), cloudinary_img_upload, (request: Request, response: any) => {
    console.log("inside upload", request.file)  
    if (!request.file) {
        return response.status(400).send("No File uploadded")
    }
    return response.status(200).send("File Uploadded")
})

app.listen(port, () => {
    console.log(`Express server started http://localhost:${port}`);
});