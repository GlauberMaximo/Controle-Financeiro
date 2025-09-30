SELECT *
FROM transacoes
WHERE valor BETWEEN 100 AND 500;

SELECT * -- Retornar as alteracoes do tipo 'credito'
FROM transacoes 
WHERE tipo_transacao = 'credito'; 

SELECT * -- Retornar as 10 transacoes mais recentes
FROM transacoes
ORDER BY data_transacao DESC
LIMIT 10;

SELECT *
FROM transacoes
WHERE tipo_transacao = 'debito'
  AND valor BETWEEN 200 AND 1000
ORDER BY data_transacao DESC
LIMIT 5;

SELECT * -- Retornar as 10 transações mais recentes da conta de origem com id 1.
FROM transacoes
WHERE id_conta_origem = 1
ORDER BY data_transacao DESC
LIMIT 10;

