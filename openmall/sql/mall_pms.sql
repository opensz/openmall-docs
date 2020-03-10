SET FOREIGN_KEY_CHECKS = 0;


-- ----------------------------
-- Table structure for pms_album
-- ----------------------------
DROP TABLE IF EXISTS `pms_album`;
CREATE TABLE `pms_album`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT,
    `name`        varchar(64)   DEFAULT NULL,
    `cover_pic`   varchar(1000) DEFAULT NULL,
    `pic_count`   int(11)       DEFAULT NULL,
    `sort`        int(11)       DEFAULT NULL,
    `description` varchar(1000) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='相册表';

-- ----------------------------
-- Records of pms_album
-- ----------------------------

-- ----------------------------
-- Table structure for pms_album_pic
-- ----------------------------
DROP TABLE IF EXISTS `pms_album_pic`;
CREATE TABLE `pms_album_pic`
(
    `id`       bigint(20) NOT NULL AUTO_INCREMENT,
    `album_id` bigint(20)    DEFAULT NULL,
    `pic`      varchar(1000) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='画册图片表';

-- ----------------------------
-- Records of pms_album_pic
-- ----------------------------

-- ----------------------------
-- Table structure for pms_brand
-- ----------------------------
DROP TABLE IF EXISTS `pms_brand`;
CREATE TABLE `pms_brand`
(
    `id`                    bigint(20) NOT NULL AUTO_INCREMENT,
    `name`                  varchar(64)  DEFAULT NULL,
    `first_letter`          varchar(8)   DEFAULT NULL COMMENT '首字母',
    `sort`                  int(11)      DEFAULT NULL,
    `factory_status`        int(1)       DEFAULT NULL COMMENT '是否为品牌制造商：0->不是；1->是',
    `show_status`           int(1)       DEFAULT NULL,
    `product_count`         int(11)      DEFAULT NULL COMMENT '产品数量',
    `product_comment_count` int(11)      DEFAULT NULL COMMENT '产品评论数量',
    `logo`                  varchar(255) DEFAULT NULL COMMENT '品牌logo',
    `big_pic`               varchar(255) DEFAULT NULL COMMENT '专区大图',
    `brand_story`           text COMMENT '品牌故事',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 100
  DEFAULT CHARSET = utf8 COMMENT ='品牌表';

-- ----------------------------
-- Records of pms_brand
-- ----------------------------

-- ----------------------------
-- Table structure for pms_comment
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment`;
CREATE TABLE `pms_comment`
(
    `id`                bigint(20) NOT NULL AUTO_INCREMENT,
    `product_id`        bigint(20)    DEFAULT NULL,
    `member_nick_name`  varchar(255)  DEFAULT NULL,
    `product_name`      varchar(255)  DEFAULT NULL,
    `star`              int(3)        DEFAULT NULL COMMENT '评价星数：0->5',
    `member_ip`         varchar(64)   DEFAULT NULL COMMENT '评价的ip',
    `create_time`       datetime      DEFAULT NULL,
    `show_status`       int(1)        DEFAULT NULL,
    `product_attribute` varchar(255)  DEFAULT NULL COMMENT '购买时的商品属性',
    `collect_couont`    int(11)       DEFAULT NULL,
    `read_count`        int(11)       DEFAULT NULL,
    `content`           text,
    `pics`              varchar(1000) DEFAULT NULL COMMENT '上传图片地址，以逗号隔开',
    `member_icon`       varchar(255)  DEFAULT NULL COMMENT '评论用户头像',
    `replay_count`      int(11)       DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='商品评价表';

-- ----------------------------
-- Records of pms_comment
-- ----------------------------

-- ----------------------------
-- Table structure for pms_comment_replay
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment_replay`;
CREATE TABLE `pms_comment_replay`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT,
    `comment_id`       bigint(20)    DEFAULT NULL,
    `member_nick_name` varchar(255)  DEFAULT NULL,
    `member_icon`      varchar(255)  DEFAULT NULL,
    `content`          varchar(1000) DEFAULT NULL,
    `create_time`      datetime      DEFAULT NULL,
    `type`             int(1)        DEFAULT NULL COMMENT '评论人员类型；0->会员；1->管理员',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='产品评价回复表';

-- ----------------------------
-- Records of pms_comment_replay
-- ----------------------------

-- ----------------------------
-- Table structure for pms_feight_template
-- ----------------------------
DROP TABLE IF EXISTS `pms_feight_template`;
CREATE TABLE `pms_feight_template`
(
    `id`              bigint(20) NOT NULL AUTO_INCREMENT,
    `name`            varchar(64)    DEFAULT NULL,
    `charge_type`     int(1)         DEFAULT NULL COMMENT '计费类型:0->按重量；1->按件数',
    `first_weight`    decimal(10, 2) DEFAULT NULL COMMENT '首重kg',
    `first_fee`       decimal(10, 2) DEFAULT NULL COMMENT '首费（元）',
    `continue_weight` decimal(10, 2) DEFAULT NULL,
    `continme_fee`    decimal(10, 2) DEFAULT NULL,
    `dest`            varchar(255)   DEFAULT NULL COMMENT '目的地（省、市）',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='运费模版';

-- ----------------------------
-- Records of pms_feight_template
-- ----------------------------

-- ----------------------------
-- Table structure for pms_member_price
-- ----------------------------
DROP TABLE IF EXISTS `pms_member_price`;
CREATE TABLE `pms_member_price`
(
    `id`                bigint(20) NOT NULL AUTO_INCREMENT,
    `product_id`        bigint(20)     DEFAULT NULL,
    `member_level_id`   bigint(20)     DEFAULT NULL,
    `member_price`      decimal(10, 2) DEFAULT NULL COMMENT '会员价格',
    `member_level_name` varchar(100)   DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1000
  DEFAULT CHARSET = utf8 COMMENT ='商品会员价格表';

-- ----------------------------
-- Records of pms_member_price
-- ----------------------------


-- ----------------------------
-- Table structure for pms_product
-- ----------------------------
DROP TABLE IF EXISTS `pms_product`;
CREATE TABLE `pms_product`
(
    `id`                            bigint(20)  NOT NULL AUTO_INCREMENT,
    `brand_id`                      bigint(20)     DEFAULT NULL,
    `product_category_id`           bigint(20)     DEFAULT NULL,
    `product_category_tree_id`      varchar(255)    DEFAULT NULL,
    `feight_template_id`            bigint(20)     DEFAULT NULL,
    `product_attribute_category_id` bigint(20)     DEFAULT NULL,
    `name`                          varchar(64) NOT NULL,
    `pic`                           varchar(255)   DEFAULT NULL,
    `product_sn`                    varchar(64) NOT NULL COMMENT '货号',
    `delete_status`                 int(1)         DEFAULT NULL COMMENT '删除状态：0->未删除；1->已删除',
    `publish_status`                int(1)         DEFAULT NULL COMMENT '上架状态：0->下架；1->上架',
    `new_status`                    int(1)         DEFAULT NULL COMMENT '新品状态:0->不是新品；1->新品',
    `recommand_status`              int(1)         DEFAULT NULL COMMENT '推荐状态；0->不推荐；1->推荐',
    `verify_status`                 int(1)         DEFAULT NULL COMMENT '审核状态：0->未审核；1->审核通过',
    `sort`                          int(11)        DEFAULT NULL COMMENT '排序',
    `sale`                          int(11)        DEFAULT NULL COMMENT '销量',
    `price`                         decimal(10, 2) DEFAULT NULL,
    `promotion_price`               decimal(10, 2) DEFAULT NULL COMMENT '促销价格',
    `gift_growth`                   int(11)        DEFAULT '0' COMMENT '赠送的成长值',
    `gift_point`                    int(11)        DEFAULT '0' COMMENT '赠送的积分',
    `use_point_limit`               int(11)        DEFAULT NULL COMMENT '限制使用的积分数',
    `sub_title`                     varchar(255)   DEFAULT NULL COMMENT '副标题',
    `description`                   text COMMENT '商品描述',
    `original_price`                decimal(10, 2) DEFAULT NULL COMMENT '市场价',
    `stock`                         int(11)        DEFAULT NULL COMMENT '库存',
    `low_stock`                     int(11)        DEFAULT NULL COMMENT '库存预警值',
    `unit`                          varchar(16)    DEFAULT NULL COMMENT '单位',
    `weight`                        decimal(10, 2) DEFAULT NULL COMMENT '商品重量，默认为克',
    `preview_status`                int(1)         DEFAULT NULL COMMENT '是否为预告商品：0->不是；1->是',
    `service_ids`                   varchar(64)    DEFAULT NULL COMMENT '以逗号分割的产品服务：1->无忧退货；2->快速退款；3->免费包邮',
    `keywords`                      varchar(255)   DEFAULT NULL,
    `note`                          varchar(255)   DEFAULT NULL,
    `album_pics`                    varchar(255)   DEFAULT NULL COMMENT '画册图片，连产品图片限制为5张，以逗号分割',
    `detail_title`                  varchar(255)   DEFAULT NULL,
    `detail_desc`                   text,
    `detail_html`                   text COMMENT '产品详情网页内容',
    `detail_mobile_html`            text COMMENT '移动端网页详情',
    `promotion_start_time`          datetime       DEFAULT NULL COMMENT '促销开始时间',
    `promotion_end_time`            datetime       DEFAULT NULL COMMENT '促销结束时间',
    `promotion_per_limit`           int(11)        DEFAULT NULL COMMENT '活动限购数量',
    `promotion_type`                int(1)         DEFAULT NULL COMMENT '促销类型：0->没有促销使用原价;1->使用促销价；2->使用会员价；3->使用阶梯价格；4->使用满减价格；5->限时购',
    `brand_name`                    varchar(255)   DEFAULT NULL COMMENT '品牌名称',
    `product_category_name`         varchar(255)   DEFAULT NULL COMMENT '商品分类名称',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1000
  DEFAULT CHARSET = utf8 COMMENT ='商品信息';

-- ----------------------------
-- Records of pms_product
-- ----------------------------

-- ----------------------------
-- Table structure for pms_product_attribute
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute`;
CREATE TABLE `pms_product_attribute`
(
    `id`                            bigint(20) NOT NULL AUTO_INCREMENT,
    `product_attribute_category_id` bigint(20)   DEFAULT NULL,
    `name`                          varchar(64)  DEFAULT NULL,
    `select_type`                   int(1)       DEFAULT NULL COMMENT '属性选择类型：0->唯一；1->单选；2->多选',
    `input_type`                    int(1)       DEFAULT NULL COMMENT '属性录入方式：0->手工录入；1->从列表中选取',
    `input_list`                    varchar(255) DEFAULT NULL COMMENT '可选值列表，以逗号隔开',
    `sort`                          int(11)      DEFAULT NULL COMMENT '排序字段：最高的可以单独上传图片',
    `filter_type`                   int(1)       DEFAULT NULL COMMENT '分类筛选样式：1->普通；1->颜色',
    `search_type`                   int(1)       DEFAULT NULL COMMENT '检索类型；0->不需要进行检索；1->关键字检索；2->范围检索',
    `related_status`                int(1)       DEFAULT NULL COMMENT '相同属性产品是否关联；0->不关联；1->关联',
    `hand_add_status`               int(1)       DEFAULT NULL COMMENT '是否支持手动新增；0->不支持；1->支持',
    `type`                          int(1)       DEFAULT NULL COMMENT '属性的类型；0->规格；1->参数',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1000
  DEFAULT CHARSET = utf8 COMMENT ='商品属性参数表';

-- ----------------------------
-- Records of pms_product_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for pms_product_attribute_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute_category`;
CREATE TABLE `pms_product_attribute_category`
(
    `id`              bigint(20) NOT NULL AUTO_INCREMENT,
    `name`            varchar(64) DEFAULT NULL,
    `attribute_count` int(11)     DEFAULT '0' COMMENT '属性数量',
    `param_count`     int(11)     DEFAULT '0' COMMENT '参数数量',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1000
  DEFAULT CHARSET = utf8 COMMENT ='产品属性分类表';

-- ----------------------------
-- Records of pms_product_attribute_category
-- ----------------------------

-- ----------------------------
-- Table structure for pms_product_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute_value`;
CREATE TABLE `pms_product_attribute_value`
(
    `id`                   bigint(20) NOT NULL AUTO_INCREMENT,
    `product_id`           bigint(20)  DEFAULT NULL,
    `product_attribute_id` bigint(20)  DEFAULT NULL,
    `value`                varchar(64) DEFAULT NULL COMMENT '手动添加规格或参数的值，参数单值，规格有多个时以逗号隔开',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1000
  DEFAULT CHARSET = utf8 COMMENT ='存储产品参数信息的表';

-- ----------------------------
-- Records of pms_product_attribute_value
-- ----------------------------


-- ----------------------------
-- Table structure for pms_product_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_category`;
CREATE TABLE `pms_product_category`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT,
    `parent_id`     bigint(20)   DEFAULT NULL COMMENT '上级分类的编号：0表示一级分类',
    `parent_tree_id`     varchar(255)   DEFAULT NULL COMMENT '树状父ID，冒号分割',
    `name`          varchar(64)  DEFAULT NULL,
    `level`         int(1)       DEFAULT NULL COMMENT '分类级别：0->1级；1->2级',
    `product_count` int(11)      DEFAULT NULL,
    `product_unit`  varchar(64)  DEFAULT NULL,
    `nav_status`    int(1)       DEFAULT NULL COMMENT '是否显示在导航栏：0->不显示；1->显示',
    `show_status`   int(1)       DEFAULT NULL COMMENT '显示状态：0->不显示；1->显示',
    `sort`          int(11)      DEFAULT NULL,
    `icon`          varchar(255) DEFAULT NULL COMMENT '图标',
    `keywords`      varchar(255) DEFAULT NULL,
    `description`   text COMMENT '描述',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1000
  DEFAULT CHARSET = utf8 COMMENT ='产品分类';

-- ----------------------------
-- Records of pms_product_category
-- ----------------------------


-- ----------------------------
-- Table structure for pms_product_category_attribute_relation
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_category_attribute_relation`;
CREATE TABLE `pms_product_category_attribute_relation`
(
    `id`                   bigint(20) NOT NULL AUTO_INCREMENT,
    `product_category_id`  bigint(20) DEFAULT NULL,
    `product_attribute_id` bigint(20) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1000
  DEFAULT CHARSET = utf8 COMMENT ='产品的分类和属性的关系表，用于设置分类筛选条件（只支持一级分类）';

-- ----------------------------
-- Records of pms_product_category_attribute_relation
-- ----------------------------


-- ----------------------------
-- Table structure for pms_product_full_reduction
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_full_reduction`;
CREATE TABLE `pms_product_full_reduction`
(
    `id`           bigint(11) NOT NULL AUTO_INCREMENT,
    `product_id`   bigint(20)     DEFAULT NULL,
    `full_price`   decimal(10, 2) DEFAULT NULL,
    `reduce_price` decimal(10, 2) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1000
  DEFAULT CHARSET = utf8 COMMENT ='产品满减表(只针对同商品)';

-- ----------------------------
-- Records of pms_product_full_reduction
-- ----------------------------


-- ----------------------------
-- Table structure for pms_product_ladder
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_ladder`;
CREATE TABLE `pms_product_ladder`
(
    `id`         bigint(20) NOT NULL AUTO_INCREMENT,
    `product_id` bigint(20)     DEFAULT NULL,
    `count`      int(11)        DEFAULT NULL COMMENT '满足的商品数量',
    `discount`   decimal(10, 2) DEFAULT NULL COMMENT '折扣',
    `price`      decimal(10, 2) DEFAULT NULL COMMENT '折后价格',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1000
  DEFAULT CHARSET = utf8 COMMENT ='产品阶梯价格表(只针对同商品)';

-- ----------------------------
-- Records of pms_product_ladder
-- ----------------------------


-- ----------------------------
-- Table structure for pms_product_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_operate_log`;
CREATE TABLE `pms_product_operate_log`
(
    `id`                  bigint(20) NOT NULL AUTO_INCREMENT,
    `product_id`          bigint(20)     DEFAULT NULL,
    `price_old`           decimal(10, 2) DEFAULT NULL,
    `price_new`           decimal(10, 2) DEFAULT NULL,
    `sale_price_old`      decimal(10, 2) DEFAULT NULL,
    `sale_price_new`      decimal(10, 2) DEFAULT NULL,
    `gift_point_old`      int(11)        DEFAULT NULL COMMENT '赠送的积分',
    `gift_point_new`      int(11)        DEFAULT NULL,
    `use_point_limit_old` int(11)        DEFAULT NULL,
    `use_point_limit_new` int(11)        DEFAULT NULL,
    `operate_man`         varchar(64)    DEFAULT NULL COMMENT '操作人',
    `create_time`         datetime       DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of pms_product_operate_log
-- ----------------------------

-- ----------------------------
-- Table structure for pms_product_vertify_record
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_vertify_record`;
CREATE TABLE `pms_product_vertify_record`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT,
    `product_id`  bigint(20)   DEFAULT NULL,
    `create_time` datetime     DEFAULT NULL,
    `vertify_man` varchar(64)  DEFAULT NULL COMMENT '审核人',
    `status`      int(1)       DEFAULT NULL,
    `detail`      varchar(255) DEFAULT NULL COMMENT '反馈详情',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1000
  DEFAULT CHARSET = utf8 COMMENT ='商品审核记录';

-- ----------------------------
-- Records of pms_product_vertify_record
-- ----------------------------

-- ----------------------------
-- Table structure for pms_sku_stock
-- ----------------------------
DROP TABLE IF EXISTS `pms_sku_stock`;
CREATE TABLE `pms_sku_stock`
(
    `id`              bigint(20)  NOT NULL AUTO_INCREMENT,
    `product_id`      bigint(20)     DEFAULT NULL,
    `sku_code`        varchar(64) NOT NULL COMMENT 'sku编码',
    `price`           decimal(10, 2) DEFAULT NULL,
    `stock`           int(11)        DEFAULT '0' COMMENT '库存',
    `low_stock`       int(11)        DEFAULT NULL COMMENT '预警库存',
    `sp1`             varchar(64)    DEFAULT NULL COMMENT '销售属性1',
    `sp2`             varchar(64)    DEFAULT NULL,
    `sp3`             varchar(64)    DEFAULT NULL,
    `pic`             varchar(255)   DEFAULT NULL COMMENT '展示图片',
    `sale`            int(11)        DEFAULT NULL COMMENT '销量',
    `promotion_price` decimal(10, 2) DEFAULT NULL COMMENT '单品促销价格',
    `lock_stock`      int(11)        DEFAULT '0' COMMENT '锁定库存',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1000
  DEFAULT CHARSET = utf8 COMMENT ='sku的库存';

-- ----------------------------
-- Records of pms_sku_stock
-- ----------------------------



SET FOREIGN_KEY_CHECKS = 1;
