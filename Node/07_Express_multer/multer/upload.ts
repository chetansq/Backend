import multer from "multer";
import { Request } from "express";

const storage = multer.diskStorage({
    destination: function (req: Express.Request, file: Express.Multer.File, callback: (error: Error | null, destination: string) => void) {
        callback(null, 'uploads/');
    },
    filename: function (req: Request, file: Express.Multer.File, callback: (error: Error | null, filename: string) => void) {
        //  const guid = guidGenerator();
        callback(null, Date.now() + '_' + file.originalname);
    }
});

export const upload = multer({ storage });