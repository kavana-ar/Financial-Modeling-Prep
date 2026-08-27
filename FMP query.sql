-- View stock data
SELECT *
FROM stock_data;

-- View earnings data
SELECT *
FROM earnings_data;

-- Check available values in the earnings table
SELECT
    COUNT(*) AS total_rows,
    COUNT("epsActual") AS eps_actual_available,
    COUNT("epsEstimated") AS eps_estimated_available,
    COUNT("revenueActual") AS revenue_actual_available,
    COUNT("revenueEstimated") AS revenue_estimated_available
FROM earnings_data;


-- 1. Find the latest 4 completed earnings reports
SELECT *
FROM earnings_data
WHERE "date" <= '2026-08-21'
ORDER BY "date" DESC
LIMIT 4;


-- 2. Find the stock price on each earnings date
SELECT
    e."date",
    e."epsActual",
    s."close"
FROM earnings_data e
JOIN stock_data s
    ON e."date" = s."date"
WHERE e."date" <= '2026-08-21'
ORDER BY e."date" DESC
LIMIT 4;


-- 3. Find the closing prices 3 trading days before one earnings date
SELECT
    "date",
    "close"
FROM stock_data
WHERE "date" < '2026-07-30'
ORDER BY "date" DESC
LIMIT 3;


-- 4. Find Apple's closing price 3 trading days before each of the four completed earnings dates
WITH latest_4 AS (
    SELECT "date" AS earnings_date
    FROM earnings_data
    WHERE "date" <= '2026-08-21'
    ORDER BY "date" DESC
    LIMIT 4
)
SELECT
    e.earnings_date,
    (
        SELECT s."close"
        FROM stock_data s
        WHERE s."date" < e.earnings_date
        ORDER BY s."date" DESC
        OFFSET 2
        LIMIT 1
    ) AS close_3_days_before
FROM latest_4 e
ORDER BY e.earnings_date DESC;


-- 5. Find the earnings-day closing price
SELECT
    e."date" AS earnings_date,
    s."close" AS earnings_day_close
FROM earnings_data e
JOIN stock_data s
    ON e."date" = s."date"
WHERE e."date" <= '2026-08-21'
ORDER BY e."date" DESC
LIMIT 4;


-- 6. Find the stock price 3 trading days after earnings
WITH latest_4 AS (
    SELECT "date" AS earnings_date
    FROM earnings_data
    WHERE "date" <= '2026-08-21'
    ORDER BY "date" DESC
    LIMIT 4
)
SELECT
    e.earnings_date,
    (
        SELECT s."close"
        FROM stock_data s
        WHERE s."date" > e.earnings_date
        ORDER BY s."date" ASC
        OFFSET 2
        LIMIT 1
    ) AS close_3_days_after
FROM latest_4 e
ORDER BY e.earnings_date DESC;


-- 7. Calculate the stock-price reaction
WITH latest_4 AS (
    SELECT
        "date" AS earnings_date
    FROM earnings_data
    WHERE "date" <= '2026-08-21'
    ORDER BY "date" DESC
    LIMIT 4
),
price_data AS (
    SELECT
        e.earnings_date,

        (
            SELECT s."close"
            FROM stock_data s
            WHERE s."date" < e.earnings_date
            ORDER BY s."date" DESC
            OFFSET 2 LIMIT 1
        ) AS price_before,

        (
            SELECT s."close"
            FROM stock_data s
            WHERE s."date" = e.earnings_date
        ) AS earnings_day_price,

        (
            SELECT s."close"
            FROM stock_data s
            WHERE s."date" > e.earnings_date
            ORDER BY s."date" ASC
            OFFSET 2 LIMIT 1
        ) AS price_after

    FROM latest_4 e
)
SELECT
    earnings_date,
    price_before,
    earnings_day_price,
    price_after,
    ROUND(
        (((price_after - price_before) / price_before) * 100)::numeric,
        2
    ) AS price_change_percent
FROM price_data
ORDER BY earnings_date DESC;


-- 8. Compare EPS surprise with stock-price reaction
WITH latest_4 AS (
    SELECT
        "date" AS earnings_date,
        "epsActual",
        "epsEstimated"
    FROM earnings_data
    WHERE "date" <= '2026-08-21'
      AND "epsActual" IS NOT NULL
      AND "epsEstimated" IS NOT NULL
    ORDER BY "date" DESC
    LIMIT 4
),
price_data AS (
    SELECT
        e.earnings_date,
        e."epsActual",
        e."epsEstimated",

        (
            SELECT s."close"
            FROM stock_data s
            WHERE s."date" < e.earnings_date
            ORDER BY s."date" DESC
            OFFSET 2 LIMIT 1
        ) AS price_before,

        (
            SELECT s."close"
            FROM stock_data s
            WHERE s."date" > e.earnings_date
            ORDER BY s."date" ASC
            OFFSET 2 LIMIT 1
        ) AS price_after

    FROM latest_4 e
)
SELECT
    earnings_date,
    "epsActual",
    "epsEstimated",

    ROUND(
        ("epsActual" - "epsEstimated")::numeric,
        2
    ) AS eps_surprise,

    CASE
        WHEN "epsActual" > "epsEstimated" THEN 'Beat'
        WHEN "epsActual" < "epsEstimated" THEN 'Miss'
        ELSE 'Met'
    END AS earnings_result,

    price_before,
    price_after,

    ROUND(
        (((price_after - price_before) / price_before) * 100)::numeric,
        2
    ) AS stock_price_change_percent

FROM price_data
ORDER BY earnings_date DESC;

jnjn



