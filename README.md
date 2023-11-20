# pg_mochocho

pg_mochochoは、おもに小麦粉からなる生地にあんこをいれて金属製焼き型で焼成した和菓子の名前を扱うPostgreSQLの拡張機能です。

拡張機能の名前は、この和菓子の名前のひとつとして流行した「ベイクドモチョチョ」からインスパイアされました。

## インストール

ソースコード入手後、構築対象となるPostgreSQLのpg_configプログラムへのPATHを指定してインストールします。pg_configはpostgresql-develパッケージに含まれています。

```
git clone https://github.com/kiskk/pg_mochocho.git
cd pg_mochocho
make USE_PGXS=1 PG_CONFIG=<PATH>/pg_config install
```

インストール後、利用したいデータベースに拡張機能をインストールします。

```
psql -d postgres
CREATE EXTENSION pg_mochocho;
```

## 使い方

### おもに小麦粉からなる生地にあんこをいれて金属製焼き型で焼成した和菓子の名前をランダムに取得する

`get_random_mochocho()` 関数は、ランダムな名前をひとつ返します。

```
postgres=# SELECT get_random_mochocho();
 get_random_mochocho
---------------------
 大判焼き
```

### おもに小麦粉からなる生地にあんこをいれて金属製焼き型で焼成した和菓子の名前を検証する

`verify_mochocho` 関数は、引数に指定された名前を検証します。

```
postgres=# SELECT verify_mochocho('大判焼き');
INFO:  大判焼き は、おもに小麦粉からなる生地にあんこをいれて金属製焼き型で焼成した和菓子の名称です。
 verify_mochocho
-----------------
 t

postgres=# SELECT verify_mochocho('おでん');
INFO:  おでん は、おもに小麦粉からなる生地にあんこをいれて金属製焼き型で焼成した和菓子の名称ではおそらくありません。
 verify_mochocho
-----------------
 f

```

### おもに小麦粉からなる生地にあんこをいれて金属製焼き型で焼成した和菓子の名前を追加する

名前は列挙型 `mochocho` で管理されています。

名前を追加したい場合は `mochocho` 型に任意の名前を追加してください。

```
postgres=# ALTER TYPE mochocho ADD VALUE 'ベイクドモチョモチョ';
ALTER TYPE
```

データ型 `mochocho` の一覧は、psqlのメタコマンド `dT+` で確認できます。

```
postgres=# \dT+ mochocho
```
