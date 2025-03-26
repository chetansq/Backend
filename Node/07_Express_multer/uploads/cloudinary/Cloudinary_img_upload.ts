import { Request, Response, NextFunction } from "express";
import { v2 as cloudinary } from "cloudinary";
import dotenv from "dotenv";
dotenv.config();

cloudinary.config({
    cloud_name: process.env.CLOUDINARY_NAME, // Replace with your Cloudinary cloud name
    api_key: process.env.CLOUDINARY_API_KEY, // Replace with your Cloudinary API key
    api_secret: process.env.CLOUDINARY_API_SECRET_KEY, // Replace with your Cloudinary API secret
})

console.log(cloudinary.config());

export const cloudinary_img_upload = async (request: Request, response: Response, next: NextFunction) => {

    try {
        const images = [];
        const uploads = await cloudinary.uploader.upload(request.file?.path as string, {
            resource_type: "auto"
        });

        images.push(uploads.secure_url);
        request.body.img = images;
        console.log(request.body.img);
        next();
    } catch (error: any) {
        console.log(error);

        response.status(500).json({ error: "error" })
    }
}