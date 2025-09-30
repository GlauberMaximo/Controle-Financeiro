UPDATE contas
SET saldo = 100.00
WHERE id_conta = 6;

UPDATE contas
SET saldo = 2.00
WHERE id_conta = 26;

UPDATE contas
SET saldo = 3700.00
WHERE id_conta = 37;

UPDATE contas
SET saldo = 158.00
WHERE id_conta = 14;

UPDATE contas
SET saldo = saldo - 2700.00
WHERE id_conta = 37;

UPDATE contas
SET saldo = saldo + 781.00
WHERE id_conta = 26;

UPDATE contas
SET saldo = saldo - 8.00
WHERE id_conta = 14;

UPDATE contas
SET saldo = saldo + 492.00
WHERE id_conta = 6;

DELETE FROM transacoes
WHERE id_transacao = 387;

DELETE FROM transacoes
WHERE id_transacao = 248;

DELETE FROM transacoes
WHERE id_transacao = 150;

DELETE FROM transacoes
WHERE id_transacao = 342;