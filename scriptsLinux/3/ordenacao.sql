-- Selecione todos os pacientes da tabela Pacientes, ordenados pelo nome
SELECT * FROM pacientes ORDER BY nome;


-- Selecione todas as consultas da tabela Consultas, ordenadas pela data e hora em ordem decrescente
SELECT * FROM consultas ORDER BY data_hora DESC;


-- Selecione todos os exames da tabela Exames, ordenados pela data em ordem decrescente
SELECT * FROM exames ORDER BY data DESC;

-- Retornar todos os exames realizados por um paciente específico, ordenados por data
SELECT * FROM exames
WHERE paciente_id = 2
ORDER BY data;

