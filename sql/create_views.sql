-- Script para criar todas as views com OR REPLACE

-- Número de empregados por departamento e localidade
CREATE OR REPLACE VIEW view_empregados_por_departamento_localidade AS
SELECT d.Dname, ld.Dlocation, COUNT(f.Ssn) AS total_empregados
FROM Departamento d
JOIN Funcionario f ON d.Dnumber = f.Dno
JOIN LocalizacoesDepartamento ld ON d.Dnumber = ld.Dnumber
GROUP BY d.Dname, ld.Dlocation;

-- Lista de departamentos e seus gerentes
CREATE OR REPLACE VIEW view_departamentos_gerentes AS
SELECT d.Dname, f.Fname AS Mgr_firstname, f.Lname AS Mgr_lastname
FROM Departamento d
JOIN Funcionario f ON d.Mgr_ssn = f.Ssn;

-- Projetos com maior número de empregados
CREATE OR REPLACE VIEW view_projetos_maior_numero_empregados AS
SELECT p.Pname, COUNT(te.Essn) AS total_empregados
FROM Projeto p
JOIN TrabalhaEm te ON p.Pnumber = te.Pno
GROUP BY p.Pname
ORDER BY total_empregados DESC;

-- Lista de projetos, departamentos e gerentes
CREATE OR REPLACE VIEW view_projetos_departamentos_gerentes AS
SELECT p.Pname, d.Dname, f.Fname AS Mgr_firstname, f.Lname AS Mgr_lastname
FROM Projeto p
JOIN Departamento d ON p.Dnum = d.Dnumber
JOIN Funcionario f ON d.Mgr_ssn = f.Ssn;

-- Quais empregados possuem dependentes e se são gerentes
CREATE OR REPLACE VIEW view_empregados_dependentes_gerentes AS
SELECT f.Fname, f.Lname, 
       CASE WHEN d.Mgr_ssn = f.Ssn THEN 'Yes' ELSE 'No' END AS Is_Manager, 
       COUNT(dep.DependentName) AS total_dependentes
FROM Funcionario f
LEFT JOIN Dependente dep ON f.Ssn = dep.Essn
LEFT JOIN Departamento d ON f.Ssn = d.Mgr_ssn
GROUP BY f.Fname, f.Lname, Is_Manager;
