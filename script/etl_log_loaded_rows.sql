-- this procedure gets rows_nums after load: 

CREATE OR REPLACE PROCEDURE etl.etl_log_loaded_rows(
    p_run_id INT,
    p_sql TEXT,
    p_label TEXT
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_rows INT;
	v_total_rows INT;
BEGIN
    EXECUTE p_sql;

    GET DIAGNOSTICS v_rows = ROW_COUNT;

    RAISE NOTICE 'Loaded % rows into %', v_rows, p_label;

    UPDATE etl.etl_run_log
    SET rows_loaded = rows_loaded+ v_rows
    WHERE run_id = p_run_id
	Returning rows_loaded into v_total_rows;
    RAISE NOTICE 'Total loaded_rows: %', v_total_rows;

    IF v_rows = 0 THEN
        RAISE EXCEPTION '% loaded 0 rows', p_label;
    END IF;

END;
$$;
