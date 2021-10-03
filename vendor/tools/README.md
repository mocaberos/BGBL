# 汎用ツールセット

# CodeBuild
## サブモジュールとして追加して利用する。
```shell
$ git submodule add https://github.com/mocaberos/tools.git ./vendor/tools

$ export PATH=$PATH:$(pwd)/vendor/tools/codebuild
```

## Dockerリポジトリにログインするコマンド
```shell
$ docker login
$ docker login --skip-ecr # ECRログインを行わない
```

## CodeBuildの実行環境変数を元に何をトリガーとして起動したか判定する
```shell
$ if trigger is release ?; then
$ if trigger is merge master ?; then
$ if trigger is pr ?; then
```

## AWSのIDを取得
```shell
$ aws-id
```

## CodeBuildのビルドログのページのURLを取得
```shell
$ result-url <CodeBuildのプロジェクト名>
```

## 名前からlambdaレイヤーの最新バージョン番号を取得
```shell
$ get-latest-layer-version LayerName
```

## 名前からlambdaレイヤーの最新バージョンのLayerVersionArnを取得
```shell
$ get-latest-layer-version-arn LayerName
```

## CodeBuildの実行環境変数を元にビルド結果を判定する
```shell
$ if result is success ?; then
$ if result is failure ?; then
```

## イメージをECRへプッシュする
```shell
$ push-to-ecr Project
```

## イメージをDockerHubへプッシュする
```shell
$ push-to-docker-hub Project
```

## 環境変数で指定された通知先に通知を送信する
```shell
$ export SLACK_WEBHOOK_URL="https://localhost/dummy"
$ notify HogeHoge
```

## イメージのリリースをSlackに通知する
```shell
$ notify-release-image Project
```

## Lambda関数のデプロイ状況をSlackに通知する
```shell
$ notify-update-lambda Project
```

## Lambda関数の設定更新状況をSlackに通知する
```shell
$ notify-update-lambda-config Project
```

## Lambdaレイヤーのデプロイ状況をSlackに通知する
```shell
$ notify-update-lambda-layer Project
```

## CIテストの結果をSlackに通知する
```shell
$ notify-build-result Project
```

## Gitの履歴から指定したコミットIDを検出する
```shell
$ detect-commit --current
$ detect-commit --base
```

# Dev
## リポジトリ内のサブモジュールを一括で更新する
```shell
$ ./dev/submodule/update
```

# Config
## .rubocop.yml
Ruby向けのコーディングスタイル定義
```ruby
group :development, :test do
  gem 'rubocop',             require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails',       require: false
  gem 'rubocop-rspec',       require: false
end
```
```yml
# .rubocop.yml

inherit_from: ./vendor/tools/config/rubocop.yml
```
