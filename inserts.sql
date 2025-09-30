USE controle_financeiro;

-- ==========================
-- INSERIR 40 CLIENTES
-- ==========================

INSERT INTO clientes (nome, cpf, data_nascimento, email) VALUES
('Ana Souza',        '123.456.789-00', '1990-02-15', 'ana.souza@example.com'),
('Bruno Lima',       '123.456.789-01', '1985-07-23', 'bruno.lima@example.com'),
('Carla Ferreira',   '123.456.789-02', '1992-11-30', 'carla.ferreira@example.com'),
('Daniel Costa',     '123.456.789-03', '1988-01-12', 'daniel.costa@example.com'),
('Eduarda Martins',  '123.456.789-04', '1995-05-09', 'eduarda.martins@example.com'),
('Felipe Gomes',     '123.456.789-05', '1987-06-18', 'felipe.gomes@example.com'),
('Gabriela Rocha',   '123.456.789-06', '1993-12-25', 'gabriela.rocha@example.com'),
('Henrique Alves',   '123.456.789-07', '1991-04-05', 'henrique.alves@example.com'),
('Isabela Torres',   '123.456.789-08', '1994-08-14', 'isabela.torres@example.com'),
('João Pereira',     '123.456.789-09', '1989-03-22', 'joao.pereira@example.com'),
('Karen Ribeiro',    '123.456.789-10', '1996-07-10', 'karen.ribeiro@example.com'),
('Lucas Fernandes',  '123.456.789-11', '1990-09-28', 'lucas.fernandes@example.com'),
('Mariana Castro',   '123.456.789-12', '1993-10-03', 'mariana.castro@example.com'),
('Nicolas Duarte',   '123.456.789-13', '1992-02-17', 'nicolas.duarte@example.com'),
('Olivia Barros',    '123.456.789-14', '1997-11-12', 'olivia.barros@example.com'),
('Paulo Henrique',   '123.456.789-15', '1986-06-01', 'paulo.henrique@example.com'),
('Quésia Almeida',   '123.456.789-16', '1998-05-18', 'quesia.almeida@example.com'),
('Rafael Moreira',   '123.456.789-17', '1991-12-07', 'rafael.moreira@example.com'),
('Sabrina Nunes',    '123.456.789-18', '1995-01-19', 'sabrina.nunes@example.com'),
('Thiago Carvalho',  '123.456.789-19', '1987-04-11', 'thiago.carvalho@example.com'),
('Ursula Prado',     '123.456.789-20', '1993-08-20', 'ursula.prado@example.com'),
('Victor Ramos',     '123.456.789-21', '1994-09-15', 'victor.ramos@example.com'),
('Wesley Braga',     '123.456.789-22', '1989-02-08', 'wesley.braga@example.com'),
('Xavier Pires',     '123.456.789-23', '1990-06-27', 'xavier.pires@example.com'),
('Yasmin Oliveira',  '123.456.789-24', '1996-11-04', 'yasmin.oliveira@example.com'),
('Zeca Azevedo',     '123.456.789-25', '1992-12-01', 'zeca.azevedo@example.com'),
('Aline Silva',      '123.456.789-26', '1991-05-07', 'aline.silva@example.com'),
('Breno Viana',      '123.456.789-27', '1993-07-23', 'breno.viana@example.com'),
('Cecília Porto',    '123.456.789-28', '1994-10-31', 'cecilia.porto@example.com'),
('Diego Mattos',     '123.456.789-29', '1988-03-13', 'diego.mattos@example.com'),
('Elaine Correia',   '123.456.789-30', '1997-01-29', 'elaine.correia@example.com'),
('Fábio Pinto',      '123.456.789-31', '1990-08-16', 'fabio.pinto@example.com'),
('Giovana Santos',   '123.456.789-32', '1995-09-05', 'giovana.santos@example.com'),
('Heitor Campos',    '123.456.789-33', '1992-06-21', 'heitor.campos@example.com'),
('Ingrid Moura',     '123.456.789-34', '1993-12-18', 'ingrid.moura@example.com'),
('Jonas Teixeira',   '123.456.789-35', '1994-04-30', 'jonas.teixeira@example.com'),
('Karla Freitas',    '123.456.789-36', '1991-07-27', 'karla.freitas@example.com'),
('Leandro Braga',    '123.456.789-37', '1989-11-22', 'leandro.braga@example.com'),
('Marta Vidal',      '123.456.789-38', '1996-10-12', 'marta.vidal@example.com'),
('Natália Figueira', '123.456.789-39', '1993-02-03', 'natalia.figueira@example.com');

-- ==========================
-- INSERIR 40 CONTAS
-- ==========================

INSERT INTO contas (id_cliente, numero_conta, saldo, data_abertura, status)
SELECT id_cliente,
       CONCAT('000', LPAD(id_cliente,4,'0')),
       ROUND(RAND() * 5000 + 1000,2),
       DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND()*600) DAY),
       'Ativa'
FROM clientes;

-- ==========================
-- INSERIR 500 TRANSAÇÕES
-- ==========================

DELIMITER $$

CREATE PROCEDURE popular_transacoes()
BEGIN
  DECLARE i INT DEFAULT 1;
  DECLARE origem INT;
  DECLARE destino INT;
  DECLARE tipo VARCHAR(20);
  DECLARE valor DECIMAL(10,2);
  
  WHILE i <= 500 DO
    -- Seleciona contas aleatórias
    SET origem = FLOOR(RAND()*40) + 1;
    SET destino = FLOOR(RAND()*40) + 1;
    
    -- Evitar mesma conta na transferência
    IF origem = destino THEN
      SET destino = (destino MOD 40) + 1;
    END IF;
    
    -- Define tipo de transação
    CASE FLOOR(RAND()*3)
      WHEN 0 THEN SET tipo = 'Deposito';
      WHEN 1 THEN SET tipo = 'Saque';
      ELSE SET tipo = 'Transferencia';
    END CASE;
    
    -- Define valor
    SET valor = ROUND(RAND()*1000 + 50,2);
    
    INSERT INTO transacoes (id_conta_origem, id_conta_destino, tipo_transacao, valor, data_transacao)
    VALUES (
      origem,
      IF(tipo='Transferencia', destino, NULL),
      tipo,
      valor,
      DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND()*630) DAY)
    );
    
    SET i = i + 1;
  END WHILE;
END$$

DELIMITER ;

-- Executar o procedimento para popular a tabela
CALL popular_transacoes();

-- (Opcional) Remover o procedimento após o uso
DROP PROCEDURE popular_transacoes;

select * from clientes;
select * from contas;
select * from transacoes;
