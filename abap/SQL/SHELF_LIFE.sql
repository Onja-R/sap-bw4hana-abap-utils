
______________________________________________________________________________________________________

WITH w AS (
	SELECT DISTINCT
		0material,
		CASE 
			WHEN iprkz = '1' THEN COALESCE( CAST( mhdrz AS integer), mhdrz )					--- dec to int
			WHEN iprkz = '2' THEN COALESCE( CAST( FLOOR( mhdrz / 30 ) AS integer), mhdrz )		--- if duration in days then we devide by 30 to get roughly the number of months
			ELSE mhdrz
		END AS mhdrz
	
)

SELECT 	
	a.0material,
	a.batch
	COALESCE( year( add_month(b.wm_bbsled, -w.mhdrz) ) || month( add_month(b.wm_bbsled, -w.mhdrz)  ), '0000000' ) as cdluomon, --- then substract the duration from the best before date
	a.stockqty
	
	FROM dmatdocb a
	
	LEFT JOIN dbvmc1 b 
	  ON a.0material = b.0material
	 AND a.batch = b.batch
	
	LEFT JOIN wmaterial w 
	  ON a.0material = w.0material	  


______________________________________________________________________________________________________

WITH w AS (
    SELECT DISTINCT
        0material,
		CASE 
			WHEN iprkz = '1' AND mhdrz BETWEEN 1 AND 999 THEN CAST(mhdrz AS INTEGER)
			WHEN iprkz = '2' AND mhdrz BETWEEN 1 AND 9999 THEN CAST(FLOOR(mhdrz / 30.0) AS INTEGER)
			WHEN iprkz = '3' AND mhdrz BETWEEN 1 AND 10 THEN CAST(mhdrz * 12 AS INTEGER)
			ELSE 0 
		END AS mhdrz
		
    FROM wmaterial
    WHERE mhdrz IS NOT NULL
)

SELECT 	
    a.0material,
    a.batch,
	b.wm_bbsled,
    CASE 
        WHEN b.wm_bbsled IS NOT NULL AND w.mhdrz > 0 THEN TO_VARCHAR(ADD_MONTHS(b.wm_bbsled, -w.mhdrz), 'YYYYMM')
		WHEN b.wm_bbsled IS NOT NULL THEN TO_VARCHAR(b.wm_bbsled, 'YYYYMM')
        ELSE '000000'
    END AS cdluomon,
    a.stockqty
	
FROM dmatdocb a
LEFT JOIN dbvmc1 b 
  ON a.0material = b.0material
 AND a.batch = b.batch
 
LEFT JOIN w 
  ON a.0material = w.0material