CREATE SCHEMA alugueis;

USE alugueis;

CREATE TABLE proprietarios ( 
cpf BIGINT NOT NULL PRIMARY KEY,
nome VARCHAR(150) NOT NULL,
telefone VARCHAR(20) NOT NULL,
email VARCHAR(100)
);

CREATE TABLE imoveis (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
cpf_proprietario BIGINT NOT NULL,
endereco VARCHAR(150) NOT NULL,
cep CHAR(8) NOT NULL,
tipo_imovel VARCHAR(15) NOT NULL,
imobiliaria VARCHAR(20),
tel_imobiliaria VARCHAR(20),
FOREIGN KEY (cpf_proprietario) REFERENCES proprietarios (cpf)
);

CREATE TABLE inquilinos (
cpf BIGINT NOT NULL PRIMARY KEY,
nome VARCHAR(150) NOT NULL,
telefone VARCHAR(20) NOT NULL,
email VARCHAR(100),
imovel_id INT NOT NULL,
data_entrada DATE NOT NULL,
data_saida DATE,
valor_aluguel DECIMAL(5,2) NOT NULL,
FOREIGN KEY (imovel_id) REFERENCES imoveis (id)
);

INSERT INTO proprietarios (cpf, nome, telefone, email)
VALUES
(32165487690, "João da Silva", "61954328907", "joao.silva@email.com"),
(89076541234, "Francisco das Chagas", "62984587655", "chicochagas@email.com"),
(07598031275, "Pedro Vasconcellos Paiva", "31987654321", "pedro-piva@email.com");

INSERT INTO imoveis (cpf_proprietario, endereco, cep, tipo_imovel, imobiliaria, tel_imobiliaria)
VALUES
(32165487690, "SQS 404 Bloco B Apt.201 Brasília-DF", "72000876", "apartamento", NULL, NULL),
(89076541234, "Rua João Gualberto n° 32 Goiânia-GO", "71987564", "casa", "Aluguel Aqui", "6235432756"),
(07598031275, "Quadra 10 Lote 1008 Apt.1507 Brasília-DF", "72908564", "cobertura", "Melhor Imobiliária", "6135768419");

INSERT INTO inquilinos (cpf, nome, telefone, email, imovel_id, data_entrada, data_saida, valor_aluguel)
VALUES
(23157894308, "Ana Carolina Figueira", "61987569900", "aninha@email.com", 3, "2020-08-06", NULL, 900.90),
(30399854123, "Paulo Rodrigues de Sousa", "62999345487", "sousa.rodrigues@email.com", 2, "2019-03-21", "2021-01-27", 650.00);

UPDATE proprietarios SET email = "pedro_paiva90@email.com"
WHERE cpf = 07598031275;

DELETE FROM imoveis
WHERE cpf_proprietario = 32165487690;

SELECT t1.tipo_imovel, SUM(t2.valor_aluguel) total_aluguel
FROM imoveis t1
JOIN inquilinos t2 ON t1.id = t2.imovel_id
GROUP BY t1.tipo_imovel;