-- Quais empregados possuem dependentes e se são gerentes
CREATE VIEW view_empregados_dependentes_gerentes AS
SELECT f.Fname, f.Lname, 
       CASE WHEN d.Mgr_ssn = f.Ssn THEN 'Yes' ELSE 'No' END AS Is_Manager, 
       COUNT(dep.DependentName) AS total_dependentes
FROM Funcionario f
LEFT JOIN Dependente dep ON f.Ssn = dep.Essn
LEFT JOIN Departamento d ON f.Ssn = d.Mgr_ssn
GROUP BY f.Fname, f.Lname, Is_Manager;
