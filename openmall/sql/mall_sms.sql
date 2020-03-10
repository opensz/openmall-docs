SET FOREIGN_KEY_CHECKS = 0;


-- ----------------------------
-- Table structure for sms_coupon
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon`;
CREATE TABLE `sms_coupon`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT,
    `type`          int(1)         DEFAULT NULL COMMENT '优惠卷类型；0->全场赠券；1->会员赠券；2->购物赠券；3->注册赠券',
    `name`          varchar(100)   DEFAULT NULL,
    `platform`      int(1)         DEFAULT NULL COMMENT '使用平台：0->全部；1->移动；2->PC',
    `count`         int(11)        DEFAULT NULL COMMENT '数量',
    `amount`        decimal(10, 2) DEFAULT NULL COMMENT '金额',
    `per_limit`     int(11)        DEFAULT NULL COMMENT '每人限领张数',
    `min_point`     decimal(10, 2) DEFAULT NULL COMMENT '使用门槛；0表示无门槛',
    `start_time`    datetime       DEFAULT NULL,
    `end_time`      datetime       DEFAULT NULL,
    `use_type`      int(1)         DEFAULT NULL COMMENT '使用类型：0->全场通用；1->指定分类；2->指定商品',
    `note`          varchar(200)   DEFAULT NULL COMMENT '备注',
    `publish_count` int(11)        DEFAULT NULL COMMENT '发行数量',
    `use_count`     int(11)        DEFAULT NULL COMMENT '已使用数量',
    `receive_count` int(11)        DEFAULT NULL COMMENT '领取数量',
    `enable_time`   datetime       DEFAULT NULL COMMENT '可以领取的日期',
    `code`          varchar(64)    DEFAULT NULL COMMENT '优惠码',
    `member_level`  int(1)         DEFAULT NULL COMMENT '可领取的会员类型：0->无限时',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 22
  DEFAULT CHARSET = utf8 COMMENT ='优惠卷表';

-- ----------------------------
-- Records of sms_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for sms_coupon_history
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_history`;
CREATE TABLE `sms_coupon_history`
(
    `id`              bigint(20) NOT NULL AUTO_INCREMENT,
    `coupon_id`       bigint(20)   DEFAULT NULL,
    `member_id`       bigint(20)   DEFAULT NULL,
    `coupon_code`     varchar(64)  DEFAULT NULL,
    `member_nickname` varchar(64)  DEFAULT NULL COMMENT '领取人昵称',
    `get_type`        int(1)       DEFAULT NULL COMMENT '获取类型：0->后台赠送；1->主动获取',
    `create_time`     datetime     DEFAULT NULL,
    `use_status`      int(1)       DEFAULT NULL COMMENT '使用状态：0->未使用；1->已使用；2->已过期',
    `use_time`        datetime     DEFAULT NULL COMMENT '使用时间',
    `order_id`        bigint(20)   DEFAULT NULL COMMENT '订单编号',
    `order_sn`        varchar(100) DEFAULT NULL COMMENT '订单号码',
    PRIMARY KEY (`id`),
    KEY `idx_member_id` (`member_id`) USING BTREE,
    KEY `idx_coupon_id` (`coupon_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 33
  DEFAULT CHARSET = utf8 COMMENT ='优惠券使用、领取历史表';

-- ----------------------------
-- Records of sms_coupon_history
-- ----------------------------

-- ----------------------------
-- Table structure for sms_coupon_product_category_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_product_category_relation`;
CREATE TABLE `sms_coupon_product_category_relation`
(
    `id`                    bigint(20) NOT NULL AUTO_INCREMENT,
    `coupon_id`             bigint(20)   DEFAULT NULL,
    `product_category_id`   bigint(20)   DEFAULT NULL,
    `product_category_name` varchar(200) DEFAULT NULL COMMENT '产品分类名称',
    `parent_category_name`  varchar(200) DEFAULT NULL COMMENT '父分类名称',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8 COMMENT ='优惠券和产品分类关系表';

-- ----------------------------
-- Records of sms_coupon_product_category_relation
-- ----------------------------

-- ----------------------------
-- Table structure for sms_coupon_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_product_relation`;
CREATE TABLE `sms_coupon_product_relation`
(
    `id`           bigint(20) NOT NULL AUTO_INCREMENT,
    `coupon_id`    bigint(20)   DEFAULT NULL,
    `product_id`   bigint(20)   DEFAULT NULL,
    `product_name` varchar(500) DEFAULT NULL COMMENT '商品名称',
    `product_sn`   varchar(200) DEFAULT NULL COMMENT '商品编码',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  DEFAULT CHARSET = utf8 COMMENT ='优惠券和产品的关系表';

-- ----------------------------
-- Records of sms_coupon_product_relation
-- ----------------------------

-- ----------------------------
-- Table structure for sms_flash_promotion
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion`;
CREATE TABLE `sms_flash_promotion`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT,
    `title`       varchar(200) DEFAULT NULL,
    `start_date`  date         DEFAULT NULL COMMENT '开始日期',
    `end_date`    date         DEFAULT NULL COMMENT '结束日期',
    `status`      int(1)       DEFAULT NULL COMMENT '上下线状态',
    `create_time` datetime     DEFAULT NULL COMMENT '秒杀时间段名称',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 14
  DEFAULT CHARSET = utf8 COMMENT ='限时购表';

-- ----------------------------
-- Records of sms_flash_promotion
-- ----------------------------

-- ----------------------------
-- Table structure for sms_flash_promotion_log
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_log`;
CREATE TABLE `sms_flash_promotion_log`
(
    `id`             int(11) NOT NULL AUTO_INCREMENT,
    `member_id`      int(11)      DEFAULT NULL,
    `product_id`     bigint(20)   DEFAULT NULL,
    `member_phone`   varchar(64)  DEFAULT NULL,
    `product_name`   varchar(100) DEFAULT NULL,
    `subscribe_time` datetime     DEFAULT NULL COMMENT '会员订阅时间',
    `send_time`      datetime     DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='限时购通知记录';

-- ----------------------------
-- Records of sms_flash_promotion_log
-- ----------------------------

-- ----------------------------
-- Table structure for sms_flash_promotion_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_product_relation`;
CREATE TABLE `sms_flash_promotion_product_relation`
(
    `id`                         bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
    `flash_promotion_id`         bigint(20)     DEFAULT NULL,
    `flash_promotion_session_id` bigint(20)     DEFAULT NULL COMMENT '编号',
    `product_id`                 bigint(20)     DEFAULT NULL,
    `flash_promotion_price`      decimal(10, 2) DEFAULT NULL COMMENT '限时购价格',
    `flash_promotion_count`      int(11)        DEFAULT NULL COMMENT '限时购数量',
    `flash_promotion_limit`      int(11)        DEFAULT NULL COMMENT '每人限购数量',
    `sort`                       int(11)        DEFAULT NULL COMMENT '排序',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 45
  DEFAULT CHARSET = utf8 COMMENT ='商品限时购与商品关系表';

-- ----------------------------
-- Records of sms_flash_promotion_product_relation
-- ----------------------------

-- ----------------------------
-- Table structure for sms_flash_promotion_session
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_session`;
CREATE TABLE `sms_flash_promotion_session`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
    `name`        varchar(200) DEFAULT NULL COMMENT '场次名称',
    `start_time`  time         DEFAULT NULL COMMENT '每日开始时间',
    `end_time`    time         DEFAULT NULL COMMENT '每日结束时间',
    `status`      int(1)       DEFAULT NULL COMMENT '启用状态：0->不启用；1->启用',
    `create_time` datetime     DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 8
  DEFAULT CHARSET = utf8 COMMENT ='限时购场次表';

-- ----------------------------
-- Records of sms_flash_promotion_session
-- ----------------------------
INSERT INTO `sms_flash_promotion_session`
VALUES ('1', '8:00', '08:00:00', '10:00:33', '1', '2018-11-16 13:22:17');
INSERT INTO `sms_flash_promotion_session`
VALUES ('2', '10:00', '10:00:00', '12:00:00', '1', '2018-11-16 13:22:34');
INSERT INTO `sms_flash_promotion_session`
VALUES ('3', '12:00', '12:00:00', '14:00:00', '1', '2018-11-16 13:22:37');
INSERT INTO `sms_flash_promotion_session`
VALUES ('4', '14:00', '14:00:00', '16:00:00', '1', '2018-11-16 13:22:41');
INSERT INTO `sms_flash_promotion_session`
VALUES ('5', '16:00', '16:00:00', '18:00:00', '1', '2018-11-16 13:22:45');
INSERT INTO `sms_flash_promotion_session`
VALUES ('6', '18:00', '18:00:00', '20:00:00', '1', '2018-11-16 13:21:34');
INSERT INTO `sms_flash_promotion_session`
VALUES ('7', '20:00', '20:00:33', '21:00:33', '0', '2018-11-16 13:22:55');

-- ----------------------------
-- Table structure for sms_home_advertise
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_advertise`;
CREATE TABLE `sms_home_advertise`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT,
    `name`        varchar(100) DEFAULT NULL,
    `type`        int(1)       DEFAULT NULL COMMENT '轮播位置：0->PC首页轮播；1->app首页轮播',
    `pic`         varchar(500) DEFAULT NULL,
    `start_time`  datetime     DEFAULT NULL,
    `end_time`    datetime     DEFAULT NULL,
    `status`      int(1)       DEFAULT NULL COMMENT '上下线状态：0->下线；1->上线',
    `click_count` int(11)      DEFAULT NULL COMMENT '点击数',
    `order_count` int(11)      DEFAULT NULL COMMENT '下单数',
    `url`         varchar(500) DEFAULT NULL COMMENT '链接地址',
    `note`        varchar(500) DEFAULT NULL COMMENT '备注',
    `sort`        int(11)      DEFAULT '0' COMMENT '排序',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 12
  DEFAULT CHARSET = utf8 COMMENT ='首页轮播广告表';

-- ----------------------------
-- Records of sms_home_advertise
-- ----------------------------

-- ----------------------------
-- Table structure for sms_home_brand
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_brand`;
CREATE TABLE `sms_home_brand`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT,
    `brand_id`         bigint(20)  DEFAULT NULL,
    `brand_name`       varchar(64) DEFAULT NULL,
    `recommend_status` int(1)      DEFAULT NULL,
    `sort`             int(11)     DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 40
  DEFAULT CHARSET = utf8 COMMENT ='首页推荐品牌表';

-- ----------------------------
-- Records of sms_home_brand
-- ----------------------------

-- ----------------------------
-- Table structure for sms_home_new_product
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_new_product`;
CREATE TABLE `sms_home_new_product`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT,
    `product_id`       bigint(20)  DEFAULT NULL,
    `product_name`     varchar(64) DEFAULT NULL,
    `recommend_status` int(1)      DEFAULT NULL,
    `sort`             int(1)      DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 13
  DEFAULT CHARSET = utf8 COMMENT ='新鲜好物表';

-- ----------------------------
-- Records of sms_home_new_product
-- ----------------------------


-- ----------------------------
-- Table structure for sms_home_recommend_product
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_recommend_product`;
CREATE TABLE `sms_home_recommend_product`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT,
    `product_id`       bigint(20)  DEFAULT NULL,
    `product_name`     varchar(64) DEFAULT NULL,
    `recommend_status` int(1)      DEFAULT NULL,
    `sort`             int(1)      DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 8
  DEFAULT CHARSET = utf8 COMMENT ='人气推荐商品表';

-- ----------------------------
-- Records of sms_home_recommend_product
-- ----------------------------

-- ----------------------------
-- Table structure for sms_home_recommend_subject
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_recommend_subject`;
CREATE TABLE `sms_home_recommend_subject`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT,
    `subject_id`       bigint(20)  DEFAULT NULL,
    `subject_name`     varchar(64) DEFAULT NULL,
    `recommend_status` int(1)      DEFAULT NULL,
    `sort`             int(11)     DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 20
  DEFAULT CHARSET = utf8 COMMENT ='首页推荐专题表';

-- ----------------------------
-- Records of sms_home_recommend_subject
-- ----------------------------


-- group_buy拼团

-- ----------------------------
--  Table structure for `sms_group`
-- ----------------------------
DROP TABLE IF EXISTS `sms_group`;
CREATE TABLE `sms_group`
(
    `id`           bigint(20) NOT NULL AUTO_INCREMENT,
    `goods_id`     bigint(20)     DEFAULT NULL,
    `goods_name`   varchar(255)   DEFAULT NULL COMMENT '商品',
    `origin_price` decimal(10, 0) DEFAULT NULL COMMENT '商品价格',
    `group_price`  decimal(10, 0) DEFAULT NULL COMMENT '拼团价格',
    `start_time`   datetime       DEFAULT NULL COMMENT '开始时间',
    `end_time`     datetime       DEFAULT NULL COMMENT '结束时间',
    `hours`        int(11)        DEFAULT NULL COMMENT '拼团小时',
    `peoples`      int(11)        DEFAULT NULL COMMENT '成团人数',
    `status`       int(11)        DEFAULT NULL COMMENT '状态',
    `create_time`  datetime       DEFAULT NULL COMMENT '创建时间',
    `max_people`   int(11)        DEFAULT NULL COMMENT '拼团总人数',
    `limit_goods`  int(11)        DEFAULT NULL COMMENT '团购次数',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 8
  DEFAULT CHARSET = utf8mb4;

-- ----------------------------
--  Table structure for `sms_group_member`
-- ----------------------------
DROP TABLE IF EXISTS `sms_group_member`;
CREATE TABLE `sms_group_member`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT,
    `group_id`    bigint(20)   DEFAULT NULL,
    `member_id`   bigint(20)   DEFAULT NULL,
    `create_time` datetime     DEFAULT NULL,
    `main_id`     bigint(20)   DEFAULT NULL,
    `name`        varchar(255) DEFAULT NULL,
    `goods_id`    bigint(20)   DEFAULT NULL,
    `status`      int(11)      DEFAULT NULL COMMENT '状态',
    `order_id`    int(11)      DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `groupAndMain` (`group_id`, `member_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 13
  DEFAULT CHARSET = utf8mb4;



SET FOREIGN_KEY_CHECKS = 1;
