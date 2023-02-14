USE trabalhoBD;

/*Contar o número total de pacientes:*/
SELECT COUNT(*) FROM Pacientes;
/*Listar o nome e a especialidade de todos os médicos:*/
SELECT nome, especialidade FROM Medicos;
/*Listar o nome, data de nascimento e telefone de todos os pacientes:*/
SELECT nome, data_nascimento, telefone FROM Pacientes;
/*Listar o nome dos médicos e o horário de início e fim de seus atendimentos:*/
SELECT nome AS 'Nome do Médico', horario_inicio, horario_fim FROM Medicos;
/*Calcular a média de idade dos pacientes:*/
SELECT AVG(YEAR(CURDATE())-YEAR(data_nascimento)) AS 'Média de idade' FROM Pacientes;

/*Agrupar pacientes por data de nascimento:*/
SELECT data_nascimento, COUNT(*)
FROM Pacientes
GROUP BY data_nascimento;
/*Agrupar pacientes por endereço e data de nascimento:*/
SELECT endereco, data_nascimento, COUNT(*)
FROM Pacientes
GROUP BY endereco, data_nascimento;
/*Agrupar médicos por especialidade e horário de trabalho:*/
SELECT especialidade, horario_inicio, horario_fim, COUNT(*)
FROM Medicos
GROUP BY especialidade, horario_inicio, horario_fim;

/*Selecionar o nome de todos os pacientes que têm pelo menos duas consultas:*/
SELECT nome 
FROM Pacientes 
INNER JOIN Consultas ON Pacientes.id = Consultas.paciente_id 
GROUP BY Pacientes.nome 
HAVING COUNT(Consultas.id) >= 2;
/*Selecionar o nome de todos os pacientes que têm pelo menos duas receitas:*/
SELECT nome 
FROM Pacientes 
INNER JOIN Receitas ON Pacientes.id = Receitas.paciente_id 
GROUP BY Pacientes.nome 
HAVING COUNT(Receitas.id) >= 2;
/*Selecionar o nome dos médicos que realizaram pelo menos três consultas:*/
SELECT nome 
FROM Medicos 
INNER JOIN Consultas ON Medicos.id = Consultas.medico_id 
GROUP BY Medicos.nome 
HAVING COUNT(Consultas.id) >= 3;
/*Selecionar o nome dos médicos que prescreveram pelo menos três receitas:*/
SELECT nome 
FROM Medicos 
INNER JOIN Receitas ON Medicos.id = Receitas.medico_id 
GROUP BY Medicos.nome 
HAVING COUNT(Receitas.id) >= 3;
/*Selecionar o nome dos pacientes que têm pelo menos uma consulta com um determinado médico:*/
SELECT nome 
FROM Pacientes 
INNER JOIN Consultas ON Pacientes.id = Consultas.paciente_id 
WHERE Consultas.medico_id = 3 
GROUP BY Pacientes.nome 
HAVING COUNT(Consultas.id) >= 1;
/*Selecionar o nome dos pacientes que têm pelo menos uma receita com um determinado médico:*/
SELECT nome 
FROM Pacientes 
INNER JOIN Receitas ON Pacientes.id = Receitas.paciente_id 
WHERE Receitas.medico_id = 3 
GROUP BY Pacientes.nome 
HAVING COUNT(Receitas.id) >= 1;
/*Selecionar a especialidade dos médicos que realizaram pelo menos duas consultas:*/
SELECT especialidade 
FROM Medicos 
INNER JOIN Consultas ON Medicos.id = Consultas.medico_id 
GROUP BY Medicos.especialidade 
HAVING COUNT(Consultas.id) >= 2;


