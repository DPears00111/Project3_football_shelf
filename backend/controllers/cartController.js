import { addToCart } from '../models/cartModel.js';

export const addCartItem = async (req, res) => {
	try {
		const { userId, productId, quantity, price } = req.body;
		if (!userId || !productId || !quantity || !price) {
			return res.status(400).json({ message: 'Missing required fields' });
		}
		await addToCart(userId, productId, quantity, price);
		res.status(201).json({ message: 'Item added to cart' });
	} catch (err) {
		console.error(err);
		res.status(500).json({ message: 'Failed to add item to cart' });
	}
};
