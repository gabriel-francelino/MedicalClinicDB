-- Exemplos de operação de Junção
SELECT Pacientes.nome, Pacientes.data_nascimento, Medicos.nome
FROM Pacientes
JOIN Consultas ON Pacientes.id = Consultas.paciente_id
JOIN Medicos ON Consultas.medico_id = Medicos.id;

SELECT DISTINCT Pacientes.nome
FROM Pacientes
JOIN Receitas ON Pacientes.id = Receitas.paciente_id
JOIN Medicos ON Receitas.medico_id = Medicos.id
WHERE Medicos.especialidade = 'Cardiologista';

SELECT DISTINCT Pacientes.nome
FROM Pacientes
JOIN Consultas ON Pacientes.id = Consultas.paciente_id
JOIN Medicos ON Consultas.medico_id = Medicos.id
WHERE Medicos.nome = 'Dr. Bruno Souza';

SELECT DISTINCT Pacientes.nome, Consultas.descricao, Exames.descricao
FROM Pacientes
JOIN Consultas ON Pacientes.id = Consultas.paciente_id
JOIN Exames ON Pacientes.id = Exames.paciente_id
WHERE Consultas.medico_id = Exames.medico_id;

-- Junções pela direita
SELECT Pacientes.nome, Consultas.data_hora
FROM Pacientes
RIGHT JOIN Consultas ON Pacientes.id = Consultas.paciente_id;
    
SELECT Medicos.nome, Consultas.data_hora
FROM Medicos
RIGHT JOIN Consultas ON Medicos.id = Consultas.medico_id;

SELECT Pacientes.nome, Consultas.data_hora, Medicos.nome
FROM Pacientes
RIGHT JOIN Consultas ON Pacientes.id = Consultas.paciente_id
JOIN Medicos ON Consultas.medico_id = Medicos.id;

-- Junções pela esquerda
SELECT Pacientes.nome, Receitas.descricao
FROM Pacientes
LEFT JOIN Receitas ON Pacientes.id = Receitas.paciente_id;

SELECT Medicos.nome, Consultas.data_hora
FROM Medicos
LEFT JOIN Consultas ON Medicos.id = Consultas.medico_id;

SELECT Pacientes.nome, Receitas.descricao, Medicos.nome AS medico
FROM Pacientes
LEFT JOIN Receitas ON Pacientes.id = Receitas.paciente_id
JOIN Medicos ON Receitas.medico_id = Medicos.id;