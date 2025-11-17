# rails-practice
Rails 勉強用

## 開発用 PostgreSQL を docker-compose で起動する

このリポジトリには、PostgreSQL を起動するための `docker-compose.yml` と、Rails からの接続情報を `.env` ファイルで管理する設定を追加しています。

### 事前準備

1. `.env` を作成
   ```sh
   cp .env.example .env
   # 必要に応じてユーザー名/パスワード/ポート/DB 名を編集
   ```

2. Docker で DB を起動
   ```sh
   docker compose up -d postgres
   # 初回はイメージのダウンロードとボリューム作成が行われます
   # ヘルスチェックで起動完了を待つには:
   docker compose ps
   ```

3. Rails 側の DB 準備
   ```sh
   bin/rails db:prepare
   # 既に DB がある場合は、必要に応じて db:migrate を使用
   ```

### 接続情報 (.env)

`.env` に設定した値が `config/database.yml` から読み込まれます。例:

```
DB_HOST=localhost
DB_PORT=5432
DB_USER=postgres
DB_PASSWORD=postgres
DB_NAME=rails_practice_development
DB_NAME_TEST=rails_practice_test
```

または、`DATABASE_URL` を設定すると、URL が優先されます:

```
DATABASE_URL=postgres://postgres:postgres@localhost:5432/rails_practice_development
```

### 備考

- `.env` は `.gitignore` 済みです。
- `dotenv-rails` を導入済みのため、開発/テスト環境では `.env` が自動で読み込まれます。
- `docker-compose.yml` は `.env` の値を使って `postgres` コンテナを起動します。
- Windows/WSL 環境では `localhost:5432` で接続可能です。ポート競合時は `.env` の `DB_PORT` を変更してください。
