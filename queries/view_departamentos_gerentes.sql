-- Lista de departamentos e seus gerentes
CREATE VIEW view_departamentos_gerentes AS
SELECT d.Dname, f.Fname AS Mgr_firstname, f.Lname AS Mgr_lastname
FROM Departamento d
JOIN Funcionario f ON d.Mgr_ssn = f.Ssn;
