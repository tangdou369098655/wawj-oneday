SET NAMES UTF8;
DROP DATABASE IF EXISTS wawj;
CREATE DATABASE wawj CHARSET=UTF8;
USE wawj;


/**管理员**/
DROP TABLE IF EXISTS manager;
CREATE TABLE manager(
	mid BIGINT NOT  NULL PRIMARY KEY AUTO_INCREMENT COMMENT  '管理员id(主键)',
	mname VARCHAR(32) NOT NULL COMMENT '管理员姓名', 
	password VARCHAR(45) NOT NULL COMMENT '密码',
	status int(1) NOT NULL COMMENT '状态'	
);



/**家居商品详情**/
CREATE TABLE product_details (
	product_id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '商品id(主键)',
	product_kinds_id BIGINT NOT NULL COMMENT '类别id',
	product_kinds_name VARCHAR(45) NOT NULL COMMENT '种类名称',
	navid BIGINT DEFAULT NULL COMMENT '所属导航栏id',
	cake_name VARCHAR(64) NOT NULL COMMENT '家居名称', 
	relish INT(1) NOT NULL COMMENT '风格标志',
	price DECIMAL(30,2) DEFAULT NULL COMMENT '商品价格',
	count INT(16) DEFAULT NULL COMMENT '商品数量',
	sellcount INT(16) DEFAULT NULL COMMENT '商品销量',
	sizes INT(1) DEFAULT NULL COMMENT '商品规格 0小 1 中 2 大 3特大',
	advertisement VARCHAR(200) NOT NULL COMMENT '广告词',
	create_time DATETIME NOT NULL COMMENT '创建时间',
	update_time DATETIME NOT NULL COMMENT '最后一次更新时间',
	status INT(1) NOT NULL COMMENT '状态',
	recommend INT(1) NOT NULL COMMENT '是否首页推荐',
	spec VARCHAR(64) NOT NULL COMMENT '其它1',
	others_two VARCHAR(64) NOT NULL COMMENT '其它2',
	FOREIGN KEY (product_kinds_id) REFERENCES product_kinds(pid)
);

/**商品图片**/
CREATE TABLE product_pic(
	pic_id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '商品图片id(主键)',
	prcid BIGINT NOT NULL COMMENT '商品详情id(外键)',
	img VARCHAR(255) NOT NULL COMMENT '图片地址标准图',
	Bimg VARCHAR(255) NOT NULL COMMENT '图片地址大图',
	img_1 VARCHAR(255) NOT NULL COMMENT '详情页主图片地址_1',
	img_2 VARCHAR(255) NOT NULL COMMENT '详情页主图片地址_2',
	img_3 VARCHAR(255) NOT NULL COMMENT '详情页主图片地址_3',
	img_4 VARCHAR(255) NOT NULL COMMENT '详情页主图片地址_4',
	img_5 VARCHAR(255) NOT NULL COMMENT '详情页主图片地址_5',
	img_6 VARCHAR(255) NOT NULL COMMENT '详情页主图片地址_6',
	img_7 VARCHAR(255) NOT NULL COMMENT '详情页主图片地址_7',
	img_8 VARCHAR(255) NOT NULL COMMENT '详情页主图片地址_8',
	img_9 VARCHAR(255) NOT NULL COMMENT '详情页主图片地址_9',
	others_one VARCHAR(255) NOT NULL COMMENT '其它1',
	create_time DATETIME NOT NULL COMMENT '创建时间',
	update_time DATETIME NOT NULL COMMENT '最后一次更新时间',
	ustatus INT(1) NOT NULL COMMENT '状态',
	FOREIGN KEY (prcid) REFERENCES product_details(product_id)
);



/**首页商品**/
CREATE TABLE index_product(
	pid  BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '首页商品id',
	car_id BIGINT NOT NULL COMMENT '商品id(外键)',
	index_title VARCHAR(64)  COMMENT '首页商品标题',
	index_details VARCHAR(64)  COMMENT '首页详细标题',
	index_img VARCHAR(64) NOT NULL COMMENT '首页图片地址',
	index_price DECIMAL(30,2) DEFAULT NULL COMMENT '首页商品价格',
	index_href VARCHAR(255)  COMMENT '首页链接地址',
	index_seq_recommended TINYINT COMMENT '首页是否被推荐',
	index_sale_new TINYINT  COMMENT '首页是否新品上市',
	index_seq_top_sale TINYINT  COMMENT '首页是否在售',
	index_other_title VARCHAR(64)  COMMENT '首页商品其他介绍',
	index_picurl VARCHAR(255) NOT NULL COMMENT '首页轮播图地址',
	index_status INT(1) NOT NULL COMMENT '首页状态',
	FOREIGN KEY(car_id)REFERENCES product_details(product_id)
);

insert into product_details  values