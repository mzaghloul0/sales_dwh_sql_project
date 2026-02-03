CREATE OR REPLACE PROCEDURE bronze.etl_load_bronze()
LANGUAGE plpgsql
AS $$
DECLARE 
  v_run_id INT;
BEGIN
  INSERT INTO etl.etl_run_log(layer, job_name) 
  VALUES ('bronze','etl_load_bronze')
  RETURNING run_id INTO v_run_id;

  TRUNCATE TABLE
    bronze.crm_accounts_info,
    bronze.crm_products_info,
    bronze.crm_sales_teams_info,
    bronze.crm_sales_pipeline_info;

  CALL etl.etl_log_loaded_rows(
    v_run_id,
    $SQL$COPY bronze.crm_accounts_info
        FROM 'file path'
        DELIMITER ',' CSV HEADER$SQL$,
    'crm_accounts_info'
  );

  CALL etl.etl_log_loaded_rows(
    v_run_id,
    $SQL$COPY bronze.crm_products_info
        FROM 'file path'
        DELIMITER ',' CSV HEADER$SQL$,
    'crm_products_info'
  );

  CALL etl.etl_log_loaded_rows(
    v_run_id,
    $SQL$COPY bronze.crm_sales_teams_info
        FROM 'file path'
        DELIMITER ',' CSV HEADER$SQL$,
    'crm_sales_teams_info'
  );

  CALL etl.etl_log_loaded_rows(
    v_run_id,
    $SQL$COPY bronze.crm_sales_pipeline_info
        FROM 'file_path'
        DELIMITER ',' CSV HEADER$SQL$,
    'crm_sales_pipeline_info'
  );

  UPDATE etl.etl_run_log 
  SET status = 'success',
      finished_at = now()
  WHERE run_id = v_run_id;

EXCEPTION WHEN OTHERS THEN
  UPDATE etl.etl_run_log 
  SET status = 'failed',
      finished_at = now(),
      message = SQLERRM
  WHERE run_id = v_run_id;

  RAISE;
END;
$$;

call bronze.etl_load_bronze();
