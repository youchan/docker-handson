# Dockerハンズオン 中級編

%author: youchan

%icon: ![](youchan.jpg)

%duration: 1min

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

---

%large: たぶんこのへんで休憩

---

%large: DockerでRailsを動かそう

---

%large: Railsを知らないひとのために

※ gemとかbundlerとか…

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

