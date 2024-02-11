INSERT INTO accounts (user_id, name, description, balance) VALUES
(1, "Cuenta uno", "Desc uno", 100),
(2, "Cuenta dos", "Desc dos", 500);

INSERT INTO transfers (from_account_id, to_account_id, status, amount, date) VALUES
(2, 1, "PAYED", 10, "2022-01-01");

UPDATE accounts SET balance = balance - 10 WHERE id = 2;
UPDATE accounts SET balance = balance + 10 WHERE id = 1;

START TRANSACTION;
INSERT INTO transfers (from_account_id, to_account_id, status, amount, date) VALUES
(1, 2, "PAYED", 20, "2022-01-01");
UPDATE accounts SET balance = balance - 20 WHERE id = 1;
UPDATE accounts SET balance = balance + 20 WHERE id = 2;
COMMIT;