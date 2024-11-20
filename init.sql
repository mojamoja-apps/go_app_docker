CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID',
    name TEXT NOT NULL COMMENT '氏名',
    age INT COMMENT '年齢'
) COMMENT='ユーザー情報を格納するテーブル';


INSERT INTO users (name, age) VALUES
('佐藤 太郎', 25),
('鈴木 花子', 30),
('高橋 一郎', 22),
('田中 美咲', 28),
('伊藤 翔太', 35),
('山本 結衣', 27),
('中村 大輔', 40),
('小林 未来', 24),
('加藤 和也', 31),
('渡辺 由香', 29);
