-- Número de empregados por departamento e localidade
CREATE VIEW view_empregados_por_departamento_localidade AS
SELECT d.Dname, ld.Dlocation, COUNT(f.Ssn) AS total_empregados
FROM Departamento d
JOIN Funcionario f ON d.Dnumber = f.Dno
JOIN LocalizacoesDepartamento ld ON d.Dnumber = ld.Dnumber
GROUP BY d.Dname, ld.Dlocation;
