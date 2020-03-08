/*
Navicat MySQL Data Transfer

Source Server         : 192.168.56.10_3306
Source Server Version : 50727
Source Host           : 192.168.56.10:3306
Source Database       : gulimall

Target Server Type    : MYSQL
Target Server Version : 50727
File Encoding         : 65001

Date: 2020-03-07 22:23:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for mq_message
-- ----------------------------
DROP TABLE IF EXISTS `mq_message`;
CREATE TABLE `mq_message` (
  `message_id` char(32) NOT NULL,
  `content` text,
  `to_exchane` varchar(255) DEFAULT NULL,
  `routing_key` varchar(255) DEFAULT NULL,
  `class_type` varchar(255) DEFAULT NULL,
  `message_status` int(1) DEFAULT '0' COMMENT '0-新建 1-已发送 2-错误抵达 3-已抵达',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of mq_message
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_order`;
CREATE TABLE `oms_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_id` bigint(20) DEFAULT NULL COMMENT 'member_id',
  `order_sn` char(64) DEFAULT NULL COMMENT '订单号',
  `coupon_id` bigint(20) DEFAULT NULL COMMENT '使用的优惠券',
  `create_time` datetime DEFAULT NULL COMMENT 'create_time',
  `member_username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `total_amount` decimal(18,4) DEFAULT NULL COMMENT '订单总额',
  `pay_amount` decimal(18,4) DEFAULT NULL COMMENT '应付总额',
  `freight_amount` decimal(18,4) DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(18,4) DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(18,4) DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(18,4) DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(18,4) DEFAULT NULL COMMENT '后台调整订单使用的折扣金额',
  `pay_type` tinyint(4) DEFAULT NULL COMMENT '支付方式【1->支付宝；2->微信；3->银联； 4->货到付款；】',
  `source_type` tinyint(4) DEFAULT NULL COMMENT '订单来源[0->PC订单；1->app订单]',
  `status` tinyint(4) DEFAULT NULL COMMENT '订单状态【0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单】',
  `delivery_company` varchar(64) DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(11) DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(11) DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(11) DEFAULT NULL COMMENT '可以获得的成长值',
  `bill_type` tinyint(4) DEFAULT NULL COMMENT '发票类型[0->不开发票；1->电子发票；2->纸质发票]',
  `bill_header` varchar(255) DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(255) DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) DEFAULT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) DEFAULT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) DEFAULT NULL COMMENT '订单备注',
  `confirm_status` tinyint(4) DEFAULT NULL COMMENT '确认收货状态[0->未确认；1->已确认]',
  `delete_status` tinyint(4) DEFAULT NULL COMMENT '删除状态【0->未删除；1->已删除】',
  `use_integration` int(11) DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COMMENT='订单';

-- ----------------------------
-- Records of oms_order
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item`;
CREATE TABLE `oms_order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` bigint(20) DEFAULT NULL COMMENT 'order_id',
  `order_sn` char(64) DEFAULT NULL COMMENT 'order_sn',
  `spu_id` bigint(20) DEFAULT NULL COMMENT 'spu_id',
  `spu_name` varchar(255) DEFAULT NULL COMMENT 'spu_name',
  `spu_pic` varchar(500) DEFAULT NULL COMMENT 'spu_pic',
  `spu_brand` varchar(200) DEFAULT NULL COMMENT '品牌',
  `category_id` bigint(20) DEFAULT NULL COMMENT '商品分类id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品sku编号',
  `sku_name` varchar(255) DEFAULT NULL COMMENT '商品sku名字',
  `sku_pic` varchar(500) DEFAULT NULL COMMENT '商品sku图片',
  `sku_price` decimal(18,4) DEFAULT NULL COMMENT '商品sku价格',
  `sku_quantity` int(11) DEFAULT NULL COMMENT '商品购买的数量',
  `sku_attrs_vals` varchar(500) DEFAULT NULL COMMENT '商品销售属性组合（JSON）',
  `promotion_amount` decimal(18,4) DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(18,4) DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(18,4) DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(18,4) DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(11) DEFAULT NULL COMMENT '赠送积分',
  `gift_growth` int(11) DEFAULT NULL COMMENT '赠送成长值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COMMENT='订单项信息';

-- ----------------------------
-- Records of oms_order_item
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_operate_history
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_operate_history`;
CREATE TABLE `oms_order_operate_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `operate_man` varchar(100) DEFAULT NULL COMMENT '操作人[用户；系统；后台管理员]',
  `create_time` datetime DEFAULT NULL COMMENT '操作时间',
  `order_status` tinyint(4) DEFAULT NULL COMMENT '订单状态【0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单】',
  `note` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单操作历史记录';

-- ----------------------------
-- Records of oms_order_operate_history
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_return_apply
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_apply`;
CREATE TABLE `oms_order_return_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` bigint(20) DEFAULT NULL COMMENT 'order_id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '退货商品id',
  `order_sn` char(32) DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime DEFAULT NULL COMMENT '申请时间',
  `member_username` varchar(64) DEFAULT NULL COMMENT '会员用户名',
  `return_amount` decimal(18,4) DEFAULT NULL COMMENT '退款金额',
  `return_name` varchar(100) DEFAULT NULL COMMENT '退货人姓名',
  `return_phone` varchar(20) DEFAULT NULL COMMENT '退货人电话',
  `status` tinyint(1) DEFAULT NULL COMMENT '申请状态[0->待处理；1->退货中；2->已完成；3->已拒绝]',
  `handle_time` datetime DEFAULT NULL COMMENT '处理时间',
  `sku_img` varchar(500) DEFAULT NULL COMMENT '商品图片',
  `sku_name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `sku_brand` varchar(200) DEFAULT NULL COMMENT '商品品牌',
  `sku_attrs_vals` varchar(500) DEFAULT NULL COMMENT '商品销售属性(JSON)',
  `sku_count` int(11) DEFAULT NULL COMMENT '退货数量',
  `sku_price` decimal(18,4) DEFAULT NULL COMMENT '商品单价',
  `sku_real_price` decimal(18,4) DEFAULT NULL COMMENT '商品实际支付单价',
  `reason` varchar(200) DEFAULT NULL COMMENT '原因',
  `description述` varchar(500) DEFAULT NULL COMMENT '描述',
  `desc_pics` varchar(2000) DEFAULT NULL COMMENT '凭证图片，以逗号隔开',
  `handle_note` varchar(500) DEFAULT NULL COMMENT '处理备注',
  `handle_man` varchar(200) DEFAULT NULL COMMENT '处理人员',
  `receive_man` varchar(100) DEFAULT NULL COMMENT '收货人',
  `receive_time` datetime DEFAULT NULL COMMENT '收货时间',
  `receive_note` varchar(500) DEFAULT NULL COMMENT '收货备注',
  `receive_phone` varchar(20) DEFAULT NULL COMMENT '收货电话',
  `company_address` varchar(500) DEFAULT NULL COMMENT '公司收货地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单退货申请';

-- ----------------------------
-- Records of oms_order_return_apply
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_return_reason
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_reason`;
CREATE TABLE `oms_order_return_reason` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(200) DEFAULT NULL COMMENT '退货原因名',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `status` tinyint(1) DEFAULT NULL COMMENT '启用状态',
  `create_time` datetime DEFAULT NULL COMMENT 'create_time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='退货原因';

-- ----------------------------
-- Records of oms_order_return_reason
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_setting
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_setting`;
CREATE TABLE `oms_order_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `flash_order_overtime` int(11) DEFAULT NULL COMMENT '秒杀订单超时关闭时间(分)',
  `normal_order_overtime` int(11) DEFAULT NULL COMMENT '正常订单超时时间(分)',
  `confirm_overtime` int(11) DEFAULT NULL COMMENT '发货后自动确认收货时间（天）',
  `finish_overtime` int(11) DEFAULT NULL COMMENT '自动完成交易时间，不能申请退货（天）',
  `comment_overtime` int(11) DEFAULT NULL COMMENT '订单完成后自动好评时间（天）',
  `member_level` tinyint(2) DEFAULT NULL COMMENT '会员等级【0-不限会员等级，全部通用；其他-对应的其他会员等级】',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单配置信息';

-- ----------------------------
-- Records of oms_order_setting
-- ----------------------------

-- ----------------------------
-- Table structure for oms_payment_info
-- ----------------------------
DROP TABLE IF EXISTS `oms_payment_info`;
CREATE TABLE `oms_payment_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_sn` char(64) DEFAULT NULL COMMENT '订单号（对外业务号）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `alipay_trade_no` varchar(50) DEFAULT NULL COMMENT '支付宝交易流水号',
  `total_amount` decimal(18,4) DEFAULT NULL COMMENT '支付总金额',
  `subject` varchar(200) DEFAULT NULL COMMENT '交易内容',
  `payment_status` varchar(20) DEFAULT NULL COMMENT '支付状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `confirm_time` datetime DEFAULT NULL COMMENT '确认时间',
  `callback_content` varchar(4000) DEFAULT NULL COMMENT '回调内容',
  `callback_time` datetime DEFAULT NULL COMMENT '回调时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_sn` (`order_sn`) USING BTREE,
  UNIQUE KEY `alipay_trade_no` (`alipay_trade_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='支付信息表';

-- ----------------------------
-- Records of oms_payment_info
-- ----------------------------

-- ----------------------------
-- Table structure for oms_refund_info
-- ----------------------------
DROP TABLE IF EXISTS `oms_refund_info`;
CREATE TABLE `oms_refund_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_return_id` bigint(20) DEFAULT NULL COMMENT '退款的订单',
  `refund` decimal(18,4) DEFAULT NULL COMMENT '退款金额',
  `refund_sn` varchar(64) DEFAULT NULL COMMENT '退款交易流水号',
  `refund_status` tinyint(1) DEFAULT NULL COMMENT '退款状态',
  `refund_channel` tinyint(4) DEFAULT NULL COMMENT '退款渠道[1-支付宝，2-微信，3-银联，4-汇款]',
  `refund_content` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='退款信息';

-- ----------------------------
-- Records of oms_refund_info
-- ----------------------------

-- ----------------------------
-- Table structure for pms_attr
-- ----------------------------
DROP TABLE IF EXISTS `pms_attr`;
CREATE TABLE `pms_attr` (
  `attr_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '属性id',
  `attr_name` char(30) DEFAULT NULL COMMENT '属性名',
  `search_type` tinyint(4) DEFAULT NULL COMMENT '是否需要检索[0-不需要，1-需要]',
  `value_type` tinyint(4) DEFAULT NULL COMMENT '值类型[0-为单个值，1-可以选择多个值]',
  `icon` varchar(255) DEFAULT NULL COMMENT '属性图标',
  `value_select` char(255) DEFAULT NULL COMMENT '可选值列表[用逗号分隔]',
  `attr_type` tinyint(4) DEFAULT NULL COMMENT '属性类型[0-销售属性，1-基本属性',
  `enable` bigint(20) DEFAULT NULL COMMENT '启用状态[0 - 禁用，1 - 启用]',
  `catelog_id` bigint(20) DEFAULT NULL COMMENT '所属分类',
  `show_desc` tinyint(4) DEFAULT NULL COMMENT '快速展示【是否展示在介绍上；0-否 1-是】，在sku中仍然可以调整',
  PRIMARY KEY (`attr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='商品属性';

-- ----------------------------
-- Records of pms_attr
-- ----------------------------
INSERT INTO `pms_attr` VALUES ('7', '入网型号', '0', '0', 'xxx', 'A2217;C3J;以官网信息为准', '1', '1', '225', '0');
INSERT INTO `pms_attr` VALUES ('8', '上市年份', '0', '0', 'xxx', '2018;2019', '1', '1', '225', '0');
INSERT INTO `pms_attr` VALUES ('9', '颜色', '0', '0', 'xxx', '黑色;白色;蓝色', '0', '1', '225', '0');
INSERT INTO `pms_attr` VALUES ('10', '内存', '0', '0', 'xxx', '4GB;6GB;8GB;12GB', '0', '1', '225', '0');
INSERT INTO `pms_attr` VALUES ('11', '机身颜色', '0', '0', 'xxx', '黑色;白色', '1', '1', '225', '1');
INSERT INTO `pms_attr` VALUES ('12', '版本', '0', '0', 'xxx', '', '0', '1', '225', '0');
INSERT INTO `pms_attr` VALUES ('13', '机身长度（mm）', '0', '0', 'xx', '158.3;135.9', '1', '1', '225', '0');
INSERT INTO `pms_attr` VALUES ('14', '机身材质工艺', '0', '1', 'xxx', '以官网信息为准;陶瓷;玻璃', '1', '1', '225', '0');
INSERT INTO `pms_attr` VALUES ('15', 'CPU品牌', '1', '0', 'xxx', '高通(Qualcomm);海思（Hisilicon）;以官网信息为准', '1', '1', '225', '1');
INSERT INTO `pms_attr` VALUES ('16', 'CPU型号', '1', '0', 'xxx', '骁龙665;骁龙845;骁龙855;骁龙730;HUAWEI Kirin 980;HUAWEI Kirin 970', '1', '1', '225', '0');

-- ----------------------------
-- Table structure for pms_attr_attrgroup_relation
-- ----------------------------
DROP TABLE IF EXISTS `pms_attr_attrgroup_relation`;
CREATE TABLE `pms_attr_attrgroup_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `attr_id` bigint(20) DEFAULT NULL COMMENT '属性id',
  `attr_group_id` bigint(20) DEFAULT NULL COMMENT '属性分组id',
  `attr_sort` int(11) DEFAULT NULL COMMENT '属性组内排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COMMENT='属性&属性分组关联';

-- ----------------------------
-- Records of pms_attr_attrgroup_relation
-- ----------------------------
INSERT INTO `pms_attr_attrgroup_relation` VALUES ('23', '7', '1', null);
INSERT INTO `pms_attr_attrgroup_relation` VALUES ('24', '8', '1', null);
INSERT INTO `pms_attr_attrgroup_relation` VALUES ('26', '11', '2', null);
INSERT INTO `pms_attr_attrgroup_relation` VALUES ('27', '13', '2', null);
INSERT INTO `pms_attr_attrgroup_relation` VALUES ('28', '14', '2', null);
INSERT INTO `pms_attr_attrgroup_relation` VALUES ('29', '15', '7', null);
INSERT INTO `pms_attr_attrgroup_relation` VALUES ('30', '16', '7', null);

-- ----------------------------
-- Table structure for pms_attr_group
-- ----------------------------
DROP TABLE IF EXISTS `pms_attr_group`;
CREATE TABLE `pms_attr_group` (
  `attr_group_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分组id',
  `attr_group_name` char(20) DEFAULT NULL COMMENT '组名',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `descript` varchar(255) DEFAULT NULL COMMENT '描述',
  `icon` varchar(255) DEFAULT NULL COMMENT '组图标',
  `catelog_id` bigint(20) DEFAULT NULL COMMENT '所属分类id',
  PRIMARY KEY (`attr_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='属性分组';

-- ----------------------------
-- Records of pms_attr_group
-- ----------------------------
INSERT INTO `pms_attr_group` VALUES ('1', '主体', '0', '主体', 'dd', '225');
INSERT INTO `pms_attr_group` VALUES ('2', '基本信息', '0', '基本信息', 'xx', '225');
INSERT INTO `pms_attr_group` VALUES ('4', '屏幕', '0', '屏幕', 'xx', '233');
INSERT INTO `pms_attr_group` VALUES ('7', '主芯片', '0', '主芯片', 'xx', '225');

-- ----------------------------
-- Table structure for pms_brand
-- ----------------------------
DROP TABLE IF EXISTS `pms_brand`;
CREATE TABLE `pms_brand` (
  `brand_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '品牌id',
  `name` char(50) DEFAULT NULL COMMENT '品牌名',
  `logo` varchar(2000) DEFAULT NULL COMMENT '品牌logo地址',
  `descript` longtext COMMENT '介绍',
  `show_status` tinyint(4) DEFAULT NULL COMMENT '显示状态[0-不显示；1-显示]',
  `first_letter` char(1) DEFAULT NULL COMMENT '检索首字母',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='品牌';

-- ----------------------------
-- Records of pms_brand
-- ----------------------------
INSERT INTO `pms_brand` VALUES ('9', '华为', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-18/de2426bd-a689-41d0-865a-d45d1afa7cde_huawei.png', '华为', '1', 'H', '1');
INSERT INTO `pms_brand` VALUES ('10', '小米', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-18/1f9e6968-cf92-462e-869a-4c2331a4113f_xiaomi.png', '小米', '1', 'M', '1');
INSERT INTO `pms_brand` VALUES ('11', 'oppo', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-18/5c8303f2-8b0c-4a5b-89a6-86513133d758_oppo.png', 'oppo', '1', 'O', '1');
INSERT INTO `pms_brand` VALUES ('12', 'Apple', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-18/819bb0b1-3ed8-4072-8304-78811a289781_apple.png', '苹果', '1', 'A', '1');

-- ----------------------------
-- Table structure for pms_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_category`;
CREATE TABLE `pms_category` (
  `cat_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` char(50) DEFAULT NULL COMMENT '分类名称',
  `parent_cid` bigint(20) DEFAULT NULL COMMENT '父分类id',
  `cat_level` int(11) DEFAULT NULL COMMENT '层级',
  `show_status` tinyint(4) DEFAULT NULL COMMENT '是否显示[0-不显示，1显示]',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `icon` char(255) DEFAULT NULL COMMENT '图标地址',
  `product_unit` char(50) DEFAULT NULL COMMENT '计量单位',
  `product_count` int(11) DEFAULT NULL COMMENT '商品数量',
  PRIMARY KEY (`cat_id`),
  KEY `parent_cid` (`parent_cid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1433 DEFAULT CHARSET=utf8mb4 COMMENT='商品三级分类';

-- ----------------------------
-- Records of pms_category
-- ----------------------------
INSERT INTO `pms_category` VALUES ('1', '图书、音像、电子书刊', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('2', '手机', '0', '1', '1', '0', '111q', null, '0');
INSERT INTO `pms_category` VALUES ('3', '家用电器', '0', '1', '1', '0', 'aaa', null, '0');
INSERT INTO `pms_category` VALUES ('4', '数码', '0', '1', '1', '0', 'aaa', null, '0');
INSERT INTO `pms_category` VALUES ('5', '家居家装', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('6', '电脑办公', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('7', '厨具', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('8', '个护化妆', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('9', '服饰内衣', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('10', '钟表', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('11', '鞋靴', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('12', '母婴', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('13', '礼品箱包', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('14', '食品饮料、保健食品', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('15', '珠宝', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('16', '汽车用品', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('17', '运动健康', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('18', '玩具乐器', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('19', '彩票、旅行、充值、票务', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('20', '生鲜', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('21', '整车', '0', '1', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('22', '电子书刊', '1', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('23', '音像', '1', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('24', '英文原版', '1', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('25', '文艺', '1', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('26', '少儿', '1', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('27', '人文社科', '1', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('28', '经管励志', '1', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('29', '生活', '1', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('30', '科技', '1', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('31', '教育', '1', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('32', '港台图书', '1', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('33', '其他', '1', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('34', '手机通讯', '2', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('35', '运营商', '2', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('36', '手机配件', '2', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('37', '大 家 电', '3', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('38', '厨卫大电', '3', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('39', '厨房小电', '3', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('40', '生活电器', '3', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('41', '个护健康', '3', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('42', '五金家装', '3', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('43', '摄影摄像', '4', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('44', '数码配件', '4', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('45', '智能设备', '4', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('46', '影音娱乐', '4', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('47', '电子教育', '4', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('48', '虚拟商品', '4', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('49', '家纺', '5', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('50', '灯具', '5', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('51', '生活日用', '5', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('52', '家装软饰', '5', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('53', '宠物生活', '5', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('54', '电脑整机', '6', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('55', '电脑配件', '6', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('56', '外设产品', '6', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('57', '游戏设备', '6', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('58', '网络产品', '6', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('59', '办公设备', '6', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('60', '文具/耗材', '6', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('61', '服务产品', '6', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('62', '烹饪锅具', '7', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('63', '刀剪菜板', '7', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('64', '厨房配件', '7', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('65', '水具酒具', '7', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('66', '餐具', '7', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('67', '酒店用品', '7', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('68', '茶具/咖啡具', '7', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('69', '清洁用品', '8', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('70', '面部护肤', '8', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('71', '身体护理', '8', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('72', '口腔护理', '8', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('73', '女性护理', '8', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('74', '洗发护发', '8', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('75', '香水彩妆', '8', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('76', '女装', '9', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('77', '男装', '9', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('78', '内衣', '9', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('79', '洗衣服务', '9', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('80', '服饰配件', '9', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('81', '钟表', '10', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('82', '流行男鞋', '11', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('83', '时尚女鞋', '11', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('84', '奶粉', '12', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('85', '营养辅食', '12', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('86', '尿裤湿巾', '12', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('87', '喂养用品', '12', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('88', '洗护用品', '12', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('89', '童车童床', '12', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('90', '寝居服饰', '12', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('91', '妈妈专区', '12', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('92', '童装童鞋', '12', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('93', '安全座椅', '12', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('94', '潮流女包', '13', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('95', '精品男包', '13', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('96', '功能箱包', '13', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('97', '礼品', '13', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('98', '奢侈品', '13', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('99', '婚庆', '13', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('100', '进口食品', '14', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('101', '地方特产', '14', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('102', '休闲食品', '14', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('103', '粮油调味', '14', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('104', '饮料冲调', '14', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('105', '食品礼券', '14', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('106', '茗茶', '14', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('107', '时尚饰品', '15', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('108', '黄金', '15', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('109', 'K金饰品', '15', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('110', '金银投资', '15', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('111', '银饰', '15', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('112', '钻石', '15', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('113', '翡翠玉石', '15', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('114', '水晶玛瑙', '15', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('115', '彩宝', '15', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('116', '铂金', '15', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('117', '木手串/把件', '15', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('118', '珍珠', '15', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('119', '维修保养', '16', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('120', '车载电器', '16', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('121', '美容清洗', '16', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('122', '汽车装饰', '16', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('123', '安全自驾', '16', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('124', '汽车服务', '16', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('125', '赛事改装', '16', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('126', '运动鞋包', '17', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('127', '运动服饰', '17', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('128', '骑行运动', '17', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('129', '垂钓用品', '17', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('130', '游泳用品', '17', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('131', '户外鞋服', '17', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('132', '户外装备', '17', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('133', '健身训练', '17', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('134', '体育用品', '17', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('135', '适用年龄', '18', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('136', '遥控/电动', '18', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('137', '毛绒布艺', '18', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('138', '娃娃玩具', '18', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('139', '模型玩具', '18', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('140', '健身玩具', '18', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('141', '动漫玩具', '18', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('142', '益智玩具', '18', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('143', '积木拼插', '18', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('144', 'DIY玩具', '18', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('145', '创意减压', '18', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('146', '乐器', '18', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('147', '彩票', '19', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('148', '机票', '19', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('149', '酒店', '19', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('150', '旅行', '19', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('151', '充值', '19', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('152', '游戏', '19', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('153', '票务', '19', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('154', '产地直供', '20', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('155', '水果', '20', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('156', '猪牛羊肉', '20', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('157', '海鲜水产', '20', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('158', '禽肉蛋品', '20', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('159', '冷冻食品', '20', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('160', '熟食腊味', '20', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('161', '饮品甜品', '20', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('162', '蔬菜', '20', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('163', '全新整车', '21', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('164', '二手车', '21', '2', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('165', '电子书', '22', '3', '1', '1', null, null, '0');
INSERT INTO `pms_category` VALUES ('166', '网络原创', '22', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('167', '数字杂志', '22', '3', '1', '2', null, null, '0');
INSERT INTO `pms_category` VALUES ('168', '多媒体图书', '22', '3', '1', '3', null, null, '0');
INSERT INTO `pms_category` VALUES ('169', '音乐', '23', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('170', '影视', '23', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('171', '教育音像', '23', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('172', '少儿', '24', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('173', '商务投资', '24', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('174', '英语学习与考试', '24', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('175', '文学', '24', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('176', '传记', '24', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('177', '励志', '24', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('178', '小说', '25', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('179', '文学', '25', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('180', '青春文学', '25', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('181', '传记', '25', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('182', '艺术', '25', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('183', '少儿', '26', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('184', '0-2岁', '26', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('185', '3-6岁', '26', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('186', '7-10岁', '26', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('187', '11-14岁', '26', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('188', '历史', '27', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('189', '哲学', '27', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('190', '国学', '27', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('191', '政治/军事', '27', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('192', '法律', '27', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('193', '人文社科', '27', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('194', '心理学', '27', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('195', '文化', '27', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('196', '社会科学', '27', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('197', '经济', '28', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('198', '金融与投资', '28', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('199', '管理', '28', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('200', '励志与成功', '28', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('201', '生活', '29', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('202', '健身与保健', '29', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('203', '家庭与育儿', '29', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('204', '旅游', '29', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('205', '烹饪美食', '29', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('206', '工业技术', '30', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('207', '科普读物', '30', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('208', '建筑', '30', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('209', '医学', '30', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('210', '科学与自然', '30', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('211', '计算机与互联网', '30', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('212', '电子通信', '30', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('213', '中小学教辅', '31', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('214', '教育与考试', '31', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('215', '外语学习', '31', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('216', '大中专教材', '31', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('217', '字典词典', '31', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('218', '艺术/设计/收藏', '32', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('219', '经济管理', '32', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('220', '文化/学术', '32', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('221', '少儿', '32', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('222', '工具书', '33', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('223', '杂志/期刊', '33', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('224', '套装书', '33', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('225', '手机', '34', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('226', '对讲机', '34', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('227', '合约机', '35', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('228', '选号中心', '35', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('229', '装宽带', '35', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('230', '办套餐', '35', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('231', '移动电源', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('232', '电池/移动电源', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('233', '蓝牙耳机', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('234', '充电器/数据线', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('235', '苹果周边', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('236', '手机耳机', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('237', '手机贴膜', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('238', '手机存储卡', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('239', '充电器', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('240', '数据线', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('241', '手机保护套', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('242', '车载配件', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('243', 'iPhone 配件', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('244', '手机电池', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('245', '创意配件', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('246', '便携/无线音响', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('247', '手机饰品', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('248', '拍照配件', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('249', '手机支架', '36', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('250', '平板电视', '37', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('251', '空调', '37', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('252', '冰箱', '37', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('253', '洗衣机', '37', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('254', '家庭影院', '37', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('255', 'DVD/电视盒子', '37', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('256', '迷你音响', '37', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('257', '冷柜/冰吧', '37', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('258', '家电配件', '37', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('259', '功放', '37', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('260', '回音壁/Soundbar', '37', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('261', 'Hi-Fi专区', '37', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('262', '电视盒子', '37', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('263', '酒柜', '37', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('264', '燃气灶', '38', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('265', '油烟机', '38', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('266', '热水器', '38', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('267', '消毒柜', '38', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('268', '洗碗机', '38', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('269', '料理机', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('270', '榨汁机', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('271', '电饭煲', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('272', '电压力锅', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('273', '豆浆机', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('274', '咖啡机', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('275', '微波炉', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('276', '电烤箱', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('277', '电磁炉', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('278', '面包机', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('279', '煮蛋器', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('280', '酸奶机', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('281', '电炖锅', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('282', '电水壶/热水瓶', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('283', '电饼铛', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('284', '多用途锅', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('285', '电烧烤炉', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('286', '果蔬解毒机', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('287', '其它厨房电器', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('288', '养生壶/煎药壶', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('289', '电热饭盒', '39', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('290', '取暖电器', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('291', '净化器', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('292', '加湿器', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('293', '扫地机器人', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('294', '吸尘器', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('295', '挂烫机/熨斗', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('296', '插座', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('297', '电话机', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('298', '清洁机', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('299', '除湿机', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('300', '干衣机', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('301', '收录/音机', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('302', '电风扇', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('303', '冷风扇', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('304', '其它生活电器', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('305', '生活电器配件', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('306', '净水器', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('307', '饮水机', '40', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('308', '剃须刀', '41', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('309', '剃/脱毛器', '41', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('310', '口腔护理', '41', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('311', '电吹风', '41', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('312', '美容器', '41', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('313', '理发器', '41', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('314', '卷/直发器', '41', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('315', '按摩椅', '41', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('316', '按摩器', '41', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('317', '足浴盆', '41', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('318', '血压计', '41', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('319', '电子秤/厨房秤', '41', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('320', '血糖仪', '41', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('321', '体温计', '41', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('322', '其它健康电器', '41', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('323', '计步器/脂肪检测仪', '41', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('324', '电动工具', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('325', '手动工具', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('326', '仪器仪表', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('327', '浴霸/排气扇', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('328', '灯具', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('329', 'LED灯', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('330', '洁身器', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('331', '水槽', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('332', '龙头', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('333', '淋浴花洒', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('334', '厨卫五金', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('335', '家具五金', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('336', '门铃', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('337', '电气开关', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('338', '插座', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('339', '电工电料', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('340', '监控安防', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('341', '电线/线缆', '42', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('342', '数码相机', '43', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('343', '单电/微单相机', '43', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('344', '单反相机', '43', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('345', '摄像机', '43', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('346', '拍立得', '43', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('347', '运动相机', '43', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('348', '镜头', '43', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('349', '户外器材', '43', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('350', '影棚器材', '43', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('351', '冲印服务', '43', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('352', '数码相框', '43', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('353', '存储卡', '44', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('354', '读卡器', '44', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('355', '滤镜', '44', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('356', '闪光灯/手柄', '44', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('357', '相机包', '44', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('358', '三脚架/云台', '44', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('359', '相机清洁/贴膜', '44', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('360', '机身附件', '44', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('361', '镜头附件', '44', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('362', '电池/充电器', '44', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('363', '移动电源', '44', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('364', '数码支架', '44', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('365', '智能手环', '45', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('366', '智能手表', '45', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('367', '智能眼镜', '45', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('368', '运动跟踪器', '45', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('369', '健康监测', '45', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('370', '智能配饰', '45', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('371', '智能家居', '45', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('372', '体感车', '45', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('373', '其他配件', '45', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('374', '智能机器人', '45', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('375', '无人机', '45', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('376', 'MP3/MP4', '46', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('377', '智能设备', '46', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('378', '耳机/耳麦', '46', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('379', '便携/无线音箱', '46', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('380', '音箱/音响', '46', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('381', '高清播放器', '46', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('382', '收音机', '46', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('383', 'MP3/MP4配件', '46', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('384', '麦克风', '46', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('385', '专业音频', '46', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('386', '苹果配件', '46', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('387', '学生平板', '47', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('388', '点读机/笔', '47', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('389', '早教益智', '47', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('390', '录音笔', '47', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('391', '电纸书', '47', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('392', '电子词典', '47', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('393', '复读机', '47', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('394', '延保服务', '48', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('395', '杀毒软件', '48', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('396', '积分商品', '48', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('397', '桌布/罩件', '49', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('398', '地毯地垫', '49', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('399', '沙发垫套/椅垫', '49', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('400', '床品套件', '49', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('401', '被子', '49', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('402', '枕芯', '49', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('403', '床单被罩', '49', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('404', '毯子', '49', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('405', '床垫/床褥', '49', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('406', '蚊帐', '49', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('407', '抱枕靠垫', '49', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('408', '毛巾浴巾', '49', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('409', '电热毯', '49', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('410', '窗帘/窗纱', '49', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('411', '布艺软饰', '49', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('412', '凉席', '49', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('413', '台灯', '50', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('414', '节能灯', '50', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('415', '装饰灯', '50', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('416', '落地灯', '50', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('417', '应急灯/手电', '50', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('418', 'LED灯', '50', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('419', '吸顶灯', '50', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('420', '五金电器', '50', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('421', '筒灯射灯', '50', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('422', '吊灯', '50', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('423', '氛围照明', '50', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('424', '保暖防护', '51', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('425', '收纳用品', '51', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('426', '雨伞雨具', '51', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('427', '浴室用品', '51', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('428', '缝纫/针织用品', '51', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('429', '洗晒/熨烫', '51', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('430', '净化除味', '51', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('431', '相框/照片墙', '52', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('432', '装饰字画', '52', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('433', '节庆饰品', '52', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('434', '手工/十字绣', '52', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('435', '装饰摆件', '52', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('436', '帘艺隔断', '52', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('437', '墙贴/装饰贴', '52', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('438', '钟饰', '52', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('439', '花瓶花艺', '52', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('440', '香薰蜡烛', '52', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('441', '创意家居', '52', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('442', '宠物主粮', '53', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('443', '宠物零食', '53', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('444', '医疗保健', '53', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('445', '家居日用', '53', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('446', '宠物玩具', '53', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('447', '出行装备', '53', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('448', '洗护美容', '53', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('449', '笔记本', '54', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('450', '超极本', '54', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('451', '游戏本', '54', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('452', '平板电脑', '54', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('453', '平板电脑配件', '54', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('454', '台式机', '54', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('455', '服务器/工作站', '54', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('456', '笔记本配件', '54', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('457', '一体机', '54', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('458', 'CPU', '55', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('459', '主板', '55', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('460', '显卡', '55', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('461', '硬盘', '55', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('462', 'SSD固态硬盘', '55', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('463', '内存', '55', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('464', '机箱', '55', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('465', '电源', '55', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('466', '显示器', '55', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('467', '刻录机/光驱', '55', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('468', '散热器', '55', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('469', '声卡/扩展卡', '55', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('470', '装机配件', '55', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('471', '组装电脑', '55', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('472', '移动硬盘', '56', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('473', 'U盘', '56', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('474', '鼠标', '56', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('475', '键盘', '56', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('476', '鼠标垫', '56', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('477', '摄像头', '56', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('478', '手写板', '56', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('479', '硬盘盒', '56', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('480', '插座', '56', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('481', '线缆', '56', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('482', 'UPS电源', '56', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('483', '电脑工具', '56', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('484', '游戏设备', '56', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('485', '电玩', '56', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('486', '电脑清洁', '56', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('487', '网络仪表仪器', '56', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('488', '游戏机', '57', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('489', '游戏耳机', '57', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('490', '手柄/方向盘', '57', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('491', '游戏软件', '57', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('492', '游戏周边', '57', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('493', '路由器', '58', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('494', '网卡', '58', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('495', '交换机', '58', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('496', '网络存储', '58', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('497', '4G/3G上网', '58', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('498', '网络盒子', '58', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('499', '网络配件', '58', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('500', '投影机', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('501', '投影配件', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('502', '多功能一体机', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('503', '打印机', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('504', '传真设备', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('505', '验钞/点钞机', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('506', '扫描设备', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('507', '复合机', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('508', '碎纸机', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('509', '考勤机', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('510', '收款/POS机', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('511', '会议音频视频', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('512', '保险柜', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('513', '装订/封装机', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('514', '安防监控', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('515', '办公家具', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('516', '白板', '59', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('517', '硒鼓/墨粉', '60', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('518', '墨盒', '60', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('519', '色带', '60', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('520', '纸类', '60', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('521', '办公文具', '60', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('522', '学生文具', '60', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('523', '财会用品', '60', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('524', '文件管理', '60', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('525', '本册/便签', '60', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('526', '计算器', '60', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('527', '笔类', '60', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('528', '画具画材', '60', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('529', '刻录碟片/附件', '60', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('530', '上门安装', '61', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('531', '延保服务', '61', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('532', '维修保养', '61', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('533', '电脑软件', '61', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('534', '京东服务', '61', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('535', '炒锅', '62', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('536', '煎锅', '62', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('537', '压力锅', '62', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('538', '蒸锅', '62', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('539', '汤锅', '62', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('540', '奶锅', '62', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('541', '锅具套装', '62', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('542', '煲类', '62', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('543', '水壶', '62', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('544', '火锅', '62', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('545', '菜刀', '63', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('546', '剪刀', '63', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('547', '刀具套装', '63', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('548', '砧板', '63', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('549', '瓜果刀/刨', '63', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('550', '多功能刀', '63', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('551', '保鲜盒', '64', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('552', '烘焙/烧烤', '64', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('553', '饭盒/提锅', '64', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('554', '储物/置物架', '64', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('555', '厨房DIY/小工具', '64', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('556', '塑料杯', '65', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('557', '运动水壶', '65', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('558', '玻璃杯', '65', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('559', '陶瓷/马克杯', '65', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('560', '保温杯', '65', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('561', '保温壶', '65', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('562', '酒杯/酒具', '65', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('563', '杯具套装', '65', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('564', '餐具套装', '66', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('565', '碗/碟/盘', '66', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('566', '筷勺/刀叉', '66', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('567', '一次性用品', '66', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('568', '果盘/果篮', '66', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('569', '自助餐炉', '67', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('570', '酒店餐具', '67', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('571', '酒店水具', '67', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('572', '整套茶具', '68', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('573', '茶杯', '68', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('574', '茶壶', '68', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('575', '茶盘茶托', '68', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('576', '茶叶罐', '68', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('577', '茶具配件', '68', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('578', '茶宠摆件', '68', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('579', '咖啡具', '68', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('580', '其他', '68', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('581', '纸品湿巾', '69', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('582', '衣物清洁', '69', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('583', '清洁工具', '69', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('584', '驱虫用品', '69', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('585', '家庭清洁', '69', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('586', '皮具护理', '69', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('587', '一次性用品', '69', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('588', '洁面', '70', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('589', '乳液面霜', '70', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('590', '面膜', '70', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('591', '剃须', '70', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('592', '套装', '70', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('593', '精华', '70', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('594', '眼霜', '70', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('595', '卸妆', '70', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('596', '防晒', '70', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('597', '防晒隔离', '70', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('598', 'T区护理', '70', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('599', '眼部护理', '70', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('600', '精华露', '70', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('601', '爽肤水', '70', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('602', '沐浴', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('603', '润肤', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('604', '颈部', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('605', '手足', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('606', '纤体塑形', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('607', '美胸', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('608', '套装', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('609', '精油', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('610', '洗发护发', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('611', '染发/造型', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('612', '香薰精油', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('613', '磨砂/浴盐', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('614', '手工/香皂', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('615', '洗发', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('616', '护发', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('617', '染发', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('618', '磨砂膏', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('619', '香皂', '71', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('620', '牙膏/牙粉', '72', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('621', '牙刷/牙线', '72', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('622', '漱口水', '72', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('623', '套装', '72', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('624', '卫生巾', '73', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('625', '卫生护垫', '73', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('626', '私密护理', '73', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('627', '脱毛膏', '73', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('628', '其他', '73', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('629', '洗发', '74', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('630', '护发', '74', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('631', '染发', '74', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('632', '造型', '74', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('633', '假发', '74', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('634', '套装', '74', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('635', '美发工具', '74', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('636', '脸部护理', '74', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('637', '香水', '75', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('638', '底妆', '75', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('639', '腮红', '75', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('640', '眼影', '75', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('641', '唇部', '75', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('642', '美甲', '75', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('643', '眼线', '75', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('644', '美妆工具', '75', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('645', '套装', '75', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('646', '防晒隔离', '75', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('647', '卸妆', '75', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('648', '眉笔', '75', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('649', '睫毛膏', '75', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('650', 'T恤', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('651', '衬衫', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('652', '针织衫', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('653', '雪纺衫', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('654', '卫衣', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('655', '马甲', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('656', '连衣裙', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('657', '半身裙', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('658', '牛仔裤', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('659', '休闲裤', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('660', '打底裤', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('661', '正装裤', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('662', '小西装', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('663', '短外套', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('664', '风衣', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('665', '毛呢大衣', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('666', '真皮皮衣', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('667', '棉服', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('668', '羽绒服', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('669', '大码女装', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('670', '中老年女装', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('671', '婚纱', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('672', '打底衫', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('673', '旗袍/唐装', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('674', '加绒裤', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('675', '吊带/背心', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('676', '羊绒衫', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('677', '短裤', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('678', '皮草', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('679', '礼服', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('680', '仿皮皮衣', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('681', '羊毛衫', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('682', '设计师/潮牌', '76', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('683', '衬衫', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('684', 'T恤', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('685', 'POLO衫', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('686', '针织衫', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('687', '羊绒衫', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('688', '卫衣', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('689', '马甲/背心', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('690', '夹克', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('691', '风衣', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('692', '毛呢大衣', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('693', '仿皮皮衣', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('694', '西服', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('695', '棉服', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('696', '羽绒服', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('697', '牛仔裤', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('698', '休闲裤', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('699', '西裤', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('700', '西服套装', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('701', '大码男装', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('702', '中老年男装', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('703', '唐装/中山装', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('704', '工装', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('705', '真皮皮衣', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('706', '加绒裤', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('707', '卫裤/运动裤', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('708', '短裤', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('709', '设计师/潮牌', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('710', '羊毛衫', '77', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('711', '文胸', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('712', '女式内裤', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('713', '男式内裤', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('714', '睡衣/家居服', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('715', '塑身美体', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('716', '泳衣', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('717', '吊带/背心', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('718', '抹胸', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('719', '连裤袜/丝袜', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('720', '美腿袜', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('721', '商务男袜', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('722', '保暖内衣', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('723', '情侣睡衣', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('724', '文胸套装', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('725', '少女文胸', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('726', '休闲棉袜', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('727', '大码内衣', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('728', '内衣配件', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('729', '打底裤袜', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('730', '打底衫', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('731', '秋衣秋裤', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('732', '情趣内衣', '78', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('733', '服装洗护', '79', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('734', '太阳镜', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('735', '光学镜架/镜片', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('736', '围巾/手套/帽子套装', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('737', '袖扣', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('738', '棒球帽', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('739', '毛线帽', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('740', '遮阳帽', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('741', '老花镜', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('742', '装饰眼镜', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('743', '防辐射眼镜', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('744', '游泳镜', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('745', '女士丝巾/围巾/披肩', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('746', '男士丝巾/围巾', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('747', '鸭舌帽', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('748', '贝雷帽', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('749', '礼帽', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('750', '真皮手套', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('751', '毛线手套', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('752', '防晒手套', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('753', '男士腰带/礼盒', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('754', '女士腰带/礼盒', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('755', '钥匙扣', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('756', '遮阳伞/雨伞', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('757', '口罩', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('758', '耳罩/耳包', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('759', '假领', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('760', '毛线/布面料', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('761', '领带/领结/领带夹', '80', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('762', '男表', '81', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('763', '瑞表', '81', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('764', '女表', '81', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('765', '国表', '81', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('766', '日韩表', '81', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('767', '欧美表', '81', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('768', '德表', '81', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('769', '儿童手表', '81', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('770', '智能手表', '81', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('771', '闹钟', '81', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('772', '座钟挂钟', '81', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('773', '钟表配件', '81', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('774', '商务休闲鞋', '82', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('775', '正装鞋', '82', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('776', '休闲鞋', '82', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('777', '凉鞋/沙滩鞋', '82', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('778', '男靴', '82', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('779', '功能鞋', '82', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('780', '拖鞋/人字拖', '82', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('781', '雨鞋/雨靴', '82', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('782', '传统布鞋', '82', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('783', '鞋配件', '82', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('784', '帆布鞋', '82', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('785', '增高鞋', '82', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('786', '工装鞋', '82', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('787', '定制鞋', '82', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('788', '高跟鞋', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('789', '单鞋', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('790', '休闲鞋', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('791', '凉鞋', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('792', '女靴', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('793', '雪地靴', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('794', '拖鞋/人字拖', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('795', '踝靴', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('796', '筒靴', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('797', '帆布鞋', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('798', '雨鞋/雨靴', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('799', '妈妈鞋', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('800', '鞋配件', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('801', '特色鞋', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('802', '鱼嘴鞋', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('803', '布鞋/绣花鞋', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('804', '马丁靴', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('805', '坡跟鞋', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('806', '松糕鞋', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('807', '内增高', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('808', '防水台', '83', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('809', '婴幼奶粉', '84', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('810', '孕妈奶粉', '84', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('811', '益生菌/初乳', '85', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('812', '米粉/菜粉', '85', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('813', '果泥/果汁', '85', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('814', 'DHA', '85', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('815', '宝宝零食', '85', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('816', '钙铁锌/维生素', '85', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('817', '清火/开胃', '85', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('818', '面条/粥', '85', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('819', '婴儿尿裤', '86', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('820', '拉拉裤', '86', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('821', '婴儿湿巾', '86', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('822', '成人尿裤', '86', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('823', '奶瓶奶嘴', '87', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('824', '吸奶器', '87', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('825', '暖奶消毒', '87', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('826', '儿童餐具', '87', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('827', '水壶/水杯', '87', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('828', '牙胶安抚', '87', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('829', '围兜/防溅衣', '87', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('830', '辅食料理机', '87', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('831', '食物存储', '87', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('832', '宝宝护肤', '88', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('833', '洗发沐浴', '88', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('834', '奶瓶清洗', '88', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('835', '驱蚊防晒', '88', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('836', '理发器', '88', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('837', '洗澡用具', '88', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('838', '婴儿口腔清洁', '88', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('839', '洗衣液/皂', '88', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('840', '日常护理', '88', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('841', '座便器', '88', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('842', '婴儿推车', '89', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('843', '餐椅摇椅', '89', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('844', '婴儿床', '89', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('845', '学步车', '89', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('846', '三轮车', '89', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('847', '自行车', '89', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('848', '电动车', '89', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('849', '扭扭车', '89', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('850', '滑板车', '89', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('851', '婴儿床垫', '89', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('852', '婴儿外出服', '90', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('853', '婴儿内衣', '90', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('854', '婴儿礼盒', '90', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('855', '婴儿鞋帽袜', '90', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('856', '安全防护', '90', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('857', '家居床品', '90', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('858', '睡袋/抱被', '90', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('859', '爬行垫', '90', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('860', '妈咪包/背婴带', '91', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('861', '产后塑身', '91', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('862', '文胸/内裤', '91', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('863', '防辐射服', '91', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('864', '孕妈装', '91', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('865', '孕期营养', '91', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('866', '孕妇护肤', '91', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('867', '待产护理', '91', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('868', '月子装', '91', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('869', '防溢乳垫', '91', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('870', '套装', '92', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('871', '上衣', '92', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('872', '裤子', '92', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('873', '裙子', '92', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('874', '内衣/家居服', '92', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('875', '羽绒服/棉服', '92', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('876', '亲子装', '92', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('877', '儿童配饰', '92', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('878', '礼服/演出服', '92', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('879', '运动鞋', '92', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('880', '皮鞋/帆布鞋', '92', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('881', '靴子', '92', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('882', '凉鞋', '92', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('883', '功能鞋', '92', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('884', '户外/运动服', '92', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('885', '提篮式', '93', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('886', '安全座椅', '93', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('887', '增高垫', '93', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('888', '钱包', '94', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('889', '手拿包', '94', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('890', '单肩包', '94', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('891', '双肩包', '94', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('892', '手提包', '94', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('893', '斜挎包', '94', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('894', '钥匙包', '94', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('895', '卡包/零钱包', '94', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('896', '男士钱包', '95', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('897', '男士手包', '95', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('898', '卡包名片夹', '95', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('899', '商务公文包', '95', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('900', '双肩包', '95', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('901', '单肩/斜挎包', '95', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('902', '钥匙包', '95', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('903', '电脑包', '96', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('904', '拉杆箱', '96', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('905', '旅行包', '96', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('906', '旅行配件', '96', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('907', '休闲运动包', '96', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('908', '拉杆包', '96', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('909', '登山包', '96', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('910', '妈咪包', '96', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('911', '书包', '96', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('912', '相机包', '96', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('913', '腰包/胸包', '96', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('914', '火机烟具', '97', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('915', '礼品文具', '97', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('916', '军刀军具', '97', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('917', '收藏品', '97', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('918', '工艺礼品', '97', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('919', '创意礼品', '97', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('920', '礼盒礼券', '97', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('921', '鲜花绿植', '97', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('922', '婚庆节庆', '97', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('923', '京东卡', '97', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('924', '美妆礼品', '97', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('925', '礼品定制', '97', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('926', '京东福卡', '97', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('927', '古董文玩', '97', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('928', '箱包', '98', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('929', '钱包', '98', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('930', '服饰', '98', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('931', '腰带', '98', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('932', '太阳镜/眼镜框', '98', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('933', '配件', '98', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('934', '鞋靴', '98', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('935', '饰品', '98', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('936', '名品腕表', '98', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('937', '高档化妆品', '98', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('938', '婚嫁首饰', '99', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('939', '婚纱摄影', '99', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('940', '婚纱礼服', '99', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('941', '婚庆服务', '99', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('942', '婚庆礼品/用品', '99', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('943', '婚宴', '99', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('944', '饼干蛋糕', '100', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('945', '糖果/巧克力', '100', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('946', '休闲零食', '100', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('947', '冲调饮品', '100', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('948', '粮油调味', '100', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('949', '牛奶', '100', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('950', '其他特产', '101', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('951', '新疆', '101', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('952', '北京', '101', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('953', '山西', '101', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('954', '内蒙古', '101', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('955', '福建', '101', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('956', '湖南', '101', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('957', '四川', '101', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('958', '云南', '101', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('959', '东北', '101', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('960', '休闲零食', '102', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('961', '坚果炒货', '102', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('962', '肉干肉脯', '102', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('963', '蜜饯果干', '102', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('964', '糖果/巧克力', '102', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('965', '饼干蛋糕', '102', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('966', '无糖食品', '102', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('967', '米面杂粮', '103', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('968', '食用油', '103', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('969', '调味品', '103', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('970', '南北干货', '103', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('971', '方便食品', '103', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('972', '有机食品', '103', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('973', '饮用水', '104', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('974', '饮料', '104', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('975', '牛奶乳品', '104', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('976', '咖啡/奶茶', '104', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('977', '冲饮谷物', '104', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('978', '蜂蜜/柚子茶', '104', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('979', '成人奶粉', '104', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('980', '月饼', '105', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('981', '大闸蟹', '105', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('982', '粽子', '105', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('983', '卡券', '105', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('984', '铁观音', '106', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('985', '普洱', '106', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('986', '龙井', '106', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('987', '绿茶', '106', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('988', '红茶', '106', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('989', '乌龙茶', '106', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('990', '花草茶', '106', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('991', '花果茶', '106', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('992', '养生茶', '106', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('993', '黑茶', '106', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('994', '白茶', '106', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('995', '其它茶', '106', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('996', '项链', '107', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('997', '手链/脚链', '107', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('998', '戒指', '107', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('999', '耳饰', '107', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1000', '毛衣链', '107', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1001', '发饰/发卡', '107', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1002', '胸针', '107', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1003', '饰品配件', '107', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1004', '婚庆饰品', '107', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1005', '黄金吊坠', '108', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1006', '黄金项链', '108', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1007', '黄金转运珠', '108', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1008', '黄金手镯/手链/脚链', '108', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1009', '黄金耳饰', '108', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1010', '黄金戒指', '108', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1011', 'K金吊坠', '109', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1012', 'K金项链', '109', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1013', 'K金手镯/手链/脚链', '109', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1014', 'K金戒指', '109', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1015', 'K金耳饰', '109', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1016', '投资金', '110', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1017', '投资银', '110', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1018', '投资收藏', '110', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1019', '银吊坠/项链', '111', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1020', '银手镯/手链/脚链', '111', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1021', '银戒指', '111', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1022', '银耳饰', '111', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1023', '足银手镯', '111', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1024', '宝宝银饰', '111', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1025', '裸钻', '112', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1026', '钻戒', '112', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1027', '钻石项链/吊坠', '112', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1028', '钻石耳饰', '112', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1029', '钻石手镯/手链', '112', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1030', '项链/吊坠', '113', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1031', '手镯/手串', '113', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1032', '戒指', '113', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1033', '耳饰', '113', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1034', '挂件/摆件/把件', '113', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1035', '玉石孤品', '113', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1036', '项链/吊坠', '114', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1037', '耳饰', '114', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1038', '手镯/手链/脚链', '114', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1039', '戒指', '114', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1040', '头饰/胸针', '114', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1041', '摆件/挂件', '114', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1042', '琥珀/蜜蜡', '115', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1043', '碧玺', '115', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1044', '红宝石/蓝宝石', '115', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1045', '坦桑石', '115', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1046', '珊瑚', '115', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1047', '祖母绿', '115', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1048', '葡萄石', '115', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1049', '其他天然宝石', '115', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1050', '项链/吊坠', '115', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1051', '耳饰', '115', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1052', '手镯/手链', '115', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1053', '戒指', '115', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1054', '铂金项链/吊坠', '116', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1055', '铂金手镯/手链/脚链', '116', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1056', '铂金戒指', '116', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1057', '铂金耳饰', '116', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1058', '小叶紫檀', '117', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1059', '黄花梨', '117', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1060', '沉香木', '117', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1061', '金丝楠', '117', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1062', '菩提', '117', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1063', '其他', '117', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1064', '橄榄核/核桃', '117', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1065', '檀香', '117', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1066', '珍珠项链', '118', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1067', '珍珠吊坠', '118', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1068', '珍珠耳饰', '118', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1069', '珍珠手链', '118', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1070', '珍珠戒指', '118', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1071', '珍珠胸针', '118', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1072', '机油', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1073', '正时皮带', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1074', '添加剂', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1075', '汽车喇叭', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1076', '防冻液', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1077', '汽车玻璃', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1078', '滤清器', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1079', '火花塞', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1080', '减震器', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1081', '柴机油/辅助油', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1082', '雨刷', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1083', '车灯', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1084', '后视镜', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1085', '轮胎', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1086', '轮毂', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1087', '刹车片/盘', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1088', '维修配件', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1089', '蓄电池', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1090', '底盘装甲/护板', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1091', '贴膜', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1092', '汽修工具', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1093', '改装配件', '119', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1094', '导航仪', '120', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1095', '安全预警仪', '120', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1096', '行车记录仪', '120', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1097', '倒车雷达', '120', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1098', '蓝牙设备', '120', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1099', '车载影音', '120', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1100', '净化器', '120', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1101', '电源', '120', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1102', '智能驾驶', '120', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1103', '车载电台', '120', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1104', '车载电器配件', '120', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1105', '吸尘器', '120', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1106', '智能车机', '120', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1107', '冰箱', '120', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1108', '汽车音响', '120', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1109', '车载生活电器', '120', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1110', '车蜡', '121', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1111', '补漆笔', '121', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1112', '玻璃水', '121', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1113', '清洁剂', '121', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1114', '洗车工具', '121', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1115', '镀晶镀膜', '121', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1116', '打蜡机', '121', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1117', '洗车配件', '121', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1118', '洗车机', '121', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1119', '洗车水枪', '121', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1120', '毛巾掸子', '121', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1121', '脚垫', '122', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1122', '座垫', '122', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1123', '座套', '122', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1124', '后备箱垫', '122', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1125', '头枕腰靠', '122', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1126', '方向盘套', '122', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1127', '香水', '122', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1128', '空气净化', '122', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1129', '挂件摆件', '122', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1130', '功能小件', '122', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1131', '车身装饰件', '122', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1132', '车衣', '122', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1133', '安全座椅', '123', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1134', '胎压监测', '123', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1135', '防盗设备', '123', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1136', '应急救援', '123', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1137', '保温箱', '123', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1138', '地锁', '123', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1139', '摩托车', '123', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1140', '充气泵', '123', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1141', '储物箱', '123', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1142', '自驾野营', '123', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1143', '摩托车装备', '123', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1144', '清洗美容', '124', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1145', '功能升级', '124', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1146', '保养维修', '124', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1147', '油卡充值', '124', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1148', '车险', '124', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1149', '加油卡', '124', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1150', 'ETC', '124', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1151', '驾驶培训', '124', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1152', '赛事服装', '125', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1153', '赛事用品', '125', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1154', '制动系统', '125', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1155', '悬挂系统', '125', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1156', '进气系统', '125', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1157', '排气系统', '125', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1158', '电子管理', '125', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1159', '车身强化', '125', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1160', '赛事座椅', '125', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1161', '跑步鞋', '126', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1162', '休闲鞋', '126', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1163', '篮球鞋', '126', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1164', '板鞋', '126', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1165', '帆布鞋', '126', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1166', '足球鞋', '126', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1167', '乒羽网鞋', '126', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1168', '专项运动鞋', '126', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1169', '训练鞋', '126', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1170', '拖鞋', '126', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1171', '运动包', '126', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1172', '羽绒服', '127', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1173', '棉服', '127', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1174', '运动裤', '127', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1175', '夹克/风衣', '127', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1176', '卫衣/套头衫', '127', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1177', 'T恤', '127', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1178', '套装', '127', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1179', '乒羽网服', '127', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1180', '健身服', '127', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1181', '运动背心', '127', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1182', '毛衫/线衫', '127', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1183', '运动配饰', '127', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1184', '折叠车', '128', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1185', '山地车/公路车', '128', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1186', '电动车', '128', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1187', '其他整车', '128', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1188', '骑行服', '128', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1189', '骑行装备', '128', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1190', '平衡车', '128', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1191', '鱼竿鱼线', '129', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1192', '浮漂鱼饵', '129', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1193', '钓鱼桌椅', '129', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1194', '钓鱼配件', '129', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1195', '钓箱鱼包', '129', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1196', '其它', '129', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1197', '泳镜', '130', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1198', '泳帽', '130', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1199', '游泳包防水包', '130', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1200', '女士泳衣', '130', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1201', '男士泳衣', '130', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1202', '比基尼', '130', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1203', '其它', '130', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1204', '冲锋衣裤', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1205', '速干衣裤', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1206', '滑雪服', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1207', '羽绒服/棉服', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1208', '休闲衣裤', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1209', '抓绒衣裤', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1210', '软壳衣裤', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1211', 'T恤', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1212', '户外风衣', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1213', '功能内衣', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1214', '军迷服饰', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1215', '登山鞋', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1216', '雪地靴', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1217', '徒步鞋', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1218', '越野跑鞋', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1219', '休闲鞋', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1220', '工装鞋', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1221', '溯溪鞋', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1222', '沙滩/凉拖', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1223', '户外袜', '131', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1224', '帐篷/垫子', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1225', '睡袋/吊床', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1226', '登山攀岩', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1227', '户外配饰', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1228', '背包', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1229', '户外照明', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1230', '户外仪表', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1231', '户外工具', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1232', '望远镜', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1233', '旅游用品', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1234', '便携桌椅床', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1235', '野餐烧烤', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1236', '军迷用品', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1237', '救援装备', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1238', '滑雪装备', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1239', '极限户外', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1240', '冲浪潜水', '132', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1241', '综合训练器', '133', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1242', '其他大型器械', '133', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1243', '哑铃', '133', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1244', '仰卧板/收腹机', '133', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1245', '其他中小型器材', '133', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1246', '瑜伽舞蹈', '133', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1247', '甩脂机', '133', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1248', '踏步机', '133', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1249', '武术搏击', '133', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1250', '健身车/动感单车', '133', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1251', '跑步机', '133', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1252', '运动护具', '133', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1253', '羽毛球', '134', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1254', '乒乓球', '134', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1255', '篮球', '134', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1256', '足球', '134', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1257', '网球', '134', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1258', '排球', '134', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1259', '高尔夫', '134', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1260', '台球', '134', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1261', '棋牌麻将', '134', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1262', '轮滑滑板', '134', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1263', '其他', '134', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1264', '0-6个月', '135', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1265', '6-12个月', '135', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1266', '1-3岁', '135', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1267', '3-6岁', '135', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1268', '6-14岁', '135', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1269', '14岁以上', '135', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1270', '遥控车', '136', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1271', '遥控飞机', '136', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1272', '遥控船', '136', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1273', '机器人', '136', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1274', '轨道/助力', '136', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1275', '毛绒/布艺', '137', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1276', '靠垫/抱枕', '137', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1277', '芭比娃娃', '138', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1278', '卡通娃娃', '138', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1279', '智能娃娃', '138', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1280', '仿真模型', '139', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1281', '拼插模型', '139', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1282', '收藏爱好', '139', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1283', '炫舞毯', '140', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1284', '爬行垫/毯', '140', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1285', '户外玩具', '140', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1286', '戏水玩具', '140', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1287', '电影周边', '141', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1288', '卡通周边', '141', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1289', '网游周边', '141', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1290', '摇铃/床铃', '142', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1291', '健身架', '142', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1292', '早教启智', '142', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1293', '拖拉玩具', '142', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1294', '积木', '143', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1295', '拼图', '143', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1296', '磁力棒', '143', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1297', '立体拼插', '143', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1298', '手工彩泥', '144', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1299', '绘画工具', '144', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1300', '情景玩具', '144', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1301', '减压玩具', '145', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1302', '创意玩具', '145', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1303', '钢琴', '146', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1304', '电子琴/电钢琴', '146', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1305', '吉他/尤克里里', '146', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1306', '打击乐器', '146', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1307', '西洋管弦', '146', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1308', '民族管弦乐器', '146', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1309', '乐器配件', '146', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1310', '电脑音乐', '146', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1311', '工艺礼品乐器', '146', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1312', '口琴/口风琴/竖笛', '146', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1313', '手风琴', '146', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1314', '双色球', '147', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1315', '大乐透', '147', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1316', '福彩3D', '147', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1317', '排列三', '147', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1318', '排列五', '147', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1319', '七星彩', '147', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1320', '七乐彩', '147', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1321', '竞彩足球', '147', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1322', '竞彩篮球', '147', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1323', '新时时彩', '147', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1324', '国内机票', '148', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1325', '国内酒店', '149', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1326', '酒店团购', '149', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1327', '度假', '150', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1328', '景点', '150', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1329', '租车', '150', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1330', '火车票', '150', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1331', '旅游团购', '150', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1332', '手机充值', '151', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1333', '游戏点卡', '152', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1334', 'QQ充值', '152', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1335', '电影票', '153', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1336', '演唱会', '153', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1337', '话剧歌剧', '153', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1338', '音乐会', '153', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1339', '体育赛事', '153', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1340', '舞蹈芭蕾', '153', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1341', '戏曲综艺', '153', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1342', '东北', '154', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1343', '华北', '154', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1344', '西北', '154', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1345', '华中', '154', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1346', '华东', '154', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1347', '华南', '154', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1348', '西南', '154', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1349', '苹果', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1350', '橙子', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1351', '奇异果/猕猴桃', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1352', '车厘子/樱桃', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1353', '芒果', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1354', '蓝莓', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1355', '火龙果', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1356', '葡萄/提子', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1357', '柚子', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1358', '香蕉', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1359', '牛油果', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1360', '梨', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1361', '菠萝/凤梨', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1362', '桔/橘', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1363', '柠檬', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1364', '草莓', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1365', '桃/李/杏', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1366', '更多水果', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1367', '水果礼盒/券', '155', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1368', '牛肉', '156', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1369', '羊肉', '156', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1370', '猪肉', '156', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1371', '内脏类', '156', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1372', '鱼类', '157', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1373', '虾类', '157', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1374', '蟹类', '157', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1375', '贝类', '157', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1376', '海参', '157', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1377', '海产干货', '157', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1378', '其他水产', '157', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1379', '海产礼盒', '157', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1380', '鸡肉', '158', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1381', '鸭肉', '158', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1382', '蛋类', '158', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1383', '其他禽类', '158', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1384', '水饺/馄饨', '159', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1385', '汤圆/元宵', '159', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1386', '面点', '159', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1387', '火锅丸串', '159', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1388', '速冻半成品', '159', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1389', '奶酪黄油', '159', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1390', '熟食', '160', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1391', '腊肠/腊肉', '160', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1392', '火腿', '160', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1393', '糕点', '160', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1394', '礼品卡券', '160', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1395', '冷藏果蔬汁', '161', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1396', '冰激凌', '161', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1397', '其他', '161', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1398', '叶菜类', '162', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1399', '茄果瓜类', '162', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1400', '根茎类', '162', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1401', '鲜菌菇', '162', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1402', '葱姜蒜椒', '162', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1403', '半加工蔬菜', '162', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1404', '微型车', '163', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1405', '小型车', '163', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1406', '紧凑型车', '163', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1407', '中型车', '163', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1408', '中大型车', '163', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1409', '豪华车', '163', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1410', 'MPV', '163', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1411', 'SUV', '163', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1412', '跑车', '163', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1413', '微型车（二手）', '164', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1414', '小型车（二手）', '164', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1415', '紧凑型车（二手）', '164', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1416', '中型车（二手）', '164', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1417', '中大型车（二手）', '164', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1418', '豪华车（二手）', '164', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1419', 'MPV（二手）', '164', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1420', 'SUV（二手）', '164', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1421', '跑车（二手）', '164', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1422', '皮卡（二手）', '164', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1423', '面包车（二手）', '164', '3', '1', '0', null, null, '0');
INSERT INTO `pms_category` VALUES ('1431', 'dsa323', '1', '2', '1', null, null, null, null);
INSERT INTO `pms_category` VALUES ('1432', 'fdsffdsadddd大萨达', '1431', '3', '1', null, null, null, null);

-- ----------------------------
-- Table structure for pms_category_brand_relation
-- ----------------------------
DROP TABLE IF EXISTS `pms_category_brand_relation`;
CREATE TABLE `pms_category_brand_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) DEFAULT NULL COMMENT '品牌id',
  `catelog_id` bigint(20) DEFAULT NULL COMMENT '分类id',
  `brand_name` varchar(255) DEFAULT NULL,
  `catelog_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COMMENT='品牌分类关联';

-- ----------------------------
-- Records of pms_category_brand_relation
-- ----------------------------
INSERT INTO `pms_category_brand_relation` VALUES ('13', '9', '225', '华为', '手机');
INSERT INTO `pms_category_brand_relation` VALUES ('15', '9', '250', '华为', '平板电视');
INSERT INTO `pms_category_brand_relation` VALUES ('16', '9', '449', '华为', '笔记本');
INSERT INTO `pms_category_brand_relation` VALUES ('17', '10', '449', '小米', '笔记本');
INSERT INTO `pms_category_brand_relation` VALUES ('18', '10', '225', '小米', '手机');
INSERT INTO `pms_category_brand_relation` VALUES ('19', '10', '231', '小米', '移动电源');
INSERT INTO `pms_category_brand_relation` VALUES ('20', '10', '233', '小米', '蓝牙耳机');
INSERT INTO `pms_category_brand_relation` VALUES ('21', '10', '250', '小米', '平板电视');
INSERT INTO `pms_category_brand_relation` VALUES ('22', '10', '449', '小米', '笔记本');
INSERT INTO `pms_category_brand_relation` VALUES ('23', '11', '225', 'oppo', '手机');
INSERT INTO `pms_category_brand_relation` VALUES ('24', '11', '227', 'oppo', '合约机');
INSERT INTO `pms_category_brand_relation` VALUES ('25', '12', '225', 'Apple', '手机');
INSERT INTO `pms_category_brand_relation` VALUES ('26', '12', '243', 'Apple', 'iPhone 配件');
INSERT INTO `pms_category_brand_relation` VALUES ('27', '12', '366', 'Apple', '智能手表');

-- ----------------------------
-- Table structure for pms_comment_replay
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment_replay`;
CREATE TABLE `pms_comment_replay` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `comment_id` bigint(20) DEFAULT NULL COMMENT '评论id',
  `reply_id` bigint(20) DEFAULT NULL COMMENT '回复id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品评价回复关系';

-- ----------------------------
-- Records of pms_comment_replay
-- ----------------------------

-- ----------------------------
-- Table structure for pms_product_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attr_value`;
CREATE TABLE `pms_product_attr_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `spu_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `attr_id` bigint(20) DEFAULT NULL COMMENT '属性id',
  `attr_name` varchar(200) DEFAULT NULL COMMENT '属性名',
  `attr_value` varchar(200) DEFAULT NULL COMMENT '属性值',
  `attr_sort` int(11) DEFAULT NULL COMMENT '顺序',
  `quick_show` tinyint(4) DEFAULT NULL COMMENT '快速展示【是否展示在介绍上；0-否 1-是】',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COMMENT='spu属性值';

-- ----------------------------
-- Records of pms_product_attr_value
-- ----------------------------
INSERT INTO `pms_product_attr_value` VALUES ('55', '13', '7', '入网型号', 'A2217', null, '0');
INSERT INTO `pms_product_attr_value` VALUES ('56', '13', '8', '上市年份', '2018', null, '0');
INSERT INTO `pms_product_attr_value` VALUES ('57', '13', '13', '机身长度（mm）', '158.3', null, '0');
INSERT INTO `pms_product_attr_value` VALUES ('58', '13', '14', '机身材质工艺', '以官网信息为准', null, '0');
INSERT INTO `pms_product_attr_value` VALUES ('59', '13', '15', 'CPU品牌', '以官网信息为准', null, '1');
INSERT INTO `pms_product_attr_value` VALUES ('60', '13', '16', 'CPU型号', 'A13仿生', null, '1');
INSERT INTO `pms_product_attr_value` VALUES ('61', '11', '7', '入网型号', 'LIO-AL00', null, '1');
INSERT INTO `pms_product_attr_value` VALUES ('62', '11', '8', '上市年份', '2019', null, '0');
INSERT INTO `pms_product_attr_value` VALUES ('63', '11', '11', '机身颜色', '黑色', null, '1');
INSERT INTO `pms_product_attr_value` VALUES ('64', '11', '13', '机身长度（mm）', '158.3', null, '1');
INSERT INTO `pms_product_attr_value` VALUES ('65', '11', '14', '机身材质工艺', '玻璃;陶瓷', null, '0');
INSERT INTO `pms_product_attr_value` VALUES ('66', '11', '15', 'CPU品牌', '海思（Hisilicon）', null, '1');
INSERT INTO `pms_product_attr_value` VALUES ('67', '11', '16', 'CPU型号', 'HUAWEI Kirin 970', null, '1');

-- ----------------------------
-- Table structure for pms_sku_images
-- ----------------------------
DROP TABLE IF EXISTS `pms_sku_images`;
CREATE TABLE `pms_sku_images` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku_id',
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `img_sort` int(11) DEFAULT NULL COMMENT '排序',
  `default_img` int(11) DEFAULT NULL COMMENT '默认图[0 - 不是默认图，1 - 是默认图]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COMMENT='sku图片';

-- ----------------------------
-- Records of pms_sku_images
-- ----------------------------
INSERT INTO `pms_sku_images` VALUES ('1', '1', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('2', '1', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/20f83b0c-86ba-4a64-808a-f2ace190ea2c_1f15cdbcf9e1273c.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('3', '1', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('4', '1', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('5', '1', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('6', '1', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('7', '1', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('8', '1', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('9', '1', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/d12516dd-43cf-4ace-8dc9-14618d2d75e4_919c850652e98031.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('10', '1', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('11', '2', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('12', '2', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/20f83b0c-86ba-4a64-808a-f2ace190ea2c_1f15cdbcf9e1273c.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('13', '2', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('14', '2', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('15', '2', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('16', '2', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('17', '2', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('18', '2', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('19', '2', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('20', '2', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('21', '3', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('22', '3', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('23', '3', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('24', '3', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('25', '3', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('26', '3', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/099f297e-ddea-4fb5-87c7-78cd88e500c0_28f296629cca865e.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('27', '3', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('28', '3', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/7aa1019e-4e01-49dd-8ac4-7d2794d0b1a8_335b2c690e43a8f8.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('29', '3', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('30', '3', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('31', '4', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('32', '4', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('33', '4', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('34', '4', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('35', '4', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('36', '4', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/099f297e-ddea-4fb5-87c7-78cd88e500c0_28f296629cca865e.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('37', '4', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('38', '4', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/7aa1019e-4e01-49dd-8ac4-7d2794d0b1a8_335b2c690e43a8f8.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('39', '4', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('40', '4', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('41', '5', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('42', '5', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/20f83b0c-86ba-4a64-808a-f2ace190ea2c_1f15cdbcf9e1273c.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('43', '5', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('44', '5', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/9a6ba5c0-0a31-4364-8759-012bdfbf5ad3_3c24f9cd69534030.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('45', '5', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/a73ef55a-79b4-41d9-8eb6-760c8b5a33dc_23d9fbb256ea5d4a.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('46', '5', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('47', '5', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('48', '5', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('49', '5', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('50', '5', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('51', '6', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('52', '6', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('53', '6', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('54', '6', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/9a6ba5c0-0a31-4364-8759-012bdfbf5ad3_3c24f9cd69534030.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('55', '6', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/a73ef55a-79b4-41d9-8eb6-760c8b5a33dc_23d9fbb256ea5d4a.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('56', '6', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('57', '6', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('58', '6', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('59', '6', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('60', '6', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('61', '7', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('62', '7', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('63', '7', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('64', '7', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('65', '7', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('66', '7', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('67', '7', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/38492c9f-b0e0-4cba-87a9-77cb6189ea73_73ab4d2e818d2211.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('68', '7', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('69', '7', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/d12516dd-43cf-4ace-8dc9-14618d2d75e4_919c850652e98031.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('70', '7', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('71', '8', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('72', '8', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('73', '8', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('74', '8', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('75', '8', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('76', '8', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('77', '8', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/38492c9f-b0e0-4cba-87a9-77cb6189ea73_73ab4d2e818d2211.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('78', '8', '', null, '0');
INSERT INTO `pms_sku_images` VALUES ('79', '8', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/d12516dd-43cf-4ace-8dc9-14618d2d75e4_919c850652e98031.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('80', '8', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('81', '9', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('82', '9', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/bc4825d6-2a6c-43f8-8d75-5f35b77b9514_a2c208410ae84d1f.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('83', '9', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/f968b6ac-2fca-4440-842f-8db8b76478f0_b8494bf281991f94.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('84', '10', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('85', '10', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/bc4825d6-2a6c-43f8-8d75-5f35b77b9514_a2c208410ae84d1f.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('86', '10', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/f968b6ac-2fca-4440-842f-8db8b76478f0_b8494bf281991f94.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('87', '11', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('88', '11', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/bc4825d6-2a6c-43f8-8d75-5f35b77b9514_a2c208410ae84d1f.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('89', '11', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/f968b6ac-2fca-4440-842f-8db8b76478f0_b8494bf281991f94.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('90', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('91', '13', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('92', '14', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('93', '15', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('94', '16', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('95', '17', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('96', '18', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('97', '19', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('98', '20', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('99', '21', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/1756fa6d-1934-4d5c-8faf-84b3d882fe53_5b5e74d0978360a1.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('100', '21', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/e21777b3-18ac-4580-819e-497c3aa25e4f_6a1b2703a9ed8737.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('101', '21', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/2419c5cf-a641-4ec1-8f94-64981dc207f6_63e862164165f483.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('102', '22', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/1756fa6d-1934-4d5c-8faf-84b3d882fe53_5b5e74d0978360a1.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('103', '22', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/e21777b3-18ac-4580-819e-497c3aa25e4f_6a1b2703a9ed8737.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('104', '22', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/2419c5cf-a641-4ec1-8f94-64981dc207f6_63e862164165f483.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('105', '23', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/1756fa6d-1934-4d5c-8faf-84b3d882fe53_5b5e74d0978360a1.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('106', '23', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/e21777b3-18ac-4580-819e-497c3aa25e4f_6a1b2703a9ed8737.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('107', '23', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/2419c5cf-a641-4ec1-8f94-64981dc207f6_63e862164165f483.jpg', null, '0');
INSERT INTO `pms_sku_images` VALUES ('108', '24', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('109', '25', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', null, '1');
INSERT INTO `pms_sku_images` VALUES ('110', '26', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', null, '1');

-- ----------------------------
-- Table structure for pms_sku_info
-- ----------------------------
DROP TABLE IF EXISTS `pms_sku_info`;
CREATE TABLE `pms_sku_info` (
  `sku_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'skuId',
  `spu_id` bigint(20) DEFAULT NULL COMMENT 'spuId',
  `sku_name` varchar(255) DEFAULT NULL COMMENT 'sku名称',
  `sku_desc` varchar(2000) DEFAULT NULL COMMENT 'sku介绍描述',
  `catalog_id` bigint(20) DEFAULT NULL COMMENT '所属分类id',
  `brand_id` bigint(20) DEFAULT NULL COMMENT '品牌id',
  `sku_default_img` varchar(255) DEFAULT NULL COMMENT '默认图片',
  `sku_title` varchar(255) DEFAULT NULL COMMENT '标题',
  `sku_subtitle` varchar(2000) DEFAULT NULL COMMENT '副标题',
  `price` decimal(18,4) DEFAULT NULL COMMENT '价格',
  `sale_count` bigint(20) DEFAULT NULL COMMENT '销量',
  PRIMARY KEY (`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COMMENT='sku信息';

-- ----------------------------
-- Records of pms_sku_info
-- ----------------------------
INSERT INTO `pms_sku_info` VALUES ('1', '11', '华为 HUAWEI Mate 30 Pro 星河银 8GB+256GB', null, '225', '9', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg', '华为 HUAWEI Mate 30 Pro 星河银 8GB+256GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机', '【现货抢购！享白条12期免息！】麒麟990，OLED环幕屏双4000万徕卡电影四摄；Mate30系列享12期免息》', '6299.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('2', '11', '华为 HUAWEI Mate 30 Pro 星河银 8GB+128GB', null, '225', '9', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg', '华为 HUAWEI Mate 30 Pro 星河银 8GB+128GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机', '【现货抢购！享白条12期免息！】麒麟990，OLED环幕屏双4000万徕卡电影四摄；Mate30系列享12期免息》', '5799.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('3', '11', '华为 HUAWEI Mate 30 Pro 亮黑色 8GB+256GB', null, '225', '9', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg', '华为 HUAWEI Mate 30 Pro 亮黑色 8GB+256GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机', '【现货抢购！享白条12期免息！】麒麟990，OLED环幕屏双4000万徕卡电影四摄；Mate30系列享12期免息》', '6299.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('4', '11', '华为 HUAWEI Mate 30 Pro 亮黑色 8GB+128GB', null, '225', '9', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg', '华为 HUAWEI Mate 30 Pro 亮黑色 8GB+128GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机', '【现货抢购！享白条12期免息！】麒麟990，OLED环幕屏双4000万徕卡电影四摄；Mate30系列享12期免息》', '5799.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('5', '11', '华为 HUAWEI Mate 30 Pro 翡冷翠 8GB+256GB', null, '225', '9', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg', '华为 HUAWEI Mate 30 Pro 翡冷翠 8GB+256GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机', '【现货抢购！享白条12期免息！】麒麟990，OLED环幕屏双4000万徕卡电影四摄；Mate30系列享12期免息》', '6299.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('6', '11', '华为 HUAWEI Mate 30 Pro 翡冷翠 8GB+128GB', null, '225', '9', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg', '华为 HUAWEI Mate 30 Pro 翡冷翠 8GB+128GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机', '【现货抢购！享白条12期免息！】麒麟990，OLED环幕屏双4000万徕卡电影四摄；Mate30系列享12期免息》', '5799.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('7', '11', '华为 HUAWEI Mate 30 Pro 罗兰紫 8GB+256GB', null, '225', '9', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg', '华为 HUAWEI Mate 30 Pro 罗兰紫 8GB+256GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机', '【现货抢购！享白条12期免息！】麒麟990，OLED环幕屏双4000万徕卡电影四摄；Mate30系列享12期免息》', '6299.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('8', '11', '华为 HUAWEI Mate 30 Pro 罗兰紫 8GB+128GB', null, '225', '9', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg', '华为 HUAWEI Mate 30 Pro 罗兰紫 8GB+128GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机', '【现货抢购！享白条12期免息！】麒麟990，OLED环幕屏双4000万徕卡电影四摄；Mate30系列享12期免息》', '5799.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('9', '13', ' Apple iPhone 11 (A2223)  黑色 128GB ', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/bc4825d6-2a6c-43f8-8d75-5f35b77b9514_a2c208410ae84d1f.jpg', ' Apple iPhone 11 (A2223)  黑色 128GB 移动联通电信4G手机 双卡双待 最后几件优惠', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '5999.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('10', '13', ' Apple iPhone 11 (A2223)  黑色 256GB', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/bc4825d6-2a6c-43f8-8d75-5f35b77b9514_a2c208410ae84d1f.jpg', ' Apple iPhone 11 (A2223)  黑色 256GB 移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '6799.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('11', '13', ' Apple iPhone 11 (A2223)  黑色 64GB', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/bc4825d6-2a6c-43f8-8d75-5f35b77b9514_a2c208410ae84d1f.jpg', ' Apple iPhone 11 (A2223)  黑色 64GB  移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '5499.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('12', '13', ' Apple iPhone 11 (A2223)  白色 128GB ', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg', ' Apple iPhone 11 (A2223)  白色 128GB  移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '5999.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('13', '13', ' Apple iPhone 11 (A2223)  白色 256GB', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg', ' Apple iPhone 11 (A2223)  白色 256GB  移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '6799.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('14', '13', ' Apple iPhone 11 (A2223)  白色 64GB', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg', ' Apple iPhone 11 (A2223)  白色 64GB  移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '5499.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('15', '13', ' Apple iPhone 11 (A2223)  绿色 128GB ', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', ' Apple iPhone 11 (A2223)  绿色 128GB  移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '5999.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('16', '13', ' Apple iPhone 11 (A2223)  绿色 256GB', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', ' Apple iPhone 11 (A2223)  绿色 256GB  移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '6799.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('17', '13', ' Apple iPhone 11 (A2223)  绿色 64GB', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', ' Apple iPhone 11 (A2223)  绿色 64GB  移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '5499.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('18', '13', ' Apple iPhone 11 (A2223)  黄色 128GB ', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', ' Apple iPhone 11 (A2223)  黄色 128GB  移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '5999.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('19', '13', ' Apple iPhone 11 (A2223)  黄色 256GB', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', ' Apple iPhone 11 (A2223)  黄色 256GB  移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '6799.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('20', '13', ' Apple iPhone 11 (A2223)  黄色 64GB', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', ' Apple iPhone 11 (A2223)  黄色 64GB  移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '5499.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('21', '13', ' Apple iPhone 11 (A2223)  红色 128GB ', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/e21777b3-18ac-4580-819e-497c3aa25e4f_6a1b2703a9ed8737.jpg', ' Apple iPhone 11 (A2223)  红色 128GB  移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '5999.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('22', '13', ' Apple iPhone 11 (A2223)  红色 256GB', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/e21777b3-18ac-4580-819e-497c3aa25e4f_6a1b2703a9ed8737.jpg', ' Apple iPhone 11 (A2223)  红色 256GB  移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '6799.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('23', '13', ' Apple iPhone 11 (A2223)  红色 64GB', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/e21777b3-18ac-4580-819e-497c3aa25e4f_6a1b2703a9ed8737.jpg', ' Apple iPhone 11 (A2223)  红色 64GB  移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '5499.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('24', '13', ' Apple iPhone 11 (A2223)  紫色 128GB ', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', ' Apple iPhone 11 (A2223)  紫色 128GB  移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '5999.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('25', '13', ' Apple iPhone 11 (A2223)  紫色 256GB', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', ' Apple iPhone 11 (A2223)  紫色 256GB  移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '6799.0000', '0');
INSERT INTO `pms_sku_info` VALUES ('26', '13', ' Apple iPhone 11 (A2223)  紫色 64GB', null, '225', '12', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', ' Apple iPhone 11 (A2223)  紫色 64GB  移动联通电信4G手机 双卡双待', 'iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！', '5499.0000', '0');

-- ----------------------------
-- Table structure for pms_sku_sale_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `pms_sku_sale_attr_value`;
CREATE TABLE `pms_sku_sale_attr_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku_id',
  `attr_id` bigint(20) DEFAULT NULL COMMENT 'attr_id',
  `attr_name` varchar(200) DEFAULT NULL COMMENT '销售属性名',
  `attr_value` varchar(200) DEFAULT NULL COMMENT '销售属性值',
  `attr_sort` int(11) DEFAULT NULL COMMENT '顺序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COMMENT='sku销售属性&值';

-- ----------------------------
-- Records of pms_sku_sale_attr_value
-- ----------------------------
INSERT INTO `pms_sku_sale_attr_value` VALUES ('1', '1', '9', '颜色', '星河银', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('2', '1', '12', '版本', '8GB+256GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('3', '2', '9', '颜色', '星河银', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('4', '2', '12', '版本', '8GB+128GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('5', '3', '9', '颜色', '亮黑色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('6', '3', '12', '版本', '8GB+256GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('7', '4', '9', '颜色', '亮黑色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('8', '4', '12', '版本', '8GB+128GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('9', '5', '9', '颜色', '翡冷翠', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('10', '5', '12', '版本', '8GB+256GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('11', '6', '9', '颜色', '翡冷翠', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('12', '6', '12', '版本', '8GB+128GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('13', '7', '9', '颜色', '罗兰紫', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('14', '7', '12', '版本', '8GB+256GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('15', '8', '9', '颜色', '罗兰紫', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('16', '8', '12', '版本', '8GB+128GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('17', '9', '9', '颜色', '黑色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('18', '9', '12', '版本', '128GB ', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('19', '10', '9', '颜色', '黑色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('20', '10', '12', '版本', '256GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('21', '11', '9', '颜色', '黑色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('22', '11', '12', '版本', '64GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('23', '12', '9', '颜色', '白色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('24', '12', '12', '版本', '128GB ', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('25', '13', '9', '颜色', '白色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('26', '13', '12', '版本', '256GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('27', '14', '9', '颜色', '白色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('28', '14', '12', '版本', '64GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('29', '15', '9', '颜色', '绿色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('30', '15', '12', '版本', '128GB ', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('31', '16', '9', '颜色', '绿色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('32', '16', '12', '版本', '256GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('33', '17', '9', '颜色', '绿色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('34', '17', '12', '版本', '64GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('35', '18', '9', '颜色', '黄色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('36', '18', '12', '版本', '128GB ', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('37', '19', '9', '颜色', '黄色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('38', '19', '12', '版本', '256GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('39', '20', '9', '颜色', '黄色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('40', '20', '12', '版本', '64GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('41', '21', '9', '颜色', '红色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('42', '21', '12', '版本', '128GB ', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('43', '22', '9', '颜色', '红色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('44', '22', '12', '版本', '256GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('45', '23', '9', '颜色', '红色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('46', '23', '12', '版本', '64GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('47', '24', '9', '颜色', '紫色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('48', '24', '12', '版本', '128GB ', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('49', '25', '9', '颜色', '紫色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('50', '25', '12', '版本', '256GB', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('51', '26', '9', '颜色', '紫色', null);
INSERT INTO `pms_sku_sale_attr_value` VALUES ('52', '26', '12', '版本', '64GB', null);

-- ----------------------------
-- Table structure for pms_spu_comment
-- ----------------------------
DROP TABLE IF EXISTS `pms_spu_comment`;
CREATE TABLE `pms_spu_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku_id',
  `spu_id` bigint(20) DEFAULT NULL COMMENT 'spu_id',
  `spu_name` varchar(255) DEFAULT NULL COMMENT '商品名字',
  `member_nick_name` varchar(255) DEFAULT NULL COMMENT '会员昵称',
  `star` tinyint(1) DEFAULT NULL COMMENT '星级',
  `member_ip` varchar(64) DEFAULT NULL COMMENT '会员ip',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `show_status` tinyint(1) DEFAULT NULL COMMENT '显示状态[0-不显示，1-显示]',
  `spu_attributes` varchar(255) DEFAULT NULL COMMENT '购买时属性组合',
  `likes_count` int(11) DEFAULT NULL COMMENT '点赞数',
  `reply_count` int(11) DEFAULT NULL COMMENT '回复数',
  `resources` varchar(1000) DEFAULT NULL COMMENT '评论图片/视频[json数据；[{type:文件类型,url:资源路径}]]',
  `content` text COMMENT '内容',
  `member_icon` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `comment_type` tinyint(4) DEFAULT NULL COMMENT '评论类型[0 - 对商品的直接评论，1 - 对评论的回复]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品评价';

-- ----------------------------
-- Records of pms_spu_comment
-- ----------------------------

-- ----------------------------
-- Table structure for pms_spu_images
-- ----------------------------
DROP TABLE IF EXISTS `pms_spu_images`;
CREATE TABLE `pms_spu_images` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `spu_id` bigint(20) DEFAULT NULL COMMENT 'spu_id',
  `img_name` varchar(200) DEFAULT NULL COMMENT '图片名',
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `img_sort` int(11) DEFAULT NULL COMMENT '顺序',
  `default_img` tinyint(4) DEFAULT NULL COMMENT '是否默认图',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COMMENT='spu图片';

-- ----------------------------
-- Records of pms_spu_images
-- ----------------------------
INSERT INTO `pms_spu_images` VALUES ('71', '11', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg', null, null);
INSERT INTO `pms_spu_images` VALUES ('72', '11', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/20f83b0c-86ba-4a64-808a-f2ace190ea2c_1f15cdbcf9e1273c.jpg', null, null);
INSERT INTO `pms_spu_images` VALUES ('73', '11', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/89e324b9-d0cf-4f4f-8e81-94bb219910b3_2b1837c6c50add30.jpg', null, null);
INSERT INTO `pms_spu_images` VALUES ('74', '11', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/9a6ba5c0-0a31-4364-8759-012bdfbf5ad3_3c24f9cd69534030.jpg', null, null);
INSERT INTO `pms_spu_images` VALUES ('75', '11', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/a73ef55a-79b4-41d9-8eb6-760c8b5a33dc_23d9fbb256ea5d4a.jpg', null, null);
INSERT INTO `pms_spu_images` VALUES ('76', '11', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/099f297e-ddea-4fb5-87c7-78cd88e500c0_28f296629cca865e.jpg', null, null);
INSERT INTO `pms_spu_images` VALUES ('77', '11', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/38492c9f-b0e0-4cba-87a9-77cb6189ea73_73ab4d2e818d2211.jpg', null, null);
INSERT INTO `pms_spu_images` VALUES ('78', '11', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/7aa1019e-4e01-49dd-8ac4-7d2794d0b1a8_335b2c690e43a8f8.jpg', null, null);
INSERT INTO `pms_spu_images` VALUES ('79', '11', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/d12516dd-43cf-4ace-8dc9-14618d2d75e4_919c850652e98031.jpg', null, null);
INSERT INTO `pms_spu_images` VALUES ('80', '11', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg', null, null);
INSERT INTO `pms_spu_images` VALUES ('88', '13', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/1756fa6d-1934-4d5c-8faf-84b3d882fe53_5b5e74d0978360a1.jpg', null, null);
INSERT INTO `pms_spu_images` VALUES ('89', '13', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg', null, null);
INSERT INTO `pms_spu_images` VALUES ('90', '13', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg', null, null);
INSERT INTO `pms_spu_images` VALUES ('91', '13', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/bc4825d6-2a6c-43f8-8d75-5f35b77b9514_a2c208410ae84d1f.jpg', null, null);
INSERT INTO `pms_spu_images` VALUES ('92', '13', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/f968b6ac-2fca-4440-842f-8db8b76478f0_b8494bf281991f94.jpg', null, null);
INSERT INTO `pms_spu_images` VALUES ('93', '13', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/e21777b3-18ac-4580-819e-497c3aa25e4f_6a1b2703a9ed8737.jpg', null, null);
INSERT INTO `pms_spu_images` VALUES ('94', '13', null, 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/2419c5cf-a641-4ec1-8f94-64981dc207f6_63e862164165f483.jpg', null, null);

-- ----------------------------
-- Table structure for pms_spu_info
-- ----------------------------
DROP TABLE IF EXISTS `pms_spu_info`;
CREATE TABLE `pms_spu_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `spu_name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `spu_description` varchar(1000) DEFAULT NULL COMMENT '商品描述',
  `catalog_id` bigint(20) DEFAULT NULL COMMENT '所属分类id',
  `brand_id` bigint(20) DEFAULT NULL COMMENT '品牌id',
  `weight` decimal(18,4) DEFAULT NULL,
  `publish_status` tinyint(4) DEFAULT NULL COMMENT '上架状态[0 - 下架，1 - 上架]',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='spu信息';

-- ----------------------------
-- Records of pms_spu_info
-- ----------------------------
INSERT INTO `pms_spu_info` VALUES ('11', '华为 HUAWEI Mate 30 Pro', '华为 HUAWEI Mate 30 Pro', '225', '9', '0.1980', '1', '2019-11-26 10:10:57', '2019-12-15 23:04:16');
INSERT INTO `pms_spu_info` VALUES ('13', ' Apple iPhone 11 (A2223) ', ' Apple iPhone 11 (A2223) ', '225', '12', '0.1940', '1', '2019-11-27 05:37:30', '2019-12-15 23:25:19');

-- ----------------------------
-- Table structure for pms_spu_info_desc
-- ----------------------------
DROP TABLE IF EXISTS `pms_spu_info_desc`;
CREATE TABLE `pms_spu_info_desc` (
  `spu_id` bigint(20) NOT NULL COMMENT '商品id',
  `decript` longtext COMMENT '商品介绍',
  PRIMARY KEY (`spu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='spu信息介绍';

-- ----------------------------
-- Records of pms_spu_info_desc
-- ----------------------------
INSERT INTO `pms_spu_info_desc` VALUES ('11', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/702b76e6-ce3e-4268-8216-a12db5607347_73366cc235d68202.jpg,https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/38956d81-5dff-4abd-8ce8-144908e869d8_528211b97272d88a.jpg');
INSERT INTO `pms_spu_info_desc` VALUES ('13', 'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/ffc5a377-b037-4f26-84a0-df5b1c7cf42d_f205d9c99a2b4b01.jpg');

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE,
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', null, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016D7E5877707874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
INSERT INTO `QRTZ_LOCKS` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RenrenScheduler', 'DESKTOP-G0LDITS1583587232060', '1583588122691', '15000');

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE,
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', null, '1583589600000', '1583587800000', '5', 'WAITING', 'CRON', '1569813024000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016D7E5877707874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('1', 'testTask', 'renren', '0 0/30 * * * ?', '0', '参数测试', '2019-09-30 02:46:30');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1303 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES ('1', '1', 'testTask', 'renren', '0', null, '0', '2019-09-30 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('2', '1', 'testTask', 'renren', '0', null, '0', '2019-09-30 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('3', '1', 'testTask', 'renren', '0', null, '1', '2019-09-30 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('4', '1', 'testTask', 'renren', '0', null, '1', '2019-09-30 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('5', '1', 'testTask', 'renren', '0', null, '1', '2019-09-30 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('6', '1', 'testTask', 'renren', '0', null, '1', '2019-09-30 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('7', '1', 'testTask', 'renren', '0', null, '1', '2019-09-30 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('8', '1', 'testTask', 'renren', '0', null, '1', '2019-09-30 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('9', '1', 'testTask', 'renren', '0', null, '0', '2019-09-30 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('10', '1', 'testTask', 'renren', '0', null, '1', '2019-09-30 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('11', '1', 'testTask', 'renren', '0', null, '0', '2019-09-30 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('12', '1', 'testTask', 'renren', '0', null, '1', '2019-09-30 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('13', '1', 'testTask', 'renren', '0', null, '1', '2019-09-30 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('14', '1', 'testTask', 'renren', '0', null, '1', '2019-09-30 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('15', '1', 'testTask', 'renren', '0', null, '1', '2019-09-30 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('16', '1', 'testTask', 'renren', '0', null, '1', '2019-09-30 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('17', '1', 'testTask', 'renren', '0', null, '1', '2019-09-30 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('18', '1', 'testTask', 'renren', '0', null, '0', '2019-09-30 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('19', '1', 'testTask', 'renren', '0', null, '0', '2019-09-30 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('20', '1', 'testTask', 'renren', '0', null, '1', '2019-09-30 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('21', '1', 'testTask', 'renren', '0', null, '1', '2019-09-30 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('22', '1', 'testTask', 'renren', '0', null, '1', '2019-09-30 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('23', '1', 'testTask', 'renren', '0', null, '1', '2019-09-30 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('24', '1', 'testTask', 'renren', '0', null, '1', '2019-09-30 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('25', '1', 'testTask', 'renren', '0', null, '0', '2019-09-30 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('26', '1', 'testTask', 'renren', '0', null, '9', '2019-10-01 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('27', '1', 'testTask', 'renren', '0', null, '1', '2019-10-01 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('28', '1', 'testTask', 'renren', '0', null, '0', '2019-10-01 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('29', '1', 'testTask', 'renren', '0', null, '0', '2019-10-01 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('30', '1', 'testTask', 'renren', '0', null, '0', '2019-10-01 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('31', '1', 'testTask', 'renren', '0', null, '1', '2019-10-01 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('32', '1', 'testTask', 'renren', '0', null, '0', '2019-10-01 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('33', '1', 'testTask', 'renren', '0', null, '0', '2019-10-01 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('34', '1', 'testTask', 'renren', '0', null, '0', '2019-10-01 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('35', '1', 'testTask', 'renren', '0', null, '0', '2019-10-01 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('36', '1', 'testTask', 'renren', '0', null, '0', '2019-10-01 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('37', '1', 'testTask', 'renren', '0', null, '0', '2019-10-01 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('38', '1', 'testTask', 'renren', '0', null, '0', '2019-10-01 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('39', '1', 'testTask', 'renren', '0', null, '1', '2019-10-01 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('40', '1', 'testTask', 'renren', '0', null, '1', '2019-10-01 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('41', '1', 'testTask', 'renren', '0', null, '1', '2019-10-01 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('42', '1', 'testTask', 'renren', '0', null, '1', '2019-10-01 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('43', '1', 'testTask', 'renren', '0', null, '0', '2019-10-01 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('44', '1', 'testTask', 'renren', '0', null, '0', '2019-10-01 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('45', '1', 'testTask', 'renren', '0', null, '0', '2019-10-01 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('46', '1', 'testTask', 'renren', '0', null, '0', '2019-10-01 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('47', '1', 'testTask', 'renren', '0', null, '1', '2019-10-01 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('48', '1', 'testTask', 'renren', '0', null, '0', '2019-10-01 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('49', '1', 'testTask', 'renren', '0', null, '0', '2019-10-01 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('50', '1', 'testTask', 'renren', '0', null, '0', '2019-10-01 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('51', '1', 'testTask', 'renren', '0', null, '0', '2019-10-01 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('52', '1', 'testTask', 'renren', '0', null, '0', '2019-10-01 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('53', '1', 'testTask', 'renren', '0', null, '0', '2019-10-01 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('54', '1', 'testTask', 'renren', '0', null, '1', '2019-10-01 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('55', '1', 'testTask', 'renren', '0', null, '0', '2019-10-01 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('56', '1', 'testTask', 'renren', '0', null, '1', '2019-10-01 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('57', '1', 'testTask', 'renren', '0', null, '0', '2019-10-01 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('58', '1', 'testTask', 'renren', '0', null, '0', '2019-10-01 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('59', '1', 'testTask', 'renren', '0', null, '0', '2019-10-01 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('60', '1', 'testTask', 'renren', '0', null, '0', '2019-10-01 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('61', '1', 'testTask', 'renren', '0', null, '0', '2019-10-01 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('62', '1', 'testTask', 'renren', '0', null, '1', '2019-10-01 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('63', '1', 'testTask', 'renren', '0', null, '0', '2019-10-01 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('64', '1', 'testTask', 'renren', '0', null, '1', '2019-10-01 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('65', '1', 'testTask', 'renren', '0', null, '1', '2019-10-01 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('66', '1', 'testTask', 'renren', '0', null, '5', '2019-10-02 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('67', '1', 'testTask', 'renren', '0', null, '1', '2019-10-02 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('68', '1', 'testTask', 'renren', '0', null, '0', '2019-10-02 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('69', '1', 'testTask', 'renren', '0', null, '1', '2019-10-02 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('70', '1', 'testTask', 'renren', '0', null, '1', '2019-10-02 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('71', '1', 'testTask', 'renren', '0', null, '1', '2019-10-02 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('72', '1', 'testTask', 'renren', '0', null, '1', '2019-10-02 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('73', '1', 'testTask', 'renren', '0', null, '1', '2019-10-02 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('74', '1', 'testTask', 'renren', '0', null, '1', '2019-10-28 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('75', '1', 'testTask', 'renren', '0', null, '1', '2019-10-28 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('76', '1', 'testTask', 'renren', '0', null, '1', '2019-10-28 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('77', '1', 'testTask', 'renren', '0', null, '5', '2019-10-29 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('78', '1', 'testTask', 'renren', '0', null, '2', '2019-10-29 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('79', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('80', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('81', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('82', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('83', '1', 'testTask', 'renren', '0', null, '0', '2019-10-29 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('84', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('85', '1', 'testTask', 'renren', '0', null, '0', '2019-10-29 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('86', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('87', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('88', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('89', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('90', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('91', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('92', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('93', '1', 'testTask', 'renren', '0', null, '0', '2019-10-29 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('94', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('95', '1', 'testTask', 'renren', '0', null, '4', '2019-10-29 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('96', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('97', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('98', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('99', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('100', '1', 'testTask', 'renren', '0', null, '0', '2019-10-29 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('101', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('102', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('103', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('104', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('105', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('106', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('107', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('108', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('109', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('110', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('111', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('112', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('113', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('114', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('115', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('116', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('117', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('118', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('119', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 21:30:03');
INSERT INTO `schedule_job_log` VALUES ('120', '1', 'testTask', 'renren', '0', null, '0', '2019-10-29 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('121', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('122', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('123', '1', 'testTask', 'renren', '0', null, '1', '2019-10-29 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('124', '1', 'testTask', 'renren', '0', null, '14', '2019-10-30 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('125', '1', 'testTask', 'renren', '0', null, '1', '2019-10-30 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('126', '1', 'testTask', 'renren', '0', null, '0', '2019-10-30 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('127', '1', 'testTask', 'renren', '0', null, '1', '2019-10-30 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('128', '1', 'testTask', 'renren', '0', null, '1', '2019-10-30 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('129', '1', 'testTask', 'renren', '0', null, '0', '2019-10-30 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('130', '1', 'testTask', 'renren', '0', null, '1', '2019-10-30 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('131', '1', 'testTask', 'renren', '0', null, '1', '2019-10-30 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('132', '1', 'testTask', 'renren', '0', null, '1', '2019-10-30 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('133', '1', 'testTask', 'renren', '0', null, '0', '2019-10-30 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('134', '1', 'testTask', 'renren', '0', null, '1', '2019-10-30 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('135', '1', 'testTask', 'renren', '0', null, '1', '2019-10-30 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('136', '1', 'testTask', 'renren', '0', null, '1', '2019-10-30 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('137', '1', 'testTask', 'renren', '0', null, '1', '2019-10-30 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('138', '1', 'testTask', 'renren', '0', null, '0', '2019-10-30 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('139', '1', 'testTask', 'renren', '0', null, '1', '2019-10-30 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('140', '1', 'testTask', 'renren', '0', null, '1', '2019-10-30 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('141', '1', 'testTask', 'renren', '0', null, '0', '2019-10-30 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('142', '1', 'testTask', 'renren', '0', null, '1', '2019-10-30 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('143', '1', 'testTask', 'renren', '0', null, '0', '2019-10-30 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('144', '1', 'testTask', 'renren', '0', null, '0', '2019-10-30 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('145', '1', 'testTask', 'renren', '0', null, '1', '2019-10-30 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('146', '1', 'testTask', 'renren', '0', null, '0', '2019-10-30 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('147', '1', 'testTask', 'renren', '0', null, '2', '2019-10-30 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('148', '1', 'testTask', 'renren', '0', null, '1', '2019-10-30 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('149', '1', 'testTask', 'renren', '0', null, '1', '2019-10-30 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('150', '1', 'testTask', 'renren', '0', null, '0', '2019-10-30 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('151', '1', 'testTask', 'renren', '0', null, '0', '2019-10-30 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('152', '1', 'testTask', 'renren', '0', null, '1', '2019-10-30 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('153', '1', 'testTask', 'renren', '0', null, '1', '2019-10-30 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('154', '1', 'testTask', 'renren', '0', null, '1', '2019-10-30 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('155', '1', 'testTask', 'renren', '0', null, '1', '2019-10-30 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('156', '1', 'testTask', 'renren', '0', null, '2', '2019-10-30 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('157', '1', 'testTask', 'renren', '0', null, '1', '2019-10-30 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('158', '1', 'testTask', 'renren', '0', null, '6', '2019-10-30 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('159', '1', 'testTask', 'renren', '0', null, '1', '2019-10-30 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('160', '1', 'testTask', 'renren', '0', null, '0', '2019-10-30 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('161', '1', 'testTask', 'renren', '0', null, '0', '2019-10-30 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('162', '1', 'testTask', 'renren', '0', null, '1', '2019-10-30 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('163', '1', 'testTask', 'renren', '0', null, '1', '2019-10-30 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('164', '1', 'testTask', 'renren', '0', null, '1', '2019-10-30 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('165', '1', 'testTask', 'renren', '0', null, '1', '2019-10-30 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('166', '1', 'testTask', 'renren', '0', null, '1', '2019-10-30 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('167', '1', 'testTask', 'renren', '0', null, '0', '2019-10-30 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('168', '1', 'testTask', 'renren', '0', null, '0', '2019-10-30 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('169', '1', 'testTask', 'renren', '0', null, '1', '2019-10-30 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('170', '1', 'testTask', 'renren', '0', null, '0', '2019-10-30 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('171', '1', 'testTask', 'renren', '0', null, '0', '2019-10-30 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('172', '1', 'testTask', 'renren', '0', null, '5', '2019-10-31 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('173', '1', 'testTask', 'renren', '0', null, '1', '2019-10-31 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('174', '1', 'testTask', 'renren', '0', null, '0', '2019-10-31 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('175', '1', 'testTask', 'renren', '0', null, '0', '2019-10-31 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('176', '1', 'testTask', 'renren', '0', null, '1', '2019-10-31 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('177', '1', 'testTask', 'renren', '0', null, '1', '2019-10-31 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('178', '1', 'testTask', 'renren', '0', null, '1', '2019-10-31 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('179', '1', 'testTask', 'renren', '0', null, '1', '2019-10-31 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('180', '1', 'testTask', 'renren', '0', null, '0', '2019-10-31 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('181', '1', 'testTask', 'renren', '0', null, '0', '2019-10-31 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('182', '1', 'testTask', 'renren', '0', null, '1', '2019-10-31 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('183', '1', 'testTask', 'renren', '0', null, '1', '2019-10-31 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('184', '1', 'testTask', 'renren', '0', null, '1', '2019-10-31 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('185', '1', 'testTask', 'renren', '0', null, '1', '2019-10-31 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('186', '1', 'testTask', 'renren', '0', null, '0', '2019-10-31 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('187', '1', 'testTask', 'renren', '0', null, '0', '2019-10-31 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('188', '1', 'testTask', 'renren', '0', null, '1', '2019-10-31 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('189', '1', 'testTask', 'renren', '0', null, '1', '2019-10-31 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('190', '1', 'testTask', 'renren', '0', null, '0', '2019-10-31 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('191', '1', 'testTask', 'renren', '0', null, '1', '2019-10-31 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('192', '1', 'testTask', 'renren', '0', null, '0', '2019-10-31 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('193', '1', 'testTask', 'renren', '0', null, '0', '2019-10-31 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('194', '1', 'testTask', 'renren', '0', null, '1', '2019-10-31 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('195', '1', 'testTask', 'renren', '0', null, '0', '2019-10-31 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('196', '1', 'testTask', 'renren', '0', null, '1', '2019-10-31 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('197', '1', 'testTask', 'renren', '0', null, '0', '2019-10-31 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('198', '1', 'testTask', 'renren', '0', null, '1', '2019-10-31 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('199', '1', 'testTask', 'renren', '0', null, '2', '2019-10-31 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('200', '1', 'testTask', 'renren', '0', null, '1', '2019-10-31 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('201', '1', 'testTask', 'renren', '0', null, '1', '2019-10-31 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('202', '1', 'testTask', 'renren', '0', null, '1', '2019-10-31 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('203', '1', 'testTask', 'renren', '0', null, '0', '2019-10-31 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('204', '1', 'testTask', 'renren', '0', null, '1', '2019-10-31 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('205', '1', 'testTask', 'renren', '0', null, '0', '2019-10-31 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('206', '1', 'testTask', 'renren', '0', null, '1', '2019-10-31 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('207', '1', 'testTask', 'renren', '0', null, '1', '2019-10-31 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('208', '1', 'testTask', 'renren', '0', null, '0', '2019-10-31 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('209', '1', 'testTask', 'renren', '0', null, '1', '2019-10-31 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('210', '1', 'testTask', 'renren', '0', null, '1', '2019-10-31 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('211', '1', 'testTask', 'renren', '0', null, '1', '2019-10-31 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('212', '1', 'testTask', 'renren', '0', null, '0', '2019-10-31 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('213', '1', 'testTask', 'renren', '0', null, '1', '2019-10-31 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('214', '1', 'testTask', 'renren', '0', null, '1', '2019-10-31 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('215', '1', 'testTask', 'renren', '0', null, '0', '2019-10-31 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('216', '1', 'testTask', 'renren', '0', null, '0', '2019-10-31 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('217', '1', 'testTask', 'renren', '0', null, '0', '2019-10-31 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('218', '1', 'testTask', 'renren', '0', null, '1', '2019-10-31 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('219', '1', 'testTask', 'renren', '0', null, '1', '2019-10-31 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('220', '1', 'testTask', 'renren', '0', null, '6', '2019-11-01 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('221', '1', 'testTask', 'renren', '0', null, '2', '2019-11-01 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('222', '1', 'testTask', 'renren', '0', null, '1', '2019-11-01 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('223', '1', 'testTask', 'renren', '0', null, '1', '2019-11-01 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('224', '1', 'testTask', 'renren', '0', null, '0', '2019-11-01 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('225', '1', 'testTask', 'renren', '0', null, '1', '2019-11-01 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('226', '1', 'testTask', 'renren', '0', null, '0', '2019-11-01 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('227', '1', 'testTask', 'renren', '0', null, '1', '2019-11-01 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('228', '1', 'testTask', 'renren', '0', null, '1', '2019-11-01 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('229', '1', 'testTask', 'renren', '0', null, '1', '2019-11-01 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('230', '1', 'testTask', 'renren', '0', null, '0', '2019-11-01 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('231', '1', 'testTask', 'renren', '0', null, '0', '2019-11-01 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('232', '1', 'testTask', 'renren', '0', null, '1', '2019-11-01 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('233', '1', 'testTask', 'renren', '0', null, '1', '2019-11-01 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('234', '1', 'testTask', 'renren', '0', null, '0', '2019-11-01 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('235', '1', 'testTask', 'renren', '0', null, '0', '2019-11-01 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('236', '1', 'testTask', 'renren', '0', null, '0', '2019-11-01 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('237', '1', 'testTask', 'renren', '0', null, '0', '2019-11-01 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('238', '1', 'testTask', 'renren', '0', null, '1', '2019-11-01 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('239', '1', 'testTask', 'renren', '0', null, '1', '2019-11-01 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('240', '1', 'testTask', 'renren', '0', null, '1', '2019-11-01 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('241', '1', 'testTask', 'renren', '0', null, '1', '2019-11-01 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('242', '1', 'testTask', 'renren', '0', null, '0', '2019-11-01 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('243', '1', 'testTask', 'renren', '0', null, '1', '2019-11-01 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('244', '1', 'testTask', 'renren', '0', null, '1', '2019-11-01 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('245', '1', 'testTask', 'renren', '0', null, '0', '2019-11-01 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('246', '1', 'testTask', 'renren', '0', null, '1', '2019-11-01 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('247', '1', 'testTask', 'renren', '0', null, '0', '2019-11-01 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('248', '1', 'testTask', 'renren', '0', null, '1', '2019-11-01 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('249', '1', 'testTask', 'renren', '0', null, '0', '2019-11-01 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('250', '1', 'testTask', 'renren', '0', null, '1', '2019-11-01 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('251', '1', 'testTask', 'renren', '0', null, '1', '2019-11-01 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('252', '1', 'testTask', 'renren', '0', null, '0', '2019-11-01 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('253', '1', 'testTask', 'renren', '0', null, '1', '2019-11-01 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('254', '1', 'testTask', 'renren', '0', null, '1', '2019-11-01 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('255', '1', 'testTask', 'renren', '0', null, '1', '2019-11-01 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('256', '1', 'testTask', 'renren', '0', null, '1', '2019-11-01 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('257', '1', 'testTask', 'renren', '0', null, '1', '2019-11-01 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('258', '1', 'testTask', 'renren', '0', null, '0', '2019-11-01 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('259', '1', 'testTask', 'renren', '0', null, '1', '2019-11-01 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('260', '1', 'testTask', 'renren', '0', null, '1', '2019-11-01 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('261', '1', 'testTask', 'renren', '0', null, '0', '2019-11-01 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('262', '1', 'testTask', 'renren', '0', null, '1', '2019-11-01 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('263', '1', 'testTask', 'renren', '0', null, '0', '2019-11-01 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('264', '1', 'testTask', 'renren', '0', null, '0', '2019-11-01 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('265', '1', 'testTask', 'renren', '0', null, '1', '2019-11-01 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('266', '1', 'testTask', 'renren', '0', null, '1', '2019-11-01 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('267', '1', 'testTask', 'renren', '0', null, '12', '2019-11-02 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('268', '1', 'testTask', 'renren', '0', null, '4', '2019-11-02 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('269', '1', 'testTask', 'renren', '0', null, '1', '2019-11-02 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('270', '1', 'testTask', 'renren', '0', null, '0', '2019-11-02 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('271', '1', 'testTask', 'renren', '0', null, '0', '2019-11-02 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('272', '1', 'testTask', 'renren', '0', null, '1', '2019-11-02 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('273', '1', 'testTask', 'renren', '0', null, '1', '2019-11-02 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('274', '1', 'testTask', 'renren', '0', null, '0', '2019-11-02 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('275', '1', 'testTask', 'renren', '0', null, '0', '2019-11-02 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('276', '1', 'testTask', 'renren', '0', null, '1', '2019-11-02 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('277', '1', 'testTask', 'renren', '0', null, '1', '2019-11-02 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('278', '1', 'testTask', 'renren', '0', null, '1', '2019-11-02 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('279', '1', 'testTask', 'renren', '0', null, '1', '2019-11-02 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('280', '1', 'testTask', 'renren', '0', null, '1', '2019-11-02 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('281', '1', 'testTask', 'renren', '0', null, '1', '2019-11-02 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('282', '1', 'testTask', 'renren', '0', null, '1', '2019-11-02 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('283', '1', 'testTask', 'renren', '0', null, '1', '2019-11-02 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('284', '1', 'testTask', 'renren', '0', null, '1', '2019-11-02 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('285', '1', 'testTask', 'renren', '0', null, '1', '2019-11-02 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('286', '1', 'testTask', 'renren', '0', null, '1', '2019-11-02 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('287', '1', 'testTask', 'renren', '0', null, '1', '2019-11-02 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('288', '1', 'testTask', 'renren', '0', null, '0', '2019-11-02 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('289', '1', 'testTask', 'renren', '0', null, '0', '2019-11-02 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('290', '1', 'testTask', 'renren', '0', null, '0', '2019-11-04 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('291', '1', 'testTask', 'renren', '0', null, '0', '2019-11-04 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('292', '1', 'testTask', 'renren', '0', null, '1', '2019-11-04 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('293', '1', 'testTask', 'renren', '0', null, '0', '2019-11-04 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('294', '1', 'testTask', 'renren', '0', null, '0', '2019-11-04 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('295', '1', 'testTask', 'renren', '0', null, '1', '2019-11-04 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('296', '1', 'testTask', 'renren', '0', null, '1', '2019-11-04 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('297', '1', 'testTask', 'renren', '0', null, '1', '2019-11-04 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('298', '1', 'testTask', 'renren', '0', null, '1', '2019-11-04 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('299', '1', 'testTask', 'renren', '0', null, '0', '2019-11-04 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('300', '1', 'testTask', 'renren', '0', null, '1', '2019-11-04 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('301', '1', 'testTask', 'renren', '0', null, '0', '2019-11-04 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('302', '1', 'testTask', 'renren', '0', null, '1', '2019-11-04 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('303', '1', 'testTask', 'renren', '0', null, '1', '2019-11-04 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('304', '1', 'testTask', 'renren', '0', null, '1', '2019-11-04 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('305', '1', 'testTask', 'renren', '0', null, '1', '2019-11-04 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('306', '1', 'testTask', 'renren', '0', null, '0', '2019-11-04 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('307', '1', 'testTask', 'renren', '0', null, '0', '2019-11-04 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('308', '1', 'testTask', 'renren', '0', null, '0', '2019-11-04 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('309', '1', 'testTask', 'renren', '0', null, '1', '2019-11-04 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('310', '1', 'testTask', 'renren', '0', null, '1', '2019-11-04 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('311', '1', 'testTask', 'renren', '0', null, '1', '2019-11-04 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('312', '1', 'testTask', 'renren', '0', null, '1', '2019-11-04 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('313', '1', 'testTask', 'renren', '0', null, '1', '2019-11-04 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('314', '1', 'testTask', 'renren', '0', null, '1', '2019-11-04 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('315', '1', 'testTask', 'renren', '0', null, '1', '2019-11-04 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('316', '1', 'testTask', 'renren', '0', null, '1', '2019-11-04 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('317', '1', 'testTask', 'renren', '0', null, '1', '2019-11-04 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('318', '1', 'testTask', 'renren', '0', null, '7', '2019-11-05 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('319', '1', 'testTask', 'renren', '0', null, '1', '2019-11-05 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('320', '1', 'testTask', 'renren', '0', null, '1', '2019-11-05 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('321', '1', 'testTask', 'renren', '0', null, '0', '2019-11-05 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('322', '1', 'testTask', 'renren', '0', null, '0', '2019-11-05 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('323', '1', 'testTask', 'renren', '0', null, '0', '2019-11-05 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('324', '1', 'testTask', 'renren', '0', null, '1', '2019-11-05 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('325', '1', 'testTask', 'renren', '0', null, '1', '2019-11-05 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('326', '1', 'testTask', 'renren', '0', null, '0', '2019-11-05 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('327', '1', 'testTask', 'renren', '0', null, '0', '2019-11-05 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('328', '1', 'testTask', 'renren', '0', null, '0', '2019-11-05 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('329', '1', 'testTask', 'renren', '0', null, '0', '2019-11-05 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('330', '1', 'testTask', 'renren', '0', null, '1', '2019-11-05 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('331', '1', 'testTask', 'renren', '0', null, '1', '2019-11-05 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('332', '1', 'testTask', 'renren', '0', null, '1', '2019-11-05 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('333', '1', 'testTask', 'renren', '0', null, '1', '2019-11-05 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('334', '1', 'testTask', 'renren', '0', null, '1', '2019-11-05 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('335', '1', 'testTask', 'renren', '0', null, '0', '2019-11-05 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('336', '1', 'testTask', 'renren', '0', null, '0', '2019-11-05 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('337', '1', 'testTask', 'renren', '0', null, '0', '2019-11-05 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('338', '1', 'testTask', 'renren', '0', null, '1', '2019-11-05 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('339', '1', 'testTask', 'renren', '0', null, '1', '2019-11-05 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('340', '1', 'testTask', 'renren', '0', null, '1', '2019-11-05 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('341', '1', 'testTask', 'renren', '0', null, '1', '2019-11-05 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('342', '1', 'testTask', 'renren', '0', null, '1', '2019-11-05 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('343', '1', 'testTask', 'renren', '0', null, '0', '2019-11-05 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('344', '1', 'testTask', 'renren', '0', null, '0', '2019-11-05 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('345', '1', 'testTask', 'renren', '0', null, '1', '2019-11-05 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('346', '1', 'testTask', 'renren', '0', null, '1', '2019-11-05 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('347', '1', 'testTask', 'renren', '0', null, '0', '2019-11-05 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('348', '1', 'testTask', 'renren', '0', null, '1', '2019-11-05 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('349', '1', 'testTask', 'renren', '0', null, '1', '2019-11-05 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('350', '1', 'testTask', 'renren', '0', null, '1', '2019-11-05 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('351', '1', 'testTask', 'renren', '0', null, '1', '2019-11-05 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('352', '1', 'testTask', 'renren', '0', null, '1', '2019-11-05 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('353', '1', 'testTask', 'renren', '0', null, '1', '2019-11-05 17:30:02');
INSERT INTO `schedule_job_log` VALUES ('354', '1', 'testTask', 'renren', '0', null, '0', '2019-11-05 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('355', '1', 'testTask', 'renren', '0', null, '1', '2019-11-05 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('356', '1', 'testTask', 'renren', '0', null, '0', '2019-11-05 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('357', '1', 'testTask', 'renren', '0', null, '0', '2019-11-05 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('358', '1', 'testTask', 'renren', '0', null, '0', '2019-11-05 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('359', '1', 'testTask', 'renren', '0', null, '0', '2019-11-05 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('360', '1', 'testTask', 'renren', '0', null, '1', '2019-11-05 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('361', '1', 'testTask', 'renren', '0', null, '1', '2019-11-05 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('362', '1', 'testTask', 'renren', '0', null, '1', '2019-11-05 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('363', '1', 'testTask', 'renren', '0', null, '0', '2019-11-05 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('364', '1', 'testTask', 'renren', '0', null, '1', '2019-11-05 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('365', '1', 'testTask', 'renren', '0', null, '1', '2019-11-05 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('366', '1', 'testTask', 'renren', '0', null, '4', '2019-11-06 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('367', '1', 'testTask', 'renren', '0', null, '1', '2019-11-06 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('368', '1', 'testTask', 'renren', '0', null, '1', '2019-11-06 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('369', '1', 'testTask', 'renren', '0', null, '1', '2019-11-06 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('370', '1', 'testTask', 'renren', '0', null, '1', '2019-11-06 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('371', '1', 'testTask', 'renren', '0', null, '1', '2019-11-06 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('372', '1', 'testTask', 'renren', '0', null, '0', '2019-11-06 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('373', '1', 'testTask', 'renren', '0', null, '0', '2019-11-06 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('374', '1', 'testTask', 'renren', '0', null, '0', '2019-11-06 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('375', '1', 'testTask', 'renren', '0', null, '0', '2019-11-06 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('376', '1', 'testTask', 'renren', '0', null, '0', '2019-11-06 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('377', '1', 'testTask', 'renren', '0', null, '1', '2019-11-06 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('378', '1', 'testTask', 'renren', '0', null, '0', '2019-11-06 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('379', '1', 'testTask', 'renren', '0', null, '0', '2019-11-06 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('380', '1', 'testTask', 'renren', '0', null, '1', '2019-11-06 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('381', '1', 'testTask', 'renren', '0', null, '0', '2019-11-06 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('382', '1', 'testTask', 'renren', '0', null, '0', '2019-11-06 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('383', '1', 'testTask', 'renren', '0', null, '0', '2019-11-06 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('384', '1', 'testTask', 'renren', '0', null, '1', '2019-11-06 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('385', '1', 'testTask', 'renren', '0', null, '0', '2019-11-06 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('386', '1', 'testTask', 'renren', '0', null, '0', '2019-11-06 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('387', '1', 'testTask', 'renren', '0', null, '0', '2019-11-06 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('388', '1', 'testTask', 'renren', '0', null, '1', '2019-11-06 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('389', '1', 'testTask', 'renren', '0', null, '0', '2019-11-06 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('390', '1', 'testTask', 'renren', '0', null, '1', '2019-11-06 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('391', '1', 'testTask', 'renren', '0', null, '0', '2019-11-06 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('392', '1', 'testTask', 'renren', '0', null, '1', '2019-11-06 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('393', '1', 'testTask', 'renren', '0', null, '0', '2019-11-06 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('394', '1', 'testTask', 'renren', '0', null, '1', '2019-11-06 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('395', '1', 'testTask', 'renren', '0', null, '1', '2019-11-06 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('396', '1', 'testTask', 'renren', '0', null, '1', '2019-11-06 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('397', '1', 'testTask', 'renren', '0', null, '1', '2019-11-06 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('398', '1', 'testTask', 'renren', '0', null, '1', '2019-11-06 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('399', '1', 'testTask', 'renren', '0', null, '1', '2019-11-06 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('400', '1', 'testTask', 'renren', '0', null, '0', '2019-11-06 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('401', '1', 'testTask', 'renren', '0', null, '1', '2019-11-06 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('402', '1', 'testTask', 'renren', '0', null, '1', '2019-11-06 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('403', '1', 'testTask', 'renren', '0', null, '1', '2019-11-06 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('404', '1', 'testTask', 'renren', '0', null, '1', '2019-11-06 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('405', '1', 'testTask', 'renren', '0', null, '1', '2019-11-06 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('406', '1', 'testTask', 'renren', '0', null, '1', '2019-11-06 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('407', '1', 'testTask', 'renren', '0', null, '1', '2019-11-06 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('408', '1', 'testTask', 'renren', '0', null, '1', '2019-11-06 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('409', '1', 'testTask', 'renren', '0', null, '1', '2019-11-06 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('410', '1', 'testTask', 'renren', '0', null, '1', '2019-11-06 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('411', '1', 'testTask', 'renren', '0', null, '1', '2019-11-06 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('412', '1', 'testTask', 'renren', '0', null, '0', '2019-11-06 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('413', '1', 'testTask', 'renren', '0', null, '1', '2019-11-06 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('414', '1', 'testTask', 'renren', '0', null, '5', '2019-11-07 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('415', '1', 'testTask', 'renren', '0', null, '2', '2019-11-07 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('416', '1', 'testTask', 'renren', '0', null, '0', '2019-11-07 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('417', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('418', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('419', '1', 'testTask', 'renren', '0', null, '0', '2019-11-07 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('420', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('421', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('422', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('423', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('424', '1', 'testTask', 'renren', '0', null, '0', '2019-11-07 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('425', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('426', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('427', '1', 'testTask', 'renren', '0', null, '0', '2019-11-07 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('428', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('429', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('430', '1', 'testTask', 'renren', '0', null, '0', '2019-11-07 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('431', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('432', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('433', '1', 'testTask', 'renren', '0', null, '0', '2019-11-07 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('434', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('435', '1', 'testTask', 'renren', '0', null, '0', '2019-11-07 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('436', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('437', '1', 'testTask', 'renren', '0', null, '0', '2019-11-07 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('438', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('439', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('440', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('441', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('442', '1', 'testTask', 'renren', '0', null, '0', '2019-11-07 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('443', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('444', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('445', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('446', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('447', '1', 'testTask', 'renren', '0', null, '0', '2019-11-07 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('448', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('449', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('450', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('451', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('452', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('453', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('454', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('455', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('456', '1', 'testTask', 'renren', '0', null, '0', '2019-11-07 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('457', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('458', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('459', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('460', '1', 'testTask', 'renren', '0', null, '1', '2019-11-07 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('461', '1', 'testTask', 'renren', '0', null, '0', '2019-11-07 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('462', '1', 'testTask', 'renren', '0', null, '7', '2019-11-08 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('463', '1', 'testTask', 'renren', '0', null, '1', '2019-11-08 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('464', '1', 'testTask', 'renren', '0', null, '0', '2019-11-08 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('465', '1', 'testTask', 'renren', '0', null, '1', '2019-11-08 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('466', '1', 'testTask', 'renren', '0', null, '0', '2019-11-08 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('467', '1', 'testTask', 'renren', '0', null, '0', '2019-11-08 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('468', '1', 'testTask', 'renren', '0', null, '0', '2019-11-08 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('469', '1', 'testTask', 'renren', '0', null, '1', '2019-11-08 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('470', '1', 'testTask', 'renren', '0', null, '1', '2019-11-08 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('471', '1', 'testTask', 'renren', '0', null, '0', '2019-11-08 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('472', '1', 'testTask', 'renren', '0', null, '1', '2019-11-11 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('473', '1', 'testTask', 'renren', '0', null, '1', '2019-11-11 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('474', '1', 'testTask', 'renren', '0', null, '1', '2019-11-11 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('475', '1', 'testTask', 'renren', '0', null, '0', '2019-11-11 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('476', '1', 'testTask', 'renren', '0', null, '0', '2019-11-11 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('477', '1', 'testTask', 'renren', '0', null, '1', '2019-11-11 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('478', '1', 'testTask', 'renren', '0', null, '0', '2019-11-11 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('479', '1', 'testTask', 'renren', '0', null, '0', '2019-11-11 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('480', '1', 'testTask', 'renren', '0', null, '1', '2019-11-11 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('481', '1', 'testTask', 'renren', '0', null, '1', '2019-11-11 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('482', '1', 'testTask', 'renren', '0', null, '1', '2019-11-11 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('483', '1', 'testTask', 'renren', '0', null, '1', '2019-11-11 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('484', '1', 'testTask', 'renren', '0', null, '0', '2019-11-11 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('485', '1', 'testTask', 'renren', '0', null, '1', '2019-11-11 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('486', '1', 'testTask', 'renren', '0', null, '1', '2019-11-11 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('487', '1', 'testTask', 'renren', '0', null, '1', '2019-11-11 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('488', '1', 'testTask', 'renren', '0', null, '1', '2019-11-11 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('489', '1', 'testTask', 'renren', '0', null, '1', '2019-11-11 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('490', '1', 'testTask', 'renren', '0', null, '1', '2019-11-11 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('491', '1', 'testTask', 'renren', '0', null, '1', '2019-11-11 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('492', '1', 'testTask', 'renren', '0', null, '1', '2019-11-11 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('493', '1', 'testTask', 'renren', '0', null, '0', '2019-11-11 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('494', '1', 'testTask', 'renren', '0', null, '1', '2019-11-11 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('495', '1', 'testTask', 'renren', '0', null, '0', '2019-11-11 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('496', '1', 'testTask', 'renren', '0', null, '1', '2019-11-11 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('497', '1', 'testTask', 'renren', '0', null, '0', '2019-11-11 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('498', '1', 'testTask', 'renren', '0', null, '1', '2019-11-11 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('499', '1', 'testTask', 'renren', '0', null, '11', '2019-11-12 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('500', '1', 'testTask', 'renren', '0', null, '2', '2019-11-12 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('501', '1', 'testTask', 'renren', '0', null, '1', '2019-11-12 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('502', '1', 'testTask', 'renren', '0', null, '1', '2019-11-12 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('503', '1', 'testTask', 'renren', '0', null, '1', '2019-11-12 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('504', '1', 'testTask', 'renren', '0', null, '0', '2019-11-12 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('505', '1', 'testTask', 'renren', '0', null, '1', '2019-11-12 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('506', '1', 'testTask', 'renren', '0', null, '1', '2019-11-12 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('507', '1', 'testTask', 'renren', '0', null, '1', '2019-11-12 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('508', '1', 'testTask', 'renren', '0', null, '0', '2019-11-12 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('509', '1', 'testTask', 'renren', '0', null, '0', '2019-11-12 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('510', '1', 'testTask', 'renren', '0', null, '1', '2019-11-12 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('511', '1', 'testTask', 'renren', '0', null, '1', '2019-11-12 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('512', '1', 'testTask', 'renren', '0', null, '1', '2019-11-12 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('513', '1', 'testTask', 'renren', '0', null, '1', '2019-11-12 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('514', '1', 'testTask', 'renren', '0', null, '0', '2019-11-12 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('515', '1', 'testTask', 'renren', '0', null, '1', '2019-11-12 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('516', '1', 'testTask', 'renren', '0', null, '1', '2019-11-12 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('517', '1', 'testTask', 'renren', '0', null, '1', '2019-11-12 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('518', '1', 'testTask', 'renren', '0', null, '0', '2019-11-12 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('519', '1', 'testTask', 'renren', '0', null, '0', '2019-11-12 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('520', '1', 'testTask', 'renren', '0', null, '1', '2019-11-12 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('521', '1', 'testTask', 'renren', '0', null, '0', '2019-11-12 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('522', '1', 'testTask', 'renren', '0', null, '0', '2019-11-12 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('523', '1', 'testTask', 'renren', '0', null, '0', '2019-11-12 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('524', '1', 'testTask', 'renren', '0', null, '1', '2019-11-12 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('525', '1', 'testTask', 'renren', '0', null, '1', '2019-11-12 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('526', '1', 'testTask', 'renren', '0', null, '1', '2019-11-12 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('527', '1', 'testTask', 'renren', '0', null, '1', '2019-11-12 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('528', '1', 'testTask', 'renren', '0', null, '1', '2019-11-12 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('529', '1', 'testTask', 'renren', '0', null, '1', '2019-11-13 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('530', '1', 'testTask', 'renren', '0', null, '1', '2019-11-13 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('531', '1', 'testTask', 'renren', '0', null, '0', '2019-11-13 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('532', '1', 'testTask', 'renren', '0', null, '1', '2019-11-13 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('533', '1', 'testTask', 'renren', '0', null, '1', '2019-11-13 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('534', '1', 'testTask', 'renren', '0', null, '0', '2019-11-13 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('535', '1', 'testTask', 'renren', '0', null, '4', '2019-11-13 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('536', '1', 'testTask', 'renren', '0', null, '0', '2019-11-13 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('537', '1', 'testTask', 'renren', '0', null, '3', '2019-11-13 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('538', '1', 'testTask', 'renren', '0', null, '0', '2019-11-13 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('539', '1', 'testTask', 'renren', '0', null, '1', '2019-11-13 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('540', '1', 'testTask', 'renren', '0', null, '0', '2019-11-13 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('541', '1', 'testTask', 'renren', '0', null, '0', '2019-11-13 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('542', '1', 'testTask', 'renren', '0', null, '1', '2019-11-13 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('543', '1', 'testTask', 'renren', '0', null, '1', '2019-11-13 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('544', '1', 'testTask', 'renren', '0', null, '1', '2019-11-13 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('545', '1', 'testTask', 'renren', '0', null, '1', '2019-11-13 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('546', '1', 'testTask', 'renren', '0', null, '1', '2019-11-13 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('547', '1', 'testTask', 'renren', '0', null, '0', '2019-11-13 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('548', '1', 'testTask', 'renren', '0', null, '1', '2019-11-13 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('549', '1', 'testTask', 'renren', '0', null, '0', '2019-11-13 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('550', '1', 'testTask', 'renren', '0', null, '3', '2019-11-13 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('551', '1', 'testTask', 'renren', '0', null, '1', '2019-11-13 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('552', '1', 'testTask', 'renren', '0', null, '0', '2019-11-13 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('553', '1', 'testTask', 'renren', '0', null, '1', '2019-11-13 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('554', '1', 'testTask', 'renren', '0', null, '1', '2019-11-13 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('555', '1', 'testTask', 'renren', '0', null, '0', '2019-11-13 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('556', '1', 'testTask', 'renren', '0', null, '1', '2019-11-13 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('557', '1', 'testTask', 'renren', '0', null, '1', '2019-11-13 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('558', '1', 'testTask', 'renren', '0', null, '10', '2019-11-14 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('559', '1', 'testTask', 'renren', '0', null, '0', '2019-11-14 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('560', '1', 'testTask', 'renren', '0', null, '1', '2019-11-14 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('561', '1', 'testTask', 'renren', '0', null, '1', '2019-11-14 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('562', '1', 'testTask', 'renren', '0', null, '1', '2019-11-14 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('563', '1', 'testTask', 'renren', '0', null, '1', '2019-11-14 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('564', '1', 'testTask', 'renren', '0', null, '0', '2019-11-14 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('565', '1', 'testTask', 'renren', '0', null, '1', '2019-11-14 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('566', '1', 'testTask', 'renren', '0', null, '1', '2019-11-14 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('567', '1', 'testTask', 'renren', '0', null, '1', '2019-11-14 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('568', '1', 'testTask', 'renren', '0', null, '1', '2019-11-14 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('569', '1', 'testTask', 'renren', '0', null, '1', '2019-11-14 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('570', '1', 'testTask', 'renren', '0', null, '0', '2019-11-14 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('571', '1', 'testTask', 'renren', '0', null, '1', '2019-11-14 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('572', '1', 'testTask', 'renren', '0', null, '1', '2019-11-14 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('573', '1', 'testTask', 'renren', '0', null, '0', '2019-11-14 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('574', '1', 'testTask', 'renren', '0', null, '1', '2019-11-14 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('575', '1', 'testTask', 'renren', '0', null, '0', '2019-11-14 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('576', '1', 'testTask', 'renren', '0', null, '1', '2019-11-14 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('577', '1', 'testTask', 'renren', '0', null, '1', '2019-11-14 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('578', '1', 'testTask', 'renren', '0', null, '1', '2019-11-14 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('579', '1', 'testTask', 'renren', '0', null, '0', '2019-11-14 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('580', '1', 'testTask', 'renren', '0', null, '1', '2019-11-14 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('581', '1', 'testTask', 'renren', '0', null, '1', '2019-11-14 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('582', '1', 'testTask', 'renren', '0', null, '1', '2019-11-14 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('583', '1', 'testTask', 'renren', '0', null, '1', '2019-11-14 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('584', '1', 'testTask', 'renren', '0', null, '1', '2019-11-14 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('585', '1', 'testTask', 'renren', '0', null, '15', '2019-11-15 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('586', '1', 'testTask', 'renren', '0', null, '1', '2019-11-15 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('587', '1', 'testTask', 'renren', '0', null, '1', '2019-11-15 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('588', '1', 'testTask', 'renren', '0', null, '1', '2019-11-15 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('589', '1', 'testTask', 'renren', '0', null, '0', '2019-11-15 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('590', '1', 'testTask', 'renren', '0', null, '1', '2019-11-15 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('591', '1', 'testTask', 'renren', '0', null, '1', '2019-11-15 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('592', '1', 'testTask', 'renren', '0', null, '1', '2019-11-15 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('593', '1', 'testTask', 'renren', '0', null, '0', '2019-11-15 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('594', '1', 'testTask', 'renren', '0', null, '0', '2019-11-15 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('595', '1', 'testTask', 'renren', '0', null, '0', '2019-11-15 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('596', '1', 'testTask', 'renren', '0', null, '1', '2019-11-15 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('597', '1', 'testTask', 'renren', '0', null, '0', '2019-11-15 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('598', '1', 'testTask', 'renren', '0', null, '1', '2019-11-15 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('599', '1', 'testTask', 'renren', '0', null, '0', '2019-11-15 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('600', '1', 'testTask', 'renren', '0', null, '1', '2019-11-15 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('601', '1', 'testTask', 'renren', '0', null, '0', '2019-11-15 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('602', '1', 'testTask', 'renren', '0', null, '0', '2019-11-15 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('603', '1', 'testTask', 'renren', '0', null, '1', '2019-11-15 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('604', '1', 'testTask', 'renren', '0', null, '1', '2019-11-15 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('605', '1', 'testTask', 'renren', '0', null, '1', '2019-11-15 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('606', '1', 'testTask', 'renren', '0', null, '1', '2019-11-15 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('607', '1', 'testTask', 'renren', '0', null, '1', '2019-11-15 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('608', '1', 'testTask', 'renren', '0', null, '1', '2019-11-15 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('609', '1', 'testTask', 'renren', '0', null, '4', '2019-11-15 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('610', '1', 'testTask', 'renren', '0', null, '0', '2019-11-15 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('611', '1', 'testTask', 'renren', '0', null, '1', '2019-11-15 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('612', '1', 'testTask', 'renren', '0', null, '1', '2019-11-15 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('613', '1', 'testTask', 'renren', '0', null, '1', '2019-11-15 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('614', '1', 'testTask', 'renren', '0', null, '1', '2019-11-15 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('615', '1', 'testTask', 'renren', '0', null, '1', '2019-11-15 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('616', '1', 'testTask', 'renren', '0', null, '1', '2019-11-15 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('617', '1', 'testTask', 'renren', '0', null, '1', '2019-11-15 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('618', '1', 'testTask', 'renren', '0', null, '1', '2019-11-15 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('619', '1', 'testTask', 'renren', '0', null, '0', '2019-11-15 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('620', '1', 'testTask', 'renren', '0', null, '1', '2019-11-15 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('621', '1', 'testTask', 'renren', '0', null, '1', '2019-11-15 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('622', '1', 'testTask', 'renren', '0', null, '1', '2019-11-15 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('623', '1', 'testTask', 'renren', '0', null, '1', '2019-11-15 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('624', '1', 'testTask', 'renren', '0', null, '1', '2019-11-15 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('625', '1', 'testTask', 'renren', '0', null, '1', '2019-11-15 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('626', '1', 'testTask', 'renren', '0', null, '1', '2019-11-16 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('627', '1', 'testTask', 'renren', '0', null, '1', '2019-11-16 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('628', '1', 'testTask', 'renren', '0', null, '1', '2019-11-16 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('629', '1', 'testTask', 'renren', '0', null, '0', '2019-11-16 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('630', '1', 'testTask', 'renren', '0', null, '0', '2019-11-16 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('631', '1', 'testTask', 'renren', '0', null, '2', '2019-11-16 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('632', '1', 'testTask', 'renren', '0', null, '1', '2019-11-16 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('633', '1', 'testTask', 'renren', '0', null, '1', '2019-11-16 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('634', '1', 'testTask', 'renren', '0', null, '1', '2019-11-16 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('635', '1', 'testTask', 'renren', '0', null, '2', '2019-11-16 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('636', '1', 'testTask', 'renren', '0', null, '1', '2019-11-16 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('637', '1', 'testTask', 'renren', '0', null, '1', '2019-11-16 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('638', '1', 'testTask', 'renren', '0', null, '1', '2019-11-16 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('639', '1', 'testTask', 'renren', '0', null, '1', '2019-11-16 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('640', '1', 'testTask', 'renren', '0', null, '1', '2019-11-16 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('641', '1', 'testTask', 'renren', '0', null, '1', '2019-11-16 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('642', '1', 'testTask', 'renren', '0', null, '0', '2019-11-16 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('643', '1', 'testTask', 'renren', '0', null, '1', '2019-11-16 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('644', '1', 'testTask', 'renren', '0', null, '1', '2019-11-16 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('645', '1', 'testTask', 'renren', '0', null, '1', '2019-11-16 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('646', '1', 'testTask', 'renren', '0', null, '0', '2019-11-16 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('647', '1', 'testTask', 'renren', '0', null, '1', '2019-11-16 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('648', '1', 'testTask', 'renren', '0', null, '0', '2019-11-16 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('649', '1', 'testTask', 'renren', '0', null, '1', '2019-11-16 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('650', '1', 'testTask', 'renren', '0', null, '1', '2019-11-16 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('651', '1', 'testTask', 'renren', '0', null, '1', '2019-11-16 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('652', '1', 'testTask', 'renren', '0', null, '1', '2019-11-16 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('653', '1', 'testTask', 'renren', '0', null, '1', '2019-11-16 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('654', '1', 'testTask', 'renren', '0', null, '1', '2019-11-16 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('655', '1', 'testTask', 'renren', '0', null, '4', '2019-11-17 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('656', '1', 'testTask', 'renren', '0', null, '0', '2019-11-17 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('657', '1', 'testTask', 'renren', '0', null, '1', '2019-11-17 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('658', '1', 'testTask', 'renren', '0', null, '1', '2019-11-17 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('659', '1', 'testTask', 'renren', '0', null, '0', '2019-11-17 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('660', '1', 'testTask', 'renren', '0', null, '0', '2019-11-17 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('661', '1', 'testTask', 'renren', '0', null, '1', '2019-11-17 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('662', '1', 'testTask', 'renren', '0', null, '1', '2019-11-17 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('663', '1', 'testTask', 'renren', '0', null, '0', '2019-11-17 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('664', '1', 'testTask', 'renren', '0', null, '1', '2019-11-17 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('665', '1', 'testTask', 'renren', '0', null, '1', '2019-11-17 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('666', '1', 'testTask', 'renren', '0', null, '1', '2019-11-17 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('667', '1', 'testTask', 'renren', '0', null, '1', '2019-11-17 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('668', '1', 'testTask', 'renren', '0', null, '1', '2019-11-17 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('669', '1', 'testTask', 'renren', '0', null, '1', '2019-11-17 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('670', '1', 'testTask', 'renren', '0', null, '1', '2019-11-17 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('671', '1', 'testTask', 'renren', '0', null, '1', '2019-11-17 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('672', '1', 'testTask', 'renren', '0', null, '1', '2019-11-17 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('673', '1', 'testTask', 'renren', '0', null, '1', '2019-11-17 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('674', '1', 'testTask', 'renren', '0', null, '1', '2019-11-17 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('675', '1', 'testTask', 'renren', '0', null, '1', '2019-11-17 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('676', '1', 'testTask', 'renren', '0', null, '1', '2019-11-17 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('677', '1', 'testTask', 'renren', '0', null, '0', '2019-11-17 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('678', '1', 'testTask', 'renren', '0', null, '1', '2019-11-18 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('679', '1', 'testTask', 'renren', '0', null, '1', '2019-11-18 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('680', '1', 'testTask', 'renren', '0', null, '1', '2019-11-18 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('681', '1', 'testTask', 'renren', '0', null, '1', '2019-11-18 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('682', '1', 'testTask', 'renren', '0', null, '1', '2019-11-18 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('683', '1', 'testTask', 'renren', '0', null, '0', '2019-11-18 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('684', '1', 'testTask', 'renren', '0', null, '1', '2019-11-18 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('685', '1', 'testTask', 'renren', '0', null, '0', '2019-11-18 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('686', '1', 'testTask', 'renren', '0', null, '1', '2019-11-18 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('687', '1', 'testTask', 'renren', '0', null, '1', '2019-11-18 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('688', '1', 'testTask', 'renren', '0', null, '0', '2019-11-18 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('689', '1', 'testTask', 'renren', '0', null, '1', '2019-11-18 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('690', '1', 'testTask', 'renren', '0', null, '0', '2019-11-18 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('691', '1', 'testTask', 'renren', '0', null, '1', '2019-11-18 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('692', '1', 'testTask', 'renren', '0', null, '1', '2019-11-18 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('693', '1', 'testTask', 'renren', '0', null, '1', '2019-11-18 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('694', '1', 'testTask', 'renren', '0', null, '2', '2019-11-18 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('695', '1', 'testTask', 'renren', '0', null, '1', '2019-11-18 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('696', '1', 'testTask', 'renren', '0', null, '0', '2019-11-18 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('697', '1', 'testTask', 'renren', '0', null, '1', '2019-11-18 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('698', '1', 'testTask', 'renren', '0', null, '1', '2019-11-18 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('699', '1', 'testTask', 'renren', '0', null, '1', '2019-11-18 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('700', '1', 'testTask', 'renren', '0', null, '1', '2019-11-18 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('701', '1', 'testTask', 'renren', '0', null, '0', '2019-11-18 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('702', '1', 'testTask', 'renren', '0', null, '1', '2019-11-18 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('703', '1', 'testTask', 'renren', '0', null, '1', '2019-11-18 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('704', '1', 'testTask', 'renren', '0', null, '0', '2019-11-18 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('705', '1', 'testTask', 'renren', '0', null, '0', '2019-11-18 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('706', '1', 'testTask', 'renren', '0', null, '14', '2019-11-19 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('707', '1', 'testTask', 'renren', '0', null, '1', '2019-11-19 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('708', '1', 'testTask', 'renren', '0', null, '1', '2019-11-19 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('709', '1', 'testTask', 'renren', '0', null, '1', '2019-11-19 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('710', '1', 'testTask', 'renren', '0', null, '1', '2019-11-19 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('711', '1', 'testTask', 'renren', '0', null, '0', '2019-11-19 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('712', '1', 'testTask', 'renren', '0', null, '1', '2019-11-19 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('713', '1', 'testTask', 'renren', '0', null, '1', '2019-11-19 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('714', '1', 'testTask', 'renren', '0', null, '1', '2019-11-19 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('715', '1', 'testTask', 'renren', '0', null, '1', '2019-11-19 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('716', '1', 'testTask', 'renren', '0', null, '1', '2019-11-19 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('717', '1', 'testTask', 'renren', '0', null, '1', '2019-11-19 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('718', '1', 'testTask', 'renren', '0', null, '0', '2019-11-19 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('719', '1', 'testTask', 'renren', '0', null, '1', '2019-11-19 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('720', '1', 'testTask', 'renren', '0', null, '0', '2019-11-19 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('721', '1', 'testTask', 'renren', '0', null, '1', '2019-11-19 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('722', '1', 'testTask', 'renren', '0', null, '1', '2019-11-19 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('723', '1', 'testTask', 'renren', '0', null, '0', '2019-11-19 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('724', '1', 'testTask', 'renren', '0', null, '0', '2019-11-19 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('725', '1', 'testTask', 'renren', '0', null, '0', '2019-11-19 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('726', '1', 'testTask', 'renren', '0', null, '0', '2019-11-19 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('727', '1', 'testTask', 'renren', '0', null, '0', '2019-11-19 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('728', '1', 'testTask', 'renren', '0', null, '1', '2019-11-19 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('729', '1', 'testTask', 'renren', '0', null, '1', '2019-11-19 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('730', '1', 'testTask', 'renren', '0', null, '0', '2019-11-19 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('731', '1', 'testTask', 'renren', '0', null, '0', '2019-11-19 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('732', '1', 'testTask', 'renren', '0', null, '0', '2019-11-19 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('733', '1', 'testTask', 'renren', '0', null, '1', '2019-11-19 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('734', '1', 'testTask', 'renren', '0', null, '1', '2019-11-19 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('735', '1', 'testTask', 'renren', '0', null, '0', '2019-11-19 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('736', '1', 'testTask', 'renren', '0', null, '4', '2019-11-20 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('737', '1', 'testTask', 'renren', '0', null, '1', '2019-11-20 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('738', '1', 'testTask', 'renren', '0', null, '0', '2019-11-20 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('739', '1', 'testTask', 'renren', '0', null, '1', '2019-11-20 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('740', '1', 'testTask', 'renren', '0', null, '1', '2019-11-20 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('741', '1', 'testTask', 'renren', '0', null, '0', '2019-11-20 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('742', '1', 'testTask', 'renren', '0', null, '1', '2019-11-20 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('743', '1', 'testTask', 'renren', '0', null, '1', '2019-11-20 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('744', '1', 'testTask', 'renren', '0', null, '1', '2019-11-20 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('745', '1', 'testTask', 'renren', '0', null, '1', '2019-11-20 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('746', '1', 'testTask', 'renren', '0', null, '1', '2019-11-20 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('747', '1', 'testTask', 'renren', '0', null, '0', '2019-11-20 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('748', '1', 'testTask', 'renren', '0', null, '1', '2019-11-20 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('749', '1', 'testTask', 'renren', '0', null, '1', '2019-11-20 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('750', '1', 'testTask', 'renren', '0', null, '0', '2019-11-20 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('751', '1', 'testTask', 'renren', '0', null, '1', '2019-11-20 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('752', '1', 'testTask', 'renren', '0', null, '1', '2019-11-20 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('753', '1', 'testTask', 'renren', '0', null, '1', '2019-11-20 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('754', '1', 'testTask', 'renren', '0', null, '1', '2019-11-20 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('755', '1', 'testTask', 'renren', '0', null, '1', '2019-11-20 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('756', '1', 'testTask', 'renren', '0', null, '0', '2019-11-20 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('757', '1', 'testTask', 'renren', '0', null, '1', '2019-11-20 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('758', '1', 'testTask', 'renren', '0', null, '0', '2019-11-20 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('759', '1', 'testTask', 'renren', '0', null, '0', '2019-11-20 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('760', '1', 'testTask', 'renren', '0', null, '0', '2019-11-20 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('761', '1', 'testTask', 'renren', '0', null, '1', '2019-11-20 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('762', '1', 'testTask', 'renren', '0', null, '1', '2019-11-20 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('763', '1', 'testTask', 'renren', '0', null, '1', '2019-11-20 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('764', '1', 'testTask', 'renren', '0', null, '0', '2019-11-20 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('765', '1', 'testTask', 'renren', '0', null, '1', '2019-11-21 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('766', '1', 'testTask', 'renren', '0', null, '1', '2019-11-21 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('767', '1', 'testTask', 'renren', '0', null, '1', '2019-11-21 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('768', '1', 'testTask', 'renren', '0', null, '1', '2019-11-21 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('769', '1', 'testTask', 'renren', '0', null, '0', '2019-11-21 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('770', '1', 'testTask', 'renren', '0', null, '1', '2019-11-21 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('771', '1', 'testTask', 'renren', '0', null, '1', '2019-11-21 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('772', '1', 'testTask', 'renren', '0', null, '1', '2019-11-21 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('773', '1', 'testTask', 'renren', '0', null, '1', '2019-11-21 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('774', '1', 'testTask', 'renren', '0', null, '0', '2019-11-21 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('775', '1', 'testTask', 'renren', '0', null, '1', '2019-11-21 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('776', '1', 'testTask', 'renren', '0', null, '1', '2019-11-21 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('777', '1', 'testTask', 'renren', '0', null, '0', '2019-11-21 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('778', '1', 'testTask', 'renren', '0', null, '0', '2019-11-21 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('779', '1', 'testTask', 'renren', '0', null, '0', '2019-11-21 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('780', '1', 'testTask', 'renren', '0', null, '1', '2019-11-21 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('781', '1', 'testTask', 'renren', '0', null, '1', '2019-11-21 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('782', '1', 'testTask', 'renren', '0', null, '1', '2019-11-21 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('783', '1', 'testTask', 'renren', '0', null, '1', '2019-11-21 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('784', '1', 'testTask', 'renren', '0', null, '1', '2019-11-21 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('785', '1', 'testTask', 'renren', '0', null, '1', '2019-11-21 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('786', '1', 'testTask', 'renren', '0', null, '1', '2019-11-21 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('787', '1', 'testTask', 'renren', '0', null, '0', '2019-11-21 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('788', '1', 'testTask', 'renren', '0', null, '1', '2019-11-21 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('789', '1', 'testTask', 'renren', '0', null, '1', '2019-11-21 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('790', '1', 'testTask', 'renren', '0', null, '1', '2019-11-21 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('791', '1', 'testTask', 'renren', '0', null, '1', '2019-11-21 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('792', '1', 'testTask', 'renren', '0', null, '1', '2019-11-22 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('793', '1', 'testTask', 'renren', '0', null, '0', '2019-11-22 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('794', '1', 'testTask', 'renren', '0', null, '0', '2019-11-22 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('795', '1', 'testTask', 'renren', '0', null, '1', '2019-11-22 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('796', '1', 'testTask', 'renren', '0', null, '0', '2019-11-22 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('797', '1', 'testTask', 'renren', '0', null, '1', '2019-11-22 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('798', '1', 'testTask', 'renren', '0', null, '0', '2019-11-22 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('799', '1', 'testTask', 'renren', '0', null, '1', '2019-11-22 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('800', '1', 'testTask', 'renren', '0', null, '1', '2019-11-22 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('801', '1', 'testTask', 'renren', '0', null, '1', '2019-11-22 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('802', '1', 'testTask', 'renren', '0', null, '1', '2019-11-22 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('803', '1', 'testTask', 'renren', '0', null, '1', '2019-11-22 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('804', '1', 'testTask', 'renren', '0', null, '1', '2019-11-22 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('805', '1', 'testTask', 'renren', '0', null, '1', '2019-11-22 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('806', '1', 'testTask', 'renren', '0', null, '4', '2019-11-22 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('807', '1', 'testTask', 'renren', '0', null, '9', '2019-11-22 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('808', '1', 'testTask', 'renren', '0', null, '2', '2019-11-22 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('809', '1', 'testTask', 'renren', '0', null, '1', '2019-11-22 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('810', '1', 'testTask', 'renren', '0', null, '2', '2019-11-22 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('811', '1', 'testTask', 'renren', '0', null, '1', '2019-11-22 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('812', '1', 'testTask', 'renren', '0', null, '1', '2019-11-22 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('813', '1', 'testTask', 'renren', '0', null, '2', '2019-11-22 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('814', '1', 'testTask', 'renren', '0', null, '2', '2019-11-22 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('815', '1', 'testTask', 'renren', '0', null, '2', '2019-11-22 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('816', '1', 'testTask', 'renren', '0', null, '29', '2019-11-23 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('817', '1', 'testTask', 'renren', '0', null, '1', '2019-11-24 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('818', '1', 'testTask', 'renren', '0', null, '0', '2019-11-24 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('819', '1', 'testTask', 'renren', '0', null, '1', '2019-11-24 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('820', '1', 'testTask', 'renren', '0', null, '1', '2019-11-24 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('821', '1', 'testTask', 'renren', '0', null, '1', '2019-11-24 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('822', '1', 'testTask', 'renren', '0', null, '1', '2019-11-24 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('823', '1', 'testTask', 'renren', '0', null, '1', '2019-11-24 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('824', '1', 'testTask', 'renren', '0', null, '1', '2019-11-24 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('825', '1', 'testTask', 'renren', '0', null, '1', '2019-11-24 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('826', '1', 'testTask', 'renren', '0', null, '1', '2019-11-24 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('827', '1', 'testTask', 'renren', '0', null, '1', '2019-11-24 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('828', '1', 'testTask', 'renren', '0', null, '1', '2019-11-24 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('829', '1', 'testTask', 'renren', '0', null, '1', '2019-11-24 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('830', '1', 'testTask', 'renren', '0', null, '1', '2019-11-24 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('831', '1', 'testTask', 'renren', '0', null, '2', '2019-11-25 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('832', '1', 'testTask', 'renren', '0', null, '0', '2019-11-25 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('833', '1', 'testTask', 'renren', '0', null, '1', '2019-11-25 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('834', '1', 'testTask', 'renren', '0', null, '1', '2019-11-25 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('835', '1', 'testTask', 'renren', '0', null, '1', '2019-11-25 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('836', '1', 'testTask', 'renren', '0', null, '1', '2019-11-25 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('837', '1', 'testTask', 'renren', '0', null, '1', '2019-11-25 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('838', '1', 'testTask', 'renren', '0', null, '1', '2019-11-25 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('839', '1', 'testTask', 'renren', '0', null, '1', '2019-11-25 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('840', '1', 'testTask', 'renren', '0', null, '1', '2019-11-25 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('841', '1', 'testTask', 'renren', '0', null, '1', '2019-11-25 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('842', '1', 'testTask', 'renren', '0', null, '1', '2019-11-25 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('843', '1', 'testTask', 'renren', '0', null, '4', '2019-11-25 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('844', '1', 'testTask', 'renren', '0', null, '2', '2019-11-25 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('845', '1', 'testTask', 'renren', '0', null, '2', '2019-11-25 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('846', '1', 'testTask', 'renren', '0', null, '2', '2019-11-25 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('847', '1', 'testTask', 'renren', '0', null, '1', '2019-11-25 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('848', '1', 'testTask', 'renren', '0', null, '1', '2019-11-25 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('849', '1', 'testTask', 'renren', '0', null, '1', '2019-11-25 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('850', '1', 'testTask', 'renren', '0', null, '2', '2019-11-25 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('851', '1', 'testTask', 'renren', '0', null, '1', '2019-11-25 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('852', '1', 'testTask', 'renren', '0', null, '2', '2019-11-25 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('853', '1', 'testTask', 'renren', '0', null, '1', '2019-11-26 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('854', '1', 'testTask', 'renren', '0', null, '1', '2019-11-26 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('855', '1', 'testTask', 'renren', '0', null, '1', '2019-11-26 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('856', '1', 'testTask', 'renren', '0', null, '6', '2019-11-26 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('857', '1', 'testTask', 'renren', '0', null, '1', '2019-11-26 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('858', '1', 'testTask', 'renren', '0', null, '0', '2019-11-26 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('859', '1', 'testTask', 'renren', '0', null, '1', '2019-11-26 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('860', '1', 'testTask', 'renren', '0', null, '0', '2019-11-26 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('861', '1', 'testTask', 'renren', '0', null, '0', '2019-11-26 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('862', '1', 'testTask', 'renren', '0', null, '0', '2019-11-26 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('863', '1', 'testTask', 'renren', '0', null, '0', '2019-11-26 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('864', '1', 'testTask', 'renren', '0', null, '1', '2019-11-26 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('865', '1', 'testTask', 'renren', '0', null, '5', '2019-11-26 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('866', '1', 'testTask', 'renren', '0', null, '1', '2019-11-26 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('867', '1', 'testTask', 'renren', '0', null, '4', '2019-11-26 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('868', '1', 'testTask', 'renren', '0', null, '1', '2019-11-26 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('869', '1', 'testTask', 'renren', '0', null, '0', '2019-11-26 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('870', '1', 'testTask', 'renren', '0', null, '2', '2019-11-26 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('871', '1', 'testTask', 'renren', '0', null, '1', '2019-11-26 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('872', '1', 'testTask', 'renren', '0', null, '1', '2019-11-26 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('873', '1', 'testTask', 'renren', '0', null, '0', '2019-11-26 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('874', '1', 'testTask', 'renren', '0', null, '1', '2019-11-26 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('875', '1', 'testTask', 'renren', '0', null, '1', '2019-11-26 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('876', '1', 'testTask', 'renren', '0', null, '1', '2019-11-27 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('877', '1', 'testTask', 'renren', '0', null, '1', '2019-11-27 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('878', '1', 'testTask', 'renren', '0', null, '1', '2019-11-27 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('879', '1', 'testTask', 'renren', '0', null, '4', '2019-11-27 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('880', '1', 'testTask', 'renren', '0', null, '1', '2019-11-27 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('881', '1', 'testTask', 'renren', '0', null, '1', '2019-11-27 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('882', '1', 'testTask', 'renren', '0', null, '1', '2019-11-27 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('883', '1', 'testTask', 'renren', '0', null, '2', '2019-11-27 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('884', '1', 'testTask', 'renren', '0', null, '0', '2019-11-27 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('885', '1', 'testTask', 'renren', '0', null, '1', '2019-11-27 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('886', '1', 'testTask', 'renren', '0', null, '1', '2019-11-27 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('887', '1', 'testTask', 'renren', '0', null, '1', '2019-11-27 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('888', '1', 'testTask', 'renren', '0', null, '2', '2019-11-27 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('889', '1', 'testTask', 'renren', '0', null, '1', '2019-11-27 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('890', '1', 'testTask', 'renren', '0', null, '1', '2019-11-27 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('891', '1', 'testTask', 'renren', '0', null, '0', '2019-11-27 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('892', '1', 'testTask', 'renren', '0', null, '0', '2019-11-27 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('893', '1', 'testTask', 'renren', '0', null, '0', '2019-11-27 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('894', '1', 'testTask', 'renren', '0', null, '1', '2019-11-27 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('895', '1', 'testTask', 'renren', '0', null, '1', '2019-11-27 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('896', '1', 'testTask', 'renren', '0', null, '1', '2019-11-27 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('897', '1', 'testTask', 'renren', '0', null, '1', '2019-11-27 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('898', '1', 'testTask', 'renren', '0', null, '1', '2019-11-27 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('899', '1', 'testTask', 'renren', '0', null, '37', '2019-11-27 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('900', '1', 'testTask', 'renren', '0', null, '508', '2019-11-28 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('901', '1', 'testTask', 'renren', '0', null, '20', '2019-11-28 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('902', '1', 'testTask', 'renren', '0', null, '1', '2019-11-28 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('903', '1', 'testTask', 'renren', '0', null, '1', '2019-11-28 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('904', '1', 'testTask', 'renren', '0', null, '2', '2019-11-28 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('905', '1', 'testTask', 'renren', '0', null, '0', '2019-11-28 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('906', '1', 'testTask', 'renren', '0', null, '1', '2019-11-28 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('907', '1', 'testTask', 'renren', '0', null, '0', '2019-11-28 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('908', '1', 'testTask', 'renren', '0', null, '1', '2019-11-28 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('909', '1', 'testTask', 'renren', '0', null, '1', '2019-11-28 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('910', '1', 'testTask', 'renren', '0', null, '1', '2019-11-28 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('911', '1', 'testTask', 'renren', '0', null, '0', '2019-11-28 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('912', '1', 'testTask', 'renren', '0', null, '1', '2019-11-28 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('913', '1', 'testTask', 'renren', '0', null, '1', '2019-11-28 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('914', '1', 'testTask', 'renren', '0', null, '1', '2019-11-28 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('915', '1', 'testTask', 'renren', '0', null, '1', '2019-11-28 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('916', '1', 'testTask', 'renren', '0', null, '0', '2019-11-28 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('917', '1', 'testTask', 'renren', '0', null, '1', '2019-11-28 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('918', '1', 'testTask', 'renren', '0', null, '1', '2019-11-28 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('919', '1', 'testTask', 'renren', '0', null, '1', '2019-11-28 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('920', '1', 'testTask', 'renren', '0', null, '1', '2019-11-28 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('921', '1', 'testTask', 'renren', '0', null, '1', '2019-11-28 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('922', '1', 'testTask', 'renren', '0', null, '1', '2019-11-28 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('923', '1', 'testTask', 'renren', '0', null, '1', '2019-11-28 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('924', '1', 'testTask', 'renren', '0', null, '0', '2019-11-28 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('925', '1', 'testTask', 'renren', '0', null, '0', '2019-11-28 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('926', '1', 'testTask', 'renren', '0', null, '1', '2019-11-28 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('927', '1', 'testTask', 'renren', '0', null, '0', '2019-11-28 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('928', '1', 'testTask', 'renren', '0', null, '1', '2019-11-29 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('929', '1', 'testTask', 'renren', '0', null, '0', '2019-11-29 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('930', '1', 'testTask', 'renren', '0', null, '0', '2019-11-29 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('931', '1', 'testTask', 'renren', '0', null, '0', '2019-11-29 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('932', '1', 'testTask', 'renren', '0', null, '1', '2019-11-29 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('933', '1', 'testTask', 'renren', '0', null, '0', '2019-11-29 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('934', '1', 'testTask', 'renren', '0', null, '1', '2019-11-29 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('935', '1', 'testTask', 'renren', '0', null, '0', '2019-11-29 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('936', '1', 'testTask', 'renren', '0', null, '1', '2019-11-29 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('937', '1', 'testTask', 'renren', '0', null, '0', '2019-11-29 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('938', '1', 'testTask', 'renren', '0', null, '0', '2019-11-29 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('939', '1', 'testTask', 'renren', '0', null, '1', '2019-11-29 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('940', '1', 'testTask', 'renren', '0', null, '1', '2019-11-29 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('941', '1', 'testTask', 'renren', '0', null, '0', '2019-11-29 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('942', '1', 'testTask', 'renren', '0', null, '3', '2019-11-29 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('943', '1', 'testTask', 'renren', '0', null, '1', '2019-11-29 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('944', '1', 'testTask', 'renren', '0', null, '1', '2019-11-29 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('945', '1', 'testTask', 'renren', '0', null, '1', '2019-11-29 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('946', '1', 'testTask', 'renren', '0', null, '1', '2019-11-29 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('947', '1', 'testTask', 'renren', '0', null, '1', '2019-11-29 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('948', '1', 'testTask', 'renren', '0', null, '1', '2019-11-29 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('949', '1', 'testTask', 'renren', '0', null, '0', '2019-11-29 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('950', '1', 'testTask', 'renren', '0', null, '1', '2019-11-30 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('951', '1', 'testTask', 'renren', '0', null, '1', '2019-11-30 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('952', '1', 'testTask', 'renren', '0', null, '1', '2019-11-30 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('953', '1', 'testTask', 'renren', '0', null, '1', '2019-11-30 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('954', '1', 'testTask', 'renren', '0', null, '1', '2019-11-30 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('955', '1', 'testTask', 'renren', '0', null, '1', '2019-11-30 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('956', '1', 'testTask', 'renren', '0', null, '0', '2019-11-30 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('957', '1', 'testTask', 'renren', '0', null, '1', '2019-11-30 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('958', '1', 'testTask', 'renren', '0', null, '1', '2019-11-30 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('959', '1', 'testTask', 'renren', '0', null, '3', '2019-12-01 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('960', '1', 'testTask', 'renren', '0', null, '1', '2019-12-01 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('961', '1', 'testTask', 'renren', '0', null, '2', '2019-12-01 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('962', '1', 'testTask', 'renren', '0', null, '1', '2019-12-01 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('963', '1', 'testTask', 'renren', '0', null, '1', '2019-12-01 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('964', '1', 'testTask', 'renren', '0', null, '0', '2019-12-01 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('965', '1', 'testTask', 'renren', '0', null, '1', '2019-12-01 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('966', '1', 'testTask', 'renren', '0', null, '1', '2019-12-01 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('967', '1', 'testTask', 'renren', '0', null, '1', '2019-12-01 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('968', '1', 'testTask', 'renren', '0', null, '1', '2019-12-01 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('969', '1', 'testTask', 'renren', '0', null, '0', '2019-12-01 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('970', '1', 'testTask', 'renren', '0', null, '7', '2019-12-02 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('971', '1', 'testTask', 'renren', '0', null, '1', '2019-12-02 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('972', '1', 'testTask', 'renren', '0', null, '1', '2019-12-02 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('973', '1', 'testTask', 'renren', '0', null, '1', '2019-12-02 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('974', '1', 'testTask', 'renren', '0', null, '0', '2019-12-02 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('975', '1', 'testTask', 'renren', '0', null, '1', '2019-12-02 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('976', '1', 'testTask', 'renren', '0', null, '1', '2019-12-02 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('977', '1', 'testTask', 'renren', '0', null, '1', '2019-12-02 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('978', '1', 'testTask', 'renren', '0', null, '0', '2019-12-02 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('979', '1', 'testTask', 'renren', '0', null, '0', '2019-12-02 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('980', '1', 'testTask', 'renren', '0', null, '0', '2019-12-02 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('981', '1', 'testTask', 'renren', '0', null, '1', '2019-12-02 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('982', '1', 'testTask', 'renren', '0', null, '1', '2019-12-02 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('983', '1', 'testTask', 'renren', '0', null, '0', '2019-12-02 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('984', '1', 'testTask', 'renren', '0', null, '0', '2019-12-02 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('985', '1', 'testTask', 'renren', '0', null, '1', '2019-12-02 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('986', '1', 'testTask', 'renren', '0', null, '1', '2019-12-02 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('987', '1', 'testTask', 'renren', '0', null, '0', '2019-12-02 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('988', '1', 'testTask', 'renren', '0', null, '1', '2019-12-02 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('989', '1', 'testTask', 'renren', '0', null, '1', '2019-12-02 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('990', '1', 'testTask', 'renren', '0', null, '0', '2019-12-02 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('991', '1', 'testTask', 'renren', '0', null, '1', '2019-12-02 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('992', '1', 'testTask', 'renren', '0', null, '1', '2019-12-02 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('993', '1', 'testTask', 'renren', '0', null, '1', '2019-12-02 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('994', '1', 'testTask', 'renren', '0', null, '1', '2019-12-02 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('995', '1', 'testTask', 'renren', '0', null, '0', '2019-12-02 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('996', '1', 'testTask', 'renren', '0', null, '0', '2019-12-02 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('997', '1', 'testTask', 'renren', '0', null, '1', '2019-12-02 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('998', '1', 'testTask', 'renren', '0', null, '1', '2019-12-02 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('999', '1', 'testTask', 'renren', '0', null, '1', '2019-12-02 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('1000', '1', 'testTask', 'renren', '0', null, '1', '2019-12-02 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('1001', '1', 'testTask', 'renren', '0', null, '0', '2019-12-02 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('1002', '1', 'testTask', 'renren', '0', null, '1', '2019-12-02 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('1003', '1', 'testTask', 'renren', '0', null, '1', '2019-12-02 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('1004', '1', 'testTask', 'renren', '0', null, '2', '2019-12-02 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('1005', '1', 'testTask', 'renren', '0', null, '0', '2019-12-02 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('1006', '1', 'testTask', 'renren', '0', null, '1', '2019-12-11 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('1007', '1', 'testTask', 'renren', '0', null, '1', '2019-12-11 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('1008', '1', 'testTask', 'renren', '0', null, '1', '2019-12-11 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('1009', '1', 'testTask', 'renren', '0', null, '1', '2019-12-11 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('1010', '1', 'testTask', 'renren', '0', null, '1', '2019-12-11 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('1011', '1', 'testTask', 'renren', '0', null, '0', '2019-12-11 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('1012', '1', 'testTask', 'renren', '0', null, '0', '2019-12-11 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('1013', '1', 'testTask', 'renren', '0', null, '1', '2019-12-11 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('1014', '1', 'testTask', 'renren', '0', null, '1', '2019-12-11 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('1015', '1', 'testTask', 'renren', '0', null, '0', '2019-12-11 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('1016', '1', 'testTask', 'renren', '0', null, '1', '2019-12-11 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('1017', '1', 'testTask', 'renren', '0', null, '0', '2019-12-11 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('1018', '1', 'testTask', 'renren', '0', null, '0', '2019-12-11 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('1019', '1', 'testTask', 'renren', '0', null, '1', '2019-12-11 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('1020', '1', 'testTask', 'renren', '0', null, '1', '2019-12-11 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('1021', '1', 'testTask', 'renren', '0', null, '1', '2019-12-11 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('1022', '1', 'testTask', 'renren', '0', null, '1', '2019-12-11 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('1023', '1', 'testTask', 'renren', '0', null, '1', '2019-12-12 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('1024', '1', 'testTask', 'renren', '0', null, '0', '2019-12-13 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('1025', '1', 'testTask', 'renren', '0', null, '1', '2019-12-13 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('1026', '1', 'testTask', 'renren', '0', null, '1', '2019-12-13 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('1027', '1', 'testTask', 'renren', '0', null, '0', '2019-12-13 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('1028', '1', 'testTask', 'renren', '0', null, '1', '2019-12-13 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('1029', '1', 'testTask', 'renren', '0', null, '2', '2019-12-13 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('1030', '1', 'testTask', 'renren', '0', null, '1', '2019-12-13 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('1031', '1', 'testTask', 'renren', '0', null, '1', '2019-12-13 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('1032', '1', 'testTask', 'renren', '0', null, '1', '2019-12-13 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('1033', '1', 'testTask', 'renren', '0', null, '1', '2019-12-13 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('1034', '1', 'testTask', 'renren', '0', null, '1', '2019-12-13 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('1035', '1', 'testTask', 'renren', '0', null, '1', '2019-12-13 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('1036', '1', 'testTask', 'renren', '0', null, '0', '2019-12-13 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('1037', '1', 'testTask', 'renren', '0', null, '1', '2019-12-13 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('1038', '1', 'testTask', 'renren', '0', null, '0', '2019-12-13 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('1039', '1', 'testTask', 'renren', '0', null, '1', '2019-12-13 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('1040', '1', 'testTask', 'renren', '0', null, '2', '2019-12-13 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('1041', '1', 'testTask', 'renren', '0', null, '1', '2019-12-13 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('1042', '1', 'testTask', 'renren', '0', null, '0', '2019-12-13 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('1043', '1', 'testTask', 'renren', '0', null, '1', '2019-12-13 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('1044', '1', 'testTask', 'renren', '0', null, '1', '2019-12-13 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('1045', '1', 'testTask', 'renren', '0', null, '1', '2019-12-15 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('1046', '1', 'testTask', 'renren', '0', null, '5', '2019-12-16 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('1047', '1', 'testTask', 'renren', '0', null, '1', '2019-12-16 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('1048', '1', 'testTask', 'renren', '0', null, '0', '2019-12-16 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('1049', '1', 'testTask', 'renren', '0', null, '1', '2019-12-16 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('1050', '1', 'testTask', 'renren', '0', null, '1', '2019-12-16 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('1051', '1', 'testTask', 'renren', '0', null, '0', '2019-12-16 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('1052', '1', 'testTask', 'renren', '0', null, '1', '2019-12-16 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('1053', '1', 'testTask', 'renren', '0', null, '1', '2019-12-16 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('1054', '1', 'testTask', 'renren', '0', null, '1', '2019-12-16 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('1055', '1', 'testTask', 'renren', '0', null, '1', '2019-12-16 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('1056', '1', 'testTask', 'renren', '0', null, '1', '2019-12-16 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('1057', '1', 'testTask', 'renren', '0', null, '1', '2019-12-16 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('1058', '1', 'testTask', 'renren', '0', null, '0', '2019-12-16 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('1059', '1', 'testTask', 'renren', '0', null, '0', '2019-12-16 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('1060', '1', 'testTask', 'renren', '0', null, '3', '2019-12-16 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('1061', '1', 'testTask', 'renren', '0', null, '1', '2019-12-16 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('1062', '1', 'testTask', 'renren', '0', null, '1', '2019-12-16 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('1063', '1', 'testTask', 'renren', '0', null, '1', '2019-12-16 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('1064', '1', 'testTask', 'renren', '0', null, '1', '2019-12-18 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('1065', '1', 'testTask', 'renren', '0', null, '1', '2019-12-19 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('1066', '1', 'testTask', 'renren', '0', null, '0', '2019-12-19 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('1067', '1', 'testTask', 'renren', '0', null, '1', '2019-12-19 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('1068', '1', 'testTask', 'renren', '0', null, '2', '2019-12-19 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('1069', '1', 'testTask', 'renren', '0', null, '0', '2019-12-19 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('1070', '1', 'testTask', 'renren', '0', null, '1', '2019-12-19 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('1071', '1', 'testTask', 'renren', '0', null, '1', '2019-12-19 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('1072', '1', 'testTask', 'renren', '0', null, '1', '2019-12-19 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('1073', '1', 'testTask', 'renren', '0', null, '1', '2019-12-19 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('1074', '1', 'testTask', 'renren', '0', null, '0', '2019-12-19 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('1075', '1', 'testTask', 'renren', '0', null, '1', '2019-12-19 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('1076', '1', 'testTask', 'renren', '0', null, '0', '2019-12-19 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('1077', '1', 'testTask', 'renren', '0', null, '1', '2019-12-19 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('1078', '1', 'testTask', 'renren', '0', null, '0', '2019-12-19 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('1079', '1', 'testTask', 'renren', '0', null, '2', '2019-12-19 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('1080', '1', 'testTask', 'renren', '0', null, '1', '2019-12-19 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('1081', '1', 'testTask', 'renren', '0', null, '1', '2019-12-19 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('1082', '1', 'testTask', 'renren', '0', null, '1', '2019-12-19 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('1083', '1', 'testTask', 'renren', '0', null, '1', '2019-12-19 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('1084', '1', 'testTask', 'renren', '0', null, '2', '2019-12-19 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('1085', '1', 'testTask', 'renren', '0', null, '1', '2019-12-19 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('1086', '1', 'testTask', 'renren', '0', null, '1', '2019-12-19 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('1087', '1', 'testTask', 'renren', '0', null, '2', '2019-12-19 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('1088', '1', 'testTask', 'renren', '0', null, '1', '2019-12-19 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('1089', '1', 'testTask', 'renren', '0', null, '3', '2019-12-19 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('1090', '1', 'testTask', 'renren', '0', null, '0', '2019-12-19 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('1091', '1', 'testTask', 'renren', '0', null, '1', '2019-12-19 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('1092', '1', 'testTask', 'renren', '0', null, '1', '2019-12-19 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('1093', '1', 'testTask', 'renren', '0', null, '14', '2019-12-20 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('1094', '1', 'testTask', 'renren', '0', null, '1', '2019-12-20 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('1095', '1', 'testTask', 'renren', '0', null, '1', '2019-12-20 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('1096', '1', 'testTask', 'renren', '0', null, '1', '2019-12-20 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('1097', '1', 'testTask', 'renren', '0', null, '1', '2019-12-20 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('1098', '1', 'testTask', 'renren', '0', null, '0', '2019-12-20 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('1099', '1', 'testTask', 'renren', '0', null, '0', '2019-12-20 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('1100', '1', 'testTask', 'renren', '0', null, '1', '2019-12-20 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('1101', '1', 'testTask', 'renren', '0', null, '1', '2019-12-20 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('1102', '1', 'testTask', 'renren', '0', null, '1', '2019-12-20 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('1103', '1', 'testTask', 'renren', '0', null, '0', '2020-01-09 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('1104', '1', 'testTask', 'renren', '0', null, '1', '2020-01-09 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('1105', '1', 'testTask', 'renren', '0', null, '1', '2020-01-09 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('1106', '1', 'testTask', 'renren', '0', null, '1', '2020-01-09 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('1107', '1', 'testTask', 'renren', '0', null, '2', '2020-01-09 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('1108', '1', 'testTask', 'renren', '0', null, '1', '2020-01-09 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('1109', '1', 'testTask', 'renren', '0', null, '0', '2020-01-09 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('1110', '1', 'testTask', 'renren', '0', null, '1', '2020-01-09 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('1111', '1', 'testTask', 'renren', '0', null, '1', '2020-01-09 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('1112', '1', 'testTask', 'renren', '0', null, '0', '2020-01-09 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('1113', '1', 'testTask', 'renren', '0', null, '1', '2020-01-09 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('1114', '1', 'testTask', 'renren', '0', null, '1', '2020-01-09 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('1115', '1', 'testTask', 'renren', '0', null, '2', '2020-01-09 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('1116', '1', 'testTask', 'renren', '0', null, '1', '2020-01-09 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('1117', '1', 'testTask', 'renren', '0', null, '1', '2020-01-09 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('1118', '1', 'testTask', 'renren', '0', null, '2', '2020-01-09 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('1119', '1', 'testTask', 'renren', '0', null, '2', '2020-01-09 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('1120', '1', 'testTask', 'renren', '0', null, '1', '2020-01-09 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('1121', '1', 'testTask', 'renren', '0', null, '14', '2020-01-10 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('1122', '1', 'testTask', 'renren', '0', null, '1', '2020-01-27 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('1123', '1', 'testTask', 'renren', '0', null, '1', '2020-01-27 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('1124', '1', 'testTask', 'renren', '0', null, '1', '2020-01-27 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('1125', '1', 'testTask', 'renren', '0', null, '1', '2020-01-27 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('1126', '1', 'testTask', 'renren', '0', null, '1', '2020-01-27 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('1127', '1', 'testTask', 'renren', '0', null, '1', '2020-01-27 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('1128', '1', 'testTask', 'renren', '0', null, '0', '2020-01-27 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('1129', '1', 'testTask', 'renren', '0', null, '2', '2020-01-28 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('1130', '1', 'testTask', 'renren', '0', null, '1', '2020-01-28 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('1131', '1', 'testTask', 'renren', '0', null, '1', '2020-01-28 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('1132', '1', 'testTask', 'renren', '0', null, '1', '2020-01-28 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('1133', '1', 'testTask', 'renren', '0', null, '0', '2020-01-28 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('1134', '1', 'testTask', 'renren', '0', null, '10', '2020-01-28 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('1135', '1', 'testTask', 'renren', '0', null, '1', '2020-01-28 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('1136', '1', 'testTask', 'renren', '0', null, '1', '2020-01-28 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('1137', '1', 'testTask', 'renren', '0', null, '1', '2020-01-28 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('1138', '1', 'testTask', 'renren', '0', null, '1', '2020-01-28 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('1139', '1', 'testTask', 'renren', '0', null, '1', '2020-01-28 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('1140', '1', 'testTask', 'renren', '0', null, '0', '2020-01-28 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('1141', '1', 'testTask', 'renren', '0', null, '0', '2020-01-28 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('1142', '1', 'testTask', 'renren', '0', null, '1', '2020-01-28 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('1143', '1', 'testTask', 'renren', '0', null, '1', '2020-01-28 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('1144', '1', 'testTask', 'renren', '0', null, '1', '2020-01-28 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('1145', '1', 'testTask', 'renren', '0', null, '0', '2020-01-28 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('1146', '1', 'testTask', 'renren', '0', null, '0', '2020-01-28 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('1147', '1', 'testTask', 'renren', '0', null, '1', '2020-01-29 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('1148', '1', 'testTask', 'renren', '0', null, '1', '2020-01-29 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('1149', '1', 'testTask', 'renren', '0', null, '12', '2020-01-29 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('1150', '1', 'testTask', 'renren', '0', null, '1', '2020-01-29 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('1151', '1', 'testTask', 'renren', '0', null, '1', '2020-01-29 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('1152', '1', 'testTask', 'renren', '0', null, '1', '2020-01-29 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('1153', '1', 'testTask', 'renren', '0', null, '1', '2020-01-29 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('1154', '1', 'testTask', 'renren', '0', null, '1', '2020-01-29 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('1155', '1', 'testTask', 'renren', '0', null, '0', '2020-01-29 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('1156', '1', 'testTask', 'renren', '0', null, '1', '2020-01-29 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('1157', '1', 'testTask', 'renren', '0', null, '0', '2020-01-29 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('1158', '1', 'testTask', 'renren', '0', null, '1', '2020-01-30 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('1159', '1', 'testTask', 'renren', '0', null, '2', '2020-01-30 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('1160', '1', 'testTask', 'renren', '0', null, '1', '2020-01-30 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('1161', '1', 'testTask', 'renren', '0', null, '1', '2020-01-30 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('1162', '1', 'testTask', 'renren', '0', null, '1', '2020-01-30 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('1163', '1', 'testTask', 'renren', '0', null, '3', '2020-01-30 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('1164', '1', 'testTask', 'renren', '0', null, '2', '2020-01-30 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('1165', '1', 'testTask', 'renren', '0', null, '1', '2020-01-30 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('1166', '1', 'testTask', 'renren', '0', null, '1', '2020-01-30 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('1167', '1', 'testTask', 'renren', '0', null, '1', '2020-01-30 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('1168', '1', 'testTask', 'renren', '0', null, '1', '2020-01-30 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('1169', '1', 'testTask', 'renren', '0', null, '1', '2020-01-30 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('1170', '1', 'testTask', 'renren', '0', null, '0', '2020-01-30 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('1171', '1', 'testTask', 'renren', '0', null, '1', '2020-01-30 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('1172', '1', 'testTask', 'renren', '0', null, '1', '2020-01-30 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('1173', '1', 'testTask', 'renren', '0', null, '1', '2020-01-30 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('1174', '1', 'testTask', 'renren', '0', null, '1', '2020-01-30 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('1175', '1', 'testTask', 'renren', '0', null, '1', '2020-01-30 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('1176', '1', 'testTask', 'renren', '0', null, '0', '2020-01-30 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('1177', '1', 'testTask', 'renren', '0', null, '1', '2020-01-30 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('1178', '1', 'testTask', 'renren', '0', null, '3', '2020-02-01 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('1179', '1', 'testTask', 'renren', '0', null, '1', '2020-02-01 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('1180', '1', 'testTask', 'renren', '0', null, '1', '2020-02-01 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('1181', '1', 'testTask', 'renren', '0', null, '1', '2020-02-01 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('1182', '1', 'testTask', 'renren', '0', null, '1', '2020-02-01 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('1183', '1', 'testTask', 'renren', '0', null, '0', '2020-02-18 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('1184', '1', 'testTask', 'renren', '0', null, '1', '2020-02-18 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('1185', '1', 'testTask', 'renren', '0', null, '10', '2020-02-18 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('1186', '1', 'testTask', 'renren', '0', null, '0', '2020-02-18 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('1187', '1', 'testTask', 'renren', '0', null, '1', '2020-02-18 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('1188', '1', 'testTask', 'renren', '0', null, '1', '2020-02-18 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('1189', '1', 'testTask', 'renren', '0', null, '1', '2020-02-18 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('1190', '1', 'testTask', 'renren', '0', null, '1', '2020-02-18 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('1191', '1', 'testTask', 'renren', '0', null, '0', '2020-02-18 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('1192', '1', 'testTask', 'renren', '0', null, '1', '2020-02-18 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('1193', '1', 'testTask', 'renren', '0', null, '1', '2020-02-18 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('1194', '1', 'testTask', 'renren', '0', null, '1', '2020-02-18 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('1195', '1', 'testTask', 'renren', '0', null, '1', '2020-02-18 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('1196', '1', 'testTask', 'renren', '0', null, '1', '2020-02-18 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('1197', '1', 'testTask', 'renren', '0', null, '1', '2020-02-18 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('1198', '1', 'testTask', 'renren', '0', null, '1', '2020-02-19 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('1199', '1', 'testTask', 'renren', '0', null, '1', '2020-02-19 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('1200', '1', 'testTask', 'renren', '0', null, '1', '2020-02-19 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('1201', '1', 'testTask', 'renren', '0', null, '1', '2020-02-19 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('1202', '1', 'testTask', 'renren', '0', null, '1', '2020-02-19 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('1203', '1', 'testTask', 'renren', '0', null, '1', '2020-02-19 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('1204', '1', 'testTask', 'renren', '0', null, '1', '2020-02-19 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('1205', '1', 'testTask', 'renren', '0', null, '1', '2020-02-19 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('1206', '1', 'testTask', 'renren', '0', null, '0', '2020-02-19 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('1207', '1', 'testTask', 'renren', '0', null, '1', '2020-02-19 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('1208', '1', 'testTask', 'renren', '0', null, '0', '2020-02-19 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('1209', '1', 'testTask', 'renren', '0', null, '1', '2020-02-20 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('1210', '1', 'testTask', 'renren', '0', null, '1', '2020-02-20 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('1211', '1', 'testTask', 'renren', '0', null, '1', '2020-02-20 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('1212', '1', 'testTask', 'renren', '0', null, '1', '2020-02-20 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('1213', '1', 'testTask', 'renren', '0', null, '1', '2020-02-20 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('1214', '1', 'testTask', 'renren', '0', null, '0', '2020-02-20 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('1215', '1', 'testTask', 'renren', '0', null, '0', '2020-02-20 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('1216', '1', 'testTask', 'renren', '0', null, '1', '2020-02-20 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('1217', '1', 'testTask', 'renren', '0', null, '1', '2020-02-20 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('1218', '1', 'testTask', 'renren', '0', null, '1', '2020-02-20 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('1219', '1', 'testTask', 'renren', '0', null, '1', '2020-02-20 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('1220', '1', 'testTask', 'renren', '0', null, '2', '2020-02-20 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('1221', '1', 'testTask', 'renren', '0', null, '1', '2020-02-21 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('1222', '1', 'testTask', 'renren', '0', null, '1', '2020-02-21 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('1223', '1', 'testTask', 'renren', '0', null, '1', '2020-02-21 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('1224', '1', 'testTask', 'renren', '0', null, '0', '2020-02-21 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('1225', '1', 'testTask', 'renren', '0', null, '1', '2020-02-22 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('1226', '1', 'testTask', 'renren', '0', null, '0', '2020-02-22 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('1227', '1', 'testTask', 'renren', '0', null, '0', '2020-02-22 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('1228', '1', 'testTask', 'renren', '0', null, '1', '2020-02-22 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('1229', '1', 'testTask', 'renren', '0', null, '1', '2020-02-22 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('1230', '1', 'testTask', 'renren', '0', null, '3', '2020-02-22 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('1231', '1', 'testTask', 'renren', '0', null, '2', '2020-02-22 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('1232', '1', 'testTask', 'renren', '0', null, '1', '2020-02-22 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('1233', '1', 'testTask', 'renren', '0', null, '1', '2020-02-22 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('1234', '1', 'testTask', 'renren', '0', null, '0', '2020-02-22 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('1235', '1', 'testTask', 'renren', '0', null, '4', '2020-02-22 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('1236', '1', 'testTask', 'renren', '0', null, '0', '2020-02-22 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('1237', '1', 'testTask', 'renren', '0', null, '1', '2020-02-22 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('1238', '1', 'testTask', 'renren', '0', null, '1', '2020-02-24 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('1239', '1', 'testTask', 'renren', '0', null, '1', '2020-02-24 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('1240', '1', 'testTask', 'renren', '0', null, '0', '2020-02-24 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('1241', '1', 'testTask', 'renren', '0', null, '0', '2020-02-24 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('1242', '1', 'testTask', 'renren', '0', null, '0', '2020-02-24 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('1243', '1', 'testTask', 'renren', '0', null, '1', '2020-02-24 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('1244', '1', 'testTask', 'renren', '0', null, '1', '2020-02-24 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('1245', '1', 'testTask', 'renren', '0', null, '1', '2020-02-24 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('1246', '1', 'testTask', 'renren', '0', null, '3', '2020-02-24 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('1247', '1', 'testTask', 'renren', '0', null, '1', '2020-02-24 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('1248', '1', 'testTask', 'renren', '0', null, '1', '2020-02-24 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('1249', '1', 'testTask', 'renren', '0', null, '0', '2020-02-24 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('1250', '1', 'testTask', 'renren', '0', null, '1', '2020-02-24 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('1251', '1', 'testTask', 'renren', '0', null, '1', '2020-02-24 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('1252', '1', 'testTask', 'renren', '0', null, '1', '2020-02-24 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('1253', '1', 'testTask', 'renren', '0', null, '1', '2020-02-24 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('1254', '1', 'testTask', 'renren', '0', null, '10', '2020-02-25 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('1255', '1', 'testTask', 'renren', '0', null, '0', '2020-02-25 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('1256', '1', 'testTask', 'renren', '0', null, '1', '2020-02-25 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('1257', '1', 'testTask', 'renren', '0', null, '1', '2020-02-25 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('1258', '1', 'testTask', 'renren', '0', null, '1', '2020-02-25 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('1259', '1', 'testTask', 'renren', '0', null, '0', '2020-02-25 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('1260', '1', 'testTask', 'renren', '0', null, '1', '2020-02-25 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('1261', '1', 'testTask', 'renren', '0', null, '1', '2020-02-25 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('1262', '1', 'testTask', 'renren', '0', null, '1', '2020-02-25 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('1263', '1', 'testTask', 'renren', '0', null, '1', '2020-02-25 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('1264', '1', 'testTask', 'renren', '0', null, '1', '2020-02-25 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('1265', '1', 'testTask', 'renren', '0', null, '1', '2020-02-25 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('1266', '1', 'testTask', 'renren', '0', null, '1', '2020-02-25 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('1267', '1', 'testTask', 'renren', '0', null, '2', '2020-02-25 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('1268', '1', 'testTask', 'renren', '0', null, '3', '2020-02-25 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('1269', '1', 'testTask', 'renren', '0', null, '1', '2020-02-25 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('1270', '1', 'testTask', 'renren', '0', null, '2', '2020-02-25 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('1271', '1', 'testTask', 'renren', '0', null, '1', '2020-02-25 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('1272', '1', 'testTask', 'renren', '0', null, '1', '2020-02-25 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('1273', '1', 'testTask', 'renren', '0', null, '1', '2020-02-25 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('1274', '1', 'testTask', 'renren', '0', null, '2', '2020-02-25 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('1275', '1', 'testTask', 'renren', '0', null, '3', '2020-02-25 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('1276', '1', 'testTask', 'renren', '0', null, '1', '2020-03-04 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('1277', '1', 'testTask', 'renren', '0', null, '1', '2020-03-04 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('1278', '1', 'testTask', 'renren', '0', null, '2', '2020-03-04 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('1279', '1', 'testTask', 'renren', '0', null, '1', '2020-03-04 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('1280', '1', 'testTask', 'renren', '0', null, '9', '2020-03-05 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('1281', '1', 'testTask', 'renren', '0', null, '2', '2020-03-05 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('1282', '1', 'testTask', 'renren', '0', null, '2', '2020-03-05 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('1283', '1', 'testTask', 'renren', '0', null, '1', '2020-03-05 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('1284', '1', 'testTask', 'renren', '0', null, '1', '2020-03-05 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('1285', '1', 'testTask', 'renren', '0', null, '3', '2020-03-05 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('1286', '1', 'testTask', 'renren', '0', null, '1', '2020-03-05 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('1287', '1', 'testTask', 'renren', '0', null, '1', '2020-03-05 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('1288', '1', 'testTask', 'renren', '0', null, '0', '2020-03-05 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('1289', '1', 'testTask', 'renren', '0', null, '0', '2020-03-05 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('1290', '1', 'testTask', 'renren', '0', null, '0', '2020-03-05 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('1291', '1', 'testTask', 'renren', '0', null, '1', '2020-03-05 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('1292', '1', 'testTask', 'renren', '0', null, '1', '2020-03-05 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('1293', '1', 'testTask', 'renren', '0', null, '1', '2020-03-05 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('1294', '1', 'testTask', 'renren', '0', null, '1', '2020-03-05 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('1295', '1', 'testTask', 'renren', '0', null, '4', '2020-03-05 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('1296', '1', 'testTask', 'renren', '0', null, '1', '2020-03-05 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('1297', '1', 'testTask', 'renren', '0', null, '4', '2020-03-05 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('1298', '1', 'testTask', 'renren', '0', null, '3', '2020-03-05 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('1299', '1', 'testTask', 'renren', '0', null, '1', '2020-03-05 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('1300', '1', 'testTask', 'renren', '0', null, '2', '2020-03-05 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('1301', '1', 'testTask', 'renren', '0', null, '1', '2020-03-05 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('1302', '1', 'testTask', 'renren', '0', null, '1', '2020-03-07 21:30:00');

-- ----------------------------
-- Table structure for sms_coupon
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon`;
CREATE TABLE `sms_coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `coupon_type` tinyint(1) DEFAULT NULL COMMENT '优惠卷类型[0->全场赠券；1->会员赠券；2->购物赠券；3->注册赠券]',
  `coupon_img` varchar(2000) DEFAULT NULL COMMENT '优惠券图片',
  `coupon_name` varchar(100) DEFAULT NULL COMMENT '优惠卷名字',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `amount` decimal(18,4) DEFAULT NULL COMMENT '金额',
  `per_limit` int(11) DEFAULT NULL COMMENT '每人限领张数',
  `min_point` decimal(18,4) DEFAULT NULL COMMENT '使用门槛',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `use_type` tinyint(1) DEFAULT NULL COMMENT '使用类型[0->全场通用；1->指定分类；2->指定商品]',
  `note` varchar(200) DEFAULT NULL COMMENT '备注',
  `publish_count` int(11) DEFAULT NULL COMMENT '发行数量',
  `use_count` int(11) DEFAULT NULL COMMENT '已使用数量',
  `receive_count` int(11) DEFAULT NULL COMMENT '领取数量',
  `enable_start_time` datetime DEFAULT NULL COMMENT '可以领取的开始日期',
  `enable_end_time` datetime DEFAULT NULL COMMENT '可以领取的结束日期',
  `code` varchar(64) DEFAULT NULL COMMENT '优惠码',
  `member_level` tinyint(1) DEFAULT NULL COMMENT '可以领取的会员等级[0->不限等级，其他-对应等级]',
  `publish` tinyint(1) DEFAULT NULL COMMENT '发布状态[0-未发布，1-已发布]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='优惠券信息';

-- ----------------------------
-- Records of sms_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for sms_coupon_history
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_history`;
CREATE TABLE `sms_coupon_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `coupon_id` bigint(20) DEFAULT NULL COMMENT '优惠券id',
  `member_id` bigint(20) DEFAULT NULL COMMENT '会员id',
  `member_nick_name` varchar(64) DEFAULT NULL COMMENT '会员名字',
  `get_type` tinyint(1) DEFAULT NULL COMMENT '获取方式[0->后台赠送；1->主动领取]',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `use_type` tinyint(1) DEFAULT NULL COMMENT '使用状态[0->未使用；1->已使用；2->已过期]',
  `use_time` datetime DEFAULT NULL COMMENT '使用时间',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `order_sn` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='优惠券领取历史记录';

-- ----------------------------
-- Records of sms_coupon_history
-- ----------------------------

-- ----------------------------
-- Table structure for sms_coupon_spu_category_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_spu_category_relation`;
CREATE TABLE `sms_coupon_spu_category_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `coupon_id` bigint(20) DEFAULT NULL COMMENT '优惠券id',
  `category_id` bigint(20) DEFAULT NULL COMMENT '产品分类id',
  `category_name` varchar(64) DEFAULT NULL COMMENT '产品分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='优惠券分类关联';

-- ----------------------------
-- Records of sms_coupon_spu_category_relation
-- ----------------------------

-- ----------------------------
-- Table structure for sms_coupon_spu_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_spu_relation`;
CREATE TABLE `sms_coupon_spu_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `coupon_id` bigint(20) DEFAULT NULL COMMENT '优惠券id',
  `spu_id` bigint(20) DEFAULT NULL COMMENT 'spu_id',
  `spu_name` varchar(255) DEFAULT NULL COMMENT 'spu_name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='优惠券与产品关联';

-- ----------------------------
-- Records of sms_coupon_spu_relation
-- ----------------------------

-- ----------------------------
-- Table structure for sms_home_adv
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_adv`;
CREATE TABLE `sms_home_adv` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(100) DEFAULT NULL COMMENT '名字',
  `pic` varchar(500) DEFAULT NULL COMMENT '图片地址',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `click_count` int(11) DEFAULT NULL COMMENT '点击数',
  `url` varchar(500) DEFAULT NULL COMMENT '广告详情连接地址',
  `note` varchar(500) DEFAULT NULL COMMENT '备注',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `publisher_id` bigint(20) DEFAULT NULL COMMENT '发布者',
  `auth_id` bigint(20) DEFAULT NULL COMMENT '审核者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='首页轮播广告';

-- ----------------------------
-- Records of sms_home_adv
-- ----------------------------

-- ----------------------------
-- Table structure for sms_home_subject
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_subject`;
CREATE TABLE `sms_home_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(200) DEFAULT NULL COMMENT '专题名字',
  `title` varchar(255) DEFAULT NULL COMMENT '专题标题',
  `sub_title` varchar(255) DEFAULT NULL COMMENT '专题副标题',
  `status` tinyint(1) DEFAULT NULL COMMENT '显示状态',
  `url` varchar(500) DEFAULT NULL COMMENT '详情连接',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `img` varchar(500) DEFAULT NULL COMMENT '专题图片地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='首页专题表【jd首页下面很多专题，每个专题链接新的页面，展示专题商品信息】';

-- ----------------------------
-- Records of sms_home_subject
-- ----------------------------

-- ----------------------------
-- Table structure for sms_home_subject_spu
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_subject_spu`;
CREATE TABLE `sms_home_subject_spu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(200) DEFAULT NULL COMMENT '专题名字',
  `subject_id` bigint(20) DEFAULT NULL COMMENT '专题id',
  `spu_id` bigint(20) DEFAULT NULL COMMENT 'spu_id',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='专题商品';

-- ----------------------------
-- Records of sms_home_subject_spu
-- ----------------------------

-- ----------------------------
-- Table structure for sms_member_price
-- ----------------------------
DROP TABLE IF EXISTS `sms_member_price`;
CREATE TABLE `sms_member_price` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku_id',
  `member_level_id` bigint(20) DEFAULT NULL COMMENT '会员等级id',
  `member_level_name` varchar(100) DEFAULT NULL COMMENT '会员等级名',
  `member_price` decimal(18,4) DEFAULT NULL COMMENT '会员对应价格',
  `add_other` tinyint(1) DEFAULT NULL COMMENT '可否叠加其他优惠[0-不可叠加优惠，1-可叠加]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COMMENT='商品会员价格';

-- ----------------------------
-- Records of sms_member_price
-- ----------------------------

-- ----------------------------
-- Table structure for sms_seckill_promotion
-- ----------------------------
DROP TABLE IF EXISTS `sms_seckill_promotion`;
CREATE TABLE `sms_seckill_promotion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(255) DEFAULT NULL COMMENT '活动标题',
  `start_time` datetime DEFAULT NULL COMMENT '开始日期',
  `end_time` datetime DEFAULT NULL COMMENT '结束日期',
  `status` tinyint(4) DEFAULT NULL COMMENT '上下线状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='秒杀活动';

-- ----------------------------
-- Records of sms_seckill_promotion
-- ----------------------------

-- ----------------------------
-- Table structure for sms_seckill_session
-- ----------------------------
DROP TABLE IF EXISTS `sms_seckill_session`;
CREATE TABLE `sms_seckill_session` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(200) DEFAULT NULL COMMENT '场次名称',
  `start_time` datetime DEFAULT NULL COMMENT '每日开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '每日结束时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '启用状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='秒杀活动场次';

-- ----------------------------
-- Records of sms_seckill_session
-- ----------------------------

-- ----------------------------
-- Table structure for sms_seckill_sku_notice
-- ----------------------------
DROP TABLE IF EXISTS `sms_seckill_sku_notice`;
CREATE TABLE `sms_seckill_sku_notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_id` bigint(20) DEFAULT NULL COMMENT 'member_id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku_id',
  `session_id` bigint(20) DEFAULT NULL COMMENT '活动场次id',
  `subcribe_time` datetime DEFAULT NULL COMMENT '订阅时间',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `notice_type` tinyint(1) DEFAULT NULL COMMENT '通知方式[0-短信，1-邮件]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='秒杀商品通知订阅';

-- ----------------------------
-- Records of sms_seckill_sku_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sms_seckill_sku_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_seckill_sku_relation`;
CREATE TABLE `sms_seckill_sku_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `promotion_id` bigint(20) DEFAULT NULL COMMENT '活动id',
  `promotion_session_id` bigint(20) DEFAULT NULL COMMENT '活动场次id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `seckill_price` decimal(10,4) DEFAULT NULL COMMENT '秒杀价格',
  `seckill_count` int(11) DEFAULT NULL COMMENT '秒杀总量',
  `seckill_limit` int(11) DEFAULT NULL COMMENT '每人限购数量',
  `seckill_sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='秒杀活动商品关联';

-- ----------------------------
-- Records of sms_seckill_sku_relation
-- ----------------------------

-- ----------------------------
-- Table structure for sms_sku_full_reduction
-- ----------------------------
DROP TABLE IF EXISTS `sms_sku_full_reduction`;
CREATE TABLE `sms_sku_full_reduction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'spu_id',
  `full_price` decimal(18,4) DEFAULT NULL COMMENT '满多少',
  `reduce_price` decimal(18,4) DEFAULT NULL COMMENT '减多少',
  `add_other` tinyint(1) DEFAULT NULL COMMENT '是否参与其他优惠',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='商品满减信息';

-- ----------------------------
-- Records of sms_sku_full_reduction
-- ----------------------------

-- ----------------------------
-- Table structure for sms_sku_ladder
-- ----------------------------
DROP TABLE IF EXISTS `sms_sku_ladder`;
CREATE TABLE `sms_sku_ladder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'spu_id',
  `full_count` int(11) DEFAULT NULL COMMENT '满几件',
  `discount` decimal(4,2) DEFAULT NULL COMMENT '打几折',
  `price` decimal(18,4) DEFAULT NULL COMMENT '折后价',
  `add_other` tinyint(1) DEFAULT NULL COMMENT '是否叠加其他优惠[0-不可叠加，1-可叠加]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='商品阶梯价格';

-- ----------------------------
-- Records of sms_sku_ladder
-- ----------------------------

-- ----------------------------
-- Table structure for sms_spu_bounds
-- ----------------------------
DROP TABLE IF EXISTS `sms_spu_bounds`;
CREATE TABLE `sms_spu_bounds` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `spu_id` bigint(20) DEFAULT NULL,
  `grow_bounds` decimal(18,4) DEFAULT NULL COMMENT '成长积分',
  `buy_bounds` decimal(18,4) DEFAULT NULL COMMENT '购物积分',
  `work` tinyint(1) DEFAULT NULL COMMENT '优惠生效情况[1111（四个状态位，从右到左）;0 - 无优惠，成长积分是否赠送;1 - 无优惠，购物积分是否赠送;2 - 有优惠，成长积分是否赠送;3 - 有优惠，购物积分是否赠送【状态位0：不赠送，1：赠送】]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='商品spu积分设置';

-- ----------------------------
-- Records of sms_spu_bounds
-- ----------------------------

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统验证码';

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
INSERT INTO `sys_captcha` VALUES ('05c69d0b-1ba0-41f0-8944-475ab4274986', 'fmb86', '2020-03-07 20:47:16');
INSERT INTO `sys_captcha` VALUES ('071ccd85-732c-4812-8e9d-7c29faf8a01f', 'f8ge3', '2019-09-30 11:38:08');
INSERT INTO `sys_captcha` VALUES ('08fa63a8-9d73-4d4e-8717-b5b89795ede5', 'b2cwy', '2020-03-07 20:51:57');
INSERT INTO `sys_captcha` VALUES ('123eeb2b-9032-4154-87fc-ffcaadf552b6', '7e33g', '2019-12-19 09:57:22');
INSERT INTO `sys_captcha` VALUES ('144b1d72-d40b-480e-8533-eca4c69888c8', 'dfene', '2020-03-07 20:52:14');
INSERT INTO `sys_captcha` VALUES ('180c1579-0cdc-4caf-8c1a-0a741680cc0b', '355nd', '2019-10-29 11:30:28');
INSERT INTO `sys_captcha` VALUES ('20bfa304-b049-4850-8873-91bec5406416', '787nn', '2019-10-29 10:23:53');
INSERT INTO `sys_captcha` VALUES ('22439312-a5d8-4af4-84bf-03c54022c453', 'dpnpb', '2019-10-29 11:30:26');
INSERT INTO `sys_captcha` VALUES ('27a9ab10-263c-4018-8e8a-b29910250f67', '4y32y', '2019-09-30 11:38:00');
INSERT INTO `sys_captcha` VALUES ('2800b4e3-2911-4a56-8841-91e1c786162e', 'nan5c', '2020-02-22 11:45:23');
INSERT INTO `sys_captcha` VALUES ('2c4ad84d-73b0-4ad3-83d2-238f40657a49', 'dmyp6', '2019-09-30 11:38:13');
INSERT INTO `sys_captcha` VALUES ('38bf7980-41dc-478c-8bec-51476ee55d8b', 'fnda8', '2019-10-28 23:33:57');
INSERT INTO `sys_captcha` VALUES ('40520a5f-5516-4b35-83e7-897901d0819c', 'cw2mf', '2019-10-29 10:22:31');
INSERT INTO `sys_captcha` VALUES ('45c192b3-bb8d-4fe0-8903-1b5e0e2876ed', 'w53ym', '2019-10-29 10:18:19');
INSERT INTO `sys_captcha` VALUES ('4fffb991-9d5c-4af3-8033-bbdb70c69976', 'app6d', '2020-03-04 09:19:01');
INSERT INTO `sys_captcha` VALUES ('57c3a23b-3931-4cec-89fe-695c03d661e0', '865y4', '2020-02-21 15:39:45');
INSERT INTO `sys_captcha` VALUES ('5a0ea466-40b1-426f-8c95-406c372efafd', 'm2gpx', '2019-10-29 12:10:55');
INSERT INTO `sys_captcha` VALUES ('6097823b-7a6d-4b9a-8aff-2f32f1202ea0', '4adp3', '2019-10-29 10:23:57');
INSERT INTO `sys_captcha` VALUES ('63314ba2-a03b-4118-82e7-da54f00213d9', 'b567x', '2019-10-29 10:46:24');
INSERT INTO `sys_captcha` VALUES ('678118fa-1a9a-4bc4-8cab-d568070542e9', '3ey5a', '2019-10-28 23:16:36');
INSERT INTO `sys_captcha` VALUES ('6f664f22-22cb-4ede-8799-4b8cebfaa258', 'bp5mg', '2019-10-28 23:18:39');
INSERT INTO `sys_captcha` VALUES ('6f82a9f4-221b-4486-848e-3a83f00252c7', 'pamw5', '2020-02-22 11:45:20');
INSERT INTO `sys_captcha` VALUES ('7123ebc0-3ec3-4c73-8461-f8a240ab9858', '72f5y', '2019-10-29 10:56:10');
INSERT INTO `sys_captcha` VALUES ('72846ba8-afff-4f74-891e-de56255c5d37', 'a42an', '2019-10-29 10:22:35');
INSERT INTO `sys_captcha` VALUES ('733e465e-ff41-4d8d-85a0-7265b34b711e', '8pbeg', '2020-03-07 20:51:43');
INSERT INTO `sys_captcha` VALUES ('7a611a55-b45f-43c4-8632-60d78055ddd8', 'n8fcg', '2019-10-28 23:26:12');
INSERT INTO `sys_captcha` VALUES ('8a8482fa-0bab-4d8d-83f2-00050f58ddf3', '6c22w', '2019-10-29 10:21:59');
INSERT INTO `sys_captcha` VALUES ('8abf953f-bb4e-4a25-8515-468e58ee6554', 'pnp3n', '2020-02-22 12:01:29');
INSERT INTO `sys_captcha` VALUES ('8fcff20f-d518-43e1-84a8-6f859cd76d3c', 'wxx2n', '2020-03-07 21:27:14');
INSERT INTO `sys_captcha` VALUES ('96c9d01e-7cf9-4ecb-8817-a5c6030c5c8f', 'nxb4m', '2019-10-28 23:22:26');
INSERT INTO `sys_captcha` VALUES ('a40f0707-8853-4944-8895-15276df7f4a1', 'mmdan', '2020-03-07 20:51:28');
INSERT INTO `sys_captcha` VALUES ('a6dd10cb-3db3-4ac0-8d72-7c1244681631', 'cx6a2', '2019-10-28 23:12:59');
INSERT INTO `sys_captcha` VALUES ('a801ecf8-1602-47e0-8a07-436b0136cc89', 'yygyx', '2020-03-07 20:45:43');
INSERT INTO `sys_captcha` VALUES ('a94444c3-6cb0-4662-8ca6-47e7bb3c99c6', 'w72aa', '2019-10-28 23:11:06');
INSERT INTO `sys_captcha` VALUES ('aad10794-43b6-4546-849d-d401848dd972', 'pnmmg', '2019-09-30 11:38:14');
INSERT INTO `sys_captcha` VALUES ('af32a584-dfea-433d-8275-633d19a85b7e', 'ebf65', '2020-03-07 20:53:10');
INSERT INTO `sys_captcha` VALUES ('bc7e0494-4f9e-4262-8b1d-e87580ae8834', 'e5cnp', '2020-02-21 15:39:23');
INSERT INTO `sys_captcha` VALUES ('c624ad95-1349-495b-85aa-41a7b11fc9ba', 'fg62b', '2019-10-28 21:37:30');
INSERT INTO `sys_captcha` VALUES ('c868dc0a-d6b9-45aa-8081-771ab87807ea', 'm3na3', '2020-03-07 20:43:03');
INSERT INTO `sys_captcha` VALUES ('cd46d32b-172c-48d9-8db2-861246571e2f', '6wxcf', '2019-10-29 10:21:55');
INSERT INTO `sys_captcha` VALUES ('d155122f-d753-4bca-8977-f38ce6cecdb2', 'edgp7', '2019-10-29 10:22:24');
INSERT INTO `sys_captcha` VALUES ('d7a93a64-a420-40be-8b8e-c449b53d8862', 'ddnew', '2019-10-29 10:52:53');
INSERT INTO `sys_captcha` VALUES ('df31e84c-420d-44a2-8093-ce53c801235c', 'cpd5n', '2019-10-29 10:19:32');
INSERT INTO `sys_captcha` VALUES ('e410a7c2-3409-4fde-8217-d824035d0f1b', 'cn2bg', '2019-10-29 12:10:55');
INSERT INTO `sys_captcha` VALUES ('eb756ff9-5300-4969-885b-4248e58e43c9', 'eecxf', '2020-03-07 20:51:32');
INSERT INTO `sys_captcha` VALUES ('edcb5be1-97da-4b7d-8fd5-9861f4e2653d', 'nfad5', '2019-10-28 23:15:07');
INSERT INTO `sys_captcha` VALUES ('f6992138-55ce-4d90-8876-a9fd99287f88', 'd8xpp', '2019-11-04 21:52:50');
INSERT INTO `sys_captcha` VALUES ('fcdc0016-ac09-4a4b-8c4c-376c1ca8c801', 'mw85n', '2019-10-29 11:30:26');
INSERT INTO `sys_captcha` VALUES ('fee96fac-a4b8-46ab-89bb-93d3673163e8', '2b4nd', '2020-02-21 21:46:43');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', '0', '云存储配置信息');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"商品系统\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"editor\",\"orderNum\":0}]', '9', '0:0:0:0:0:0:0:1', '2019-10-28 21:34:21');
INSERT INTO `sys_log` VALUES ('2', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"分类维护\",\"url\":\"product/category\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":0}]', '8', '0:0:0:0:0:0:0:1', '2019-10-28 21:35:21');
INSERT INTO `sys_log` VALUES ('3', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":33,\"parentId\":31,\"name\":\"品牌管理\",\"url\":\"product/brand\",\"perms\":\"\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0}]', '17', '0:0:0:0:0:0:0:1', '2019-11-06 10:19:56');
INSERT INTO `sys_log` VALUES ('4', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[33]', '322', '0:0:0:0:0:0:0:1', '2019-11-06 10:40:06');
INSERT INTO `sys_log` VALUES ('5', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":34,\"parentId\":31,\"name\":\"品牌管理\",\"url\":\"product/brand\",\"perms\":\"\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0}]', '8', '0:0:0:0:0:0:0:1', '2019-11-06 10:52:28');
INSERT INTO `sys_log` VALUES ('6', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":35,\"parentId\":31,\"name\":\"属性维护\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"system\",\"orderNum\":0}]', '11', '0:0:0:0:0:0:0:1', '2019-11-13 11:59:27');
INSERT INTO `sys_log` VALUES ('7', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":36,\"parentId\":35,\"name\":\"基本属性\",\"url\":\"product/baseatr\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '8', '0:0:0:0:0:0:0:1', '2019-11-13 11:59:56');
INSERT INTO `sys_log` VALUES ('8', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[35]', '4', '0:0:0:0:0:0:0:1', '2019-11-13 12:08:23');
INSERT INTO `sys_log` VALUES ('9', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[36]', '311', '0:0:0:0:0:0:0:1', '2019-11-13 12:08:28');
INSERT INTO `sys_log` VALUES ('10', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[35]', '11', '0:0:0:0:0:0:0:1', '2019-11-13 12:08:34');
INSERT INTO `sys_log` VALUES ('11', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":37,\"parentId\":31,\"name\":\"平台属性\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"system\",\"orderNum\":0}]', '11', '0:0:0:0:0:0:0:1', '2019-11-13 20:05:22');
INSERT INTO `sys_log` VALUES ('12', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":38,\"parentId\":37,\"name\":\"属性分组\",\"url\":\"product/attrgroup\",\"perms\":\"\",\"type\":1,\"icon\":\"tubiao\",\"orderNum\":0}]', '7', '0:0:0:0:0:0:0:1', '2019-11-13 20:06:12');
INSERT INTO `sys_log` VALUES ('13', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":39,\"parentId\":37,\"name\":\"规格参数\",\"url\":\"product/baseattr\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', '6', '0:0:0:0:0:0:0:1', '2019-11-13 20:07:29');
INSERT INTO `sys_log` VALUES ('14', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":40,\"parentId\":37,\"name\":\"销售属性\",\"url\":\"product/saleattr\",\"perms\":\"\",\"type\":1,\"icon\":\"zonghe\",\"orderNum\":0}]', '8', '0:0:0:0:0:0:0:1', '2019-11-13 20:08:00');
INSERT INTO `sys_log` VALUES ('15', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":41,\"parentId\":31,\"name\":\"商品维护\",\"url\":\"product/spu\",\"perms\":\"\",\"type\":1,\"icon\":\"zonghe\",\"orderNum\":0}]', '7', '0:0:0:0:0:0:0:1', '2019-11-13 20:13:12');
INSERT INTO `sys_log` VALUES ('16', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":42,\"parentId\":0,\"name\":\"优惠营销\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"mudedi\",\"orderNum\":0}]', '5', '0:0:0:0:0:0:0:1', '2019-11-13 20:14:52');
INSERT INTO `sys_log` VALUES ('17', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":43,\"parentId\":0,\"name\":\"库存系统\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"shouye\",\"orderNum\":0}]', '7', '0:0:0:0:0:0:0:1', '2019-11-13 20:15:20');
INSERT INTO `sys_log` VALUES ('18', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":44,\"parentId\":0,\"name\":\"订单系统\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"config\",\"orderNum\":0}]', '5', '0:0:0:0:0:0:0:1', '2019-11-13 20:15:48');
INSERT INTO `sys_log` VALUES ('19', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":45,\"parentId\":0,\"name\":\"用户系统\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"admin\",\"orderNum\":0}]', '5', '0:0:0:0:0:0:0:1', '2019-11-13 20:16:12');
INSERT INTO `sys_log` VALUES ('20', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":46,\"parentId\":0,\"name\":\"内容管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"sousuo\",\"orderNum\":0}]', '3', '0:0:0:0:0:0:0:1', '2019-11-13 20:16:56');
INSERT INTO `sys_log` VALUES ('21', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":47,\"parentId\":42,\"name\":\"优惠券管理\",\"url\":\"coupon/coupon\",\"perms\":\"\",\"type\":1,\"icon\":\"zhedie\",\"orderNum\":0}]', '7', '0:0:0:0:0:0:0:1', '2019-11-13 20:19:59');
INSERT INTO `sys_log` VALUES ('22', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":48,\"parentId\":42,\"name\":\"发放记录\",\"url\":\"coupon/history\",\"perms\":\"\",\"type\":1,\"icon\":\"sql\",\"orderNum\":0}]', '15', '0:0:0:0:0:0:0:1', '2019-11-13 20:20:52');
INSERT INTO `sys_log` VALUES ('23', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":49,\"parentId\":42,\"name\":\"专题活动\",\"url\":\"coupon/subject\",\"perms\":\"\",\"type\":1,\"icon\":\"tixing\",\"orderNum\":0}]', '7', '0:0:0:0:0:0:0:1', '2019-11-13 20:21:58');
INSERT INTO `sys_log` VALUES ('24', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":50,\"parentId\":42,\"name\":\"秒杀活动\",\"url\":\"coupon/seckill\",\"perms\":\"\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]', '7', '0:0:0:0:0:0:0:1', '2019-11-13 20:22:32');
INSERT INTO `sys_log` VALUES ('25', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":51,\"parentId\":42,\"name\":\"积分维护\",\"url\":\"coupon/bounds\",\"perms\":\"\",\"type\":1,\"icon\":\"geren\",\"orderNum\":0}]', '5', '0:0:0:0:0:0:0:1', '2019-11-13 20:25:13');
INSERT INTO `sys_log` VALUES ('26', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":52,\"parentId\":42,\"name\":\"满减折扣\",\"url\":\"coupon/full\",\"perms\":\"\",\"type\":1,\"icon\":\"shoucang\",\"orderNum\":0}]', '9', '0:0:0:0:0:0:0:1', '2019-11-13 20:26:21');
INSERT INTO `sys_log` VALUES ('27', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":53,\"parentId\":43,\"name\":\"仓库维护\",\"url\":\"ware/wareinfo\",\"perms\":\"\",\"type\":1,\"icon\":\"shouye\",\"orderNum\":0}]', '5', '0:0:0:0:0:0:0:1', '2019-11-13 20:27:51');
INSERT INTO `sys_log` VALUES ('28', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":54,\"parentId\":43,\"name\":\"库存工作单\",\"url\":\"ware/task\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', '14', '0:0:0:0:0:0:0:1', '2019-11-13 20:28:55');
INSERT INTO `sys_log` VALUES ('29', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":55,\"parentId\":43,\"name\":\"商品库存\",\"url\":\"ware/sku\",\"perms\":\"\",\"type\":1,\"icon\":\"jiesuo\",\"orderNum\":0}]', '5', '0:0:0:0:0:0:0:1', '2019-11-13 20:29:31');
INSERT INTO `sys_log` VALUES ('30', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":56,\"parentId\":44,\"name\":\"订单查询\",\"url\":\"order/order\",\"perms\":\"\",\"type\":1,\"icon\":\"zhedie\",\"orderNum\":0}]', '6', '0:0:0:0:0:0:0:1', '2019-11-13 20:31:55');
INSERT INTO `sys_log` VALUES ('31', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":57,\"parentId\":44,\"name\":\"退货单处理\",\"url\":\"order/return\",\"perms\":\"\",\"type\":1,\"icon\":\"shanchu\",\"orderNum\":0}]', '5', '0:0:0:0:0:0:0:1', '2019-11-13 20:33:04');
INSERT INTO `sys_log` VALUES ('32', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":58,\"parentId\":44,\"name\":\"等级规则\",\"url\":\"order/settings\",\"perms\":\"\",\"type\":1,\"icon\":\"system\",\"orderNum\":0}]', '5', '0:0:0:0:0:0:0:1', '2019-11-13 20:34:34');
INSERT INTO `sys_log` VALUES ('33', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":59,\"parentId\":44,\"name\":\"支付流水查询\",\"url\":\"order/payment\",\"perms\":\"\",\"type\":1,\"icon\":\"job\",\"orderNum\":0}]', '5', '0:0:0:0:0:0:0:1', '2019-11-13 20:37:41');
INSERT INTO `sys_log` VALUES ('34', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":60,\"parentId\":44,\"name\":\"退款流水查询\",\"url\":\"order/refund\",\"perms\":\"\",\"type\":1,\"icon\":\"mudedi\",\"orderNum\":0}]', '6', '0:0:0:0:0:0:0:1', '2019-11-13 20:38:16');
INSERT INTO `sys_log` VALUES ('35', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":61,\"parentId\":45,\"name\":\"会员列表\",\"url\":\"member/member\",\"perms\":\"\",\"type\":1,\"icon\":\"geren\",\"orderNum\":0}]', '7', '0:0:0:0:0:0:0:1', '2019-11-13 20:40:14');
INSERT INTO `sys_log` VALUES ('36', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":62,\"parentId\":45,\"name\":\"会员等级\",\"url\":\"member/level\",\"perms\":\"\",\"type\":1,\"icon\":\"tubiao\",\"orderNum\":0}]', '14', '0:0:0:0:0:0:0:1', '2019-11-13 20:40:34');
INSERT INTO `sys_log` VALUES ('37', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":63,\"parentId\":45,\"name\":\"积分变化\",\"url\":\"member/growth\",\"perms\":\"\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":0}]', '6', '0:0:0:0:0:0:0:1', '2019-11-13 20:43:14');
INSERT INTO `sys_log` VALUES ('38', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":64,\"parentId\":45,\"name\":\"统计信息\",\"url\":\"member/statistics\",\"perms\":\"\",\"type\":1,\"icon\":\"sql\",\"orderNum\":0}]', '4', '0:0:0:0:0:0:0:1', '2019-11-13 20:43:52');
INSERT INTO `sys_log` VALUES ('39', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":65,\"parentId\":46,\"name\":\"首页推荐\",\"url\":\"content/index\",\"perms\":\"\",\"type\":1,\"icon\":\"shouye\",\"orderNum\":0}]', '6', '0:0:0:0:0:0:0:1', '2019-11-13 20:44:47');
INSERT INTO `sys_log` VALUES ('40', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":66,\"parentId\":46,\"name\":\"分类热门\",\"url\":\"content/category\",\"perms\":\"\",\"type\":1,\"icon\":\"zhedie\",\"orderNum\":0}]', '7', '0:0:0:0:0:0:0:1', '2019-11-13 20:45:24');
INSERT INTO `sys_log` VALUES ('41', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":67,\"parentId\":46,\"name\":\"评论管理\",\"url\":\"content/comments\",\"perms\":\"\",\"type\":1,\"icon\":\"pinglun\",\"orderNum\":0}]', '20', '0:0:0:0:0:0:0:1', '2019-11-13 20:48:21');
INSERT INTO `sys_log` VALUES ('42', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":41,\"parentId\":31,\"name\":\"商品维护\",\"url\":\"product/spu\",\"perms\":\"\",\"type\":0,\"icon\":\"zonghe\",\"orderNum\":0}]', '11', '0:0:0:0:0:0:0:1', '2019-11-17 12:18:52');
INSERT INTO `sys_log` VALUES ('43', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":68,\"parentId\":41,\"name\":\"spu管理\",\"url\":\"product/spu\",\"perms\":\"\",\"type\":1,\"icon\":\"config\",\"orderNum\":0}]', '9', '0:0:0:0:0:0:0:1', '2019-11-17 12:19:52');
INSERT INTO `sys_log` VALUES ('44', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":69,\"parentId\":41,\"name\":\"发布商品\",\"url\":\"product/spuadd\",\"perms\":\"\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":0}]', '14', '0:0:0:0:0:0:0:1', '2019-11-17 12:49:04');
INSERT INTO `sys_log` VALUES ('45', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":70,\"parentId\":43,\"name\":\"采购单维护\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"tubiao\",\"orderNum\":0}]', '12', '0:0:0:0:0:0:0:1', '2019-11-17 13:29:35');
INSERT INTO `sys_log` VALUES ('46', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":71,\"parentId\":70,\"name\":\"发布采购项\",\"url\":\"ware/purchaseitem\",\"perms\":\"\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0}]', '7', '0:0:0:0:0:0:0:1', '2019-11-17 13:30:23');
INSERT INTO `sys_log` VALUES ('47', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":71,\"parentId\":70,\"name\":\"采购需求\",\"url\":\"ware/purchaseitem\",\"perms\":\"\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0}]', '6', '0:0:0:0:0:0:0:1', '2019-11-17 13:30:57');
INSERT INTO `sys_log` VALUES ('48', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":72,\"parentId\":70,\"name\":\"采购单\",\"url\":\"ware/purchase\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":0}]', '5', '0:0:0:0:0:0:0:1', '2019-11-17 13:31:32');
INSERT INTO `sys_log` VALUES ('49', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":73,\"parentId\":41,\"name\":\"商品管理\",\"url\":\"product/manager\",\"perms\":\"\",\"type\":1,\"icon\":\"zonghe\",\"orderNum\":0}]', '8', '0:0:0:0:0:0:0:1', '2019-11-17 13:36:18');
INSERT INTO `sys_log` VALUES ('50', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":74,\"parentId\":42,\"name\":\"会员价格\",\"url\":\"coupon/memberprice\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '11', '0:0:0:0:0:0:0:1', '2019-11-24 16:23:33');
INSERT INTO `sys_log` VALUES ('51', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":74,\"parentId\":42,\"name\":\"会员价格\",\"url\":\"coupon/memberprice\",\"perms\":\"\",\"type\":1,\"icon\":\"admin\",\"orderNum\":0}]', '9', '0:0:0:0:0:0:0:1', '2019-11-24 16:23:48');
INSERT INTO `sys_log` VALUES ('52', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":2,\"username\":\"leifengyang\",\"password\":\"ed1b7fbd834332e5395d8823be934478141c3285ddccae1c55b192306571b886\",\"salt\":\"M78W7WGGh2RD0QGKm86j\",\"email\":\"aaaa@qq.com\",\"mobile\":\"12345678912\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Nov 29, 2019 9:46:09 AM\"}]', '179', '0:0:0:0:0:0:0:1', '2019-11-29 09:46:09');
INSERT INTO `sys_log` VALUES ('53', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":75,\"parentId\":42,\"name\":\"每日秒杀\",\"url\":\"aaaaaaaa\",\"perms\":\"\",\"type\":1,\"icon\":\"job\",\"orderNum\":0}]', '8', '0:0:0:0:0:0:0:1', '2020-02-18 18:42:37');
INSERT INTO `sys_log` VALUES ('54', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":75,\"parentId\":42,\"name\":\"每日秒杀\",\"url\":\"coupon/seckillsession\",\"perms\":\"\",\"type\":1,\"icon\":\"job\",\"orderNum\":0}]', '11', '0:0:0:0:0:0:0:1', '2020-02-18 18:43:10');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'system', '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员列表', 'sys/user', null, '1', 'admin', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'sys/role', null, '1', 'role', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'sys/menu', null, '1', 'menu', '3');
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'http://localhost:8080/renren-fast/druid/sql.html', null, '1', 'sql', '4');
INSERT INTO `sys_menu` VALUES ('6', '1', '定时任务', 'job/schedule', null, '1', 'job', '5');
INSERT INTO `sys_menu` VALUES ('7', '6', '查看', null, 'sys:schedule:list,sys:schedule:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '6', '新增', null, 'sys:schedule:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '6', '修改', null, 'sys:schedule:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '6', '删除', null, 'sys:schedule:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '6', '暂停', null, 'sys:schedule:pause', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '6', '恢复', null, 'sys:schedule:resume', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '6', '立即执行', null, 'sys:schedule:run', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '6', '日志列表', null, 'sys:schedule:log', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '参数管理', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'config', '6');
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', 'sys/log', 'sys:log:list', '1', 'log', '7');
INSERT INTO `sys_menu` VALUES ('30', '1', '文件上传', 'oss/oss', 'sys:oss:all', '1', 'oss', '6');
INSERT INTO `sys_menu` VALUES ('31', '0', '商品系统', '', '', '0', 'editor', '0');
INSERT INTO `sys_menu` VALUES ('32', '31', '分类维护', 'product/category', '', '1', 'menu', '0');
INSERT INTO `sys_menu` VALUES ('34', '31', '品牌管理', 'product/brand', '', '1', 'editor', '0');
INSERT INTO `sys_menu` VALUES ('37', '31', '平台属性', '', '', '0', 'system', '0');
INSERT INTO `sys_menu` VALUES ('38', '37', '属性分组', 'product/attrgroup', '', '1', 'tubiao', '0');
INSERT INTO `sys_menu` VALUES ('39', '37', '规格参数', 'product/baseattr', '', '1', 'log', '0');
INSERT INTO `sys_menu` VALUES ('40', '37', '销售属性', 'product/saleattr', '', '1', 'zonghe', '0');
INSERT INTO `sys_menu` VALUES ('41', '31', '商品维护', 'product/spu', '', '0', 'zonghe', '0');
INSERT INTO `sys_menu` VALUES ('42', '0', '优惠营销', '', '', '0', 'mudedi', '0');
INSERT INTO `sys_menu` VALUES ('43', '0', '库存系统', '', '', '0', 'shouye', '0');
INSERT INTO `sys_menu` VALUES ('44', '0', '订单系统', '', '', '0', 'config', '0');
INSERT INTO `sys_menu` VALUES ('45', '0', '用户系统', '', '', '0', 'admin', '0');
INSERT INTO `sys_menu` VALUES ('46', '0', '内容管理', '', '', '0', 'sousuo', '0');
INSERT INTO `sys_menu` VALUES ('47', '42', '优惠券管理', 'coupon/coupon', '', '1', 'zhedie', '0');
INSERT INTO `sys_menu` VALUES ('48', '42', '发放记录', 'coupon/history', '', '1', 'sql', '0');
INSERT INTO `sys_menu` VALUES ('49', '42', '专题活动', 'coupon/subject', '', '1', 'tixing', '0');
INSERT INTO `sys_menu` VALUES ('50', '42', '秒杀活动', 'coupon/seckill', '', '1', 'daohang', '0');
INSERT INTO `sys_menu` VALUES ('51', '42', '积分维护', 'coupon/bounds', '', '1', 'geren', '0');
INSERT INTO `sys_menu` VALUES ('52', '42', '满减折扣', 'coupon/full', '', '1', 'shoucang', '0');
INSERT INTO `sys_menu` VALUES ('53', '43', '仓库维护', 'ware/wareinfo', '', '1', 'shouye', '0');
INSERT INTO `sys_menu` VALUES ('54', '43', '库存工作单', 'ware/task', '', '1', 'log', '0');
INSERT INTO `sys_menu` VALUES ('55', '43', '商品库存', 'ware/sku', '', '1', 'jiesuo', '0');
INSERT INTO `sys_menu` VALUES ('56', '44', '订单查询', 'order/order', '', '1', 'zhedie', '0');
INSERT INTO `sys_menu` VALUES ('57', '44', '退货单处理', 'order/return', '', '1', 'shanchu', '0');
INSERT INTO `sys_menu` VALUES ('58', '44', '等级规则', 'order/settings', '', '1', 'system', '0');
INSERT INTO `sys_menu` VALUES ('59', '44', '支付流水查询', 'order/payment', '', '1', 'job', '0');
INSERT INTO `sys_menu` VALUES ('60', '44', '退款流水查询', 'order/refund', '', '1', 'mudedi', '0');
INSERT INTO `sys_menu` VALUES ('61', '45', '会员列表', 'member/member', '', '1', 'geren', '0');
INSERT INTO `sys_menu` VALUES ('62', '45', '会员等级', 'member/level', '', '1', 'tubiao', '0');
INSERT INTO `sys_menu` VALUES ('63', '45', '积分变化', 'member/growth', '', '1', 'bianji', '0');
INSERT INTO `sys_menu` VALUES ('64', '45', '统计信息', 'member/statistics', '', '1', 'sql', '0');
INSERT INTO `sys_menu` VALUES ('65', '46', '首页推荐', 'content/index', '', '1', 'shouye', '0');
INSERT INTO `sys_menu` VALUES ('66', '46', '分类热门', 'content/category', '', '1', 'zhedie', '0');
INSERT INTO `sys_menu` VALUES ('67', '46', '评论管理', 'content/comments', '', '1', 'pinglun', '0');
INSERT INTO `sys_menu` VALUES ('68', '41', 'spu管理', 'product/spu', '', '1', 'config', '0');
INSERT INTO `sys_menu` VALUES ('69', '41', '发布商品', 'product/spuadd', '', '1', 'bianji', '0');
INSERT INTO `sys_menu` VALUES ('70', '43', '采购单维护', '', '', '0', 'tubiao', '0');
INSERT INTO `sys_menu` VALUES ('71', '70', '采购需求', 'ware/purchaseitem', '', '1', 'editor', '0');
INSERT INTO `sys_menu` VALUES ('72', '70', '采购单', 'ware/purchase', '', '1', 'menu', '0');
INSERT INTO `sys_menu` VALUES ('73', '41', '商品管理', 'product/manager', '', '1', 'zonghe', '0');
INSERT INTO `sys_menu` VALUES ('74', '42', '会员价格', 'coupon/memberprice', '', '1', 'admin', '0');
INSERT INTO `sys_menu` VALUES ('75', '42', '每日秒杀', 'coupon/seckillsession', '', '1', 'job', '0');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', '1', '1', '2016-11-11 11:11:11');
INSERT INTO `sys_user` VALUES ('2', 'leifengyang', 'ed1b7fbd834332e5395d8823be934478141c3285ddccae1c55b192306571b886', 'M78W7WGGh2RD0QGKm86j', 'aaaa@qq.com', '12345678912', '1', '1', '2019-11-29 09:46:09');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统用户Token';

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES ('1', '4576ed62b3a5f3c489a17b416690c3c1', '2020-03-08 09:22:45', '2020-03-07 21:22:45');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');

-- ----------------------------
-- Table structure for ums_growth_change_history
-- ----------------------------
DROP TABLE IF EXISTS `ums_growth_change_history`;
CREATE TABLE `ums_growth_change_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_id` bigint(20) DEFAULT NULL COMMENT 'member_id',
  `create_time` datetime DEFAULT NULL COMMENT 'create_time',
  `change_count` int(11) DEFAULT NULL COMMENT '改变的值（正负计数）',
  `note` varchar(0) DEFAULT NULL COMMENT '备注',
  `source_type` tinyint(4) DEFAULT NULL COMMENT '积分来源[0-购物，1-管理员修改]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='成长值变化历史记录';

-- ----------------------------
-- Records of ums_growth_change_history
-- ----------------------------

-- ----------------------------
-- Table structure for ums_integration_change_history
-- ----------------------------
DROP TABLE IF EXISTS `ums_integration_change_history`;
CREATE TABLE `ums_integration_change_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_id` bigint(20) DEFAULT NULL COMMENT 'member_id',
  `create_time` datetime DEFAULT NULL COMMENT 'create_time',
  `change_count` int(11) DEFAULT NULL COMMENT '变化的值',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  `source_tyoe` tinyint(4) DEFAULT NULL COMMENT '来源[0->购物；1->管理员修改;2->活动]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='积分变化历史记录';

-- ----------------------------
-- Records of ums_integration_change_history
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member
-- ----------------------------
DROP TABLE IF EXISTS `ums_member`;
CREATE TABLE `ums_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `level_id` bigint(20) DEFAULT NULL COMMENT '会员等级id',
  `username` char(64) DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `nickname` varchar(64) DEFAULT NULL COMMENT '昵称',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `header` varchar(500) DEFAULT NULL COMMENT '头像',
  `gender` tinyint(4) DEFAULT NULL COMMENT '性别',
  `birth` date DEFAULT NULL COMMENT '生日',
  `city` varchar(500) DEFAULT NULL COMMENT '所在城市',
  `job` varchar(255) DEFAULT NULL COMMENT '职业',
  `sign` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `source_type` tinyint(4) DEFAULT NULL COMMENT '用户来源',
  `integration` int(11) DEFAULT NULL COMMENT '积分',
  `growth` int(11) DEFAULT NULL COMMENT '成长值',
  `status` tinyint(4) DEFAULT NULL COMMENT '启用状态',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间',
  `social_uid` varchar(255) DEFAULT NULL COMMENT '社交用户的唯一id',
  `access_token` varchar(255) DEFAULT NULL COMMENT '访问令牌',
  `expires_in` varchar(255) DEFAULT NULL COMMENT '访问令牌的时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='会员';

-- ----------------------------
-- Records of ums_member
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_collect_spu
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_collect_spu`;
CREATE TABLE `ums_member_collect_spu` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `member_id` bigint(20) DEFAULT NULL COMMENT '会员id',
  `spu_id` bigint(20) DEFAULT NULL COMMENT 'spu_id',
  `spu_name` varchar(500) DEFAULT NULL COMMENT 'spu_name',
  `spu_img` varchar(500) DEFAULT NULL COMMENT 'spu_img',
  `create_time` datetime DEFAULT NULL COMMENT 'create_time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员收藏的商品';

-- ----------------------------
-- Records of ums_member_collect_spu
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_collect_subject
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_collect_subject`;
CREATE TABLE `ums_member_collect_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `subject_id` bigint(20) DEFAULT NULL COMMENT 'subject_id',
  `subject_name` varchar(255) DEFAULT NULL COMMENT 'subject_name',
  `subject_img` varchar(500) DEFAULT NULL COMMENT 'subject_img',
  `subject_urll` varchar(500) DEFAULT NULL COMMENT '活动url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员收藏的专题活动';

-- ----------------------------
-- Records of ums_member_collect_subject
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_level
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_level`;
CREATE TABLE `ums_member_level` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(100) DEFAULT NULL COMMENT '等级名称',
  `growth_point` int(11) DEFAULT NULL COMMENT '等级需要的成长值',
  `default_status` tinyint(4) DEFAULT NULL COMMENT '是否为默认等级[0->不是；1->是]',
  `free_freight_point` decimal(18,4) DEFAULT NULL COMMENT '免运费标准',
  `comment_growth_point` int(11) DEFAULT NULL COMMENT '每次评价获取的成长值',
  `priviledge_free_freight` tinyint(4) DEFAULT NULL COMMENT '是否有免邮特权',
  `priviledge_member_price` tinyint(4) DEFAULT NULL COMMENT '是否有会员价格特权',
  `priviledge_birthday` tinyint(4) DEFAULT NULL COMMENT '是否有生日特权',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='会员等级';

-- ----------------------------
-- Records of ums_member_level
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_login_log`;
CREATE TABLE `ums_member_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_id` bigint(20) DEFAULT NULL COMMENT 'member_id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `ip` varchar(64) DEFAULT NULL COMMENT 'ip',
  `city` varchar(64) DEFAULT NULL COMMENT 'city',
  `login_type` tinyint(1) DEFAULT NULL COMMENT '登录类型[1-web，2-app]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员登录记录';

-- ----------------------------
-- Records of ums_member_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_receive_address
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_receive_address`;
CREATE TABLE `ums_member_receive_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_id` bigint(20) DEFAULT NULL COMMENT 'member_id',
  `name` varchar(255) DEFAULT NULL COMMENT '收货人姓名',
  `phone` varchar(64) DEFAULT NULL COMMENT '电话',
  `post_code` varchar(64) DEFAULT NULL COMMENT '邮政编码',
  `province` varchar(100) DEFAULT NULL COMMENT '省份/直辖市',
  `city` varchar(100) DEFAULT NULL COMMENT '城市',
  `region` varchar(100) DEFAULT NULL COMMENT '区',
  `detail_address` varchar(255) DEFAULT NULL COMMENT '详细地址(街道)',
  `areacode` varchar(15) DEFAULT NULL COMMENT '省市区代码',
  `default_status` tinyint(1) DEFAULT NULL COMMENT '是否默认',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='会员收货地址';

-- ----------------------------
-- Records of ums_member_receive_address
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_statistics_info
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_statistics_info`;
CREATE TABLE `ums_member_statistics_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_id` bigint(20) DEFAULT NULL COMMENT '会员id',
  `consume_amount` decimal(18,4) DEFAULT NULL COMMENT '累计消费金额',
  `coupon_amount` decimal(18,4) DEFAULT NULL COMMENT '累计优惠金额',
  `order_count` int(11) DEFAULT NULL COMMENT '订单数量',
  `coupon_count` int(11) DEFAULT NULL COMMENT '优惠券数量',
  `comment_count` int(11) DEFAULT NULL COMMENT '评价数',
  `return_order_count` int(11) DEFAULT NULL COMMENT '退货数量',
  `login_count` int(11) DEFAULT NULL COMMENT '登录次数',
  `attend_count` int(11) DEFAULT NULL COMMENT '关注数量',
  `fans_count` int(11) DEFAULT NULL COMMENT '粉丝数量',
  `collect_product_count` int(11) DEFAULT NULL COMMENT '收藏的商品数量',
  `collect_subject_count` int(11) DEFAULT NULL COMMENT '收藏的专题活动数量',
  `collect_comment_count` int(11) DEFAULT NULL COMMENT '收藏的评论数量',
  `invite_friend_count` int(11) DEFAULT NULL COMMENT '邀请的朋友数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员统计信息';

-- ----------------------------
-- Records of ums_member_statistics_info
-- ----------------------------

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `branch_id` bigint(20) NOT NULL,
  `xid` varchar(100) NOT NULL,
  `context` varchar(128) NOT NULL,
  `rollback_info` longblob NOT NULL,
  `log_status` int(11) NOT NULL,
  `log_created` datetime NOT NULL,
  `log_modified` datetime NOT NULL,
  `ext` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_undo_log` (`xid`,`branch_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of undo_log
-- ----------------------------

-- ----------------------------
-- Table structure for wms_purchase
-- ----------------------------
DROP TABLE IF EXISTS `wms_purchase`;
CREATE TABLE `wms_purchase` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assignee_id` bigint(20) DEFAULT NULL,
  `assignee_name` varchar(255) DEFAULT NULL,
  `phone` char(13) DEFAULT NULL,
  `priority` int(4) DEFAULT NULL,
  `status` int(4) DEFAULT NULL,
  `ware_id` bigint(20) DEFAULT NULL,
  `amount` decimal(18,4) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='采购信息';

-- ----------------------------
-- Records of wms_purchase
-- ----------------------------

-- ----------------------------
-- Table structure for wms_purchase_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_purchase_detail`;
CREATE TABLE `wms_purchase_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `purchase_id` bigint(20) DEFAULT NULL COMMENT '采购单id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '采购商品id',
  `sku_num` int(11) DEFAULT NULL COMMENT '采购数量',
  `sku_price` decimal(18,4) DEFAULT NULL COMMENT '采购金额',
  `ware_id` bigint(20) DEFAULT NULL COMMENT '仓库id',
  `status` int(11) DEFAULT NULL COMMENT '状态[0新建，1已分配，2正在采购，3已完成，4采购失败]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of wms_purchase_detail
-- ----------------------------

-- ----------------------------
-- Table structure for wms_ware_info
-- ----------------------------
DROP TABLE IF EXISTS `wms_ware_info`;
CREATE TABLE `wms_ware_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) DEFAULT NULL COMMENT '仓库名',
  `address` varchar(255) DEFAULT NULL COMMENT '仓库地址',
  `areacode` varchar(20) DEFAULT NULL COMMENT '区域编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='仓库信息';

-- ----------------------------
-- Records of wms_ware_info
-- ----------------------------

-- ----------------------------
-- Table structure for wms_ware_order_task
-- ----------------------------
DROP TABLE IF EXISTS `wms_ware_order_task`;
CREATE TABLE `wms_ware_order_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` bigint(20) DEFAULT NULL COMMENT 'order_id',
  `order_sn` varchar(255) DEFAULT NULL COMMENT 'order_sn',
  `consignee` varchar(100) DEFAULT NULL COMMENT '收货人',
  `consignee_tel` char(15) DEFAULT NULL COMMENT '收货人电话',
  `delivery_address` varchar(500) DEFAULT NULL COMMENT '配送地址',
  `order_comment` varchar(200) DEFAULT NULL COMMENT '订单备注',
  `payment_way` tinyint(1) DEFAULT NULL COMMENT '付款方式【 1:在线付款 2:货到付款】',
  `task_status` tinyint(2) DEFAULT NULL COMMENT '任务状态',
  `order_body` varchar(255) DEFAULT NULL COMMENT '订单描述',
  `tracking_no` char(30) DEFAULT NULL COMMENT '物流单号',
  `create_time` datetime DEFAULT NULL COMMENT 'create_time',
  `ware_id` bigint(20) DEFAULT NULL COMMENT '仓库id',
  `task_comment` varchar(500) DEFAULT NULL COMMENT '工作单备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COMMENT='库存工作单';

-- ----------------------------
-- Records of wms_ware_order_task
-- ----------------------------

-- ----------------------------
-- Table structure for wms_ware_order_task_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_ware_order_task_detail`;
CREATE TABLE `wms_ware_order_task_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku_id',
  `sku_name` varchar(255) DEFAULT NULL COMMENT 'sku_name',
  `sku_num` int(11) DEFAULT NULL COMMENT '购买个数',
  `task_id` bigint(20) DEFAULT NULL COMMENT '工作单id',
  `ware_id` bigint(20) DEFAULT NULL COMMENT '仓库id',
  `lock_status` int(1) DEFAULT NULL COMMENT '1-已锁定  2-已解锁  3-扣减',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COMMENT='库存工作单';

-- ----------------------------
-- Records of wms_ware_order_task_detail
-- ----------------------------

-- ----------------------------
-- Table structure for wms_ware_sku
-- ----------------------------
DROP TABLE IF EXISTS `wms_ware_sku`;
CREATE TABLE `wms_ware_sku` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku_id',
  `ware_id` bigint(20) DEFAULT NULL COMMENT '仓库id',
  `stock` int(11) DEFAULT NULL COMMENT '库存数',
  `sku_name` varchar(200) DEFAULT NULL COMMENT 'sku_name',
  `stock_locked` int(11) DEFAULT '0' COMMENT '锁定库存',
  PRIMARY KEY (`id`),
  KEY `sku_id` (`sku_id`) USING BTREE,
  KEY `ware_id` (`ware_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='商品库存';

-- ----------------------------
-- Records of wms_ware_sku
-- ----------------------------
