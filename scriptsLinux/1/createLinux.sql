-- CREATE DATABASE trabalhoBD;
USE trabalhoBD;

DROP TABLE IF EXISTS pacientes, medicos, consultas, receitas, exames;

CREATE TABLE pacientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  data_nascimento DATE NOT NULL,
  endereco VARCHAR(255) NOT NULL,
  telefone VARCHAR(15) NOT NULL
);

CREATE TABLE medicos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  especialidade VARCHAR(255) NOT NULL,
  horario_inicio TIME NOT NULL,
  horario_fim TIME NOT NULL
);

CREATE TABLE consultas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  data_hora DATETIME NOT NULL,
  descricao TEXT NOT NULL,
  paciente_id INT,
  medico_id INT,
  FOREIGN KEY (paciente_id) REFERENCES pacientes(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (medico_id) REFERENCES medicos(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE receitas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  data DATE NOT NULL,
  descricao TEXT NOT NULL,
  medicamentos TEXT NOT NULL,
  paciente_id INT,
  medico_id INT,
  FOREIGN KEY (paciente_id) REFERENCES pacientes(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (medico_id) REFERENCES medicos(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE exames (
  id INT AUTO_INCREMENT PRIMARY KEY,
  data DATE NOT NULL,
  descricao TEXT NOT NULL,
  resultados TEXT NOT NULL,
  paciente_id INT,
  medico_id INT,
  FOREIGN KEY (paciente_id) REFERENCES pacientes(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (medico_id) REFERENCES medicos(id) ON DELETE CASCADE ON UPDATE CASCADE
);

SHOW TABLES;
