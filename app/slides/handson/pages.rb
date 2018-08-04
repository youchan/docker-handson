class Gibier::Page0 < Gibier::PageBase
def header
  h1(nil, "Dockerハンズオン 中級編")
end

def content
  [].tap do |children|
      children << p({className:"author"}, "youchan")
      children << p({className:"icon"}, p({class:""}, img({src:"#{Gibier.assets_path}/images/youchan.jpg"}, "")))
      children << p({className:"duration"}, "1min")
  end
end
end

class Gibier::Page1 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "Dockerfileを書いてみよう")
      children << p({className:"large"}, "ところでDockerfileってなに？")
  end
end
end

class Gibier::Page2 < Gibier::PageBase
def header
  h2(nil, "最初の一歩")
end

def content
  [].tap do |children|
      children << p(nil, strong(nil, "Dockerfile"))
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1</pre></td><td class="code"><pre>FROM alpine
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page3 < Gibier::PageBase
def header
  h2(nil, "docker imageをビルドする")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1</pre></td><td class="code"><pre>    $ docker build -t temple .
</pre></td></tr></tbody></table>
</div>
} } })
      children << p(nil, "※ 最後のピリオド忘れないようにね！")
  end
end
end

class Gibier::Page4 < Gibier::PageBase
def header
  h2(nil, "ビルドできた？")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4</pre></td><td class="code"><pre>    $ docker images
    REPOSITORY                            TAG                 IMAGE ID            CREATED             SIZE
    temple                              latest              dcb037e1d29b        38 seconds ago      9.5MB
    alpine                                latest              11cd0b38bc3c        3 weeks ago         4.41MB
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page5 < Gibier::PageBase
def header
  h2(nil, "実行してみましょう")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2</pre></td><td class="code"><pre>    $ docker run --rm temple --rm uname -a
    Linux 874fd214b983 4.9.93-linuxkit-aufs #1 SMP Wed Jun 6 16:55:56 UTC 2018 x86_64 Linux
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page6 < Gibier::PageBase
def header
  h2(nil, "bashで中をみてみよう")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1</pre></td><td class="code"><pre>    $ docker run --rm -it temple /bin/bash
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page7 < Gibier::PageBase
def header
  h2(nil, "bashがない！！！？？？")
end

def content
  [].tap do |children|
      children << p(nil, "実は",code(nil, "ash"))
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1</pre></td><td class="code"><pre>    $ docker run --rm -it temple /bin/ash
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page8 < Gibier::PageBase
def header
  h2(nil, "bashをインストールしよう")
end

def content
  [].tap do |children|
      children << p(nil, strong(nil, code(nil, "Dockerfile")))
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3</pre></td><td class="code"><pre>FROM alpine

RUN apk add --no-cache bash ruby
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page9 < Gibier::PageBase
def header
  h2(nil, "bash")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1</pre></td><td class="code"><pre>    $ docker run --rm -it temple /bin/bash
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page10 < Gibier::PageBase
def header
  h2(nil, "Dockerfileのリファレンス")
end

def content
  [].tap do |children|
      children << p(nil, a({href:"https://docs.docker.com/", target:"_brank"}, "https://docs.docker.com/"))
  end
end
end

class Gibier::Page11 < Gibier::PageBase
def header
  h2(nil, "OSだけじゃあなにもできない")
end

def content
  [].tap do |children|
      children << p(nil, strong(nil, code(nil, "Dockerfile")))
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1</pre></td><td class="code"><pre>RUN apk add --no-cache bash ruby
</pre></td></tr></tbody></table>
</div>
} } })
      children << p(nil, "※ ファイルの一部を修正だよ！")
  end
end
end

class Gibier::Page12 < Gibier::PageBase
def header
  h2(nil, "docker build")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1</pre></td><td class="code"><pre>    $ docker build -t temple .
</pre></td></tr></tbody></table>
</div>
} } })
      children << p(nil, "※ 次からdocker buildは書かないからね！")
  end
end
end

class Gibier::Page13 < Gibier::PageBase
def header
  h2(nil, "Rubyを実行しよう")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1</pre></td><td class="code"><pre>    $ docker run --rm -it temple ruby -e '(0..100).each{|i| print ("\r%3d%% "%i+"|"*i); sleep 0.1}'
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page14 < Gibier::PageBase
def header
  h2(nil, "ファイルから実行しよう")
end

def content
  [].tap do |children|
      children << p(nil, strong(nil, code(nil, "progress.rb")))
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1</pre></td><td class="code"><pre><span class="p">(</span><span class="mi">0</span><span class="p">.</span><span class="nf">.</span><span class="mi">100</span><span class="p">).</span><span class="nf">each</span><span class="p">{</span><span class="o">|</span><span class="n">i</span><span class="o">|</span> <span class="nb">print</span> <span class="p">(</span><span class="s2">"</span><span class="se">\r</span><span class="s2">%3d%% "</span><span class="o">%</span><span class="n">i</span><span class="o">+</span><span class="s2">"|"</span><span class="o">*</span><span class="n">i</span><span class="p">);</span> <span class="nb">sleep</span> <span class="mi">0</span><span class="o">.</span><span class="mi">1</span><span class="p">}</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page15 < Gibier::PageBase
def header
  h2(nil, "???")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1</pre></td><td class="code"><pre>    $ docker run --rm -it temple ruby progress.rb
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page16 < Gibier::PageBase
def header
  h2(nil, "docker imageにファイルをコピー")
end

def content
  [].tap do |children|
      children << p(nil, strong(nil, code(nil, "Dockerfile")))
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5
6
7
8
9</pre></td><td class="code"><pre>FROM ruby:alpine

RUN apk add --no-cache bash

WORKDIR /temple

COPY progress.rb .

CMD ruby progress.rb
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page17 < Gibier::PageBase
def header
  h2(nil, "docker run!")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1</pre></td><td class="code"><pre>    $ docker run --rm -it temple
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page18 < Gibier::PageBase
def header
  h2(nil, "コンテキストとは？")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1</pre></td><td class="code"><pre>    $ docker build -t temple .
</pre></td></tr></tbody></table>
</div>
} } })
      children << p(nil, "※ 最後のピリオドがコンテキストだよ！")
  end
end
end

class Gibier::Page19 < Gibier::PageBase
def header
  h2(nil, "それでもローカルのファイルを実行したい")
end

def content
  [].tap do |children|
      children << p(nil, strong(nil, code(nil, "Dockerfile")))
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5</pre></td><td class="code"><pre>FROM ruby:alpine

RUN apk add --no-cache bash

WORKDIR /temple
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page20 < Gibier::PageBase
def header
  h2(nil, "ボリュームマウントを使うのだ！")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1</pre></td><td class="code"><pre>    $ docker run --rm -it -v ${PWD}:/temple temple ruby progress.rb
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page21 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "たぶんこのへんで休憩")
  end
end
end

class Gibier::Page22 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "DockerでRailsを動かそう")
  end
end
end

class Gibier::Page23 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "Railsを知らないひとのために")
      children << p(nil, "※ gemとかbundlerとか…")
  end
end
end

class Gibier::Page24 < Gibier::PageBase
def header
  h2(nil, "imageにRailsをインストールするよ！")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16</pre></td><td class="code"><pre>FROM ruby:alpine

RUN apk add --no-cache bash tzdata libxml2-dev libxslt-dev sqlite sqlite-dev nodejs

WORKDIR /temple

COPY Gemfile .

RUN set -ex \
 &amp;&amp; apk add --no-cache --virtual .build-dep build-base \
 &amp;&amp; gem install nokogiri \
   -- --use-system-libraries \
   --with-xml2-config=/usr/bin/xml2-config \
   --with-xslt-config=/usr/bin/xslt-config \
 &amp;&amp; bundle install \
 &amp;&amp; apk del .build-dep
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page25 < Gibier::PageBase
def header
  h2(nil, "Rails new")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1</pre></td><td class="code"><pre>    $ docker run --rm -it -v `pwd`:/temple temple rails new . --skip-bundle
</pre></td></tr></tbody></table>
</div>
} } })
      children << p(nil, "※ もう一度docker buildしてね！")
  end
end
end

class Gibier::Page26 < Gibier::PageBase
def header
  h2(nil, "Rails serverを起動しよう")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1</pre></td><td class="code"><pre>    $ docker run --rm -it -v `pwd`:/temple -p 3000:3000 temple rails server
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page27 < Gibier::PageBase
def header
  h2(nil, code(nil, "docker run --rm")," ほげほげ面倒でござる！")
end

def content
  [].tap do |children|
      children << p(nil, strong(nil, code(nil, ".aliases")))
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1</pre></td><td class="code"><pre>alias rails="docker run --rm -it -v `pwd`:/temple -p 3000:3000 temple rails"
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page28 < Gibier::PageBase
def header
  h2(nil, "簡単なアプリをつくる")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3</pre></td><td class="code"><pre>    $ rails g scaffold memos title:string body:text
    $ rails db:migrate
    $ rails server
</pre></td></tr></tbody></table>
</div>
} } })
      children << p(nil, a({href:"http://localhost:3000", target:"_brank"}, "http://localhost:3000"))
  end
end
end

class Gibier::Page29 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "データベース(progres)をつかおう！")
  end
end
end

class Gibier::Page30 < Gibier::PageBase
def header
  h2(nil, code(nil, "Gemfile"),"に",code(nil, "pg")," gemを追加しよう")
end

def content
  [].tap do |children|
      children << p(nil, strong(nil, code(nil, "Gemfile")))
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1</pre></td><td class="code"><pre>gem 'pg'
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page31 < Gibier::PageBase
def header
  h2(nil, "ついでに面倒なので以下はコメントアウトしておく")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4</pre></td><td class="code"><pre>  #gem 'capybara', '&gt;= 2.15', '&lt; 4.0'
  #gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  #gem 'chromedriver-helper'
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page32 < Gibier::PageBase
def header
  h2(nil, "docker imageにpostgres-devをインストールする")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1</pre></td><td class="code"><pre>RUN apk add --no-cache bash tzdata libxml2-dev libxslt-dev sqlite sqlite-dev nodejs postgresql-dev
</pre></td></tr></tbody></table>
</div>
} } })
      children << p(nil, "※ ",code(nil, "apk add"),"するとこだけ書き換えてね！")
  end
end
end

class Gibier::Page33 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "ここでdocker build!")
  end
end
end

class Gibier::Page34 < Gibier::PageBase
def header
  h2(nil, "Railsからpostgresを使うように設定")
end

def content
  [].tap do |children|
      children << p(nil, strong(nil, code(nil, "config/database.yml")),"の",code(nil, "development"),"を以下のように書き換えて")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5
6
7
8</pre></td><td class="code"><pre>development:
  adapter: postgresql
  encoding: unicode
  database: temple
  pool: 5
  username: postgres
  password: topsecret
  host: db
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page35 < Gibier::PageBase
def header
  h2(nil, "データベース(postgres)を準備")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1</pre></td><td class="code"><pre>    $ docker pull postgres:alpine
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page36 < Gibier::PageBase
def header
  h2(nil, "データベースを起動")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1</pre></td><td class="code"><pre>    $ docker run --name=temple-db -e POSTGRES_PASSWORD=topsecret -d -p 5432:5432 postgres:alpine
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page37 < Gibier::PageBase
def header
  h2(nil, "Railsからデータベースを参照するようにする")
end

def content
  [].tap do |children|
      children << p(nil, strong(nil, code(nil, ".aliases")))
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1</pre></td><td class="code"><pre>alias rails="docker run --rm -it -v `pwd`:/temple -p 3000:3000 --link temple-db:db temple rails"
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page38 < Gibier::PageBase
def header
  h2(nil, "では動かしてみましょう")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2</pre></td><td class="code"><pre>    $ rails db:create db:migrate
    $ rails server
</pre></td></tr></tbody></table>
</div>
} } })
      children << p(nil, a({href:"http://localhost:3000", target:"_brank"}, "http://localhost:3000"))
  end
end
end

class Gibier::Page39 < Gibier::PageBase
def header
  h2(nil, "docker-compose")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, code(nil, "docker run"),"の引数がどんどん長くなる"),
                    li(nil, "しかも起動するコンテナが1つだけじゃない！"),
                    li(nil, "そんなお悩みをお持ちのあなたに！")
      )
  end
end
end

class Gibier::Page40 < Gibier::PageBase
def content
  [].tap do |children|
      children << p(nil, strong(nil, code(nil, "docker-compose.yml")))
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21</pre></td><td class="code"><pre>version: '3'
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
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

Gibier.page_count = 41
Gibier.title = "Dockerハンズオン 中級編"
