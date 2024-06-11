-- Criação das tabelas

-- Tabela Departamento
CREATE TABLE IF NOT EXISTS Departamento (
    Dnumber INT PRIMARY KEY,
    Dname VARCHAR(255),
    Mgr_ssn CHAR(9),
    Mgr_start_date DATE
);

-- Tabela LocalizacoesDepartamento
CREATE TABLE IF NOT EXISTS LocalizacoesDepartamento (
    Dnumber INT,
    Dlocation VARCHAR(255),
    PRIMARY KEY (Dnumber, Dlocation),
    FOREIGN KEY (Dnumber) REFERENCES Departamento(Dnumber)
);

-- Tabela Funcionario
CREATE TABLE IF NOT EXISTS Funcionario (
    Ssn CHAR(9) PRIMARY KEY,
    Fname VARCHAR(255),
    Minit CHAR(1),
    Lname VARCHAR(255),
    Bdate DATE,
    Address VARCHAR(255),
    Sex CHAR(1),
    Salary DECIMAL(10, 2),
    Super_ssn CHAR(9),
    Dno INT,
    FOREIGN KEY (Dno) REFERENCES Departamento(Dnumber)
);

-- Tabela Projeto
CREATE TABLE IF NOT EXISTS Projeto (
    Pnumber INT PRIMARY KEY,
    Pname VARCHAR(255),
    Plocation VARCHAR(255),
    Dnum INT,
    FOREIGN KEY (Dnum) REFERENCES Departamento(Dnumber)
);

-- Tabela TrabalhaEm
CREATE TABLE IF NOT EXISTS TrabalhaEm (
    Essn CHAR(9),
    Pno INT,
    Hours DECIMAL(3, 1),
    PRIMARY KEY (Essn, Pno),
    FOREIGN KEY (Essn) REFERENCES Funcionario(Ssn),
    FOREIGN KEY (Pno) REFERENCES Projeto(Pnumber)
);

-- Tabela Dependente
CREATE TABLE IF NOT EXISTS Dependente (
    Essn CHAR(9),
    DependentName VARCHAR(255),
    Sex CHAR(1),
    Bdate DATE,
    Relationship VARCHAR(255),
    PRIMARY KEY (Essn, DependentName),
    FOREIGN KEY (Essn) REFERENCES Funcionario(Ssn)
);
