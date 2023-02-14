-- Exemplos de operação de Junção
SELECT pacientes.nome, pacientes.data_nascimento, medicos.nome
FROM pacientes
JOIN consultas ON pacientes.id = consultas.paciente_id
JOIN medicos ON consultas.medico_id = medicos.id;

SELECT DISTINCT pacientes.nome
FROM pacientes
JOIN receitas ON pacientes.id = receitas.paciente_id
JOIN medicos ON receitas.medico_id = medicos.id
WHERE medicos.especialidade = 'Cardiologista';

SELECT DISTINCT pacientes.nome
FROM pacientes
JOIN consultas ON pacientes.id = consultas.paciente_id
JOIN medicos ON consultas.medico_id = medicos.id
WHERE medicos.nome = 'Dr. Bruno Souza';

SELECT DISTINCT pacientes.nome, consultas.descricao, exames.descricao
FROM pacientes
JOIN consultas ON pacientes.id = consultas.paciente_id
JOIN exames ON pacientes.id = exames.paciente_id
WHERE consultas.medico_id = exames.medico_id;

-- Junções pela direita
SELECT pacientes.nome, consultas.data_hora
FROM pacientes
RIGHT JOIN consultas ON pacientes.id = consultas.paciente_id;
    
SELECT medicos.nome, consultas.data_hora
FROM medicos
RIGHT JOIN consultas ON medicos.id = consultas.medico_id;

SELECT pacientes.nome, consultas.data_hora, medicos.nome
FROM pacientes
RIGHT JOIN consultas ON pacientes.id = consultas.paciente_id
JOIN medicos ON consultas.medico_id = medicos.id;

-- Junções pela esquerda
SELECT pacientes.nome, receitas.descricao
FROM pacientes
LEFT JOIN receitas ON pacientes.id = receitas.paciente_id;

SELECT medicos.nome, consultas.data_hora
FROM medicos
LEFT JOIN consultas ON medicos.id = consultas.medico_id;

SELECT pacientes.nome, receitas.descricao, medicos.nome AS medico
FROM pacientes
LEFT JOIN receitas ON pacientes.id = receitas.paciente_id
JOIN medicos ON receitas.medico_id = medicos.id;