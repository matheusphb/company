-- Relação de empregados por departamento
SELECT d.Dname AS Departamento, GROUP_CONCAT(CONCAT(f.Fname, ' ', f.Lname) SEPARATOR ', ') AS Funcionarios
FROM Funcionario f
JOIN Departamento d ON f.Dno = d.Dnumber
GROUP BY f.Dno;
