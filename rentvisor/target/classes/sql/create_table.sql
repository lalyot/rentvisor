CREATE TABLE code_group (
	group_code CHAR(3) NOT NULL,
	group_name VARCHAR(30) NOT NULL,
	use_yn CHAR(1) NOT NULL DEFAULT 'Y',
	reg_date TIMESTAMP NOT NULL DEFAULT now(),
	upd_date TIMESTAMP DEFAULT now(),
	PRIMARY KEY (group_code)
);

CREATE TABLE code_detail (
	group_code CHAR(3) NOT NULL,
	code_value VARCHAR(3) NOT NULL,
	code_name VARCHAR(30) NOT NULL,
	sort_seq INT NOT NULL,
	use_yn CHAR(1) NOT NULL DEFAULT 'Y',
	reg_date TIMESTAMP NOT NULL DEFAULT now(),
	upd_date TIMESTAMP DEFAULT now(),
	PRIMARY KEY (group_code, code_value)
);

CREATE TABLE member(
	user_no BIGINT NOT NULL AUTO_INCREMENT,
	user_id VARCHAR(50) NOT NULL,
	user_pw VARCHAR(100) NOT NULL,
	user_name VARCHAR(100) NOT NULL,
	job VARCHAR(3) NOT NULL DEFAULT '00',
	coin INTEGER DEFAULT 0,
	reg_date DATETIME,
	upd_date DATETIME,
	PRIMARY KEY (user_no)
);

CREATE TABLE member_auth (
	user_auth_no BIGINT NOT NULL AUTO_INCREMENT,
	user_no BIGINT NOT NULL,
	auth VARCHAR(50) NOT NULL,
	reg_date DATETIME,
	upd_date DATETIME,
	PRIMARY KEY (user_auth_no)
);

ALTER TABLE member_apdsuth ADD CONSTRAINT fk_member_auth_user_no
FOREIGN KEY (user_no) REFERENCES member(user_no);

CREATE TABLE persistent_logins (
	username VARCHAR(64) NOT NULL,
	series VARCHAR(64) NOT NULL,
	token VARCHAR(64) NOT NULL,
	last_used TIMESTAMP NOT NULL,
	PRIMARY KEY (series)
);

CREATE TABLE board (
	board_no BIGINT NOT NULL AUTO_INCREMENT,
	title VARCHAR(200) NOT NULL,
	content TEXT,
	writer VARCHAR(50) NOT NULL,
	reg_date DATETIME,
	upd_date DATETIME,
	PRIMARY KEY (board_no)
);

CREATE TABLE notice (
	notice_no BIGINT NOT NULL AUTO_INCREMENT,
	title VARCHAR(200) NOT NULL,
	content TEXT,
	reg_date DATETIME,
	upd_date DATETIME,
	PRIMARY KEY (notice_no)
);

CREATE TABLE item(
	item_id BIGINT NOT NULL AUTO_INCREMENT,
	item_name VARCHAR(20) NOT NULL,
	price INTEGER NOT NULL,
	description VARCHAR(50),
	picture_url VARCHAR(200),
	preview_url VARCHAR(200),
	reg_date DATETIME,
	upd_date DATETIME,
	PRIMARY KEY (item_id)
);
alter table item add category varchar(500) not null;

CREATE TABLE charge_coin_history (
	history_no BIGINT NOT NULL AUTO_INCREMENT,
	user_no BIGINT NOT NULL,
	amount INTEGER NOT NULL,
	reg_date DATETIME,
	upd_date DATETIME,
	PRIMARY KEY (history_no)
);

CREATE TABLE user_item (
	user_item_no BIGINT NOT NULL AUTO_INCREMENT,
	user_no BIGINT NOT NULL,
	item_id BIGINT NOT NULL,
	reg_date DATETIME,
	upd_date DATETIME,
	PRIMARY KEY (user_item_no)
);

CREATE TABLE pay_coin_history (
	history_no BIGINT NOT NULL AUTO_INCREMENT,
	user_no BIGINT NOT NULL,
	item_id BIGINT NOT NULL,
	amount INTEGER NOT NULL,
	reg_date DATETIME,
	upd_date DATETIME,
	PRIMARY KEY (history_no)
);

CREATE TABLE pds(
	item_id BIGINT NOT NULL AUTO_INCREMENT,
	item_name VARCHAR(20),
	view_cnt INTEGER,
	description VARCHAR(50),
	reg_date DATETIME,
	upd_date DATETIME,
	PRIMARY KEY (item_id)
);

CREATE TABLE pds_file (
	pds_file_id BIGINT NOT NULL AUTO_INCREMENT,
	full_name VARCHAR(200) NOT NULL,
	item_id BIGINT NOT NULL,
	down_cnt INTEGER,
	reg_date DATETIME,
	upd_date DATETIME,
	PRIMARY KEY(pds_file_id)
);

ALTER TABLE pds_file ADD CONSTRAINT fk_pds_file_item_id
FOREIGN KEY (item_id) REFERENCES pds(item_id);

CREATE TABLE login_log (
	log_no BIGINT NOT NULL AUTO_INCREMENT,
	user_no BIGINT NOT NULL,
	user_id VARCHAR(50) NOT NULL,
	remote_addr VARCHAR(50) NOT NULL,
	reg_date DATETIME,
	upd_date DATETIME,
	PRIMARY KEY (log_no)
);

CREATE TABLE access_log (
	log_no BIGINT NOT NULL AUTO_INCREMENT,
	request_uri VARCHAR(200) NOT NULL,
	class_name VARCHAR(100) NOT NULL,
	class_simple_name VARCHAR(50) NOT NULL,
	method_name VARCHAR(100) NOT NULL,
	remote_addr VARCHAR(50) NOT NULL,
	reg_date DATETIME,
	upd_date DATETIME,
	PRIMARY KEY (log_no)
);

CREATE TABLE performance_log (
	log_no BIGINT NOT NULL AUTO_INCREMENT,
	signature_name VARCHAR(50) NOT NULL,
	signature_type_name VARCHAR(100) NOT NULL,
	duration_time BIGINT DEFAULT 0,
	reg_date DATETIME,
	upd_date DATETIME,
	PRIMARY KEY (log_no)
);

create table comment(
commentId int(10) auto_increment primary key,
parentId int(10) default 0,
content varchar(4000),
writeDate timestamp default now(),
user_id varchar(20) default null,
user_no int(10) default 0,
boardNo int(10));

INSERT INTO code_group (group_code, group_name, use_yn, reg_date) VALUES ('A01','job', 'Y', now());
INSERT INTO code_group (group_code, group_name, use_yn, reg_date) VALUES ('A02','hobby', 'Y', now());

INSERT INTO code_detail (group_code, code_value, code_name, sort_seq, use_yn , reg_date) VALUES ('A01','00', '---', 1, 'Y', now());
INSERT INTO code_detail (group_code, code_value, code_name, sort_seq, use_yn , reg_date) VALUES ('A01','01', 'Developer', 2, 'Y', now());
INSERT INTO code_detail (group_code, code_value, code_name, sort_seq, use_yn , reg_date) VALUES ('A01','02', 'Designer', 3, 'Y', now());
INSERT INTO code_detail (group_code, code_value, code_name, sort_seq, use_yn , reg_date) VALUES ('A01','03', 'Architect', 4, 'Y', now());

INSERT INTO code_detail (group_code, code_value, code_name, sort_seq, use_yn , reg_date) VALUES ('A02','00', '---', 1, 'Y', now());
INSERT INTO code_detail (group_code, code_value, code_name, sort_seq, use_yn , reg_date) VALUES ('A02','01', 'Movie', 2, 'Y', now());
INSERT INTO code_detail (group_code, code_value, code_name, sort_seq, use_yn , reg_date) VALUES ('A02','02', 'Music', 3, 'Y', now());
INSERT INTO code_detail (group_code, code_value, code_name, sort_seq, use_yn , reg_date) VALUES ('A02','03', 'Sports', 4, 'Y', now());

INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_1', 'content_1', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_2', 'content_2', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_3', 'content_3', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_4', 'content_4', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_5', 'content_5', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_6', 'content_6', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_7', 'content_7', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_8', 'content_8', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_9', 'content_9', 'hongkd', now());

INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_10', 'content_10', 'hongkd', now());

INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_11', 'content_11', 'hongkd', now());

INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_12', 'content_12', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_13', 'content_13', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_14', 'content_14', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_15', 'content_15', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_16', 'content_16', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_17', 'content_17', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_18', 'content_18', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_19', 'content_19', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_20', 'content_20', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_21', 'content_21', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_22', 'content_22', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_23', 'content_23', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_24', 'content_24', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_25', 'content_25', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_26', 'content_26', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_27', 'content_27', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_28', 'content_28', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_29', 'content_29', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_30', 'content_30', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_31', 'content_31', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_32', 'content_32', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_33', 'content_33', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_34', 'content_34', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_35', 'content_35', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_36', 'content_36', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_37', 'content_37', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_38', 'content_38', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_39', 'content_39', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_40', 'content_40', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_41', 'content_41', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_42', 'content_42', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_43', 'content_43', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_44', 'content_44', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_45', 'content_45', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_46', 'content_46', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_47', 'content_47', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_48', 'content_48', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_49', 'content_49', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_50', 'content_50', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_51', 'content_51', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_52', 'content_52', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_53', 'content_53', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_54', 'content_54', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_55', 'content_55', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_56', 'content_56', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_57', 'content_57', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_58', 'content_58', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_59', 'content_59', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_60', 'content_60', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_61', 'content_61', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_62', 'content_62', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_63', 'content_63', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_64', 'content_64', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_65', 'content_65', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_66', 'content_66', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_67', 'content_67', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_68', 'content_68', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_69', 'content_69', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_70', 'content_70', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_71', 'content_71', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_72', 'content_72', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_73', 'content_73', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_74', 'content_74', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_75', 'content_75', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_76', 'content_76', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_77', 'content_77', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_78', 'content_78', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_79', 'content_79', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_80', 'content_80', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_81', 'content_81', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_82', 'content_82', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_83', 'content_83', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_84', 'content_84', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_85', 'content_85', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_86', 'content_86', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_87', 'content_87', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_88', 'content_88', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_89', 'content_89', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_90', 'content_90', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_91', 'content_91', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_92', 'content_92', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_93', 'content_93', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_94', 'content_94', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_95', 'content_95', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_96', 'content_96', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_97', 'content_97', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_98', 'content_98', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_99', 'content_99', 'hongkd', now());

INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_100', 'content_100', 'hongkd', now());

INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_101', 'content_101', 'hongkd', now());

INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_102', 'content_102', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_103', 'content_103', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_104', 'content_104', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_105', 'content_105', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_106', 'content_106', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_107', 'content_107', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_108', 'content_108', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_109', 'content_109', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_110', 'content_110', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_111', 'content_111', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_112', 'content_112', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_113', 'content_113', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_114', 'content_114', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_115', 'content_115', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_116', 'content_116', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_117', 'content_117', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_118', 'content_118', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_119', 'content_119', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_120', 'content_120', 'hongkd', now());
INSERT INTO board (title, content, writer, reg_date)  VALUES ('title_121', 'content_121', 'hongkd', now());