SELECT
    -- COALESCE returns the first non-NULL value from the list.
    -- 1. It first checks for a gdivision from the Italian_article table.
    -- 2. If that is NULL, it checks for a gdivision from the Division table.
    -- 3. If both are NULL, it defaults to an empty string ''.
    COALESCE( ia.gdivision, d.gdivision, '' ) AS gdivision,
    a.record,
    a.sql_procedure
FROM
    Asteori AS a
LEFT JOIN
    -- Attempt to find a match in the primary source table.
    Italian_article AS ia ON a.article_no = ia.article_vision
LEFT JOIN
    -- Attempt to find a match in the fallback source table.
    Division AS d ON a."Asteori field" = d.divisiovi;