USE trabalhoBD;

INSERT INTO pacientes(nome, data_nascimento, endereco, telefone)
VALUES
	('Bruno Henrique', '1989-03-20', 'Rua 4, número 400', '44 4444-4444');
    
INSERT INTO consultas(data_hora, descricao, paciente_id, medico_id)
VALUES
	('2023-02-13 10:00:00', 'Consulta de resfriado', 4, 1);
    
INSERT INTO exames(data, descricao, resultados, paciente_id, medico_id)
VALUES
	('2023-02-14', 'Teste de COVID-19', 'Não reagente', 4, 1);
    
INSERT INTO receitas(data, descricao, medicamentos, paciente_id, medico_id)
VALUES
	('2023-02-14', 'Receita para resfriado', 'Dipirona 500mg', 4, 1);
    
UPDATE pacientes SET telefone = '55 5555-5555' WHERE id = 4;
UPDATE exames SET Resultados = 'Reagente' WHERE paciente_id = 4;
UPDATE receitas SET medicamentos = 'Acetilcisteína 600mg' WHERE paciente_id = 4;

DELETE FROM pacientes WHERE id = 4;
DELETE FROM consultas WHERE data_hora > '2023-02-10 08:00:00' AND data_hora < '2023-02-10 15:00:00';
DELETE FROM pacientes WHERE id IN (SELECT paciente_id FROM consultas WHERE medico_id = 2);

    
select * from Medicos;