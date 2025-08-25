import pool from '../config/db.js';

export const createOrder = async (req, res) => {
    const { userId, jerseyIds } = req.body;

    if (!userId || !jerseyIds || jerseyIds.length === 0) {
        return res.status(400).json({ error: 'Missing user ID or jersey IDs.' });
    }

    try {
        let totalAmount = 0;
        const jerseysData = [];

        for (const jerseyId of jerseyIds) {
            const [rows] = await pool.query(
                'SELECT price FROM jerseys WHERE jersey_id = ?',
                [jerseyId]
            );

            if (rows.length === 0) {
                return res.status(404).json({ error: `Jersey with ID ${jerseyId} not found.` });
            }
            jerseysData.push(rows[0]);
            totalAmount += parseFloat(rows[0].price);
        }

        const [result] = await pool.query(
            'INSERT INTO customer_orders (user_id, jersey_ids, total_amount, status) VALUES (?, ?, ?, ?)',
            [userId, JSON.stringify(jerseyIds), totalAmount, 'pending']
        );

        const newOrderId = result.insertId;

        res.status(201).json({
            message: 'Order created successfully. Ready for payment.',
            orderId: newOrderId,
            totalAmount: totalAmount
        });

    } catch (err) {
        console.error('Error creating order:', err);
        res.status(500).json({ error: 'Failed to create order.', details: err.message });
    }
};

export const processPayment = async (req, res) => {
    const { orderId, cardNumber, expiry, cvv } = req.body;

    if (!orderId || !cardNumber || !expiry || !cvv) {
        return res.status(400).json({ error: 'Missing payment details.' });
    }

    try {
        const paymentSuccessful = true;

        if (paymentSuccessful) {
            const [updateResult] = await pool.query(
                'UPDATE customer_orders SET status = ? WHERE order_id = ?',
                ['completed', orderId]
            );

            if (updateResult.affectedRows === 0) {
                res.status(404).json({ error: 'Order not found.' });
            } else {
                res.status(200).json({ message: 'Payment successful, order confirmed.' });
            }
        } else {
            res.status(400).json({ error: 'Payment failed. Please try again.' });
        }
    } catch (err) {
        console.error('Error processing payment:', err);
        res.status(500).json({ error: 'Payment processing failed.', details: err.message });
    }
};