# Railsチュートリアル 練習用リポジトリ


production環境で使うgemは除く
```
$ bundle install --without production
```

マイグレーションを実行
```
$ rails db:migrate
```

テスト実行
```
$ rails test
```

サーバーを起動
```
$ rails server
```

Heroku
https://arcane-inlet-48332.herokuapp.com/ | https://git.heroku.com/arcane-inlet-48332.git

本番環境のログ取得
```
$ heroku logs
```