-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01/12/2025 às 14:54
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `e-comercegustavoo`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `carrinho`
--

CREATE TABLE `carrinho` (
  `id_carrinho` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_endereco` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `data_adicao` timestamp NOT NULL DEFAULT current_timestamp(),
  `descricao_produto` varchar(255) NOT NULL,
  `cliente_nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `carrinho`
--

INSERT INTO `carrinho` (`id_carrinho`, `id_cliente`, `id_endereco`, `id_produto`, `preco`, `quantidade`, `data_adicao`, `descricao_produto`, `cliente_nome`) VALUES
(7, 0, 0, 1, 100.00, 1, '2025-12-01 13:37:43', 'Boneco do Sonic', 'João da Silva'),
(8, 0, 0, 2, 120.00, 1, '2025-12-01 13:37:43', 'Boneco do Pikachu', 'Junin'),
(9, 0, 0, 3, 150.00, 1, '2025-12-01 13:37:43', 'Boneco do Kratos', 'Gabriel Ribeiro Jr');

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nome`, `cpf`, `data_nascimento`) VALUES
(1, 'João da Silva', '123.456.789-10', '1980-11-09'),
(2, 'Junin', '099.566.889-98', '1997-03-10'),
(3, 'gabriel ribeiro jr', '014-293-971-13', '1985-04-12');

-- --------------------------------------------------------

--
-- Estrutura para tabela `contato`
--

CREATE TABLE `contato` (
  `contato_id` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `mensagem` text DEFAULT NULL,
  `data_contato` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `endereco`
--

CREATE TABLE `endereco` (
  `id_endereco` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `bairro` varchar(80) DEFAULT NULL,
  `cidade` varchar(80) DEFAULT NULL,
  `estado` char(2) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `estado`
--

CREATE TABLE `estado` (
  `id` int(11) NOT NULL,
  `nome_estado` varchar(255) NOT NULL,
  `sigla_estado` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `logadouro`
--

CREATE TABLE `logadouro` (
  `id` int(11) NOT NULL,
  `tipo_logradouro` varchar(50) NOT NULL,
  `nome_logradouro` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `logadouro`
--

INSERT INTO `logadouro` (`id`, `tipo_logradouro`, `nome_logradouro`) VALUES
(1, 'Rua', 'Rua das Flores');

-- --------------------------------------------------------

--
-- Estrutura para tabela `numero`
--

CREATE TABLE `numero` (
  `id` int(11) NOT NULL,
  `numero_imovel` varchar(20) NOT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `logadouro_id` int(11) DEFAULT NULL,
  `bairro_id` int(11) DEFAULT NULL,
  `cidade_id` int(11) DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `cep_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `produto_id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `jogo` varchar(255) DEFAULT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `tipo_produto` enum('Personagem','Figura de Ação','Colecionável') DEFAULT 'Personagem',
  `preco` decimal(10,2) NOT NULL,
  `estoque` int(11) DEFAULT 0,
  `descricao` text DEFAULT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`produto_id`, `nome`, `jogo`, `marca`, `tipo_produto`, `preco`, `estoque`, `descricao`, `data_cadastro`) VALUES
(1, 'Boneco do Sonic', 'Sonic the Hedgehog', 'Sega', 'Personagem', 100.00, 50, 'Boneco do Sonic com detalhes incríveis para colecionadores.', '2025-12-01 12:30:04'),
(2, 'Boneco de Kratos', 'God of War', 'PlayStation', 'Personagem', 150.00, 30, 'Boneco do Kratos com acessórios exclusivos de God of War.', '2025-12-01 12:30:04'),
(3, 'Boneco do Mario', 'Super Mario', 'Nintendo', 'Personagem', 120.00, 100, 'Boneco do Mario com vestuário característico.', '2025-12-01 12:30:04'),
(4, 'Boneco da Lara Croft', 'Tomb Raider', 'Square Enix', 'Personagem', 130.00, 20, 'Boneco da Lara Croft com mochila e armas.', '2025-12-01 12:30:04'),
(14, 'Boneco do Pikachu', 'pokemon', 'nintendo', 'Personagem', 120.00, 90, 'o pokémon mais desejavel de gerações passadas que com icrivelç habilidades relampegos ajuda ash na sua aventura lendaria ', '2025-12-01 13:03:52');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD PRIMARY KEY (`id_carrinho`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `contato`
--
ALTER TABLE `contato`
  ADD PRIMARY KEY (`contato_id`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Índices de tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`id_endereco`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Índices de tabela `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `logadouro`
--
ALTER TABLE `logadouro`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `numero`
--
ALTER TABLE `numero`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`produto_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `carrinho`
--
ALTER TABLE `carrinho`
  MODIFY `id_carrinho` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `contato`
--
ALTER TABLE `contato`
  MODIFY `contato_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `id_endereco` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `estado`
--
ALTER TABLE `estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `logadouro`
--
ALTER TABLE `logadouro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `numero`
--
ALTER TABLE `numero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `produto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `contato`
--
ALTER TABLE `contato`
  ADD CONSTRAINT `contato_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);

--
-- Restrições para tabelas `endereco`
--
ALTER TABLE `endereco`
  ADD CONSTRAINT `endereco_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
