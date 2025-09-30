DELIMITER //

CREATE PROCEDURE RealizarTransferencia(
    IN p_conta_origem INT,
    IN p_conta_destino INT,
    IN p_valor DECIMAL(10,2)
)
BEGIN
    DECLARE v_saldo_origem DECIMAL(10,2);
    DECLARE v_msg VARCHAR(100);

    START TRANSACTION;

    -- 1. Verifica saldo
    SELECT saldo INTO v_saldo_origem
    FROM contas
    WHERE id_conta = p_conta_origem
      FOR UPDATE;               -- bloqueia a linha durante a transação

    IF v_saldo_origem < p_valor THEN
        SET v_msg = 'Saldo insuficiente';
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = v_msg;   -- aborta
    END IF;

    -- 2. Debita origem
    UPDATE contas
       SET saldo = saldo - p_valor
     WHERE id_conta = p_conta_origem;

    -- 3. Credita destino
    UPDATE contas
       SET saldo = saldo + p_valor
     WHERE id_conta = p_conta_destino;

    -- 4. Registra na tabela de transações
    INSERT INTO transacoes (
        id_conta_origem,
        id_conta_destino,
        tipo_transacao,
        valor,
        data_transacao
    ) VALUES (
        p_conta_origem,
        p_conta_destino,
        'Transferencia',
        p_valor,
        NOW()
    );

    COMMIT;
END//

DELIMITER ;

CALL RealizarTransferencia(4, 5, 100.00); -- teste

DELIMITER //

CREATE PROCEDURE listar_transacoes_conta (
    IN p_id_conta INT
)
BEGIN
    -- Listar as transações da conta, mostrando tipo, valor, data e nome do cliente
    SELECT 
        t.id_transacao,
        t.tipo_transacao,
        t.valor,
        t.data_transacao,
        c.nome AS nome_cliente
    FROM transacoes t
    INNER JOIN contas ct 
        ON (t.id_conta_origem = ct.id_conta OR t.id_conta_destino = ct.id_conta)
    INNER JOIN clientes c 
        ON ct.id_cliente = c.id_cliente
    WHERE ct.id_conta = p_id_conta
    ORDER BY t.data_transacao DESC;

    -- Mostrar o total por tipo de transação (resumo)
    SELECT 
        t.tipo_transacao,
        SUM(t.valor) AS total_tipo
    FROM transacoes t
    WHERE t.id_conta_origem = p_id_conta 
       OR t.id_conta_destino = p_id_conta
    GROUP BY t.tipo_transacao;
END //

DELIMITER ;

CALL listar_transacoes_conta(40); -- teste

DELIMITER //

CREATE PROCEDURE contas_com_movimentacao_acima (
    IN p_valor_limite DECIMAL(10,2),
    IN p_data_inicio DATE,
    IN p_data_fim DATE
)
BEGIN
    SELECT 
        c.id_conta,
        cl.nome AS nome_cliente,
        SUM(t.valor) AS total_movimentado
    FROM contas c
    INNER JOIN clientes cl 
        ON c.id_cliente = cl.id_cliente
    INNER JOIN transacoes t 
        ON (t.id_conta_origem = c.id_conta OR t.id_conta_destino = c.id_conta)
    WHERE t.data_transacao BETWEEN p_data_inicio AND p_data_fim
    GROUP BY c.id_conta, cl.nome
    HAVING SUM(t.valor) > p_valor_limite
    ORDER BY total_movimentado DESC;
END //

DELIMITER ;
select * from transacoes;

CALL contas_com_movimentacao_acima(10.000,'2023-01-01 00:00:00','2026-02-28 00:00:00'); -- teste
