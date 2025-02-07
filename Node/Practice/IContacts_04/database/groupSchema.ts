import { IGroup } from "../model/IGroup";
import mongoose from "mongoose";

const groupSchema = new mongoose.Schema<IGroup>({
    name: { type: String, required: true, unique: true }
}, {
    timestamps: true
}
);

const groupTable = mongoose.model<IGroup>("groups", groupSchema);

export default groupTable;