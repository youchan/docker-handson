# Dockerハンズオン 中級編

%author: youchan

%icon: ![](youchan.jpg)

%duration: 1min

## 自己紹介

%large: 大崎 瑶(よう)

%large: @youchan

## 自己紹介

%large: Rubyistです。

## RubyKaigi & RubyConf

* **RubyKaigi2015**: "Writing web application in Ruby"
* **RubyKaigi2016**: "Isomorphic web programming in Ruby"
* **RubyKaigi2017**: "dRuby on Browser"
* **RubyKaigi2018**: "How to get the dark power from ISeq"
* **RubyConf2018**: "Building web-based board games only with Ruby"

## 同人誌

* Pragmatic Opal
* ISeq探訪
* 猫と森羅と日本語とRuby

## 猫と森羅と日本語とRuby

![portlait-left](neko.jpg)

%right:

* 日本語の自然言語処理 + Ruby
* 湊川さんに表紙+イラストを書いていただきました！
* BOOTHにて絶賛販売中

https://youchan.booth.pm/items/1041946

---

%large: Dockerfileを書いてみよう

%large: ところでDockerfileってなに？

## 最初の一歩

**Dockerfile**

```
FROM alpine
```

## docker imageをビルドする

```
    $ docker build -t temple .
```

※ 最後のピリオド忘れないようにね！

## ビルドできた？

```
    $ docker images
    REPOSITORY                            TAG                 IMAGE ID            CREATED             SIZE
    temple                              latest              dcb037e1d29b        38 seconds ago      9.5MB
    alpine                                latest              11cd0b38bc3c        3 weeks ago         4.41MB
```

## 実行してみましょう

```
    $ docker run --rm temple --rm uname -a
    Linux 874fd214b983 4.9.93-linuxkit-aufs #1 SMP Wed Jun 6 16:55:56 UTC 2018 x86_64 Linux
```

## bashで中をみてみよう

```
    $ docker run --rm -it temple /bin/bash
```

## bashがない！！！？？？

実は`ash`

```
    $ docker run --rm -it temple /bin/ash
```

## bashをインストールしよう

**`Dockerfile`**

```
FROM alpine

RUN apk add --no-cache bash ruby
```

## bash

```
    $ docker run --rm -it temple /bin/bash
```

## Dockerfileのリファレンス

https://docs.docker.com/

## OSだけじゃあなにもできない

**`Dockerfile`**

```
RUN apk add --no-cache bash ruby
```

※ ファイルの一部を修正だよ！

## docker build

```
    $ docker build -t temple .
```

※ 次からdocker buildは書かないからね！

## Rubyを実行しよう

```
    $ docker run --rm -it temple ruby -e '(0..100).each{|i| print ("\r%3d%% "%i+"|"*i); sleep 0.1}'
```

## ファイルから実行しよう

**`progress.rb`**

```ruby
(0..100).each{|i| print ("\r%3d%% "%i+"|"*i); sleep 0.1}
```

## ???

```
    $ docker run --rm -it temple ruby progress.rb
```

## docker imageにファイルをコピー

**`Dockerfile`**

```
FROM ruby:alpine

RUN apk add --no-cache bash

WORKDIR /temple

COPY progress.rb .

CMD ruby progress.rb
```

## docker run!

```
    $ docker run --rm -it temple
```


## コンテキストとは？

```
    $ docker build -t temple .
```

※ 最後のピリオドがコンテキストだよ！

## それでもローカルのファイルを実行したい

**`Dockerfile`**

```
FROM ruby:alpine

RUN apk add --no-cache bash

WORKDIR /temple
```

## ボリュームマウントを使うのだ！

```
    $ docker run --rm -it -v ${PWD}:/temple temple ruby progress.rb
```

## Coffee break

![middle](coffee.jpg)

## DockerでRailsを動かそう

![portlait](rails.png)

---

%large: Railsを知らないひとのために

※ gemとかbundlerとか…

## rubygems(gem)

* Rubyのライブラリのパッケージシステム
* JavaScriptの`npm`、Pythonなら`pip`

## bundler

* 複数のバージョンの`gem`を切り換えて使うためにある
* アプリケーションで使う`gem`を特定のバージョンに固定できる
* `Gemfile`で管理

## Gemfile

```ruby
# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem "rails"
```

## imageにRailsをインストールするよ！

```
FROM ruby:alpine

RUN apk add --no-cache bash tzdata libxml2-dev libxslt-dev sqlite sqlite-dev nodejs

WORKDIR /temple

COPY Gemfile .

RUN set -ex \
 && apk add --no-cache --virtual .build-dep build-base \
 && gem install nokogiri \
   -- --use-system-libraries \
   --with-xml2-config=/usr/bin/xml2-config \
   --with-xslt-config=/usr/bin/xslt-config \
 && bundle install \
 && apk del .build-dep
```

## Rails new

```
    $ docker run --rm -it -v `pwd`:/temple temple rails new . --skip-bundle
```

※ もう一度docker buildしてね！

## Rails serverを起動しよう

```
    $ docker run --rm -it -v `pwd`:/temple -p 3000:3000 temple rails server
```

## `docker run --rm` ほげほげ面倒でござる！

**`.aliases`**

```
alias rails="docker run --rm -it -v `pwd`:/temple -p 3000:3000 temple rails"
```

## 簡単なアプリをつくる

```
    $ rails g scaffold memos title:string body:text
    $ rails db:migrate
    $ rails server
```

http://localhost:3000

---

%large: データベース(progres)をつかおう！

## `Gemfile`に`pg` gemを追加しよう

**`Gemfile`**

```
gem 'pg'
```

## ついでに面倒なので以下はコメントアウトしておく

```
  #gem 'capybara', '>= 2.15', '< 4.0'
  #gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  #gem 'chromedriver-helper'
```

## docker imageにpostgres-devをインストールする

```
RUN apk add --no-cache bash tzdata libxml2-dev libxslt-dev sqlite sqlite-dev nodejs postgresql-dev
```

※ `apk add`するとこだけ書き換えてね！

---

%large: ここでdocker build!

## Railsからpostgresを使うように設定

**`config/database.yml`**の`development`を以下のように書き換えて

```
development:
  adapter: postgresql
  encoding: unicode
  database: temple
  pool: 5
  username: postgres
  password: topsecret
  host: db
```

## データベース(postgres)を準備

```
    $ docker pull postgres:alpine
```

## データベースを起動

```
    $ docker run --name=temple-db -e POSTGRES_PASSWORD=topsecret -d -p 5432:5432 postgres:alpine
```

## Railsからデータベースを参照するようにする

**`.aliases`**

```
alias rails="docker run --rm -it -v `pwd`:/temple -p 3000:3000 --link temple-db:db temple rails"
```

## では動かしてみましょう

```
    $ rails db:create db:migrate
    $ rails server
```

http://localhost:3000

## docker-compose

* `docker run`の引数がどんどん長くなる
* しかも起動するコンテナが1つだけじゃない！
* そんなお悩みをお持ちのあなたに！

---
**`docker-compose.yml`**

```yaml
version: '3'
services:
  app:
    build: .
    ports:
      - "3000:3000"
    volumes:
      - .:/temple
    links:
      - db
    command: bin/rails server
  db:
    image: postgres
    environment:
      - POSTGRES_PASSWORD=topsecret      
    expose:
      - "5432"
    volumes:
      - pgdata:/var/lib/postgresql/data
volumes:
  pgdata:
```

