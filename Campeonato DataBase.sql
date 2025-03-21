-- Criando o banco de dados Campeonato
CREATE DATABASE Campeonatoum;

-- Selecionando o banco de dados Campeonato para usar
USE Campeonatoum;

-- Criando a tabela fases com chave primária
CREATE TABLE IF NOT EXISTS fases (
    id_fase INT NOT NULL AUTO_INCREMENT,  -- Chave primária autoincrement
    descricao_fase VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_fase)  -- Definindo id_fase como chave primária
);

-- Criando a tabela de times com chave primária
CREATE TABLE IF NOT EXISTS times (
    id_time INT NOT NULL AUTO_INCREMENT,  -- Chave primária autoincrement
    nome_time VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_time)  -- Definindo id_time como chave primária
);

-- Criando a tabela de jogadores com chave primária
CREATE TABLE IF NOT EXISTS jogadores (
    id_jogador INT NOT NULL AUTO_INCREMENT,  -- Chave primária autoincrement
    nome_jogador VARCHAR(100) NOT NULL,
    id_time INT NOT NULL,
    PRIMARY KEY (id_jogador),  -- Definindo id_jogador como chave primária
    FOREIGN KEY (id_time) REFERENCES times(id_time)  -- Referência para a tabela times
);

-- Criando a tabela de partidas com chave primária e chaves estrangeiras
CREATE TABLE IF NOT EXISTS partidas (
    id_partida INT NOT NULL AUTO_INCREMENT,  -- Chave primária autoincrement
    id_fase INT NOT NULL,  -- Relaciona com a fase do campeonato
    id_time_casa INT NOT NULL,  -- Time mandante
    id_time_visitante INT NOT NULL,  -- Time visitante
    data_partida DATE NOT NULL,  -- Data do jogo (sem hora)
    gols_time_casa INT DEFAULT 0,  -- Gols marcados pelo time mandante
    gols_time_visitante INT DEFAULT 0,  -- Gols marcados pelo time visitante
    saldo_gols_time_casa INT DEFAULT 0,  -- Saldo de gols do time mandante
    saldo_gols_time_visitante INT DEFAULT 0,  -- Saldo de gols do time visitante
    artilheiro_time_casa INT DEFAULT NULL,  -- ID do jogador artilheiro do time mandante
    artilheiro_time_visitante INT DEFAULT NULL,  -- ID do jogador artilheiro do time visitante
    numero_cartoes_time_casa INT DEFAULT 0,  -- Cartões do time mandante
    numero_cartoes_time_visitante INT DEFAULT 0,  -- Cartões do time visitante
    PRIMARY KEY (id_partida),  -- Definindo id_partida como chave primária
    FOREIGN KEY (id_fase) REFERENCES fases(id_fase),  -- Relacionamento com fases
    FOREIGN KEY (id_time_casa) REFERENCES times(id_time),  -- Relacionamento com times (mandante)
    FOREIGN KEY (id_time_visitante) REFERENCES times(id_time),  -- Relacionamento com times (visitante)
    FOREIGN KEY (artilheiro_time_casa) REFERENCES jogadores(id_jogador),  -- Relacionamento com jogadores (artilheiro casa)
    FOREIGN KEY (artilheiro_time_visitante) REFERENCES jogadores(id_jogador)  -- Relacionamento com jogadores (artilheiro visitante)
);

-- Inserindo dados na tabela fases
INSERT INTO fases (id_fase, descricao_fase) VALUES
(1, "Fase de Grupo Ida"),
(2, "Fase de Grupo Volta"),
(3, "Oitavas de Final"),
(4, "Quartas de Final"),
(5, "Semi-Final"),
(6, "Terceiro e Quarto Lugar"),
(7, "Final");

-- Inserir times na tabela times
INSERT INTO times (id_time, nome_time) VALUES
(1, 'Corinthians'),
(2, 'Atlético Mineiro'),
(3, 'Chelsea'),
(4, 'Santos'),
(5, 'Palmeiras'),
(6, 'São Paulo'),
(7, 'Barcelona'),
(8, 'Real Madrid'),
(9, 'Manchester City'),
(10, 'Manchester United'),
(11, 'Inter Milan'),
(12, 'Milan'),
(13, 'Juventus'),
(14, 'Boca Juniors'),
(15, 'River Plate'),
(16, 'Tombense'),
(17, 'Flamengo'),
(18, 'Fluminense'),
(19, 'Vasco da Gama'),
(20, 'Botafogo'),
(21, 'Paris Saint-Germain'),
(22, 'Bayern de Munique'),
(23, 'Liverpool'),
(24, 'Arsenal'),
(25, 'Real Betis'),
(26, 'Monaco'),
(27, 'Olympique de Marselha'),
(28, 'Atlético Madrid'),
(29, 'Tottenham Hotspur'),
(30, 'Porto'),
(31, 'Benfica'),
(32, 'Borussia Dortmund');

-- Inserir jogadores na tabela jogadores
INSERT INTO jogadores (id_jogador, nome_jogador, id_time) VALUES
(1, 'Ronaldo Fenômeno', 1),
(2, 'Garrincha', 1),
(3, 'Diego Costa', 2),
(4, 'Ronaldinho Gaúcho', 2),
(5, 'Frank Lampard', 3),
(6, 'Didier Drogba', 3),
(7, 'Pelé', 4),
(8, 'Robson de Souza', 4),
(9, 'Felipe Melo', 5),
(10, 'Rivaldo', 5),
(11, 'Raí', 6),
(12, 'Cafu', 6),
(13, 'Lionel Messi', 7),
(14, 'Andrés Iniesta', 7),
(15, 'Cristiano Ronaldo', 8),
(16, 'Sergio Ramos', 8),
(17, 'Kevin De Bruyne', 9),
(18, 'Sergio Agüero', 9),
(19, 'Ryan Giggs', 10),
(20, 'Paul Scholes', 10),
(21, 'Zlatan Ibrahimović', 11),
(22, 'Javier Zanetti', 11),
(23, 'Paolo Maldini', 12),
(24, 'Alessandro Nesta', 12),
(25, 'Cristiano Ronaldo', 13),
(26, 'Pavel Nedvěd', 13),
(27, 'Carlos Tévez', 14),
(28, 'Diego Maradona', 14),
(29, 'Daniel Passarella', 15),
(30, 'Enzo Francescoli', 15),
(31, 'Diego Forlán', 16),
(32, 'Eto’o', 16),
(33, 'Gabigol', 17),
(34, 'Everton Ribeiro', 17),
(35, 'Fred', 18),
(36, 'Thiago Silva', 18),
(37, 'Romário', 19),
(38, 'Ronaldo Nazário', 19),
(39, 'Seedorf', 20),
(40, 'John Charles', 20),
(41, 'Kylian Mbappé', 21),
(42, 'Neymar', 21),
(43, 'Bastian Schweinsteiger', 22),
(44, 'Robert Lewandowski', 22),
(45, 'Luis Suárez', 23),
(46, 'Mohamed Salah', 23),
(47, 'Thierry Henry', 24),
(48, 'Dennis Bergkamp', 24),
(49, 'Juanmi', 25),
(50, 'Sergio Canales', 25),
(51, 'Falcao García', 26),
(52, 'Radamel Falcao', 26),
(53, 'Dimitri Payet', 27),
(54, 'Nabil Fekir', 27),
(55, 'Antoine Griezmann', 28),
(56, 'Diego Simeone', 28),
(57, 'Harry Kane', 29),
(58, 'Son Heung-min', 29),
(59, 'Danilo', 30),
(60, 'Luis Díaz', 30),
(61, 'João Félix', 31),
(62, 'Raúl Jiménez', 31),
(63, 'Jude Bellingham', 32),
(64, 'Erling Haaland', 32);

-- Inserção de dados na tabela 'partidas' (exemplo)
INSERT INTO partidas (id_fase, id_time_casa, id_time_visitante, data_partida, gols_time_casa, gols_time_visitante, saldo_gols_time_casa, saldo_gols_time_visitante, artilheiro_time_casa, artilheiro_time_visitante, numero_cartoes_time_casa, numero_cartoes_time_visitante) 
VALUES 
(1, 1, 2, '2022-08-15', 2, 1, 1, -1, 1, 3, 2, 1),
(1, 3, 4, '2022-08-15', 3, 0, 3, 0, 5, 8, 0, 2),
(1, 5, 6, '2022-08-15', 1, 2, -1, 2, 9, 13, 1, 0),
(1, 7, 8, '2022-08-15', 2, 3, -1, 1, 14, 16, 0, 1);
-- Continue com mais partidas...
;

-- Consultas solicitadas:

-- 1. Consultar todos os jogos com nome dos times
SELECT 
    p.id_fase, 
    tc.nome_time AS time_casa, 
    tv.nome_time AS time_visitante, 
    p.data_partida,
    p.gols_time_casa, 
    p.gols_time_visitante, 
    p.saldo_gols_time_casa, 
    p.saldo_gols_time_visitante, 
    p.numero_cartoes_time_casa, 
    p.numero_cartoes_time_visitante
FROM partidas p
JOIN times tc ON p.id_time_casa = tc.id_time
JOIN times tv ON p.id_time_visitante = tv.id_time
ORDER BY p.id_fase, p.data_partida;

-- 2. Consultar os artilheiros e seus gols
SELECT 
    j.nome_jogador, 
    SUM(CASE WHEN j.id_time = p.id_time_casa THEN p.gols_time_casa ELSE p.gols_time_visitante END) AS total_gols
FROM jogadores j
JOIN partidas p ON (j.id_time = p.id_time_casa OR j.id_time = p.id_time_visitante)
GROUP BY j.id_jogador
ORDER BY total_gols DESC;