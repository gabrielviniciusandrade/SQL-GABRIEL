CREATE TABLE produto 
( 
 id INT PRIMARY KEY AUTO_INCREMENT,  
 descrição VARCHAR(255) NOT NULL,  
 quantidade INT NOT NULL,  
 nome VARCHAR(150) NOT NULL,  
 categoria VARCHAR(100) NOT NULL,  
 preço FLOAT NOT NULL 
); 

CREATE TABLE cliente 
( 
 id INT PRIMARY KEY AUTO_INCREMENT,  
 nome VARCHAR(150) NOT NULL,  
 cpf VARCHAR(11) NOT NULL,  
 UNIQUE (cpf)
); 

CREATE TABLE compra 
( 
 id INT PRIMARY KEY AUTO_INCREMENT,  
 idcliente INT NOT NULL,  
 forma_pag VARCHAR(50) NOT NULL,  
 data DATETIME NOT NULL  
); 

CREATE TABLE endereço 
( 
 id INT PRIMARY KEY AUTO_INCREMENT,  
 idcliente INT NOT NULL,  
 cep VARCHAR(8) NOT NULL,  
 rua VARCHAR(150) NOT NULL,  
 numero VARCHAR(10) NOT NULL,  
 bairro VARCHAR(50) NOT NULL,  
 cidade VARCHAR(50) NOT NULL,  
 estado CHAR(2) NOT NULL,  
 complemento VARCHAR(100) NOT NULL 
); 

CREATE TABLE tem 
( 
 id_compra INT NOT NULL,  
 id_produto INT NOT NULL,  
 quantidade INT NOT NULL,  
 valor_unitario FLOAT NOT NULL,  
 desconto FLOAT,  
 PRIMARY KEY (id_compra, id_produto)
); 

CREATE TABLE TEM 
( 
 id_compra INT NOT NULL,  
 id_endereco INT NOT NULL,  
 PRIMARY KEY (id_compra, id_endereco)
); 

-- Vinculando os relacionamentos (Chaves Estrangeiras)
ALTER TABLE compra ADD FOREIGN KEY(idcliente) REFERENCES cliente (id);
ALTER TABLE endereço ADD FOREIGN KEY(idcliente) REFERENCES cliente (id);

ALTER TABLE tem ADD FOREIGN KEY(id_compra) REFERENCES compra (id);
ALTER TABLE tem ADD FOREIGN KEY(id_produto) REFERENCES produto (id);

ALTER TABLE TEM ADD FOREIGN KEY(id_compra) REFERENCES compra (id);
ALTER TABLE TEM ADD FOREIGN KEY(id_endereco) REFERENCES endereço (id);
