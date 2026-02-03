-- table for ETL-Log

DROP TABLE IF EXISTS etl.etl_run_log;
CREATE TABLE etl.etl_run_log (
  run_id      SERIAL PRIMARY KEY,
  layer       TEXT NOT NULL,
  job_name    TEXT NOT NULL,
  started_at  TIMESTAMP NOT NULL DEFAULT now(),
  finished_at TIMESTAMP,
  load_time INTERVAL GENERATED ALWAYS AS (finished_at - started_at) STORED, 
  status      TEXT NOT NULL DEFAULT 'running',
  rows_loaded INT DEFAULT 0,
  message     TEXT DEFAULT 'none'
);


select * from etl.etl_run_log;
