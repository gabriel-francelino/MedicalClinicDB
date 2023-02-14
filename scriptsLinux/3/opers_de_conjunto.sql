-- Exemplos da operação de União
SELECT data_hora, descricao FROM consultas
UNION
SELECT data, descricao FROM receitas;

SELECT pacientes.nome, consultas.descricao
FROM pacientes
JOIN consultas ON pacientes.id = consultas.paciente_id;

SELECT pacientes.nome, exames.resultados
FROM pacientes
JOIN exames ON pacientes.id = exames.paciente_id;

-- Exemplos da operação Intersecção
SELECT medicos.*
FROM medicos
INNER JOIN receitas
ON medicos.id = receitas.medico_id
INTERSECT
SELECT medicos.*
FROM medicos
INNER JOIN exames
ON medicos.id = exames.medico_id;

SELECT pacientes.nome, pacientes.telefone
FROM pacientes
INNER JOIN receitas
ON pacientes.id = receitas.paciente_id
INTERSECT
SELECT pacientes.nome, pacientes.telefone
FROM pacientes
INNER JOIN exames
ON pacientes.id = exames.paciente_id;

SELECT consultas.*
FROM consultas
INNER JOIN receitas
ON consultas.paciente_id = receitas.paciente_id
INTERSECT
SELECT consultas.*
FROM consultas
INNER JOIN pacientes
ON consultas.paciente_id = pacientes.id;


-- Exemplos da operação de Diferença
SELECT pacientes.nome, pacientes.telefone
FROM pacientes
EXCEPT
SELECT pacientes.nome, pacientes.telefone
FROM pacientes
INNER JOIN exames
ON pacientes.id = exames.paciente_id
WHERE NOT exames.resultados = 'Lesão identificada';

SELECT *
FROM medicos
EXCEPT
SELECT *
FROM medicos
WHERE medicos.especialidade = 'Cardiologista' AND medicos.especialidade = 'Pediatra';