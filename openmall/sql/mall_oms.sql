SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for oms_cart_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_cart_item`;
CREATE TABLE `oms_cart_item`
(
    `id`                  bigint(20) NOT NULL AUTO_INCREMENT,
    `product_id`          bigint(20)     DEFAULT NULL,
    `product_sku_id`      bigint(20)     DEFAULT NULL,
    `member_id`           bigint(20)     DEFAULT NULL,
    `quantity`            int(11)        DEFAULT NULL COMMENT '购买数量',
    `price`               decimal(10, 2) DEFAULT NULL COMMENT '添加到购物车的价格',
    `sp1`                 varchar(200)   DEFAULT NULL COMMENT '销售属性1',
    `sp2`                 varchar(200)   DEFAULT NULL COMMENT '销售属性2',
    `sp3`                 varchar(200)   DEFAULT NULL COMMENT '销售属性3',
    `product_pic`         varchar(1000)  DEFAULT NULL COMMENT '商品主图',
    `product_name`        varchar(500)   DEFAULT NULL COMMENT '商品名称',
    `product_sub_title`   varchar(500)   DEFAULT NULL COMMENT '商品副标题（卖点）',
    `product_sku_code`    varchar(200)   DEFAULT NULL COMMENT '商品sku条码',
    `member_nickname`     varchar(500)   DEFAULT NULL COMMENT '会员昵称',
    `create_date`         datetime       DEFAULT NULL COMMENT '创建时间',
    `modify_date`         datetime       DEFAULT NULL COMMENT '修改时间',
    `delete_status`       int(1)         DEFAULT '0' COMMENT '是否删除',
    `product_category_id` bigint(20)     DEFAULT NULL COMMENT '商品分类',
    `product_brand`       varchar(200)   DEFAULT NULL,
    `product_sn`          varchar(200)   DEFAULT NULL,
    `product_attr`        varchar(500)   DEFAULT NULL COMMENT '商品销售属性:[{"key":"颜色","value":"颜色"},{"key":"容量","value":"4G"}]',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 17
  DEFAULT CHARSET = utf8 COMMENT ='购物车表';

-- ----------------------------
-- Records of oms_cart_item
-- ----------------------------


-- ----------------------------
-- Table structure for oms_company_address
-- ----------------------------
DROP TABLE IF EXISTS `oms_company_address`;
CREATE TABLE `oms_company_address`
(
    `id`             bigint(20) NOT NULL AUTO_INCREMENT,
    `address_name`   varchar(200) DEFAULT NULL COMMENT '地址名称',
    `send_status`    int(1)       DEFAULT NULL COMMENT '默认发货地址：0->否；1->是',
    `receive_status` int(1)       DEFAULT NULL COMMENT '是否默认收货地址：0->否；1->是',
    `name`           varchar(64)  DEFAULT NULL COMMENT '收发货人姓名',
    `phone`          varchar(64)  DEFAULT NULL COMMENT '收货人电话',
    `province`       varchar(64)  DEFAULT NULL COMMENT '省/直辖市',
    `city`           varchar(64)  DEFAULT NULL COMMENT '市',
    `region`         varchar(64)  DEFAULT NULL COMMENT '区',
    `detail_address` varchar(200) DEFAULT NULL COMMENT '详细地址',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8 COMMENT ='公司收发货地址表';

-- ----------------------------
-- Records of oms_company_address
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_order`;
CREATE TABLE `oms_order`
(
    `id`                      bigint(20)   NOT NULL AUTO_INCREMENT COMMENT '订单id',
    `member_id`               bigint(20)   NOT NULL,
    `coupon_id`               bigint(20)            DEFAULT NULL,
    `order_sn`                varchar(64)           DEFAULT NULL COMMENT '订单编号',
    `create_time`             datetime              DEFAULT NULL COMMENT '提交时间',
    `member_username`         varchar(64)           DEFAULT NULL COMMENT '用户帐号',
    `total_amount`            decimal(10, 2)        DEFAULT NULL COMMENT '订单总金额',
    `pay_amount`              decimal(10, 2)        DEFAULT NULL COMMENT '应付金额（实际支付金额）',
    `freight_amount`          decimal(10, 2)        DEFAULT NULL COMMENT '运费金额',
    `promotion_amount`        decimal(10, 2)        DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
    `integration_amount`      decimal(10, 2)        DEFAULT NULL COMMENT '积分抵扣金额',
    `coupon_amount`           decimal(10, 2)        DEFAULT NULL COMMENT '优惠券抵扣金额',
    `discount_amount`         decimal(10, 2)        DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
    `pay_type`                int(1)                DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
    `source_type`             int(1)                DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
    `status`                  int(1)                DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
    `order_type`              int(1)                DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
    `delivery_company`        varchar(64)           DEFAULT NULL COMMENT '物流公司(配送方式)',
    `delivery_sn`             varchar(64)           DEFAULT NULL COMMENT '物流单号',
    `auto_confirm_day`        int(11)               DEFAULT NULL COMMENT '自动确认时间（天）',
    `integration`             int(11)               DEFAULT NULL COMMENT '可以获得的积分',
    `growth`                  int(11)               DEFAULT NULL COMMENT '可以活动的成长值',
    `promotion_info`          varchar(100)          DEFAULT NULL COMMENT '活动信息',
    `bill_type`               int(1)                DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
    `bill_header`             varchar(200)          DEFAULT NULL COMMENT '发票抬头',
    `bill_content`            varchar(200)          DEFAULT NULL COMMENT '发票内容',
    `bill_receiver_phone`     varchar(32)           DEFAULT NULL COMMENT '收票人电话',
    `bill_receiver_email`     varchar(64)           DEFAULT NULL COMMENT '收票人邮箱',
    `receiver_name`           varchar(100) NOT NULL COMMENT '收货人姓名',
    `receiver_phone`          varchar(32)  NOT NULL COMMENT '收货人电话',
    `receiver_post_code`      varchar(32)           DEFAULT NULL COMMENT '收货人邮编',
    `receiver_province`       varchar(32)           DEFAULT NULL COMMENT '省份/直辖市',
    `receiver_city`           varchar(32)           DEFAULT NULL COMMENT '城市',
    `receiver_region`         varchar(32)           DEFAULT NULL COMMENT '区',
    `receiver_detail_address` varchar(200)          DEFAULT NULL COMMENT '详细地址',
    `note`                    varchar(500)          DEFAULT NULL COMMENT '订单备注',
    `confirm_status`          int(1)                DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
    `delete_status`           int(1)       NOT NULL DEFAULT '0' COMMENT '删除状态：0->未删除；1->已删除',
    `use_integration`         int(11)               DEFAULT NULL COMMENT '下单时使用的积分',
    `payment_time`            datetime              DEFAULT NULL COMMENT '支付时间',
    `delivery_time`           datetime              DEFAULT NULL COMMENT '发货时间',
    `receive_time`            datetime              DEFAULT NULL COMMENT '确认收货时间',
    `comment_time`            datetime              DEFAULT NULL COMMENT '评价时间',
    `modify_time`             datetime              DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 27
  DEFAULT CHARSET = utf8 COMMENT ='订单表';

-- ----------------------------
-- Records of oms_order
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item`;
CREATE TABLE `oms_order_item`
(
    `id`                  bigint(20) NOT NULL AUTO_INCREMENT,
    `order_id`            bigint(20)     DEFAULT NULL COMMENT '订单id',
    `order_sn`            varchar(64)    DEFAULT NULL COMMENT '订单编号',
    `product_id`          bigint(20)     DEFAULT NULL,
    `product_pic`         varchar(500)   DEFAULT NULL,
    `product_name`        varchar(200)   DEFAULT NULL,
    `product_brand`       varchar(200)   DEFAULT NULL,
    `product_sn`          varchar(64)    DEFAULT NULL,
    `product_price`       decimal(10, 2) DEFAULT NULL COMMENT '销售价格',
    `product_quantity`    int(11)        DEFAULT NULL COMMENT '购买数量',
    `product_sku_id`      bigint(20)     DEFAULT NULL COMMENT '商品sku编号',
    `product_sku_code`    varchar(50)    DEFAULT NULL COMMENT '商品sku条码',
    `product_category_id` bigint(20)     DEFAULT NULL COMMENT '商品分类id',
    `sp1`                 varchar(100)   DEFAULT NULL COMMENT '商品的销售属性',
    `sp2`                 varchar(100)   DEFAULT NULL,
    `sp3`                 varchar(100)   DEFAULT NULL,
    `promotion_name`      varchar(200)   DEFAULT NULL COMMENT '商品促销名称',
    `promotion_amount`    decimal(10, 2) DEFAULT NULL COMMENT '商品促销分解金额',
    `coupon_amount`       decimal(10, 2) DEFAULT NULL COMMENT '优惠券优惠分解金额',
    `integration_amount`  decimal(10, 2) DEFAULT NULL COMMENT '积分优惠分解金额',
    `real_amount`         decimal(10, 2) DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
    `gift_integration`    int(11)        DEFAULT '0',
    `gift_growth`         int(11)        DEFAULT '0',
    `product_attr`        varchar(500)   DEFAULT NULL COMMENT '商品销售属性:[{"key":"颜色","value":"颜色"},{"key":"容量","value":"4G"}]',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 46
  DEFAULT CHARSET = utf8 COMMENT ='订单中所包含的商品';

-- ----------------------------
-- Records of oms_order_item
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_operate_history
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_operate_history`;
CREATE TABLE `oms_order_operate_history`
(
    `id`           bigint(20) NOT NULL AUTO_INCREMENT,
    `order_id`     bigint(20)   DEFAULT NULL COMMENT '订单id',
    `operate_man`  varchar(100) DEFAULT NULL COMMENT '操作人：用户；系统；后台管理员',
    `create_time`  datetime     DEFAULT NULL COMMENT '操作时间',
    `order_status` int(1)       DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
    `note`         varchar(500) DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 23
  DEFAULT CHARSET = utf8 COMMENT ='订单操作历史记录';

-- ----------------------------
-- Records of oms_order_operate_history
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_return_apply
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_apply`;
CREATE TABLE `oms_order_return_apply`
(
    `id`                 bigint(20) NOT NULL AUTO_INCREMENT,
    `order_id`           bigint(20)     DEFAULT NULL COMMENT '订单id',
    `company_address_id` bigint(20)     DEFAULT NULL COMMENT '收货地址表id',
    `product_id`         bigint(20)     DEFAULT NULL COMMENT '退货商品id',
    `order_sn`           varchar(64)    DEFAULT NULL COMMENT '订单编号',
    `create_time`        datetime       DEFAULT NULL COMMENT '申请时间',
    `member_username`    varchar(64)    DEFAULT NULL COMMENT '会员用户名',
    `return_amount`      decimal(10, 2) DEFAULT NULL COMMENT '退款金额',
    `return_name`        varchar(100)   DEFAULT NULL COMMENT '退货人姓名',
    `return_phone`       varchar(100)   DEFAULT NULL COMMENT '退货人电话',
    `status`             int(1)         DEFAULT NULL COMMENT '申请状态：0->待处理；1->退货中；2->已完成；3->已拒绝',
    `handle_time`        datetime       DEFAULT NULL COMMENT '处理时间',
    `product_pic`        varchar(500)   DEFAULT NULL COMMENT '商品图片',
    `product_name`       varchar(200)   DEFAULT NULL COMMENT '商品名称',
    `product_brand`      varchar(200)   DEFAULT NULL COMMENT '商品品牌',
    `product_attr`       varchar(500)   DEFAULT NULL COMMENT '商品销售属性：颜色：红色；尺码：xl;',
    `product_count`      int(11)        DEFAULT NULL COMMENT '退货数量',
    `product_price`      decimal(10, 2) DEFAULT NULL COMMENT '商品单价',
    `product_real_price` decimal(10, 2) DEFAULT NULL COMMENT '商品实际支付单价',
    `reason`             varchar(200)   DEFAULT NULL COMMENT '原因',
    `description`        varchar(500)   DEFAULT NULL COMMENT '描述',
    `proof_pics`         varchar(1000)  DEFAULT NULL COMMENT '凭证图片，以逗号隔开',
    `handle_note`        varchar(500)   DEFAULT NULL COMMENT '处理备注',
    `handle_man`         varchar(100)   DEFAULT NULL COMMENT '处理人员',
    `receive_man`        varchar(100)   DEFAULT NULL COMMENT '收货人',
    `receive_time`       datetime       DEFAULT NULL COMMENT '收货时间',
    `receive_note`       varchar(500)   DEFAULT NULL COMMENT '收货备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 27
  DEFAULT CHARSET = utf8 COMMENT ='订单退货申请';

-- ----------------------------
-- Records of oms_order_return_apply
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_return_reason
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_reason`;
CREATE TABLE `oms_order_return_reason`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT,
    `name`        varchar(100) DEFAULT NULL COMMENT '退货类型',
    `sort`        int(11)      DEFAULT NULL,
    `status`      int(1)       DEFAULT NULL COMMENT '状态：0->不启用；1->启用',
    `create_time` datetime     DEFAULT NULL COMMENT '添加时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 16
  DEFAULT CHARSET = utf8 COMMENT ='退货原因表';

-- ----------------------------
-- Records of oms_order_return_reason
-- ----------------------------


-- ----------------------------
-- Table structure for oms_order_setting
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_setting`;
CREATE TABLE `oms_order_setting`
(
    `id`                    bigint(20) NOT NULL AUTO_INCREMENT,
    `flash_order_overtime`  int(11) DEFAULT NULL COMMENT '秒杀订单超时关闭时间(分)',
    `normal_order_overtime` int(11) DEFAULT NULL COMMENT '正常订单超时时间(分)',
    `confirm_overtime`      int(11) DEFAULT NULL COMMENT '发货后自动确认收货时间（天）',
    `finish_overtime`       int(11) DEFAULT NULL COMMENT '自动完成交易时间，不能申请售后（天）',
    `comment_overtime`      int(11) DEFAULT NULL COMMENT '订单完成后自动好评时间（天）',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8 COMMENT ='订单设置表';

-- ----------------------------
-- Records of oms_order_setting
-- ----------------------------



SET FOREIGN_KEY_CHECKS = 1;
