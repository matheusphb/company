-- Lista de projetos, departamentos e gerentes
CREATE VIEW view_projetos_departamentos_gerentes AS
SELECT p.Pname, d.Dname, f.Fname AS Mgr_firstname, f.Lname AS Mgr_lastname
FROM Projeto p
JOIN Departamento d ON p.Dnum = d.Dnumber
JOIN Funcionario f ON d.Mgr_ssn = f.Ssn;
