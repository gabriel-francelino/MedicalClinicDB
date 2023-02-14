-- Exemplos da operação de União
SELECT data_hora, descricao FROM Consultas
UNION
SELECT data, descricao FROM Receitas;

SELECT Pacientes.nome, Consultas.descricao
FROM Pacientes
JOIN Consultas ON Pacientes.id = Consultas.paciente_id;

SELECT Pacientes.nome, Exames.resultados
FROM Pacientes
JOIN Exames ON Pacientes.id = Exames.paciente_id;

-- Exemplos da operação Intersecção
SELECT Medicos.*
FROM Medicos
INNER JOIN Receitas
ON Medicos.id = Receitas.medico_id
INTERSECT
SELECT Medicos.*
FROM Medicos
INNER JOIN Exames
ON Medicos.id = Exames.medico_id;

SELECT Pacientes.nome, Pacientes.telefone
FROM Pacientes
INNER JOIN Receitas
ON Pacientes.id = Receitas.paciente_id
INTERSECT
SELECT Pacientes.nome, Pacientes.telefone
FROM Pacientes
INNER JOIN Exames
ON Pacientes.id = Exames.paciente_id;

SELECT Consultas.*
FROM Consultas
INNER JOIN Receitas
ON Consultas.paciente_id = Receitas.paciente_id
INTERSECT
SELECT Consultas.*
FROM Consultas
INNER JOIN Pacientes
ON Consultas.paciente_id = Pacientes.id;


-- Exemplos da operação de Diferença
SELECT Pacientes.nome, Pacientes.telefone
FROM Pacientes
EXCEPT
SELECT Pacientes.nome, Pacientes.telefone
FROM Pacientes
INNER JOIN Exames
ON Pacientes.id = Exames.paciente_id
WHERE NOT Exames.resultados = 'Lesão identificada';

SELECT *
FROM Medicos
EXCEPT
SELECT *
FROM Medicos
WHERE Medicos.especialidade = 'Cardiologista' AND Medicos.especialidade = 'Pediatra';