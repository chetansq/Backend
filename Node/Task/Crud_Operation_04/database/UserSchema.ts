import mongoose from "mongoose";
import { IUser } from "../model/IUser";

const UserSchema = new mongoose.Schema<IUser>({
    name: { type: String, required: true },
    email: { type: String, required: true, unique: true },
    password: { type: String, required: true, unique: true },
    isAdmin: { type: Boolean, required: true }
}, { timestamps: true });

const UserTable = mongoose.model<IUser>('users', UserSchema);

export default UserTable;