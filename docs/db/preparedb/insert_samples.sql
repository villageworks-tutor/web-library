DELETE FROM bibliographies;
DELETE FROM users;
DELETE FROM roles;
DELETE FROM nippon_decimal_classifications;

INSERT INTO nippon_decimal_classifications VALUES
	(0, '総記'),
	(1, '哲学・宗教'),
	(2, '歴史・地理'),
	(3, '社会科学'),
	(4, '自然科学'),
	(5, '技術、家庭、工業'),
	(6, '産業'),
	(7, '芸術、体育'),
	(8, '言語'),
	(9, '文学');

INSERT INTO roles VALUES
	(1, 'システム管理者'),
	(2, '一般ユーザ'),
	(3, 'ゲスト');

INSERT INTO users (name, zipcode, address, phone, email) VALUES
('大田 蜀山人', '390-0026', '東京都新宿区中町', '090-7777-8888', 'user00@example.com'),
('吉田 真一', '250-0012', '東京都府中市府中12-12-12', '090-2222-3333', 'user11@example.com'),
('石井 美加', '260-0013', '東京都調布市調布13-13-13', '090-3333-4444', 'user02@example.com'),
('松本 彩', '270-0014', '東京都町田市町田14-14-14', '090-4444-5555', 'user13@example.com'),
('長谷川 志郎', '280-0015', '東京都狛江市狛江15-15-15', '090-5555-6666', 'user14@example.com'),
('森田 和夫', '290-0016', '東京都西東京市西東京16-16-16', '090-6666-7777', 'user05@example.com'),
('尾崎 春子', '350-0022', '東京都清瀬市清瀬22-22-22', '090-3333-4444', 'user06@example.com'),
('岡田 篤志', '360-0023', '東京都東大和市東大和23-23-23', '090-4444-5555', 'user17@example.com'),
('山口 智子', '370-0024', '東京都日野市日野24-24-24', '090-5555-6666', 'user08@example.com'),
('伊藤 若冲', '604-8063', '京都錦小路', '090-6666-7777', 'user09@example.com');

INSERT INTO authentications (email, password, role) VALUES
('user00@example.com', 'pass00', 1),
('user09@example.com', 'pass09', 1),
('user11@example.com', 'pass11', 2),
('user13@example.com', 'pass13', 2),
('user14@example.com', 'pass14', 2),
('user17@example.com', 'pass17', 2);




INSERT INTO bibliographies (type, ndc, code, title, author, publisher, published_on, price, created_at, updated_at, deleted_at) VALUES
(1, 5, 'B001234567890', 'Javaプログラミング入門', '山田太郎', '技術書出版', 2020, 3500, NOW(), NULL, NULL),
(1, 7, 'B001234567891', 'PHPとMySQLの基礎', '佐藤花子', 'プログラミング出版社', 2019, 3000, NOW(), NULL, NULL),
(2, 3, 'B001234567892', 'システム開発のための設計手法', '鈴木一郎', 'ソフトウェア出版社', 2021, 4200, NOW(), NULL, NULL),
(1, 6, 'B001234567893', 'AIによるデータ分析入門', '田中浩二', 'AI学術出版', 2020, 4800, NOW(), NULL, NULL),
(3, 9, 'B001234567894', 'デザインパターン実践', '高橋明', 'コンピュータ技術出版', 2018, 3500, NOW(), NULL, NULL),
(2, 2, 'B001234567895', 'フロントエンド開発の新常識', '木村英明', 'ウェブ開発出版社', 2022, 2700, NOW(), NULL, NULL),
(1, 8, 'B001234567896', 'Pythonプログラミング実践ガイド', '渡辺奈々', 'エンジニア出版', 2017, 3200, NOW(), NULL, NULL),
(1, 4, 'B001234567897', 'Webアプリケーション開発の教科書', '小林健太', '技術書出版', 2020, 4000, NOW(), NULL, NULL),
(2, 1, 'B001234567898', 'セキュリティの基本', '三浦圭介', 'セキュリティ学会出版', 2021, 3300, NOW(), NULL, NULL),
(3, 7, 'B001234567899', 'フレームワーク徹底解説', '岡田茂', '開発者出版', 2020, 3800, NOW(), NULL, NULL),
(1, 3, 'B001234567900', 'HTML5とCSS3の基礎', '中村優子', 'デザイン出版社', 2023, 2500, NOW(), NULL, NULL),
(2, 5, 'B001234567901', 'ソフトウェアテストの実務', '林真理子', '開発者出版', 2021, 3900, NOW(), NULL, NULL),
(1, 6, 'B001234567902', 'データベース設計と運用', '高田明', 'コンピュータ技術出版', 2019, 2800, NOW(), NULL, NULL),
(1, 9, 'B001234567903', 'アジャイル開発実践', '井上誠', '開発者出版社', 2018, 4200, NOW(), NULL, NULL),
(3, 4, 'B001234567904', 'Reactの基礎から応用', '安藤真由美', 'ウェブ開発出版社', 2020, 3600, NOW(), NULL, NULL),
(2, 8, 'B001234567905', 'クラウドコンピューティング入門', '佐藤洋一', '技術書出版', 2022, 2800, NOW(), NULL, NULL),
(1, 1, 'B001234567906', 'コンピュータネットワークの基礎', '白石恵', 'ネットワーク学会出版', 2020, 3300, NOW(), NULL, NULL),
(2, 2, 'B001234567907', 'パフォーマンス最適化の技術', '前田俊介', '開発者出版', 2021, 3500, NOW(), NULL, NULL),
(1, 5, 'B001234567908', 'C#プログラミング入門', '吉田直子', 'プログラミング出版社', 2023, 3700, NOW(), NULL, NULL),
(1, 8, 'B001234567909', 'マイクロサービスアーキテクチャ実践', '堀田賢', 'ソフトウェア技術出版', 2022, 4000, NOW(), NULL, NULL);
