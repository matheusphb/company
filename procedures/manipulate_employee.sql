USE company_db;

DELIMITER $$

CREATE PROCEDURE manipulate_employee(
    IN action INT,
    IN p_ssn CHAR(9),
    IN p_fname VARCHAR(255),
    IN p_minit CHAR(1),
    IN p_lname VARCHAR(255),
    IN p_bdate DATE,
    IN p_address VARCHAR(255),
    IN p_sex CHAR(1),
    IN p_salary DECIMAL(10,2),
    IN p_super_ssn CHAR(9),
    IN p_dno INT
)
BEGIN
    CASE action
        WHEN 1 THEN -- Insert
            INSERT INTO Funcionario (Ssn, Fname, Minit, Lname, Bdate, Address, Sex, Salary, Super_ssn, Dno)
            VALUES (p_ssn, p_fname, p_minit, p_lname, p_bdate, p_address, p_sex, p_salary, p_super_ssn, p_dno);
        WHEN 2 THEN -- Update
            UPDATE Funcionario
            SET Fname = p_fname, Minit = p_minit, Lname = p_lname, Bdate = p_bdate, Address = p_address, Sex = p_sex, Salary = p_salary, Super_ssn = p_super_ssn, Dno = p_dno
            WHERE Ssn = p_ssn;
        WHEN 3 THEN -- Delete
            DELETE FROM Funcionario WHERE Ssn = p_ssn;
        WHEN 4 THEN -- Select
            SELECT * FROM Funcionario WHERE Ssn = p_ssn;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Invalid action value';
    END CASE;
END$$

DELIMITER ;
