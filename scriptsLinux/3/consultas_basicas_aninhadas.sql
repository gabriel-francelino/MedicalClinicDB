USE trabalhoBD;
-- consultas básicas --------------------------------------------------------------------------------------------------------------------------
-- Selecionar todos os pacientes da tabela pacientes:
SELECT * FROM pacientes;
-- Selecionar o nome e especialidade dos médicos da tabela Médicos:
SELECT nome, especialidade FROM medicos;
-- Selecionar todas as consultas agendadas com o ID do paciente e do médico:
SELECT paciente_id, medico_id, data_hora, descricao FROM consultas;
-- Selecionar o nome do médico, data da consulta e descrição a partir do ID do médico na tabela consultas:
SELECT nome, data_hora, descricao FROM consultas INNER JOIN medicos ON consultas.medico_id = medicos.id;
-- Selecionar o nome do paciente, data do exame e descrição a partir do ID do paciente na tabela exames:
SELECT nome, data, descricao FROM exames INNER JOIN pacientes ON exames.paciente_id = pacientes.id;
-- Selecionar o nome do paciente, nome do médico e data da receita a partir do ID do paciente e do médico na tabela receitas:
SELECT p.nome, data FROM receitas r
	INNER JOIN pacientes p ON r.paciente_id = p.id
	INNER JOIN medicos m ON r.medico_id = m.id;
-- Selecionar na tabela receitas todos os medicamentos que possuem 500mg .
SELECT medicamentos FROM receitas WHERE medicamentos like '%500mg';

-- consultas aninhadas -----------------------------------------------------------------------------------------------------------------------------
-- Selecione o nome do paciente e os medicamentos passados a ele, onde os resultados dos exames não estão normais.
SELECT nome, medicamentos FROM pacientes p JOIN receitas r ON p.id = r.paciente_id
	WHERE p.id IN (SELECT paciente_id FROM exames WHERE resultados <> 'Tudo normal');
-- Selecione o nome do paciente, onde os resultados dos exames estão normais.
SELECT nome FROM pacientes p JOIN receitas r ON p.id = r.paciente_id
	WHERE p.id NOT IN (SELECT paciente_id FROM exames WHERE resultados <> 'Tudo normal');
