DELIMITER //
CREATE TRIGGER trg_mudancas_saldo
AFTER UPDATE ON contas
FOR EACH ROW
BEGIN
    -- Verifica se o campo 'saldo' foi alterado
    IF OLD.saldo <> NEW.saldo THEN
        INSERT INTO log_auditoria (
            tabela_afetada,
            id_registro_afetado,
            data_mudanca,
            coluna_alterada,
            valor_anterior,
            usuario_mudanca
        )
        VALUES (
            'contas',
            OLD.id_conta,
            NOW(),
            'saldo',
            CAST(OLD.saldo AS CHAR),
            CURRENT_USER()
        );
    END IF;
END//
DELIMITER ;
