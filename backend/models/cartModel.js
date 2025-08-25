import pool from '../config/db.js';

export const addToCart = async (userId, productId, quantity, price) => {
	// Insert or update cart item for the user
	const sql = `INSERT INTO cart (product_id, quantity, price_at_add) VALUES (?, ?, ?)
		ON DUPLICATE KEY UPDATE quantity = quantity + VALUES(quantity), price_at_add = VALUES(price_at_add)`;
	const [result] = await pool.execute(sql, [productId, quantity, price]);
	return result;
};
