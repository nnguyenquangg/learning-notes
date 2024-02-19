
  WITH RECURSIVE employee_tree AS (
    SELECT id, name, "supervisorId", 0 AS level
    FROM "Employee"
    WHERE "supervisorId" IS NULL
  
    UNION ALL 

    SELECT e.id, e.name, e."supervisorId", et.level + 1
    FROM "Employee" e
    JOIN employee_tree et ON e."supervisorId" = et.id
  )

  SELECT id, name, level, "supervisorId"
  FROM employee_tree
  ORDER BY level, name;