-- Projetos com maior número de empregados
CREATE VIEW view_projetos_maior_numero_empregados AS
SELECT p.Pname, COUNT(te.Essn) AS total_empregados
FROM Projeto p
JOIN TrabalhaEm te ON p.Pnumber = te.Pno
GROUP BY p.Pname
ORDER BY total_empregados DESC;
