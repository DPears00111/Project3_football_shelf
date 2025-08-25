import { getAllJerseys as getAllJerseysFromModel } from "../models/jerseysModel.js";

export const getAllJerseys = async (req, res) => {
    try {
        const jerseys = await getAllJerseysFromModel();
        res.json(jerseys);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};