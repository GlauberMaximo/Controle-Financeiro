create database controle_financeiro;
use controle_financeiro;
create table clientes (
	id_cliente int primary key auto_increment, -- Index
    nome varchar(100) not null,
    cpf varchar(14) unique not null,
    data_nascimento date,
    email varchar(100) unique
);

create table contas (
	id_conta int primary key auto_increment,
    id_cliente int, -- FK
    numero_conta varchar(20) unique not null,
    saldo decimal(10,2) not null, 
    data_abertura date not null,
    status varchar(10) not null
);

create table transacoes (
	id_transacao int primary key auto_increment,
    id_conta_origem int, -- FK
    id_conta_destino int, -- FK
    tipo_transacao varchar(20) not null,
    valor decimal(10,2) not null,
    data_transacao datetime not null -- Index
);

create table log_auditoria(
	id_log int primary key auto_increment,
    tabela_afetada varchar(50) not null,
    id_registro_afetado int not null,
    data_mudanca datetime not null,
    coluna_alterada varchar(50) not null,
    valor_anterior varchar(100) not null,
	usuario_mudanca varchar(50) not null
);

-- Index 
create index idx_id_cliente on clientes(id_cliente);
create index idx_data_transacao on transacoes(data_transacao);

-- Foreign Keys
alter table contas
add constraint fk_contas_id_cliente foreign key (id_cliente) references clientes(id_cliente);

alter table transacoes
add constraint fk_transacoes_id_conta_origem foreign key (id_conta_origem) references contas(id_conta);

alter table transacoes
add constraint fk_transacoes_id_conta_destino foreign key (id_conta_destino) references contas(id_conta);

ALTER TABLE transacoes MODIFY COLUMN tipo_transacao VARCHAR(20) NOT NULL;
