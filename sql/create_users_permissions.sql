-- Criação de usuários e definição de permissões

-- Usuário gerente
CREATE USER IF NOT EXISTS 'gerente'@'localhost' IDENTIFIED BY 'senha_gerente';
GRANT SELECT ON company_db.Departamento TO 'gerente'@'localhost';
GRANT SELECT ON company_db.Funcionario TO 'gerente'@'localhost';
GRANT SELECT ON company_db.LocalizacoesDepartamento TO 'gerente'@'localhost';
GRANT SELECT ON company_db.Projeto TO 'gerente'@'localhost';
GRANT SELECT ON company_db.TrabalhaEm TO 'gerente'@'localhost';
GRANT SELECT ON company_db.Dependente TO 'gerente'@'localhost';

-- Views acessíveis pelo gerente
GRANT SELECT ON company_db.view_empregados_por_departamento_localidade TO 'gerente'@'localhost';
GRANT SELECT ON company_db.view_departamentos_gerentes TO 'gerente'@'localhost';
GRANT SELECT ON company_db.view_projetos_maior_numero_empregados TO 'gerente'@'localhost';
GRANT SELECT ON company_db.view_projetos_departamentos_gerentes TO 'gerente'@'localhost';
GRANT SELECT ON company_db.view_empregados_dependentes_gerentes TO 'gerente'@'localhost';

-- Usuário employee
CREATE USER IF NOT EXISTS 'employee'@'localhost' IDENTIFIED BY 'senha_employee';
GRANT SELECT ON company_db.Funcionario TO 'employee'@'localhost';
GRANT SELECT ON company_db.Dependente TO 'employee'@'localhost';

-- Views acessíveis pelo employee
GRANT SELECT ON company_db.view_empregados_dependentes_gerentes TO 'employee'@'localhost';
