SELECT c.nome, c.cpf, ct.numero_conta, ct.saldo -- transações do tipo subsídio considerando a conta de origem
FROM clientes c
INNER JOIN contas ct ON c.id_cliente = ct.id_cliente;

SELECT id_transacao, id_conta_origem AS id_conta, valor, data_transacao, 'debito' AS tipo -- transações do tipo crédito considerando a conta de destino
FROM transacoes
WHERE tipo_transacao = 'debito'
UNION ALL
SELECT id_transacao, id_conta_destino AS id_conta, valor, data_transacao, 'credito' AS tipo
FROM transacoes
WHERE tipo_transacao = 'credito';