-- Qual o departamento com maior número de pessoas?
SELECT Dno, COUNT(*) AS total_funcionarios
FROM Funcionario
GROUP BY Dno
ORDER BY total_funcionarios DESC
LIMIT 1;
