-- Criação de índices

-- Índice na coluna Dno da tabela Funcionario
CREATE INDEX idx_funcionario_departamento ON Funcionario(Dno);

-- Índice na coluna Dlocation da tabela LocalizacoesDepartamento
CREATE INDEX idx_localizacoesdepartamento_cidade ON LocalizacoesDepartamento(Dlocation);
