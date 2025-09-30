# 💰 Cenário de Controle Financeiro de Lançamentos

Este projeto foi desenvolvido para simular um sistema de controle financeiro com foco em **segurança**, **integridade máxima (ACID)** e **implementação de lógica de negócios** diretamente no banco de dados.  

O objetivo é praticar **modelagem de dados**, **consultas SQL**, **procedimentos armazenados** e **controle transacional**, garantindo consistência dos dados.

---

## 📂 Estrutura do Projeto

O sistema é dividido em **módulos de complexidade crescente**:

### 🔹 Módulo Básico — Modelagem e CRUD
- **Modelagem e DDL**
  - Criação das tabelas: `Contas`, `Clientes`, `Transacoes`, `Log_Auditoria`.
  - Definição de **chaves primárias/estrangeiras**, `UNIQUE` para número da conta e `NOT NULL` para saldo.
- **DML**
  - Inserção de **500 transações** para simular volumetria.
  - Operações de `UPDATE` e `DELETE` com restrições.
- **Consultas**
  - Filtros com `BETWEEN` e `WHERE`.
  - Ordenação com `ORDER BY` e limite de resultados com `LIMIT`.

---

### 🔹 Módulo Intermediário — Análise e Estrutura
- **JOINs e UNION**
  - `INNER JOIN` para listar clientes e saldos.
  - `UNION ALL` para combinar débitos e créditos.
- **Agregação e HAVING**
  - `SUM` para calcular totais por conta.
  - `GROUP BY` e `HAVING` para detectar movimentações acima de R$ 10.000,00/mês.
- **Subqueries e Views**
  - `VIEW` para exibir saldos atualizados.
  - `SUBQUERY` para encontrar cliente com menor saldo.
- **Funções e Normalização**
  - Uso de `ROUND` para formatar valores.

---

### 🔹 Módulo Avançado — Programação e Controle Transacional
- **Otimização**
  - Índices (`INDEX`) em `id_cliente` e `data_transacao`.
- **Stored Procedure**
  - `RealizarTransferencia` com operações de débito, crédito e registro de log.
- **Triggers**
  - `AFTER UPDATE` em `Contas` para registrar alterações no `Log_Auditoria`.
- **Transações Programáticas**
  - Verificação de saldo antes de débito.
  - Uso de `ROLLBACK` em caso de saldo insuficiente.
  - Gerenciamento de erros para consistência.
- **Transações (ACID)**
  - Garantia de **atomicidade, consistência, isolamento e durabilidade** em transferências.

---

## 🚀 Tecnologias Utilizadas
- **MySQL 8+**
- **Workbench / CLI**
- **SQL (DDL, DML, DQL, DCL, TCL)**

---
## 👤 Participantes
- **Caue Oliveira**
- **César Augusto**
- **Glauber Máximo**
- **Pedro Matos**

---

## ⚙️ Como Executar
1. Clone este repositório:
   ```bash
   git clone https://github.com/GlauberMaximo/Controle-Financeiro.git
  
## 📄 Licença

Este projeto está licenciado sob a [MIT License](LICENSE).
