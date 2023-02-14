USE trabalhoBD;
-- consultas básicas --------------------------------------------------------------------------------------------------------------------------
-- Selecionar todos os pacientes da tabela Pacientes:
SELECT * FROM Pacientes;
-- Selecionar o nome e especialidade dos médicos da tabela Médicos:
SELECT nome, especialidade FROM Medicos;
-- Selecionar todas as consultas agendadas com o ID do paciente e do médico:
SELECT paciente_id, medico_id, data_hora, descricao FROM Consultas;
-- Selecionar o nome do médico, data da consulta e descrição a partir do ID do médico na tabela Consultas:
SELECT nome, data_hora, descricao FROM Consultas INNER JOIN Medicos ON Consultas.medico_id = Medicos.id;
-- Selecionar o nome do paciente, data do exame e descrição a partir do ID do paciente na tabela Exames:
SELECT nome, data, descricao FROM Exames INNER JOIN Pacientes ON Exames.paciente_id = Pacientes.id;
-- Selecionar o nome do paciente, nome do médico e data da receita a partir do ID do paciente e do médico na tabela Receitas:
SELECT p.nome, data FROM Receitas r
	INNER JOIN Pacientes p ON r.paciente_id = p.id
	INNER JOIN Medicos m ON r.medico_id = m.id;
-- Selecionar na tabela receitas todos os medicamentos que possuem 500mg .
SELECT medicamentos FROM Receitas WHERE medicamentos like '%500mg';

-- consultas aninhadas -----------------------------------------------------------------------------------------------------------------------------
-- Selecione o nome do paciente e os medicamentos passados a ele, onde os resultados dos exames não estão normais.
SELECT nome, medicamentos FROM Pacientes p JOIN Receitas r ON p.id = r.paciente_id
	WHERE p.id IN (SELECT paciente_id FROM Exames WHERE resultados <> 'Tudo normal');
-- Selecione o nome do paciente, onde os resultados dos exames estão normais.
SELECT nome FROM Pacientes p JOIN Receitas r ON p.id = r.paciente_id
	WHERE p.id NOT IN (SELECT paciente_id FROM Exames WHERE resultados <> 'Tudo normal');
