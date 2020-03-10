SET FOREIGN_KEY_CHECKS = 0;


-- ----------------------------
-- Table structure for ums_admin
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin`;
CREATE TABLE `ums_admin`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT,
    `username`    varchar(64)  DEFAULT NULL,
    `password`    varchar(64)  DEFAULT NULL,
    `icon`        varchar(500) DEFAULT NULL COMMENT '头像',
    `email`       varchar(100) DEFAULT NULL COMMENT '邮箱',
    `nick_name`   varchar(200) DEFAULT NULL COMMENT '昵称',
    `note`        varchar(500) DEFAULT NULL COMMENT '备注信息',
    `create_time` datetime     DEFAULT NULL COMMENT '创建时间',
    `login_time`  datetime     DEFAULT NULL COMMENT '最后登录时间',
    `status`      int(1)       DEFAULT '1' COMMENT '帐号启用状态：0->禁用；1->启用',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8 COMMENT ='后台用户表';


-- ----------------------------
-- Table structure for ums_admin_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_login_log`;
CREATE TABLE `ums_admin_login_log`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT,
    `admin_id`    bigint(20)   DEFAULT NULL,
    `create_time` datetime     DEFAULT NULL,
    `ip`          varchar(64)  DEFAULT NULL,
    `address`     varchar(100) DEFAULT NULL,
    `user_agent`  varchar(100) DEFAULT NULL COMMENT '浏览器登录类型',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 18
  DEFAULT CHARSET = utf8 COMMENT ='后台用户登录日志表';

-- ----------------------------
-- Records of ums_admin_login_log
-- ----------------------------


-- ----------------------------
-- Table structure for ums_admin_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_permission_relation`;
CREATE TABLE `ums_admin_permission_relation`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT,
    `admin_id`      bigint(20) DEFAULT NULL,
    `permission_id` bigint(20) DEFAULT NULL,
    `type`          int(1)     DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='后台用户和权限关系表(除角色中定义的权限以外的加减权限)';

-- ----------------------------
-- Records of ums_admin_permission_relation
-- ----------------------------

-- ----------------------------
-- Table structure for ums_admin_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_role_relation`;
CREATE TABLE `ums_admin_role_relation`
(
    `id`       bigint(20) NOT NULL AUTO_INCREMENT,
    `admin_id` bigint(20) DEFAULT NULL,
    `role_id`  bigint(20) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 17
  DEFAULT CHARSET = utf8 COMMENT ='后台用户和角色关系表';




-- ----------------------------
-- Table structure for ums_permission
-- ----------------------------
DROP TABLE IF EXISTS `ums_permission`;
CREATE TABLE `ums_permission`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT,
    `pid`         bigint(20)   DEFAULT NULL COMMENT '父级权限id',
    `name`        varchar(100) DEFAULT NULL COMMENT '名称',
    `value`       varchar(200) DEFAULT NULL COMMENT '权限值',
    `icon`        varchar(500) DEFAULT NULL COMMENT '图标',
    `type`        int(1)       DEFAULT NULL COMMENT '权限类型：0->目录；1->菜单；2->按钮（接口绑定权限）',
    `uri`         varchar(200) DEFAULT NULL COMMENT '前端资源路径',
    `status`      int(1)       DEFAULT NULL COMMENT '启用状态；0->禁用；1->启用',
    `create_time` datetime     DEFAULT NULL COMMENT '创建时间',
    `sort`        int(11)      DEFAULT NULL COMMENT '排序',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 19
  DEFAULT CHARSET = utf8 COMMENT ='后台用户权限表';



-- ----------------------------
-- Table structure for ums_role
-- ----------------------------
DROP TABLE IF EXISTS `ums_role`;
CREATE TABLE `ums_role`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT,
    `name`        varchar(100) DEFAULT NULL COMMENT '名称',
    `description` varchar(500) DEFAULT NULL COMMENT '描述',
    `admin_count` int(11)      DEFAULT NULL COMMENT '后台用户数量',
    `create_time` datetime     DEFAULT NULL COMMENT '创建时间',
    `status`      int(1)       DEFAULT '1' COMMENT '启用状态：0->禁用；1->启用',
    `sort`        int(11)      DEFAULT '0',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8 COMMENT ='后台用户角色表';



-- ----------------------------
-- Table structure for ums_role_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_permission_relation`;
CREATE TABLE `ums_role_permission_relation`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT,
    `role_id`       bigint(20) DEFAULT NULL,
    `permission_id` bigint(20) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 18
  DEFAULT CHARSET = utf8 COMMENT ='后台用户角色和权限关系表';





SET FOREIGN_KEY_CHECKS = 1;
