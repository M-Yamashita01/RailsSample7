# Docker Compose でRails + MySQL環境を起動する

## 前提条件

- Docker Desktop がインストールされていること
- Docker Compose が使用可能なこと

## 起動方法

### 1. 初回起動

```bash
# イメージのビルドとコンテナの起動
docker-compose up --build

# または、バックグラウンドで起動する場合
docker-compose up -d --build
```

### 2. データベースのセットアップ

別のターミナルを開いて以下を実行：

```bash
# データベースの作成とマイグレーション
docker-compose exec web rails db:create
docker-compose exec web rails db:migrate

# Ridgepoleを使用している場合
docker-compose exec web bundle exec ridgepole -c config/database.yml -E development --apply -f db/Schemafile
```

### 3. アプリケーションへのアクセス

ブラウザで以下のURLにアクセス：
- Rails: http://localhost:3000
- MySQL: localhost:3306 (外部ツールから接続可能)

## 基本的なコマンド

```bash
# コンテナの起動
docker-compose up

# コンテナの停止
docker-compose down

# コンテナを停止してボリュームも削除
docker-compose down -v

# ログの確認
docker-compose logs -f web
docker-compose logs -f db

# Railsコンソールの起動
docker-compose exec web rails console

# コンテナに入る
docker-compose exec web bash

# bundle install（Gemfileを更新した場合）
docker-compose exec web bundle install

# テストの実行
docker-compose exec web rspec

# データベースのリセット
docker-compose exec web rails db:reset
```

## データベース接続情報

- **ホスト**: db (Docker内部) / localhost (ホストマシンから)
- **ポート**: 3306
- **ユーザー名**: root
- **パスワード**: password
- **データベース名**: sample_development

## トラブルシューティング

### ポート3000が既に使用されている場合

`docker-compose.yml`の`web`サービスのポート設定を変更：

```yaml
ports:
  - "3001:3000"  # ホストの3001番ポートを使用
```

### データベース接続エラーが発生する場合

1. MySQLコンテナが起動しているか確認：
```bash
docker-compose ps
```

2. データベースの状態を確認：
```bash
docker-compose exec db mysql -uroot -ppassword -e "SHOW DATABASES;"
```

3. コンテナを再起動：
```bash
docker-compose restart
```

### Gemを追加した場合

```bash
# イメージを再ビルド
docker-compose build web

# または、コンテナ内でbundle install
docker-compose exec web bundle install
```

## ファイル構成

```
.
├── docker-compose.yml          # Docker Composeの設定ファイル
├── .env.sample                 # 環境変数のサンプルファイル
└── sample/
    ├── Dockerfile              # Railsアプリケーション用のDockerfile
    ├── .dockerignore           # Dockerビルド時に除外するファイル
    ├── bin/docker-entrypoint   # コンテナ起動時のエントリーポイント
    └── config/database.yml     # データベース設定（環境変数対応）
```

