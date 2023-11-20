\echo Use "CREATE EXTENSION pg_mochocho" to load this file. \quit

CREATE TYPE mochocho AS ENUM (
 'あじまん',
 'あづま焼',
 'あづま焼き',
 'あまやき',
 'あんこ饅頭',
 'えびす焼き',
 'オバントク',
 'おやき',
 'おやつ饅頭',
 'お竹饅頭',
 'カスタードパンケーキ',
 'がめこもぢ',
 'カルチャー焼',
 'ぎし焼き',
 'きんつば',
 'こがねやき',
 'しばらく',
 'じまんやき',
 'ずぼら焼き',
 'ずんどう焼き',
 'ちゃっぽろ焼き',
 'どてきん',
 'どらこ焼き',
 'ドラ焼き',
 'どりこの焼き',
 'ぱんじゅうやき',
 'ピーパン',
 'ひぎり焼',
 'びっくり饅頭',
 'ヒット焼き',
 'ふうまん',
 'ベイクドモチョチョ',
 'ホームラン焼き',
 'ホッペ焼き',
 'まんまる焼き',
 'めおとまんじゅう',
 'やなぎ饅頭',
 '円盤焼',
 '横綱まんじゅう',
 '黄金焼',
 '黄金饅頭',
 '花見焼き',
 '回転焼',
 '回転焼き',
 '回転饅頭',
 '甘太郎焼',
 '栗まんじゅう',
 '御座候',
 '紅豆餅',
 '今川焼',
 '今川焼き',
 '三笠焼',
 '暫',
 '志゛まんやき',
 '自慢焼',
 '七越焼き',
 '七尾焼き',
 '車輪餅',
 '焼き饅頭',
 '焼一番',
 '人工衛星饅頭',
 '太鼓まん',
 '太鼓焼き',
 '太鼓饅頭',
 '太閤焼き',
 '太郎焼',
 '大判焼',
 '大判焼き',
 '大文字焼き',
 '大砲焼き',
 '天輪焼',
 '東海道',
 '二重焼き',
 '尼い出焼き',
 '巴焼き',
 '夫婦饅頭',
 '蜂楽饅頭',
 '蜂来饅頭',
 '望月',
 '満月焼き',
 '六法焼'
);

CREATE OR REPLACE FUNCTION get_random_mochocho() RETURNS text
AS $$
DECLARE
    mochocho_name text;
BEGIN
    SELECT pg_enum.enumlabel INTO STRICT mochocho_name FROM pg_catalog.pg_enum,pg_catalog.pg_type WHERE pg_type.typname = 'mochocho' AND pg_enum.enumtypid = pg_type.oid ORDER BY pg_catalog.random() LIMIT 1;
    RETURN mochocho_name;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION verify_mochocho(mochocho_name text) RETURNS boolean
AS $$
DECLARE
    result boolean;
BEGIN
    SELECT EXISTS (SELECT pg_enum.enumlabel AS name FROM pg_catalog.pg_enum,pg_catalog.pg_type WHERE pg_type.typname = 'mochocho' AND pg_enum.enumtypid = pg_type.oid AND pg_enum.enumlabel = mochocho_name) INTO STRICT result;
    IF result THEN
      RAISE INFO '% は、おもに小麦粉からなる生地にあんこをいれて金属製焼き型で焼成した和菓子の名称です。', mochocho_name;
    ELSE
      RAISE INFO '% は、おもに小麦粉からなる生地にあんこをいれて金属製焼き型で焼成した和菓子の名称ではおそらくありません。', mochocho_name;
    END IF;
    RETURN result;
END;
$$ LANGUAGE plpgsql;
