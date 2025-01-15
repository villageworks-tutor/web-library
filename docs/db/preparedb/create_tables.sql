use weblibrarydb

DROP TABLE IF EXISTS nippon_decimal_classifications;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS loan_details;
DROP TABLE IF EXISTS loan_activities;
DROP TABLE IF EXISTS inventories;
DROP TABLE IF EXISTS bibliographies;
DROP TABLE IF EXISTS authentications;
DROP TABLE IF EXISTS users;

/**********************************/
/* テーブル名: 日本十進分類コード表 */
/**********************************/
CREATE TABLE nippon_decimal_classifications (
	code INTEGER(10) NOT NULL COMMENT '類',
	name VARCHAR(8)  NOT NULL COMMENT '分野'
) COMMENT='日本十進分類表';

/**********************************/
/* テーブル名: ロールマスタ */
/**********************************/
CREATE TABLE roles (
	id   INTEGER(1) NOT NULL COMMENT 'ロールID',
	name VARCHAR(8) NOT NULL COMMENT 'ロール名'
) COMMENT='ユーザロールマスタ';

/**********************************/
/* テーブル名: 利用者 */
/**********************************/
CREATE TABLE users(
		id         INTEGER(10)  NOT NULL AUTO_INCREMENT            COMMENT '利用者ID',
		name       VARCHAR(20)  NOT NULL                           COMMENT '利用者名',
		zipcode    CHAR(8)      NOT NULL                           COMMENT '郵便番号',
		address    VARCHAR(255) NOT NULL                           COMMENT '住所',
		phone      CHAR(13)     NOT NULL                           COMMENT '電話番号',
		email      VARCHAR(255)	NOT NULL UNIQUE                    COMMENT '電子メールアドレス',
		signup_at  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録日時',
		updated_at TIMESTAMP        NULL DEFAULT NULL              COMMENT '更新日時',
		deleted_at TIMESTAMP        NULL DEFAULT NULL              COMMENT '削除日時',
		PRIMARY KEY (id)
) COMMENT='利用者';

/**********************************/
/* テーブル名: 認証 */
/**********************************/
CREATE TABLE authentications(
		email	     VARCHAR(255)	NOT NULL UNIQUE                    COMMENT '電子メールアドレス',
		password   VARCHAR(64)  NOT NULL                           COMMENT 'パスワード',
		role       INTEGER(1)   NOT NULL                           COMMENT 'ユーザロール',
		created_at TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録日時',
		updated_at TIMESTAMP        NULL DEFAULT NULL              COMMENT '更新日時',
		deleted_at TIMESTAMP        NULL DEFAULT NULL              COMMENT '削除日時',
		PRIMARY KEY (email),
		FOREIGN KEY (email) REFERENCES users (email) ON DELETE CASCADE
) COMMENT='認証';

/**********************************/
/* テーブル名: 書誌台帳 */
/**********************************/
CREATE TABLE bibliographies(
		id INTEGER(10)            NOT NULL AUTO_INCREMENT            COMMENT '資料ID',
		type INTEGER(1) 		      NOT NULL                           COMMENT '資料種別',
		ndc  INTEGER(1)           NOT NULL                           COMMENT '日本十進分類コード',
		code CHAR(13)		          NOT NULL                           COMMENT '資料コード',
		title VARCHAR(255)		    NOT NULL                           COMMENT '資料タイトル',
		author TEXT		                NULL                           COMMENT '著作者',
		publisher VARCHAR(100)		NOT NULL                           COMMENT '出版社',
		published_on INTEGER(10)	NOT NULL                           COMMENT '出版年',
		price        INTEGER(10) 	NOT NULL                           COMMENT '価格',
		created_at   TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録日時',
		updated_at   TIMESTAMP        NULL DEFAULT NULL              COMMENT '更新日時',
		deleted_at   TIMESTAMP        NULL DEFAULT NULL              COMMENT '削除日時',
		PRIMARY KEY(id)
) COMMENT='書誌台帳';

/**********************************/
/* テーブル名: 資料管理台帳 */
/**********************************/
CREATE TABLE inventories(
		id         INTEGER(10) NOT NULL AUTO_INCREMENT            COMMENT '管理ID',
		code       CHAR(13)    NOT NULL                           COMMENT '資料コード',
		require_id CHAR(10)    NOT NULL                           COMMENT '請求番号',
		status     INTEGER(10) NOT NULL                           COMMENT '配架状況',
		memo       TEXT            NULL                           COMMENT '備考',
		created_at TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録日時',
		updated_at TIMESTAMP       NULL                           COMMENT '更新日時',
		deleted_at TIMESTAMP       NULL                           COMMENT '削除日時',
		PRIMARY KEY (id)
) COMMENT='資料管理台帳';

/**********************************/
/* テーブル名: 貸出台帳 */
/**********************************/
CREATE TABLE loan_activities(
		id          INTEGER(10)	NOT NULL AUTO_INCREMENT       COMMENT '台帳ID',
		user_id     INTEGER(10)	NOT NULL                      COMMENT '利用者ID',
		status      INTEGER(10) NOT NULL                      COMMENT '貸出状況',
		loan_date   DATE        NOT NULL                      COMMENT '貸出日',
		due_date    DATE        NOT NULL DEFAULT CURRENT_DATE COMMENT '貸出期限',
		return_date DATE		        NULL                      COMMENT '返却日',
		PRIMARY KEY (id)
) COMMENT='貸出台帳';

/**********************************/
/* テーブル名: 貸出明細 */
/**********************************/
CREATE TABLE loan_details(
		id         INTEGER(10) NOT NULL AUTO_INCREMENT           COMMENT '明細ID',
		loan_id    INTEGER(10) NOT NULL                          COMMENT '貸出台帳ID',
		require_id CHAR(10)		 NOT NULL                          COMMENT '請求番号',
		status     INTEGER(10) NOT NULL                          COMMENT '貸出状況',
		PRIMARY KEY (id),
		FOREIGN KEY (loan_id) REFERENCES loan_activities (id)
) COMMENT='貸出明細';


