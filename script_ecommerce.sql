
-- Nome do BD: BD_Ecommerce
-- Usuário: root
-- Senha: 1234

DROP TABLE Pedidos_Produtos;
DROP TABLE Pedidos;
DROP TABLE Produtos;
DROP TABLE Clientes;


CREATE TABLE Produtos(
    ID int NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    Nome varchar(255) NOT NULL,
    Preco double,
    Categoria varchar(20),
    descricao varchar(2048),
    --descricao text,

    PRIMARY KEY (ID)
);
--Produtos
INSERT INTO PRODUTOS (Nome, Preco, categoria, descricao) VALUES('Cálculo - Vol. 1 - 7ª Ed. 2013', 113.30,'Exatas', 'Cálculo foi escrito originalmente na forma de um curso. Sempre dando ênfase à compreensão dos conceitos, o autor inicia a obra oferecendo uma visão geral do assunto para, em seguida, apresentá-lo em detalhes, por meio da formulação de problemas, exercícios, tabelas e gráficos. ');
INSERT INTO PRODUTOS (Nome, Preco, categoria, descricao) VALUES('Ciência da Computação - 4ª Ed. 2010', 117.30,'Exatas','Revista e atualizada com as últimas informações de campo, a quarta edição de Ciência da Computação apresenta a história do hardware e do software, mostrando um sistema computacional como uma cebola. O computador, com sua linguagem de máquina, é o coração da cebola, e camadas de software e hardware mais sofisticados têm sido acrescentadas em volta desse coração, camada por camada.');
INSERT INTO PRODUTOS (Nome, Preco, categoria, descricao) VALUES('O Livro da Psicologia', 31.20,'Humanas','Seja ao candidatar-se a um novo emprego, buscar apoio para fobias ou compulsões, receber orientação sobre como melhorar o desempenho dos filhos na escola, a aplicação dos estudos da psicologia acompanham decisões e comportamentos a todo momento.');
INSERT INTO PRODUTOS (Nome, Preco, categoria, descricao) VALUES('Manual de Direito Civil - Volume Único - 5ª Ed. 2015', 177.60,'Humanas','Este Manual de Direito Civil pretende suprir as necessidades dos operadores do Direito Privado em geral. É direcionado a todos os seus aplicadores: juízes, promotores, procuradores, advogados, professores, alunos de graduação e pós-graduação, bem como àqueles que se preparam para provas oficiais e concursos para a carreira jurídica.');
INSERT INTO PRODUTOS (Nome, Preco, categoria, descricao) VALUES('Maquetes & Miniaturas', 35.00,'Exatas','A proposta da autora Regina Mazzocato Nacca neste livro não é exatamente listar fórmulas únicas de se confeccionar maquetes, porque isso, na prática, não seria possível.');
INSERT INTO PRODUTOS (Nome, Preco, categoria, descricao) VALUES('Le Corbusier', 49.90, 'Exatas', 'Arquitectural poesia na era da máquina .A arquitectura é a jogada magistral, correcto e magnífico dos volumes reunidos na luz - Le Corbusier Nascido Charles-Edouard Jeanneret, Le Corbusier (1887-1965) adoptou o pseudónimo famoso após a publicação de suas ideias na revista LEsprit Nouveau em 1920.');
--INSERT INTO PRODUTOS (Nome, Preco, categoria, descricao) VALUES('Livro 1 - Crespusculo', 29.0,'Livros','Quando Isabella Swan se muda para a melancolica cidade de forks e conhece o misterioso e atraente Edward Cullen, sua vida da uma guinada emocionante e apavorante.');


CREATE TABLE Clientes(
    Login varchar(10) UNIQUE NOT NULL,
    Senha varchar(15),
    Nome varchar(255) NOT NULL,
    CPF varchar(12) NOT NULL,
    Endereco varchar(255),
    cidade varchar(255),

    PRIMARY KEY (CPF)
);
--Clientes
INSERT INTO CLIENTES (Login, Senha, Nome, CPF, Endereco, cidade) VALUES('fulano', '1234', 'Guerrero', '11122233345', 'Rua Alameda dos Tupiniquins, 101', 'Sao Paulo');
INSERT INTO CLIENTES (Login, Senha, Nome, CPF, Endereco, cidade) VALUES('fulano2', '1234', 'Ralf', '35241256895', 'Av. Paulista, 1200', 'Sao Paulo');
INSERT INTO CLIENTES (Login, Senha, Nome, CPF, Endereco, cidade) VALUES('fulano3', '1234', 'Angel Romero', '358745985455', 'Rua sergipe, 305', 'Sao Paulo');
INSERT INTO CLIENTES (Login, Senha, Nome, CPF, Endereco, cidade) VALUES('fulano4', '1234', 'Uendel', '65789545235', 'Av. Angelica, 2008', 'Sao Paulo');
INSERT INTO CLIENTES (Login, Senha, Nome, CPF, Endereco, cidade) VALUES('fulano5', '1234', 'Cassio', '35741245698', 'Av. Antonio Abrahao Caran, 30', 'Belo Horizonte');
INSERT INTO CLIENTES (Login, Senha, Nome, CPF, Endereco, cidade) VALUES('fulano6', '1234', 'Ferrugem', '12587458963', 'Av. Cristiano Machado, 47', 'Belo Horizonte');
INSERT INTO CLIENTES (Login, Senha, Nome, CPF, Endereco, cidade) VALUES('fulano7', '1234', 'Fagner', '35214523658', 'Rua Hamilton, 420', 'Belo Horizonte');

CREATE TABLE Pedidos (
    NumPedido int NOT NULL,
    ClienteCPF varchar(12) NOT NULL,
    Endereco varchar(255),
    Pago boolean DEFAULT false,
    Data date,
    ValorTotal double,      --Poderia ser feito um trigger para pegar a soma automaticamente
    FormaPagamento varchar(20),

    PRIMARY KEY (NumPedido),
    FOREIGN KEY (ClienteCPF) REFERENCES Clientes(CPF)
);
--Pedidos
INSERT INTO Pedidos (NumPedido, ClienteCPF, Endereco, ValorTotal, FormaPagamento) VALUES (101,'11122233345','Rua Alameda dos Tupiniquins, 101', 2000.0, 'Boleto');
INSERT INTO Pedidos (NumPedido, ClienteCPF, Endereco, ValorTotal, FormaPagamento) VALUES (102,'35241256895','Av. Paulista, 1200', 315.0, 'Boleto');
INSERT INTO Pedidos (NumPedido, ClienteCPF, Endereco, ValorTotal, FormaPagamento) VALUES (103,'358745985455','Rua Sergipe, 305', 0.0, 'Boleto');
INSERT INTO Pedidos (NumPedido, ClienteCPF, Endereco, ValorTotal, FormaPagamento) VALUES (104,'65789545235','Av. Angelica, 2008', 0.0, 'Boleto');
INSERT INTO Pedidos (NumPedido, ClienteCPF, Endereco, ValorTotal, FormaPagamento) VALUES (105,'35741245698','Av. Antônio Abrahão Caran, 30', 0.0, 'Boleto');
INSERT INTO Pedidos (NumPedido, ClienteCPF, Endereco, ValorTotal, FormaPagamento) VALUES (106,'12587458963','Av. Cristiano Machado, 47', 0.0, 'Boleto');
INSERT INTO Pedidos (NumPedido, ClienteCPF, Endereco, ValorTotal, FormaPagamento) VALUES (107,'35214523658','Rua Hamilton, 420', 0.0, 'Boleto');

CREATE TABLE Pedidos_Produtos (
    IDPedido int NOT NULL,
    IDProduto int NOT NULL,
    Quantidade int,
    Valor double,
    
    PRIMARY KEY (IDPedido, IDProduto),
    FOREIGN KEY (IDPedido) REFERENCES Pedidos(NumPedido), 
    FOREIGN KEY (IDProduto) REFERENCES Produtos(ID) 
);
--Pedidos_Produtos
INSERT INTO Pedidos_Produtos (IDPedido, IDProduto, Quantidade, Valor) VALUES (101, 1, 1, 2000.0);
INSERT INTO Pedidos_Produtos (IDPedido, IDProduto, Quantidade, Valor) VALUES (102, 4, 2, 186.0);
INSERT INTO Pedidos_Produtos (IDPedido, IDProduto, Quantidade, Valor) VALUES (102, 6, 1, 129.0);



