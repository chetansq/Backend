import { IGroup } from "../model/IGroup";
import mongoose from "mongoose";

const GroupSchema = new mongoose.Schema<IGroup>(
    {
        name: { type: String, required: true, unique: true }
    },
    { timestamps: true }
);

const groupTable = mongoose.model<IGroup>("groups", GroupSchema);

export default groupTable;