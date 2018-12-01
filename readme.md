## docker command
- docker-compose up -d
  - 起動
  - `-d` をつけない場合、コンテナがフォアグラウンドで実行されログが表示される
  - `control + c` で止めた場合、pidファイルが残り起動に失敗することがある
    - pidファイルを削除をすると治る
    - pidファイル...dockerがどのポートを使用したかが記載されているファイル
- docker-compose stop
  - 停止
- docker-compose down
  - コンテナの削除
- docker compose build
  - Gemfileを変更したときなど
- docker-compose run web bundle exec rails g model board name:string title:string body:text
  - model/migrationファイルの作成
- docker-compose run web bundle exec rake db:migrate
  - migrateコマンド

## debug
- binding.pry
- docker ps
- docker attach main_web_1
- control + p q

## routes
- http://localhost:3000/rails/info/routes

## seeds
- docker-compose exec web bundle exec rake db:seed

## annotate
- annotateをつける
- docker-compose exec web bundle exec annotate

- migrate時に自動でannotateがつくように
- docker-compose exec web bundle exec rails g annotate:install

## migrate
- 外部テーブルとの紐付け
- docker-compose run web bundle exec rails g model comment board:references name:strng commnet:text
