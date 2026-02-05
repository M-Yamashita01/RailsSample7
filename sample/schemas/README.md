# Schema Files

このディレクトリには、Ridgepoleで使用するテーブル定義ファイルを配置します。

## ファイル命名規則

- テーブルごとに1ファイル作成
- ファイル名: `<table_name>.rb` （例: `users.rb`, `posts.rb`）
- アルファベット順に読み込まれます

## 記法例

### 基本的なテーブル定義

```ruby
# frozen_string_literal: true

create_table :users, force: :cascade do |t|
  t.string :name, null: false
  t.string :email, null: false
  t.text :bio
  t.integer :age
  
  t.timestamps
end

add_index :users, :email, unique: true
```

### 外部キー制約

```ruby
create_table :posts, force: :cascade do |t|
  t.references :user, null: false, foreign_key: true
  t.string :title, null: false
  t.text :content
  
  t.timestamps
end

add_index :posts, :user_id
```

## IDEの恩恵

.rbファイルとして定義することで、以下の恩恵が得られます：

- シンタックスハイライト
- コード補完
- リンター/フォーマッターの適用
- 構文エラーの即座な検出

## 使い方

1. 新しいテーブルを追加する場合は、このディレクトリに `.rb` ファイルを作成
2. `Schemafile` が自動的に全てのファイルを読み込みます
3. Ridgepoleを実行してデータベースに反映

```bash
# 開発環境
bundle exec ridgepole -c config/database.yml -E development --apply -f Schemafile

# Docker環境
docker-compose exec web bundle exec ridgepole -c config/database.yml -E development --apply -f Schemafile
```

