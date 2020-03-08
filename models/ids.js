'use strict';

import mongoose from 'mongoose'

const idsSchema = new mongoose.Schema({
	restaurant_id: Number, // 商铺ID
	food_id: Number, // Food ID
	order_id: Number, // 订单ID
	user_id: Number, // 用户ID
	address_id: Number, // 地址ID
	cart_id: Number, // 购物车ID
	img_id: Number, // 图片ID
	category_id: Number, // 分类ID
	item_id: Number,  
	sku_id: Number, 
	admin_id: Number,
	statis_id: Number,
});

const Ids = mongoose.model('Ids', idsSchema);

Ids.findOne((err, data) => {
	if (!data) {
		const newIds = new Ids({
			restaurant_id: 0,
			food_id: 0,
			order_id: 0,
			user_id: 0,
			address_id: 0,
			cart_id: 0,
			img_id: 0,
			category_id: 0,
			item_id: 0,
			sku_id: 0, 
			admin_id: 0,
			statis_id: 0,
		});
		newIds.save();
	}
})

export default Ids