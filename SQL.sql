CREATE DATABASE etec_dql;
USE etec_dql;

CREATE TABLE alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    curso VARCHAR(100)
);

CREATE TABLE professores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    disciplina VARCHAR(100)
);

CREATE TABLE turmas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_turma VARCHAR(50),
    id_professor INT,
    FOREIGN KEY (id_professor) REFERENCES professores(id)
);

CREATE TABLE matriculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_turma INT,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id),
    FOREIGN KEY (id_turma) REFERENCES turmas(id)
);

INSERT INTO alunos (nome, idade, curso) VALUES
('Ana Paula', 17, 'Informática'),
('Bruno Silva', 18, 'Administracão'),
('Carlos Oliveira', 17, 'Informática'),
('Daniela Lima', 19, 'Contabilidade'),
('Eduardo Dias', 18, 'Informática'),
('Fernanda Souza', 17, 'Administracão'),
('Gustavo Lima', 20, 'Contabilidade'),
('Helena Castro', 16, 'Informática'),
('Igor Ramos', 19, 'Informática'),
('Julia Martins', 17, 'Administracão'),
('Kaique Alves', 18, 'Informática'),
('Larissa Torres', 17, 'Contabilidade'),
('Marcos Nunes', 19, 'Administracão'),
('Natália Mendes', 18, 'Informática'),
('Otávio Rocha', 17, 'Contabilidade'),
('Paula Fernandes', 20, 'Administracão'),
('Rafael Duarte', 16, 'Informática'),
('Sabrina Lopes', 17, 'Contabilidade'),
('Thiago Costa', 18, 'Informática'),
('Vanessa Ribeiro', 19, 'Administracão'),
('William Pinto', 17, 'Contabilidade');

INSERT INTO professores (nome, disciplina) VALUES
('João Mendes', 'Matemática'),
('Maria Souza', 'Português'),
('Carlos Santos', 'Informática'),
('Lúcia Oliveira', 'Contabilidade'),
('Pedro Silva', 'Administracão');

INSERT INTO turmas (nome_turma, id_professor) VALUES
('Turma A', 1),
('Turma B', 2),
('Turma C', 3),
('Turma D', 4),
('Turma E', 5);

INSERT INTO matriculas (id_aluno, id_turma) VALUES
(1,1),(2,1),(3,2),(4,2),(5,3),(6,3),(7,4),(8,4),
(9,5),(10,5),(11,1),(12,2),(13,3),(14,4),(15,5),
(16,1),(17,2),(18,3),(19,4),(20,5),(21,1),(1,2),
(2,3),(3,4),(4,5),(5,1),(6,2),(7,3),(8,4),(9,5);

/*Exercício 1*/
SELECT nome, idade FROM alunos WHERE curso = 'Informática';

/*Exercício 2*/
SELECT nome FROM professores WHERE disciplina = 'Administracão';

/*Exercício 3*/
SELECT nome, idade FROM alunos ORDER BY idade DESC;

/*Exercício 4*/
SELECT curso, COUNT(*) AS total_aluno FROM alunos GROUP BY curso;

/*Exercício 5*/
SELECT curso, COUNT(*) AS total_aluno FROM alunos GROUP BY curso HAVING COUNT(*) >=6; 

/*Exercício 6*/
SELECT a.nome
FROM alunos a
JOIN matriculas m ON a.id = m.id_aluno
JOIN turmas t ON m.id_turma = t.id
WHERE t.nome_turma = 'Turma A';

/*Exercício 7*/
SELECT a.nome, t.nome_turma
FROM alunos a
JOIN matriculas m ON a.id = m.id_aluno
JOIN turmas t ON m.id_turma = t.id;

/*Exercício 8*/
SELECT t.nome_turma, a.nome
FROM alunos a
JOIN matriculas m ON a.id = m.id_aluno
JOIN turmas t ON m.id_turma = t.id;

/*Exercício 9*/
SELECT id_turma, COUNT(*) AS QTD_Matriculas FROM matriculas WHERE id_turma = 2;

/*Exercício 10*/
SELECT p.nome, t.nome_turma
FROM professores p
INNER JOIN turmas t
ON p.id = t.id;

/*Exercício 11*/
SELECT AVG(idade) AS media_alunos_contabilidade FROM alunos WHERE curso = 'Contabilidade';