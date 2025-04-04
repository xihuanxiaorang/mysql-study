-- 月度销售表
DROP TABLE IF EXISTS sales_monthly;
CREATE TABLE IF NOT EXISTS sales_monthly
(
    product VARCHAR(20),   -- 产品名称
    ym      VARCHAR(10),   -- 年月
    amount  NUMERIC(10, 2) -- 销售金额（元）
);

-- 银行交易日志表
DROP TABLE IF EXISTS transfer_log;
CREATE TABLE IF NOT EXISTS transfer_log
(
    log_id    INTEGER PRIMARY KEY,  -- 交易日志编号
    log_ts    TIMESTAMP   NOT NULL, -- 交易时间
    from_user VARCHAR(50) NOT NULL, -- 交易发起账号
    to_user   VARCHAR(50),          -- 交易接收账号（存款时为空）
    type      VARCHAR(10) NOT NULL, -- 交易类型（存款/转账）
    amount    NUMERIC(10) NOT NULL  -- 交易金额（元）
);