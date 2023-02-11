USE trabalhoBD;

INSERT INTO Pacientes(nome, data_nascimento, endereco, telefone)
VALUES
	('Bruno Henrique', '1989-03-20', 'Rua 4, número 400', '44 4444-4444');
    
INSERT INTO Consultas(data_hora, descricao, paciente_id, medico_id)
VALUES
	('2023-02-13 10:00:00', 'Consulta de resfriado', 4, 1);
    
INSERT INTO Exames(data, descricao, resultados, paciente_id, medico_id)
VALUES
	('2023-02-14', 'Teste de COVID-19', 'Não reagente', 4, 1);
    
INSERT INTO Receitas(data, descricao, medicamentos, paciente_id, medico_id)
VALUES
	('2023-02-14', 'Receita para resfriado', 'Dipirona 500mg', 4, 1);
    
UPDATE Pacientes SET telefone = '55 5555-5555' WHERE id = 4;
UPDATE Exames SET Resultados = 'Reagente' WHERE paciente_id = 4;
UPDATE Receitas SET medicamentos = 'Acetilcisteína 600mg' WHERE paciente_id = 4;

DELETE FROM Pacientes WHERE id = 4;
DELETE FROM Consultas WHERE data_hora > '2023-02-10 08:00:00' AND data_hora < '2023-02-10 15:00:00';
DELETE FROM Pacientes WHERE id IN (SELECT paciente_id FROM Consultas WHERE medico_id = 2);

    
select * from Pacientes;