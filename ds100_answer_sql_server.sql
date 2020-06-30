/**************************************************
データサイエンス100本ノック（構造化データ加工編） - SQL
SQL Server 2017 版

https://github.com/The-Japan-DataScientist-Society/100knocks-preprocess/blob/master/docker/work/answer/ans_preprocess_knock_SQL.ipynb
****************************************************/
use crm
;


/**************************************
S-001	レシート明細テーブル（receipt）から全項目を10件抽出し、どのようなデータを保有しているか目視で確認せよ。
**************************************/
SELECT
    TOP 10 *
FROM
     receipt
;


/**************************************
S-002	レシート明細のテーブル（receipt）から売上日（sales_ymd）、顧客ID（customer_id）、商品コード（product_cd）、売上金額（amount）の順に列を指定し、10件表示させよ。
**************************************/
SELECT
     TOP 10 sales_ymd
    ,customer_id
    ,product_cd
    ,amount
FROM
     receipt
;


/**************************************
S-003	レシート明細のテーブル（receipt）から売上日（sales_ymd）、顧客ID（customer_id）、商品コード（product_cd）、売上金額（amount）の順に列を指定し、10件表示させよ。ただし、sales_ymdはsales_dateに項目名を変更しながら抽出すること。
**************************************/
SELECT
     TOP 10 sales_ymd AS sales_date
    ,customer_id
    ,product_cd
    ,amount
FROM
     receipt
;


/**************************************
S-004	レシート明細のテーブル（receipt）から売上日（sales_ymd）、顧客ID（customer_id）、商品コード（product_cd）、売上金額（amount）の順に列を指定し、以下の条件を満たすデータを抽出せよ
**************************************/
SELECT
     sales_ymd AS sales_date
    ,customer_id
    ,product_cd
    ,amount
FROM
    receipt
WHERE
    customer_id = 'CS018205000001'
;


/**************************************
S-005	レシート明細のテーブル（receipt）から売上日（sales_ymd）、顧客ID（customer_id）、商品コード（product_cd）、売上金額（amount）の順に列を指定し、以下の条件を満たすデータを抽出せよ。
**************************************/
SELECT
     sales_ymd AS sales_date
    ,customer_id
    ,product_cd
    ,amount
FROM
    receipt
WHERE
    customer_id = 'CS018205000001'
AND amount >= 1000
;


/**************************************
S-006	レシート明細テーブル（receipt）から売上日（sales_ymd）、顧客ID（customer_id）、商品コード（product_cd）、売上数量（quantity）、売上金額（amount）の順に列を指定し、以下の条件を満たすデータを抽出せよ。
**************************************/
SELECT
     sales_ymd AS sales_date
    ,customer_id
    ,product_cd
    ,quantity
    ,amount
FROM
    receipt
WHERE
    customer_id = 'CS018205000001'
AND (
        amount >= 1000
    OR  quantity >= 5
    )
;


/**************************************
S-007	レシート明細のテーブル（receipt）から売上日（sales_ymd）、顧客ID（customer_id）、商品コード（product_cd）、売上金額（amount）の順に列を指定し、以下の条件を満たすデータを抽出せよ。
**************************************/
SELECT
     sales_ymd AS sales_date
    ,customer_id
    ,product_cd
    ,amount
FROM
    receipt
WHERE
    customer_id = 'CS018205000001'
AND amount BETWEEN 1000 AND 2000
;


/**************************************
S-008	レシート明細テーブル（receipt）から売上日（sales_ymd）、顧客ID（customer_id）、商品コード（product_cd）、売上金額（amount）の順に列を指定し、以下の条件を満たすデータを抽出せよ
**************************************/
SELECT
     sales_ymd AS sales_date
    ,customer_id
    ,product_cd
    ,amount
FROM
    receipt
WHERE
    customer_id = 'CS018205000001'
AND product_cd != 'P071401019'
;


/**************************************
S-009	以下の処理において、出力結果を変えずにORをANDに書き換えよ。
**************************************/
SELECT
    *
FROM
    store
WHERE
    prefecture_cd != '13'
AND floor_area <= 900
;


/**************************************
S-010	店舗テーブル（store）から、店舗コード（store_cd）が"S14"で始まるものだけ全項目抽出し、10件だけ表示せよ。
**************************************/
SELECT
    TOP 10 *
FROM
    store
WHERE
    store_cd LIKE 'S14%'
;


/**************************************
S-011	顧客テーブル（customer）から顧客ID（customer_id）の末尾が1のものだけ全項目抽出し、10件だけ表示せよ。
**************************************/
SELECT
    TOP 10 *
FROM
    customer
WHERE
    customer_id LIKE '%1'
;


/**************************************
S-012	店舗テーブル（store）から横浜市の店舗だけ全項目表示せよ。
**************************************/
SELECT
    *
FROM
    store
WHERE
    address LIKE '%横浜市%'
;


/**************************************
S-013	顧客テーブル（customer）から、ステータスコード（status_cd）の先頭がアルファベットのA〜Fで始まるデータを全項目抽出し、10件だけ表示せよ。
**************************************/
SELECT
    TOP 10 *
FROM
    customer
WHERE
    status_cd LIKE '[A-F]%'
;


/**************************************
S-014	顧客テーブル（customer）から、ステータスコード（status_cd）の末尾が数字の1〜9で終わるデータを全項目抽出し、10件だけ表示せよ。
**************************************/
SELECT
    TOP 10 *
FROM
    customer
WHERE
    status_cd LIKE '%[1-9]'
;


/**************************************
S-015	顧客テーブル（customer）から、ステータスコード（status_cd）の先頭がアルファベットのA〜Fで始まり、末尾が数字の1〜9で終わるデータを全項目抽出し、10件だけ表示せよ。
**************************************/
SELECT
    TOP 10 *
FROM
    customer
WHERE
    status_cd LIKE '[A-F]%[1-9]'
;


/**************************************
S-016	店舗テーブル（store）から、電話番号（tel_no）が3桁-3桁-4桁のデータを全項目表示せよ。
**************************************/
SELECT
    *
FROM
    store
WHERE
    tel_no LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'
;


/**************************************
S-017	顧客テーブル（customer）を生年月日（birth_day）で高齢順にソートし、先頭10件を全項目表示せよ。
**************************************/
SELECT
    TOP 10 *
FROM
    customer
ORDER BY
    birth_day
;


/**************************************
S-018	顧客テーブル（customer）を生年月日（birth_day）で若い順にソートし、先頭10件を全項目表示せよ。
**************************************/
SELECT
    TOP 10 *
FROM
    customer
ORDER BY
     birth_day DESC
;


/**************************************
S-019	レシート明細テーブル（receipt）に対し、1件あたりの売上金額（amount）が高い順にランクを付与し、先頭10件を抽出せよ。項目は顧客ID（customer_id）、売上金額（amount）、付与したランクを表示させること。なお、売上金額（amount）が等しい場合は同一順位を付与するものとする。
**************************************/
SELECT
     TOP 10 customer_id
    ,amount
    ,RANK() OVER(ORDER BY amount DESC) AS ranking
FROM
     receipt
;


/**************************************
S-020	レシート明細テーブル（receipt）に対し、1件あたりの売上金額（amount）が高い順にランクを付与し、先頭10件を抽出せよ。項目は顧客ID（customer_id）、売上金額（amount）、付与したランクを表示させること。なお、売上金額（amount）が等しい場合でも別順位を付与すること。
**************************************/
SELECT
     TOP 10 customer_id
    ,amount
    ,ROW_NUMBER() OVER(ORDER BY amount DESC) AS ranking
FROM
     receipt
;


/**************************************
S-021	レシート明細テーブル（receipt）に対し、件数をカウントせよ。
**************************************/
SELECT
    COUNT(1)
FROM
     receipt
;


/**************************************
S-022	レシート明細テーブル（receipt）の顧客ID（customer_id）に対し、ユニーク件数をカウントせよ。
**************************************/
SELECT
    COUNT(DISTINCT customer_id)
FROM
     receipt
;


/**************************************
S-023	レシート明細テーブル（receipt）に対し、店舗コード（store_cd）ごとに売上金額（amount）と売上数量（quantity）を合計せよ。
**************************************/
SELECT
     store_cd
    ,SUM(amount) AS amount
    ,SUM(quantity) AS quantity
FROM
    receipt
GROUP BY
    store_cd
ORDER BY
     store_cd
;


/**************************************
S-024	レシート明細テーブル（receipt）に対し、顧客ID（customer_id）ごとに最も新しい売上日（sales_ymd）を求め、10件表示せよ。
**************************************/
SELECT
     TOP 10 customer_id
    ,MAX(sales_ymd) AS max_dt
FROM
    receipt
GROUP BY
     customer_id
;


/**************************************
S-025	レシート明細テーブル（receipt）に対し、顧客ID（customer_id）ごとに最も古い売上日（sales_ymd）を求め、10件表示せよ。
**************************************/
SELECT
     TOP 10 customer_id
    ,MIN(sales_ymd) AS min_dt
FROM
    receipt
GROUP BY
     customer_id
;


/**************************************
S-026	レシート明細テーブル（receipt）に対し、顧客ID（customer_id）ごとに最も新しい売上日（sales_ymd）と古い売上日を求め、両者が異なるデータを10件表示せよ。
**************************************/
SELECT
     TOP 10 customer_id
    ,MAX(sales_ymd) AS max_dt
    ,MIN(sales_ymd) AS min_dt
FROM
    receipt
GROUP BY
    customer_id
HAVING MAX(sales_ymd) != MIN(sales_ymd)
;


/**************************************
S-027	レシート明細テーブル（receipt）に対し、店舗コード（store_cd）ごとに売上金額（amount）の平均を計算し、降順でTOP5を表示せよ。
**************************************/
SELECT
     TOP 5 store_cd
    ,AVG(amount) AS avr_amount
FROM
    receipt
GROUP BY
    store_cd
ORDER BY
     avr_amount DESC
;


/**************************************
S-028	レシート明細テーブル（receipt）に対し、店舗コード（store_cd）ごとに売上金額（amount）の中央値を計算し、降順でTOP5を表示せよ。
**************************************/
SELECT DISTINCT
     TOP 5 store_cd
    ,PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY amount) OVER(PARTITION BY store_cd) AS amount_50per
FROM
    receipt
ORDER BY
     amount_50per DESC
;


/**************************************
S-029	レシート明細テーブル（receipt）に対し、店舗コード（store_cd）ごとに商品コードの最頻値を求めよ。
**************************************/
SELECT
     t1.store_cd
    ,t1.product_cd AS mode
FROM
    (
         SELECT
             store_cd
            ,product_cd
            ,COUNT(1) AS cnt
            ,MAX(COUNT(1)) OVER(PARTITION BY store_cd) AS max_cnt
        FROM
            receipt
        GROUP BY
             store_cd
            ,product_cd
    ) AS t1
WHERE
    t1.cnt = t1.max_cnt
ORDER BY
     t1.store_cd
;


/**************************************
S-030	レシート明細テーブル（receipt）に対し、店舗コード（store_cd）ごとに売上金額（amount）の標本分散を計算し、降順にTOP5を表示せよ。
**************************************/
SELECT
     TOP 5 store_cd
    ,var(amount) AS var_amount
FROM
    receipt
GROUP BY
    store_cd
ORDER BY
     var_amount DESC
;


/**************************************
S-031	レシート明細テーブル（receipt）に対し、店舗コード（store_cd）ごとに売上金額（amount）の標本標準偏差を計算し、降順にTOP5を表示せよ。
**************************************/
SELECT
     TOP 5 store_cd
    ,STDEV(amount) AS stds_amount
FROM
    receipt
GROUP BY
    store_cd
ORDER BY
    stds_amount
;


/**************************************
S-032	レシート明細テーブル（receipt）に対し、売上金額（amount）について25％刻みでパーセンタイル値を求めよ。
**************************************/
SELECT DISTINCT
    PERCENTILE_CONT(0.25) WITHIN GROUP(ORDER BY amount) OVER() AS amount_25per
    ,PERCENTILE_CONT(0.50) WITHIN GROUP(ORDER BY amount) OVER() AS amount_50per
    ,PERCENTILE_CONT(0.75) WITHIN GROUP(ORDER BY amount) OVER() AS amount_75per
    ,PERCENTILE_CONT(1.0) WITHIN GROUP(ORDER BY amount) OVER() AS amount_100per
FROM
     receipt
;


/**************************************
S-033	レシート明細テーブル（receipt）に対し、店舗コード（store_cd）ごとに売上金額（amount）の平均を計算し、330以上のものを抽出せよ。
**************************************/
SELECT
     store_cd
    ,AVG(amount) AS avg_amount
FROM
    receipt
GROUP BY
    store_cd
HAVING AVG(amount) >= 330
;



/**************************************
S-034	レシート明細テーブル（receipt）に対し、顧客ID（customer_id）ごとに売上金額（amount）を合計して全顧客の平均を求めよ。ただし、顧客IDが"Z"から始まるのものは非会員を表すため、除外して計算すること。
**************************************/
WITH customer_amount AS(
     SELECT
         customer_id
        ,SUM(amount) AS sum_amount
    FROM
        receipt
    WHERE
        customer_id NOT LIKE 'Z%'
    GROUP BY
         customer_id
)
SELECT
    AVG(sum_amount)
FROM
     customer_amount
;


/**************************************
S-035	レシート明細テーブル（receipt）に対し、顧客ID（customer_id）ごとに販売金額（amount）を合計して全顧客の平均を求め、平均以上に買い物をしている顧客を抽出せよ。ただし、顧客IDが"Z"から始まるのものは非会員を表すため、除外して計算すること。なお、データは10件だけ表示させれば良い。
**************************************/
WITH customer_amount AS(
     SELECT
         customer_id
        ,SUM(amount) AS sum_amount
    FROM
        receipt
    WHERE
        customer_id NOT LIKE 'Z%'
    GROUP BY
         customer_id
)
SELECT
     customer_id
    ,sum_amount
FROM
    customer_amount
WHERE
    sum_amount >= (
        SELECT
            AVG(sum_amount)
        FROM
             customer_amount
    )
;


/**************************************
S-036	レシート明細テーブル（receipt）と店舗テーブル（store）を内部結合し、レシート明細テーブルの全項目と店舗テーブルの店舗名（store_name）を10件表示させよ。
**************************************/
SELECT
     TOP 10 r.*
    ,s.store_name
FROM
     receipt r
    JOIN store s
    ON  r.store_cd = s.store_cd
;


/**************************************
S-037	商品テーブル（product）とカテゴリテーブル（category）を内部結合し、商品テーブルの全項目とカテゴリテーブルの小区分名（category_small_name）を10件表示させよ。
**************************************/
SELECT
     TOP 10 p.*
    ,c.category_small_name
FROM
     product p
JOIN category c
ON  p.category_small_cd = c.category_small_cd
;


/**************************************
S-038	顧客テーブル（customer）とレシート明細テーブル（receipt）から、各顧客ごとの売上金額合計を求めよ。ただし、買い物の実績がない顧客については売上金額を0として表示させること。また、顧客は性別コード（gender_cd）が女性（1）であるものを対象とし、非会員（顧客IDが'Z'から始まるもの）は除外すること。なお、結果は10件だけ表示させれば良い。
**************************************/
WITH customer_amount AS(
     SELECT
         customer_id
        ,SUM(amount) AS sum_amount
    FROM
        receipt
    GROUP BY
         customer_id
)
SELECT
     TOP 10 c.customer_id
    ,COALESCE(a.sum_amount, 0) AS sum_amount
FROM
    customer c
LEFT JOIN customer_amount a
ON  c.customer_id = a.customer_id
WHERE
    c.gender_cd = '1'
AND c.customer_id NOT LIKE 'Z%'
ORDER BY
     customer_id
;


/**************************************
S-039	レシート明細テーブル（receipt）から売上日数の多い顧客の上位20件と、売上金額合計の多い顧客の上位20件を抽出し、完全外部結合せよ。ただし、非会員（顧客IDが'Z'から始まるもの）は除外すること。
**************************************/
WITH customer_days AS(
     SELECT
         TOP 20 customer_id
        ,COUNT(DISTINCT sales_ymd) come_days
    FROM
        receipt
    WHERE
        customer_id NOT LIKE 'Z%'
    GROUP BY
        customer_id
    ORDER BY
         come_days DESC
)
,customer_amount AS(
     SELECT
         TOP 20 customer_id
        ,SUM(amount) buy_amount
    FROM
        receipt
    WHERE
        customer_id NOT LIKE 'Z%'
    GROUP BY
        customer_id
    ORDER BY
         buy_amount DESC
)
SELECT
     COALESCE(d.customer_id, a.customer_id) AS customer_id
    ,COALESCE(d.come_days, 0) AS come_days
    ,COALESCE(a.buy_amount, 0) AS buy_amount
FROM
     customer_days d
FULL JOIN customer_amount a
ON  d.customer_id = a.customer_id
;


/**************************************
S-040	全ての店舗と全ての商品を組み合わせると何件のデータとなるか調査したい。店舗（store）と商品（product）を直積した件数を計算せよ。
**************************************/
SELECT
    COUNT(1)
FROM
     store CROSS
JOIN product
;


/**************************************
S-041	レシート明細テーブル（receipt）の売上金額（amount）を日付（sales_ymd）ごとに集計し、前日からの売上金額増減を計算せよ。なお、計算結果は10件表示すればよい。
**************************************/
WITH sales_amount_by_date AS(
     SELECT
         sales_ymd
        ,SUM(amount) AS amount
    FROM
        receipt
    GROUP BY
         sales_ymd
)
SELECT
     TOP 10 sales_ymd
    ,LAG(sales_ymd, 1) OVER(ORDER BY sales_ymd) lag_ymd
    ,amount
    ,LAG(amount, 1) OVER(ORDER BY sales_ymd) AS lag_amount
    ,amount - LAG(amount, 1) OVER(ORDER BY sales_ymd) AS diff_amount
FROM
     sales_amount_by_date
;


/**************************************
S-042	レシート明細テーブル（receipt）の売上金額（amount）を日付（sales_ymd）ごとに集計し、各日付のデータに対し、１日前、２日前、３日前のデータを結合せよ。結果は10件表示すればよい。
**************************************/
-- コード例1:縦持ちケース
WITH sales_amount_by_date AS(
     SELECT
         sales_ymd
        ,SUM(amount) AS amount
    FROM
        receipt
    GROUP BY
         sales_ymd
)
,sales_amount_lag_date AS(
     SELECT
         sales_ymd
        ,COALESCE(LAG(sales_ymd, 3) OVER(ORDER BY sales_ymd), MIN(sales_ymd) OVER(PARTITION BY NULL)) AS lag_date_3
        ,amount
    FROM
         sales_amount_by_date
)
SELECT
     a.sales_ymd
    ,b.sales_ymd AS lag_ymd
    ,a.amount AS amount
    ,b.amount AS lag_amount
FROM
    sales_amount_lag_date a
JOIN sales_amount_lag_date b
ON  b.sales_ymd >= a.lag_date_3
AND b.sales_ymd < a.sales_ymd
ORDER BY
     sales_ymd
    ,lag_ymd
;


/**************************************
S-043	レシート明細テーブル（receipt）と顧客テーブル（customer）を結合し、性別（gender）と年代（ageから計算）ごとに売上金額（amount）を合計した売上サマリテーブル（sales_summary）を作成せよ。性別は0が男性、1が女性、9が不明を表すものとする。
**************************************/
-- SQL向きではないため、やや強引に記載する（カテゴリ数が多いときはとても長いSQLとなってしまう点に注意）
DROP TABLE IF EXISTS sales_summary
;
WITH gender_era_amount AS(
     SELECT
         c.gender_cd
        ,FLOOR(c.age / 10) * 10 AS era
        ,SUM(r.amount) AS amount
    FROM
        customer c
        JOIN receipt r
        ON  c.customer_id = r.customer_id
    GROUP BY
         c.gender_cd
        ,FLOOR(c.age / 10) * 10
)
SELECT
     era
    ,MAX(CASE gender_cd WHEN '0' THEN amount ELSE 0 END) AS male
    ,MAX(CASE gender_cd WHEN '1' THEN amount ELSE 0 END) AS female
    ,MAX(CASE gender_cd WHEN '9' THEN amount ELSE 0 END) AS unknown
INTO
    sales_summary
FROM
    gender_era_amount
GROUP BY
     era
;
SELECT
    *
FROM
     sales_summary
;


/**************************************
S-044	前設問で作成した売上サマリテーブル（sales_summary）は性別の売上を横持ちさせたものであった。このテーブルから性別を縦持ちさせ、年代、性別コード、売上金額の3項目に変換せよ。ただし、性別コードは男性を'00'、女性を'01'、不明を'99'とする。
**************************************/
-- SQL向きではないため、やや強引に記載する（カテゴリ数が多いときはとても長いSQLとなってしまう点に注意）
SELECT
     era
    ,'00' AS gender_cd
    ,male AS amount
FROM
     sales_summary
UNION ALL
SELECT
     era
    ,'01' AS gender_cd
    ,female AS amount
FROM
     sales_summary
UNION ALL
SELECT
     era
    ,'99' AS gender_cd
    ,unknown AS amount
FROM
     sales_summary
;


/**************************************
S-045	顧客テーブル（customer）の生年月日（birth_day）は日付型（Date）でデータを保有している。これをYYYYMMDD形式の文字列に変換し、顧客ID（customer_id）とともに抽出せよ。データは10件を抽出すれば良い。
**************************************/
SELECT
     TOP 10 customer_id
    ,CONVERT(VARCHAR, birth_day, 112) AS birth_day
FROM
     customer
;


/**************************************
S-046	顧客テーブル（customer）の申し込み日（application_date）はYYYYMMD形式の文字列型でデータを保有している。これを日付型（dateやdatetime）に変換し、顧客ID（customer_id）とともに抽出せよ。データは10件を抽出すれば良い。
**************************************/
SELECT
     TOP 10 customer_id
    ,CONVERT(date, application_date) AS application_date
FROM
     customer
;


/**************************************
S-047	レシート明細テーブル（receipt）の売上日（sales_ymd）はYYYYMMDD形式の数値型でデータを保有している。これを日付型（dateやdatetime）に変換し、レシート番号(receipt_no)、レシートサブ番号（receipt_sub_no）とともに抽出せよ。データは10件を抽出すれば良い。
**************************************/
SELECT
     TOP 10 CONVERT(date, CONVERT(varchar(20), sales_ymd)) AS sales_ymd
    ,receipt_no
    ,receipt_sub_no
FROM
     receipt
;


/**************************************
S-048	レシート明細テーブル（receipt）の売上エポック秒（sales_epoch）は数値型のUNIX秒でデータを保有している。これを日付型（timestamp型）に変換し、レシート番号(receipt_no)、レシートサブ番号（receipt_sub_no）とともに抽出せよ。データは10件を抽出すれば良い。
**************************************/
SELECT
     TOP 10 DATEADD(SECOND, sales_epoch, CONVERT(datetime, '1970-01-01')) AS sales_date
    ,receipt_no
    ,receipt_sub_no
    ,*
FROM
     receipt
;


/**************************************
S-049	レシート明細テーブル（receipt）の販売エポック秒（sales_epoch）を日付型（timestamp型）に変換し、"年"だけ取り出してレシート番号(receipt_no)、レシートサブ番号（receipt_sub_no）とともに抽出せよ。データは10件を抽出すれば良い。
**************************************/
SELECT
     TOP 10 YEAR(DATEADD(SECOND, sales_epoch, '1970-01-01')) AS sales_year
    ,receipt_no
    ,receipt_sub_no
FROM
     receipt
;


/**************************************
S-050	レシート明細テーブル（receipt）の売上エポック秒（sales_epoch）を日付型（timestamp型）に変換し、"月"だけ取り出してレシート番号(receipt_no)、レシートサブ番号（receipt_sub_no）とともに抽出せよ。なお、"月"は0埋め2桁で取り出すこと。データは10件を抽出すれば良い。
**************************************/
SELECT
     TOP 10 FORMAT(DATEADD(SECOND, sales_epoch, '1970-01-01'), 'MM') AS sales_epoch
    ,receipt_no
    ,receipt_sub_no
FROM
     receipt
;


/**************************************
S-051	レシート明細テーブル（receipt）の売上エポック秒（sales_epoch）を日付型（timestamp型）に変換し、"日"だけ取り出してレシート番号(receipt_no)、レシートサブ番号（receipt_sub_no）とともに抽出せよ。なお、"日"は0埋め2桁で取り出すこと。データは10件を抽出すれば良い。
**************************************/
SELECT
     TOP 10 FORMAT(DATEADD(SECOND, sales_epoch, '1970-01-01'), 'dd') AS sales_epoch
    ,receipt_no
    ,receipt_sub_no
FROM
     receipt
;


/**************************************
S-052	レシート明細テーブル（receipt）の売上金額（amount）を顧客ID（customer_id）ごとに合計の上、売上金額合計に対して2000円以下を0、2000円超を1に2値化し、顧客ID、合計金額とともに10件表示せよ。ただし、顧客IDが"Z"から始まるのものは非会員を表すため、除外して計算すること。
**************************************/
SELECT
     TOP 10 customer_id
    ,SUM(amount) AS sum_amount
    ,CASE
        WHEN SUM(amount) > 2000 THEN 1
        WHEN SUM(amount) <= 2000 THEN 0
    END AS amount_flg
FROM
    receipt
WHERE
    customer_id NOT LIKE 'Z%'
GROUP BY
     customer_id
;


/**************************************
S-053	顧客テーブル（customer）の郵便番号（postal_cd）に対し、東京（先頭3桁が100〜209のもの）を1、それ以外のものを0に２値化せよ。さらにレシート明細テーブル（receipt）と結合し、全期間において買い物実績のある顧客数を、作成した2値ごとにカウントせよ。
**************************************/
WITH cust AS(
     SELECT
         customer_id
        ,postal_cd
        ,CASE
            WHEN 100 <= CAST(SUBSTRING(postal_cd, 1, 3) AS INTEGER)
        AND CAST(SUBSTRING(postal_cd, 1, 3) AS INTEGER) <= 209 THEN 1
            ELSE 0
        END AS postal_flg
    FROM
         customer
)
,rect AS(
     SELECT
         customer_id
        ,SUM(amount) AS SUM
    FROM
        receipt
    GROUP BY
         customer_id
)
SELECT
     c.postal_flg
    ,COUNT(1)
FROM
    rect r
JOIN cust c
ON  r.customer_id = c.customer_id
GROUP BY
     c.postal_flg
;


/**************************************
S-054	顧客テーブル（customer）の住所（address）は、埼玉県、千葉県、東京都、神奈川県のいずれかとなっている。都道府県毎にコード値を作成し、顧客ID、住所とともに抽出せよ。値は埼玉県を11、千葉県を12、東京都を13、神奈川県を14とすること。結果は10件表示させれば良い。
**************************************/
-- SQL向きではないため、やや強引に記載する（カテゴリ数が多いときはとても長いSQLとなってしまう点に注意）
SELECT
     TOP 10 customer_id
    ,
    -- 確認用に住所も表示
    address
    ,CASE SUBSTRING(address, 1, 3)
        WHEN '埼玉県' THEN '11'
        WHEN '千葉県' THEN '12'
        WHEN '東京都' THEN '13'
        WHEN '神奈川' THEN '14'
    END AS prefecture_cd
FROM
     customer
;


/**************************************
S-055	レシート明細テーブル（receipt）の売上金額（amount）を顧客ID（customer_id）ごとに合計し、その合計金額の四分位点を求めよ。その上で、顧客ごとの売上金額合計に対して以下の基準でカテゴリ値を作成し、顧客ID、売上金額合計とともに表示せよ。カテゴリ値は上から順に1〜4とする。結果は10件表示させれば良い。
**************************************/
WITH sales_amount AS(
     SELECT
         customer_id
        ,SUM(amount) AS sum_amount
    FROM
        receipt
    GROUP BY
         customer_id
)
,sales_pct AS(
     SELECT
        PERCENTILE_CONT(0.25) WITHIN GROUP(ORDER BY sum_amount) OVER() AS pct25
        ,PERCENTILE_CONT(0.50) WITHIN GROUP(ORDER BY sum_amount) OVER() AS pct50
        ,PERCENTILE_CONT(0.75) WITHIN GROUP(ORDER BY sum_amount) OVER() AS pct75
    FROM
         sales_amount
)
SELECT DISTINCT
     a.customer_id
    ,a.sum_amount
    ,CASE
        WHEN a.sum_amount < pct25 THEN 1
        WHEN pct25 <= a.sum_amount
    AND a.sum_amount < pct50 THEN 2
        WHEN pct50 <= a.sum_amount
    AND a.sum_amount < pct75 THEN 3
        WHEN pct75 <= a.sum_amount THEN 4
    END AS pct_flg
FROM
     sales_amount a CROSS
JOIN sales_pct p
;


/**************************************
S-056	顧客テーブル（customer）の年齢（age）をもとに10歳刻みで年代を算出し、顧客ID（customer_id）、生年月日（birth_day）とともに抽出せよ。ただし、60歳以上は全て60歳代とすること。年代を表すカテゴリ名は任意とする。先頭10件を表示させればよい。
**************************************/
SELECT
     TOP 10 customer_id
    ,birth_day
    ,age
    ,CASE
        WHEN age >= 60 THEN 60
        ELSE CAST(FLOOR(age / 10) * 10 AS INTEGER)
    END AS era
FROM
     customer
;


/**************************************
S-057	前問題の抽出結果と性別（gender）を組み合わせ、新たに性別×年代の組み合わせを表すカテゴリデータを作成せよ。組み合わせを表すカテゴリの値は任意とする。先頭10件を表示させればよい。
**************************************/
SELECT
     TOP 10 customer_id
    ,birth_day
    ,gender_cd + CONVERT(
         varchar(20)
        ,CASE
            WHEN age >= 60 THEN 60
            ELSE CAST(FLOOR(age / 10) * 10 AS INTEGER)
        END
    ) AS era
FROM
     customer
;


/**************************************
S-058	顧客テーブル（customer）の性別コード（gender_cd）をダミー変数化し、顧客ID（customer_id）とともに抽出せよ。結果は10件表示させれば良い。
**************************************/
-- SQL向きではないため、やや強引に記載する（カテゴリ数が多いときはとても長いSQLとなってしまう点に注意）
SELECT
     TOP 10 customer_id
    ,CASE
        WHEN gender_cd = '0' THEN '1'
        ELSE '0'
    END AS gender_male
    ,CASE
        WHEN gender_cd = '1' THEN '1'
        ELSE '0'
    END AS gender_female
    ,CASE
        WHEN gender_cd = '9' THEN '1'
        ELSE '0'
    END AS gender_unknown
FROM
     customer
;


/**************************************
S-059	レシート明細テーブル（receipt）の売上金額（amount）を顧客ID（customer_id）ごとに合計し、合計した売上金額を平均0、標準偏差1に標準化して顧客ID、売上金額合計とともに表示せよ。標準化に使用する標準偏差は、不偏標準偏差と標本標準偏差のどちらでも良いものとする。ただし、顧客IDが"Z"から始まるのものは非会員を表すため、除外して計算すること。結果は10件表示させれば良い。
**************************************/
WITH sales_amount AS(
     SELECT
         customer_id
        ,SUM(amount) AS sum_amount
    FROM
        receipt
    WHERE
        customer_id NOT LIKE 'Z%'
    GROUP BY
         customer_id
)
,stats_amount AS(
     SELECT
         AVG(sum_amount) AS avg_amount
        ,STDEV(sum_amount) AS std_amount
    FROM
         sales_amount
)
SELECT
     customer_id
    ,sum_amount
    ,(sum_amount - avg_amount) / std_amount AS normal_amount
FROM
     sales_amount CROSS
JOIN stats_amount
;


/**************************************
S-060	レシート明細テーブル（receipt）の売上金額（amount）を顧客ID（customer_id）ごとに合計し、合計した売上金額を最小値0、最大値1に正規化して顧客ID、売上金額合計とともに表示せよ。ただし、顧客IDが"Z"から始まるのものは非会員を表すため、除外して計算すること。結果は10件表示させれば良い。
**************************************/
WITH sales_amount AS(
     SELECT
         customer_id
        ,SUM(amount) AS sum_amount
    FROM
        receipt
    WHERE
        customer_id NOT LIKE 'Z%'
    GROUP BY
         customer_id
)
,stats_amount AS(
     SELECT
         MAX(sum_amount) AS max_amount
        ,MIN(sum_amount) AS min_amount
    FROM
         sales_amount
)
SELECT
     TOP 10 customer_id
    ,sum_amount
    ,(sum_amount - min_amount) * 1.0 / (max_amount - min_amount) * 1.0 AS scale_amount
FROM
     sales_amount CROSS
JOIN stats_amount
;


/**************************************
S-061	レシート明細テーブル（receipt）の売上金額（amount）を顧客ID（customer_id）ごとに合計し、合計した売上金額を常用対数化（底=10）して顧客ID、売上金額合計とともに表示せよ。ただし、顧客IDが"Z"から始まるのものは非会員を表すため、除外して計算すること。結果は10件表示させれば良い。
**************************************/
SELECT
     TOP 10 customer_id
    ,SUM(amount)
    ,LOG10(SUM(amount) + 1) AS log_amount
FROM
    receipt
WHERE
    customer_id NOT LIKE 'Z%'
GROUP BY
     customer_id
;


/**************************************
S-062	レシート明細テーブル（receipt）の売上金額（amount）を顧客ID（customer_id）ごとに合計し、合計した売上金額を自然対数化(底=e）して顧客ID、売上金額合計とともに表示せよ（ただし、顧客IDが"Z"から始まるのものは非会員を表すため、除外して計算すること）。結果は10件表示させれば良い。
**************************************/
SELECT
     TOP 10 customer_id
    ,SUM(amount)
    ,LOG(SUM(amount) + 1) AS log_amount
FROM
    receipt
WHERE
    customer_id NOT LIKE 'Z%'
GROUP BY
     customer_id
;


/**************************************
S-063	商品テーブル（product）の単価（unit_price）と原価（unit_cost）から、各商品の利益額を算出せよ。結果は10件表示させれば良い。
**************************************/
SELECT
     TOP 10 product_cd
    ,unit_price
    ,unit_cost
    ,unit_price - unit_cost AS unit_profit
FROM
     product
;


/**************************************
S-064	商品テーブル（product）の単価（unit_price）と原価（unit_cost）から、各商品の利益率の全体平均を算出せよ。 ただし、単価と原価にはNULLが存在することに注意せよ。
**************************************/
SELECT
    AVG((unit_price * 1.0 - unit_cost) / unit_price) AS unit_profit_rate
FROM
     product
;


/**************************************
S-065	商品テーブル（product）の各商品について、利益率が30%となる新たな単価を求めよ。ただし、1円未満は切り捨てること。そして結果を10件表示させ、利益率がおよそ30％付近であることを確認せよ。ただし、単価（unit_price）と原価（unit_cost）にはNULLが存在することに注意せよ。
**************************************/
SELECT
     product_cd
    ,unit_price
    ,unit_cost
    ,FLOOR(unit_cost / 0.7) AS new_price
    ,((FLOOR(unit_cost / 0.7) - unit_cost) / FLOOR(unit_cost / 0.7)) AS new_profit
FROM
     product
;


/**************************************
S-066	商品テーブル（product）の各商品について、利益率が30%となる新たな単価を求めよ。今回は、1円未満を四捨五入すること。そして結果を10件表示させ、利益率がおよそ30％付近であることを確認せよ。ただし、単価（unit_price）と原価（unit_cost）にはNULLが存在することに注意せよ。
**************************************/
SELECT
     TOP 10 product_cd
    ,unit_price
    ,unit_cost
    ,CONVERT(int, ROUND(unit_cost / 0.7, 0)) AS new_price
    ,((CONVERT(int, ROUND(unit_cost / 0.7, 0))) - unit_cost) * 1.0 / CONVERT(int, ROUND(unit_cost / 0.7, 0)) * 1.0 AS new_profit
FROM
     product
;


/**************************************
S-067	商品テーブル（product）の各商品について、利益率が30%となる新たな単価を求めよ。今回は、1円未満を切り上げること。そして結果を10件表示させ、利益率がおよそ30％付近であることを確認せよ。ただし、単価（unit_price）と原価（unit_cost）にはNULLが存在することに注意せよ。
**************************************/
SELECT
     TOP 10 product_cd
    ,unit_price
    ,unit_cost
    ,CONVERT(int, CEILING(unit_cost / 0.7)) AS new_price
    ,((CONVERT(int, CEILING(unit_cost / 0.7))) - unit_cost) * 1.0 / CONVERT(int, CEILING(unit_cost / 0.7)) * 1.0 AS new_profit
FROM
     product
;


/**************************************
S-068	商品テーブル（product）の各商品について、消費税率10%の税込み金額を求めよ。 1円未満の端数は切り捨てとし、結果は10件表示すれば良い。ただし、単価（unit_price）にはNULLが存在することに注意せよ。
**************************************/
SELECT
     product_cd
    ,unit_price
    ,FLOOR(unit_price * 1.1) AS tax_price
FROM
     product
;


/**************************************
S-069	レシート明細テーブル（receipt）と商品テーブル（product）を結合し、顧客毎に全商品の売上金額合計と、カテゴリ大区分（category_major_cd）が"07"（瓶詰缶詰）の売上金額合計を計算の上、両者の比率を求めよ。抽出対象はカテゴリ大区分"07"（瓶詰缶詰）の購入実績がある顧客のみとし、結果は10件表示させればよい。
**************************************/
WITH amount_all AS(
     SELECT
         customer_id
        ,SUM(amount) AS sum_all
    FROM
        receipt
    GROUP BY
         customer_id
)
,amount_07 AS(
     SELECT
         r.customer_id
        ,SUM(r.amount) AS sum_07
    FROM
        receipt r
        JOIN product p
        ON  r.product_cd = p.product_cd
        AND p.category_major_cd = '07'
    GROUP BY
         customer_id
)
SELECT
     TOP 10 amount_all.customer_id
    ,sum_all
    ,sum_07
    ,sum_07 * 1.0 / sum_all AS sales_rate
FROM
     amount_all
JOIN amount_07
ON  amount_all.customer_id = amount_07.customer_id
;


/**************************************
S-070	レシート明細テーブル（receipt）の売上日（sales_ymd）に対し、顧客テーブル（customer）の会員申込日（application_date）からの経過日数を計算し、顧客ID（customer_id）、売上日、会員申込日とともに表示せよ。結果は10件表示させれば良い（なお、sales_ymdは数値、application_dateは文字列でデータを保持している点に注意）。
**************************************/
WITH receit_distinct AS(
     SELECT DISTINCT
         customer_id
        ,sales_ymd
    FROM
         receipt
)
SELECT
     c.customer_id
    ,r.sales_ymd
    ,c.application_date
    ,datediff(day, CONVERT(date, c.application_date), CONVERT(date, CONVERT(varchar(10), r.sales_ymd))) AS elapsed_days
FROM
     receit_distinct r
JOIN customer c
ON  r.customer_id = c.customer_id
;


/**************************************
S-071	レシート明細テーブル（receipt）の売上日（sales_ymd）に対し、顧客テーブル（customer）の会員申込日（application_date）からの経過月数を計算し、顧客ID（customer_id）、売上日、会員申込日とともに表示せよ。結果は10件表示させれば良い（なお、sales_ymdは数値、application_dateは文字列でデータを保持している点に注意）。1ヶ月未満は切り捨てること。
**************************************/
WITH receit_distinct AS(
     SELECT DISTINCT
         customer_id
        ,sales_ymd
    FROM
         receipt
)
SELECT
     TOP 10 c.customer_id
    ,r.sales_ymd
    ,c.application_date
    ,datediff(MONTH, CONVERT(date, application_date), CONVERT(date, CONVERT(varchar(10), sales_ymd))) AS elapsed_months
FROM
     receit_distinct r
JOIN customer c
ON  r.customer_id = c.customer_id
;


/**************************************
S-072	レシート明細テーブル（receipt）の売上日（sales_ymd）に対し、顧客テーブル（customer）の会員申込日（application_date）からの経過年数を計算し、顧客ID（customer_id）、売上日、会員申込日とともに表示せよ。結果は10件表示させれば良い（なお、sales_ymdは数値、application_dateは文字列でデータを保持している点に注意）。1年未満は切り捨てること。
**************************************/
WITH receit_distinct AS(
     SELECT DISTINCT
         customer_id
        ,sales_ymd
    FROM
         receipt
)
SELECT
     TOP 10 c.customer_id
    ,r.sales_ymd
    ,c.application_date
    ,datediff(YEAR, CONVERT(date, application_date), CONVERT(date, CONVERT(varchar(10), sales_ymd))) AS elapsed_months
FROM
     receit_distinct r
JOIN customer c
ON  r.customer_id = c.customer_id
;


/**************************************
S-073	レシート明細テーブル（receipt）の売上日（sales_ymd）に対し、顧客テーブル（customer）の会員申込日（application_date）からのエポック秒による経過時間を計算し、顧客ID（customer_id）、売上日、会員申込日とともに表示せよ。結果は10件表示させれば良い（なお、sales_ymdは数値、application_dateは文字列でデータを保持している点に注意）。なお、時間情報は保有していないため各日付は0時0分0秒を表すものとする。
**************************************/
WITH receit_distinct AS(
     SELECT DISTINCT
         customer_id
        ,sales_ymd
    FROM
         receipt
)
SELECT
     TOP 10 c.customer_id
    ,r.sales_ymd
    ,c.application_date
    ,datediff(second, CONVERT(date, application_date), CONVERT(date, CONVERT(varchar(10), sales_ymd))) AS elapsed_months
FROM
     receit_distinct r
JOIN customer c
ON  r.customer_id = c.customer_id
;


/**************************************
S-074	レシート明細テーブル（receipt）の売上日（sales_ymd）に対し、当該週の月曜日からの経過日数を計算し、売上日、当該週の月曜日付とともに表示せよ。結果は10件表示させれば良い（なお、sales_ymdは数値でデータを保持している点に注意）。
**************************************/
WITH receipt_pre1 AS(
     SELECT
         customer_id
        ,CONVERT(date, CONVERT(varchar(10), sales_ymd)) AS sales_ymd
        ,datepart(weekday, CONVERT(varchar(10), sales_ymd)) AS [weekday]
    FROM
         receipt
)
,receipt_pre2 AS(
     SELECT
         customer_id
        ,sales_ymd
        ,dateadd(day, - (CASE [weekday] WHEN 2 THEN 0 WHEN 3 THEN 1 WHEN 4 THEN 2 WHEN 5 THEN 3 WHEN 6 THEN 4 WHEN 7 THEN 5 WHEN 1 THEN 6 ELSE NULL END), sales_ymd) AS [monday]
    FROM
         receipt_pre1
)
SELECT
     TOP 10 customer_id
    ,sales_ymd
    ,datediff(day, [monday], sales_ymd) AS elapsed_days
    ,[monday]
FROM
    receipt_pre2
;


/**************************************
S-075	顧客テーブル（customer）からランダムに1%のデータを抽出し、先頭から10件データを抽出せよ。
**************************************/
SELECT
    TOP 10 *
FROM
    customer
WHERE
    (ABS(CAST((BINARY_CHECKSUM(*) * RAND()) AS int)) % 100) < 1
;
--https://docs.microsoft.com/en-us/previous-versions/software-testing/cc441928(v=msdn.10)?redirectedfrom=MSDN


/**************************************
SQL-076	 顧客テーブル（customer）から性別（gender_cd）の割合に基づきランダムに10%のデータを層化抽出データし、性別ごとに件数を集計せよ。
**************************************/
-- カテゴリ数が少ない場合はそれぞれサンプリングしUNIONするほうが簡単だが、カテゴリ数が多いケースを考慮して以下のSQLとした
-- RANDOMでORDER BYしているため、大量データを扱う場合は注意が必要
WITH customer_pre AS(
     SELECT
         customer_id
        ,gender_cd
        ,COUNT(1) over(partition BY gender_cd) AS cnt
        ,ABS(CAST((BINARY_CHECKSUM(*) * RAND()) AS int)) AS random_no
    FROM
         customer
)
SELECT
     gender_cd
    ,COUNT(1) AS [count]
FROM
    customer_pre
WHERE
    (random_no % cnt) <= cnt * 0.1
GROUP BY
     gender_cd
;


/**************************************
SQL-077	レシート明細テーブル（receipt）の売上金額（amount）を顧客単位に合計し、合計した売上金額の外れ値を抽出せよ。ただし、顧客IDが"Z"から始まるのものは非会員を表すため、除外して計算すること。なお、ここでは外れ値を平均から3σ以上離れたものとする。結果は10件表示させれば良い。
**************************************/
WITH sales_amount AS(
     SELECT
         customer_id
        ,SUM(amount) AS sum_amount
    FROM
        receipt
    WHERE
        customer_id NOT LIKE 'Z%'
    GROUP BY
         customer_id
)
SELECT
     TOP 10 customer_id
    ,sum_amount
FROM
     sales_amount CROSS
JOIN(
         SELECT
             AVG(sum_amount) AS avg_amount
            ,STDEV(sum_amount) AS std_amount
        FROM
            sales_amount
    ) stats_amount
WHERE
    ABS(sum_amount - avg_amount) / std_amount > 3
;


/**************************************
SQL-078	レシート明細テーブル（receipt）の売上金額（amount）を顧客単位に合計し、合計した売上金額の外れ値を抽出せよ。ただし、顧客IDが"Z"から始まるのものは非会員を表すため、除外して計算すること。なお、ここでは外れ値を第一四分位と第三四分位の差であるIQRを用いて、「第一四分位数-1.5×IQR」よりも下回るもの、または「第三四分位数+1.5×IQR」を超えるものとする。結果は10件表示させれば良い。
**************************************/
WITH sales_amount AS(
     SELECT
         customer_id
        ,SUM(amount) AS sum_amount
    FROM
        receipt
    WHERE
        customer_id NOT LIKE 'Z%'
    GROUP BY
         customer_id
)
SELECT
     TOP 10 customer_id
    ,sum_amount
FROM
    sales_amount CROSS
JOIN(
         SELECT DISTINCT
            PERCENTILE_CONT(0.25) WITHIN GROUP(ORDER BY sum_amount) OVER() AS amount_25per
            ,PERCENTILE_CONT(0.75) WITHIN GROUP(ORDER BY sum_amount) OVER() AS amount_75per
        FROM
            sales_amount
    ) stats_amount
WHERE
    sum_amount < amount_25per - (amount_75per - amount_25per) * 1.5
OR  amount_75per + (amount_75per - amount_25per) * 1.5 < sum_amount
;


/**************************************
SQL-079	商品テーブル（product）の各項目に対し、欠損数を確認せよ。
**************************************/
SELECT
     TOP 10 SUM(CASE WHEN product_cd IS NULL THEN 1 ELSE 0 END) AS product_cd
    ,SUM(CASE WHEN category_major_cd IS NULL THEN 1 ELSE 0 END) AS category_major_cd
    ,SUM(CASE WHEN category_medium_cd IS NULL THEN 1 ELSE 0 END) AS category_medium_cd
    ,SUM(CASE WHEN category_small_cd IS NULL THEN 1 ELSE 0 END) AS category_small_cd
    ,SUM(CASE WHEN unit_price IS NULL THEN 1 ELSE 0 END) AS unit_price
    ,SUM(CASE WHEN unit_cost IS NULL THEN 1 ELSE 0 END) AS unit_cost
FROM
    product
;


/**************************************
SQL-080	商品テーブル（product）のいずれかの項目に欠損が発生しているレコードを全て削除した新たなproduct_1を作成せよ。なお、削除前後の件数を表示させ、前設問で確認した件数だけ減少していることも確認すること。
**************************************/
DROP TABLE IF EXISTS product_1
;
SELECT
    *
INTO
    product_1
FROM
    product
WHERE
    product_cd IS NOT NULL
AND category_major_cd IS NOT NULL
AND category_medium_cd IS NOT NULL
AND category_small_cd IS NOT NULL
AND unit_price IS NOT NULL
AND unit_cost IS NOT NULL
;


/**************************************
SQL-081	単価（unit_price）と原価（unit_cost）の欠損値について、それぞれの平均値で補完した新たなproduct_2を作成せよ。なお、平均値について1円未満は四捨五入とする。補完実施後、各項目について欠損が生じていないことも確認すること。
**************************************/
DROP TABLE IF EXISTS product_2
;
SELECT
     product_cd
    ,category_major_cd
    ,category_medium_cd
    ,category_small_cd
    ,COALESCE(unit_price, unit_avg) AS unit_price
    ,COALESCE(unit_cost, cost_avg) AS unit_cost
INTO
    product_2
FROM
     product CROSS
JOIN(
         SELECT
             ROUND(AVG(unit_price), 0) AS unit_avg
            ,ROUND(AVG(unit_cost), 0) AS cost_avg
        FROM
             product
    ) stats_product
;
SELECT
     TOP 10 SUM(CASE WHEN unit_price IS NULL THEN 1 ELSE 0 END) AS unit_price
    ,SUM(CASE WHEN unit_cost IS NULL THEN 1 ELSE 0 END) AS unit_cost
FROM
     product_2
;


/**************************************
SQL-082	 単価（unit_price）と原価（unit_cost）の欠損値について、それぞれの中央値で補完した新たなproduct_3を作成せよ。なお、中央値について1円未満は四捨五入とする。補完実施後、各項目について欠損が生じていないことも確認すること。
**************************************/
DROP TABLE IF EXISTS product_3
;
SELECT
     product_cd
    ,category_major_cd
    ,category_medium_cd
    ,category_small_cd
    ,COALESCE(unit_price, unit_med) AS unit_price
    ,COALESCE(unit_cost, cost_med) AS unit_cost
INTO
    product_3
FROM
    product CROSS
JOIN(
         SELECT DISTINCT
            ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY unit_price) OVER(), 0) AS unit_med
            ,ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY unit_cost) OVER(), 0) AS cost_med
        FROM
             product
    ) stats_product
;
SELECT
     TOP 10 SUM(CASE WHEN unit_price IS NULL THEN 1 ELSE 0 END) AS unit_price
    ,SUM(CASE WHEN unit_cost IS NULL THEN 1 ELSE 0 END) AS unit_cost
FROM
     product_3
;


/**************************************
SQL-083	単価（unit_price）と原価（unit_cost）の欠損値について、各商品の小区分（category_small_cd）ごとに算出した中央値で補完した新たなproduct_4を作成せよ。なお、中央値について1円未満は四捨五入とする。補完実施後、各項目について欠損が生じていないことも確認すること。
**************************************/
DROP TABLE IF EXISTS product_4
;
WITH category_median AS(
     SELECT DISTINCT
         category_small_cd
        ,ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY unit_price) OVER(partition BY category_small_cd), 0) AS unit_med
        ,ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY unit_cost) OVER(partition BY category_small_cd), 0) AS cost_med
    FROM
         product
)
SELECT
     p.product_cd
    ,p.category_major_cd
    ,p.category_medium_cd
    ,p.category_small_cd
    ,COALESCE(p.unit_price, c.unit_med) AS unit_price
    ,COALESCE(p.unit_cost, c.cost_med) AS unit_cost
INTO
    product_4
FROM
     product p
JOIN category_median c
ON  p.category_small_cd = c.category_small_cd
;
SELECT
     TOP 10 SUM(CASE WHEN unit_price IS NULL THEN 1 ELSE 0 END) AS unit_price
    ,SUM(CASE WHEN unit_cost IS NULL THEN 1 ELSE 0 END) AS unit_cost
FROM
     product_4
;


/**************************************
SQL-084	顧客テーブル（customer）の全顧客に対し、全期間の売上金額に占める2019年売上金額の割合を計算せよ。ただし、販売実績のない場合は0として扱うこと。そして計算した割合が0超のものを抽出せよ。 結果は10件表示させれば良い。
**************************************/
WITH sales_amount_2019 AS(
     SELECT
         customer_id
        ,SUM(amount) AS sum_amount_2019
    FROM
        receipt
    WHERE
        20190101 <= sales_ymd
    AND sales_ymd <= 20191231
    GROUP BY
         customer_id
)
,sales_amount_all AS(
     SELECT
         customer_id
        ,SUM(amount) AS sum_amount_all
    FROM
        receipt
    GROUP BY
         customer_id
)
SELECT
     TOP 10 a.customer_id
    ,COALESCE(b.sum_amount_2019, 0) AS sales_amount_2019
    ,COALESCE(c.sum_amount_all, 0) AS sales_amount_all
    ,CASE COALESCE(c.sum_amount_all, 0)
        WHEN 0 THEN 0
        ELSE COALESCE(b.sum_amount_2019, 0) * 1.0 / c.sum_amount_all
    END AS sales_rate
FROM
    customer a
LEFT JOIN sales_amount_2019 b
ON  a.customer_id = b.customer_id
LEFT JOIN sales_amount_all c
ON  a.customer_id = c.customer_id
WHERE
    CASE COALESCE(c.sum_amount_all, 0)
        WHEN 0 THEN 0
        ELSE COALESCE(b.sum_amount_2019, 0) * 1.0 / c.sum_amount_all
    END > 0
;


/**************************************
SQL-085	顧客テーブル（customer）の全顧客に対し、郵便番号（postal_cd）を用いて経度緯度変換用テーブル（geocode）を紐付け、新たなcustomer_1を作成せよ。ただし、複数紐づく場合は経度（longitude）、緯度（latitude）それぞれ平均を算出すること。
**************************************/
DROP TABLE IF EXISTS customer_1
;
WITH geocode_avg AS(
     SELECT
         postal_cd
        ,AVG(longitude) AS m_longitude
        ,AVG(latitude) AS m_latitude
    FROM
        geocode
    GROUP BY
         postal_cd
)
SELECT
     c.*
    ,g.m_longitude
    ,g.m_latitude
INTO
    customer_1
FROM
    customer c
JOIN geocode_avg g
ON  c.postal_cd = g.postal_cd
;
SELECT
    *
FROM
    customer_1
WHERE
    postal_cd = '136-0076'
;


/**************************************
SQL-086	前設問で作成した緯度経度つき顧客テーブル（customer_1）に対し、申込み店舗コード（application_store_cd）をキーに店舗テーブル（store）と結合せよ。そして申込み店舗の緯度（latitude）・経度情報（longitude)と顧客の緯度・経度を用いて距離（km）を求め、顧客ID（customer_id）、顧客住所（address）、店舗住所（address）とともに表示せよ。計算式は簡易式で良いものとするが、その他精度の高い方式を利用したライブラリを利用してもかまわない。結果は10件表示すれば良い。
**************************************/
SELECT
     TOP 10 c.customer_id
    ,c.address AS customer_address
    ,s.address AS store_address
    ,(6371 * ACOS(SIN(RADIANS(c.m_latitude)) * SIN(RADIANS(s.latitude)) + COS(RADIANS(c.m_latitude)) * COS(RADIANS(s.latitude)) * COS(RADIANS(c.m_longitude) - RADIANS(s.longitude)))) AS distance
FROM
    customer_1 c
JOIN store s
ON  c.application_store_cd = s.store_cd
WHERE
    c.customer_id = 'CS037613000071'
;


/**************************************
SQL-087	顧客テーブル（customer）では、異なる店舗での申込みなどにより同一顧客が複数登録されている。名前（customer_name）と郵便番号（postal_cd）が同じ顧客は同一顧客とみなし、1顧客1レコードとなるように名寄せした名寄顧客テーブル（customer_u）を作成せよ。ただし、同一顧客に対しては売上金額合計が最も高いものを残すものとし、売上金額合計が同一もしくは売上実績の無い顧客については顧客ID（customer_id）の番号が小さいものを残すこととする。
**************************************/
DROP TABLE IF EXISTS customer_u
;
WITH sales_amount AS(
     SELECT
         c.customer_id
        ,c.customer_name
        ,c.postal_cd
        ,SUM(r.amount) AS sum_amount
    FROM
        customer c
        LEFT JOIN receipt r
        ON  c.customer_id = r.customer_id
    GROUP BY
         c.customer_id
        ,c.customer_name
        ,c.postal_cd
)
,sales_ranking AS(
     SELECT
         *
        ,ROW_NUMBER() OVER(PARTITION BY customer_name, postal_cd ORDER BY sum_amount DESC, customer_ID) AS rank
    FROM
         sales_amount
)
SELECT
    c.*
INTO
    customer_u
FROM
     customer c
JOIN sales_ranking r
ON  c.customer_id = r.customer_id
AND r.rank = 1
;
SELECT
     cnt
    ,cnt_u
    ,cnt - cnt_u AS diff
FROM
    (
        SELECT
            COUNT(1) AS cnt
        FROM
             customer
    ) customer CROSS
JOIN(
        SELECT
            COUNT(1) AS cnt_u
        FROM
             customer_u
    ) customer_u
;


/**************************************
SQL-088	前設問で作成したデータを元に、顧客テーブルに統合名寄IDを付与したテーブル（customer_n）を作成せよ。ただし、統合名寄IDは以下の仕様で付与するものとする。
・重複していない顧客：顧客ID（customer_id）を設定
・重複している顧客：前設問で抽出したレコードの顧客IDを設定
**************************************/
DROP TABLE IF EXISTS customer_n
;
SELECT
     c.*
    ,u.customer_id AS integration_id
INTO
    customer_n
FROM
    customer c
JOIN customer_u u
ON  c.customer_name = u.customer_name
AND c.postal_cd = u.postal_cd
;
SELECT
    COUNT(1)
FROM
    customer_n
WHERE
    customer_id != integration_id
;


/**************************************
SQL-089	売上実績のある顧客に対し、予測モデル構築のため学習用データとテスト用データに分割したい。それぞれ8:2の割合でランダムに分割し、テーブルを作成せよ。
**************************************/
DROP TABLE IF EXISTS customer_test
;
WITH sales_amoiunt AS(
     SELECT
         customer_id
        ,SUM(amount) AS sum_amount
    FROM
        receipt
    GROUP BY
        customer_id
)
SELECT
    c.*
INTO
    customer_test
FROM
    customer c
JOIN sales_amoiunt s
ON  c.customer_id = s.customer_id
WHERE
    ABS(CAST((BINARY_CHECKSUM(*) * RAND()) AS int)) % 100 < 20
;
--1652
DROP TABLE IF EXISTS customer_train
;
WITH sales_amoiunt AS(
     SELECT
         customer_id
        ,SUM(amount) AS sum_amount
    FROM
        receipt
    GROUP BY
         customer_id
)
SELECT
    c.*
INTO
    customer_train
FROM
     customer c
JOIN sales_amoiunt s
ON  c.customer_id = s.customer_id EXCEPT(
        SELECT
            *
        FROM
             customer_test
    )
;
--6654


/**************************************
S-090	レシート明細テーブル（receipt）は2017年1月1日〜2019年10月31日までのデータを有している。売上金額（amount）を月次で集計し、学習用に12ヶ月、テスト用に6ヶ月のモデル構築用データを3テーブルとしてセット作成せよ。データの持ち方は自由とする。
**************************************/
DROP TABLE IF EXISTS sales_amount
;
SELECT
     SUBSTRING(CAST(sales_ymd AS VARCHAR), 1, 6) AS sales_ym
    ,SUM(amount) AS sum_amount
    ,ROW_NUMBER() OVER(ORDER BY SUBSTRING(CAST(sales_ymd AS VARCHAR), 1, 6)) AS rn
INTO
    sales_amount
FROM
    receipt
GROUP BY
     SUBSTRING(CAST(sales_ymd AS VARCHAR), 1, 6)
;
-- SQLでは限界があるが、作成データセットの増加に伴いなるべく使いまわしができるものにする
-- WITH句内のLAG関数について、ラグ期間を変えれば使い回せるよう記述
DROP TABLE IF EXISTS series_data_1
;
WITH lag_amount AS(
     SELECT
         sales_ym
        ,sum_amount
        ,LAG(rn, 0) OVER(ORDER BY rn) AS rn
    FROM
         sales_amount
)
SELECT
     sales_ym
    ,sum_amount
    ,CASE
        WHEN rn <= 12 THEN 0
        WHEN 12 < rn THEN 1
    END AS test_flg
INTO
    series_data_1
FROM
    lag_amount
WHERE
    rn <= 18
;
DROP TABLE IF EXISTS series_data_2
;
WITH lag_amount AS(
     SELECT
         sales_ym
        ,sum_amount
        ,LAG(rn, 6) OVER(ORDER BY rn) AS rn
    FROM
         sales_amount
)
SELECT
     sales_ym
    ,sum_amount
    ,CASE
        WHEN rn <= 12 THEN 0
        WHEN 12 < rn THEN 1
    END AS test_flg
INTO
    series_data_2
FROM
    lag_amount
WHERE
    rn <= 18
;
DROP TABLE IF EXISTS series_data_3
;
WITH lag_amount AS(
     SELECT
         sales_ym
        ,sum_amount
        ,LAG(rn, 12) OVER(ORDER BY rn) AS rn
    FROM
         sales_amount
)
SELECT
     sales_ym
    ,sum_amount
    ,CASE
        WHEN rn <= 12 THEN 0
        WHEN 12 < rn THEN 1
    END AS test_flg
INTO
    series_data_3
FROM
    lag_amount
WHERE
    rn <= 18
;


/**************************************
SQL-091	顧客テーブル（customer）の各顧客に対し、売上実績のある顧客数と売上実績のない顧客数が1:1となるようにアンダーサンプリングで抽出せよ。
**************************************/
DROP TABLE IF EXISTS customer_sample
;
WITH sales_customer AS(
     SELECT
         c.customer_id
        ,CASE
            WHEN SUM(COALESCE(r.amount, 0)) > 0 THEN 1
            ELSE 0
        END AS sales_flg
    FROM
        customer c
        LEFT JOIN receipt r
        ON  c.customer_id = r.customer_id
    GROUP BY
         c.customer_id
)
,sales_flg_cnt AS(
    SELECT
        (SUM(sales_flg) * 1.0) / (COUNT(1) - SUM(sales_flg)) AS buy_ratio
    FROM
         sales_customer
)
,flg_1_ramdom AS(
     SELECT
         c.customer_id
        ,(ABS(CAST((BINARY_CHECKSUM(*) * RAND()) AS int)) % 100) * 1.0 / 100 AS rnd
        ,buy_ratio
    FROM
        customer c
        JOIN sales_customer s
        ON  c.customer_id = s.customer_id CROSS
        JOIN sales_flg_cnt
    WHERE
        sales_flg = 0
)(
    SELECT
        s.*
    INTO
        customer_sample
    FROM
        sales_customer s
        JOIN flg_1_ramdom r
        ON  s.customer_id = r.customer_id
    WHERE
        rnd <= buy_ratio
)
UNION
(
    SELECT
        s.*
    FROM
        sales_customer s
    WHERE
        sales_flg = 1
)
;
-- 確認（RANDOM関数をつかっているため、多少のズレは乗じる）
SELECT
     sales_flg
    ,COUNT(1)
FROM
    customer_sample
GROUP BY
     sales_flg
;


/**************************************
SQL-092	顧客テーブル（customer）では、性別に関する情報が非正規化の状態で保持されている。これを第三正規化せよ。
**************************************/
DROP TABLE IF EXISTS customer_std
;
SELECT
     customer_id
    ,customer_name
    ,gender_cd
    ,birth_day
    ,age
    ,postal_cd
    ,application_store_cd
    ,application_date
    ,status_cd
INTO
    customer_std
FROM
     customer
;
DROP TABLE IF EXISTS gender_std
;
SELECT DISTINCT
     gender_cd
    ,gender
INTO
    gender_std
FROM
     customer
;
SELECT
    *
FROM
     gender_std
;


/**************************************
SQL-093	商品テーブル（product）では各カテゴリのコード値だけを保有し、カテゴリ名は保有していない。カテゴリテーブル（category）と組み合わせて非正規化し、カテゴリ名を保有した新たな商品テーブルを作成せよ。
**************************************/
DROP TABLE IF EXISTS product_full
;
SELECT
     p.product_cd
    ,p.category_major_cd
    ,c.category_major_name
    ,p.category_medium_cd
    ,c.category_medium_name
    ,p.category_small_cd
    ,c.category_small_name
    ,p.unit_price
    ,p.unit_cost
INTO
    product_full
FROM
     product p
JOIN category c
ON  p.category_small_cd = c.category_small_cd
;
SELECT
    *
FROM
     product_full
;


/**************************************
SQL-094	先に作成したカテゴリ名付き商品データを以下の仕様でファイル出力せよ。出力先のパスは'/tmp/data'を指定することでJupyterの/'work/data'と共有されるようになっている。なお、COPYコマンドの権限は付与済みである。
・ファイル形式はCSV（カンマ区切り）
・ヘッダ有り
・文字コードはUTF-8
**************************************/
--コマンドプロンプトで
--管理者権限で
--仕様でヘッダは出力できません
--bcp "SELECT * FROM crm.dbo.product_full" queryout "C:\product_full_utf8.csv" -c -C65001 -t , -S 192.168.1.1 -U user01 -P password01


/**************************************
SQL-095	先に作成したカテゴリ名付き商品データを以下の仕様でファイル出力せよ。出力先のパスは'/tmp/data'を指定することでJupyterの/'work/data'と共有されるようになっている。なお、COPYコマンドの権限は付与済みである。
・ファイル形式はCSV（カンマ区切り）
・ヘッダ有り
・文字コードはSJIS
**************************************/
--コマンドプロンプトで
--管理者権限で
--仕様でヘッダは出力できません
--bcp "SELECT * FROM crm.dbo.product_full" queryout "C:\product_full_sjis.csv" -c -C932 -t , -S 192.168.1.1 -U user01 -P password01


/**************************************
SQL-096	先に作成したカテゴリ名付き商品データを以下の仕様でファイル出力せよ。出力先のパスは'/tmp/data'を指定することでJupyterの/'work/data'と共有されるようになっている。なお、COPYコマンドの権限は付与済みである。
・ファイル形式はCSV（カンマ区切り）
・ヘッダ無し
・文字コードはUTF-8
**************************************/
--コマンドプロンプトで
--管理者権限で
--仕様でヘッダは出力できません
--bcp "SELECT * FROM crm.dbo.product_full" queryout "C:\product_full_utf8.csv" -c -C65001 -t , -S 192.168.1.1 -U user01 -P password01


/**************************************
SQL-097	先に作成した以下形式のファイルを読み込み、テーブルを作成せよ。また、先頭3件を表示させ、正しくとりまれていることを確認せよ。
・ファイル形式はCSV（カンマ区切り）
・ヘッダ有り
・文字コードはUTF-8
**************************************/
DROP TABLE IF EXISTS product_full_1
;
CREATE TABLE product_full_1(
     product_cd NVARCHAR(10)
    ,category_major_cd NVARCHAR(2)
    ,category_major_name NVARCHAR(20)
    ,category_medium_cd NVARCHAR(4)
    ,category_medium_name NVARCHAR(20)
    ,category_small_cd NVARCHAR(6)
    ,category_small_name NVARCHAR(20)
    ,unit_price INT
    ,unit_cost INT
)
;
truncate TABLE product_full_1
;
BULK
INSERT product_full_1
FROM
     'D:\BeaconCRM\SAS_DATA\rawdata\WORK\product_full.csv' WITH(
         FIRSTROW = 2
        ,DATAFILETYPE = 'char'
        ,CODEPAGE = '65001'
        ,FIELDTERMINATOR = ','
        ,ROWTERMINATOR = '\n'
    )
;
SELECT
    *
FROM
     product_full_1
;


/**************************************
SQL-098	先に作成した以下形式のファイルを読み込み、テーブルを作成せよ。また、先頭3件を表示させ、正しくとりまれていることを確認せよ。
・ファイル形式はCSV（カンマ区切り）
・ヘッダ無し
・文字コードはUTF-8
**************************************/
DROP TABLE IF EXISTS product_full_1
;
CREATE TABLE product_full_1(
     product_cd NVARCHAR(10)
    ,category_major_cd NVARCHAR(2)
    ,category_major_name NVARCHAR(20)
    ,category_medium_cd NVARCHAR(4)
    ,category_medium_name NVARCHAR(20)
    ,category_small_cd NVARCHAR(6)
    ,category_small_name NVARCHAR(20)
    ,unit_price INT
    ,unit_cost INT
)
;
truncate TABLE product_full_1
;
BULK
INSERT product_full_1
FROM
     'D:\BeaconCRM\SAS_DATA\rawdata\WORK\product_full.csv' WITH(
         FIRSTROW = 1
        ,DATAFILETYPE = 'char'
        ,CODEPAGE = '65001'
        ,FIELDTERMINATOR = ','
        ,ROWTERMINATOR = '\n'
    )
;
SELECT
    *
FROM
    product_full_1
;


/**************************************
SQL-099	先に作成したカテゴリ名付き商品データを以下の仕様でファイル出力せよ。出力先のパスは'/tmp/data'を指定することでJupyterの/'work/data'と共有されるようになっている。なお、COPYコマンドの権限は付与済みである。
・ファイル形式はTSV（タブ区切り）
・ヘッダ有り
・文字コードはUTF-8
**************************************/
--省略
--仕様でヘッダは出力できません


/**************************************
SQL-100	先に作成した以下形式のファイルを読み込み、テーブルを作成せよ。また、先頭10件を表示させ、正しくとりまれていることを確認せよ。
・ファイル形式はTSV（タブ区切り）
・ヘッダ有り
・文字コードはUTF-8
**************************************/
--省略
--仕様でヘッダは出力できません

/**************************************/
--おしまい
