-- Quais são os departamentos por cidade?
SELECT ld.Dlocation, GROUP_CONCAT(d.Dname SEPARATOR ', ') AS Departamentos
FROM LocalizacoesDepartamento ld
JOIN Departamento d ON ld.Dnumber = d.Dnumber
GROUP BY ld.Dlocation;
