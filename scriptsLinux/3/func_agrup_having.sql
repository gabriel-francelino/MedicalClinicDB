USE trabalhoBD;

/*Contar o número total de pacientes:*/
SELECT COUNT(*) FROM pacientes;
/*Listar o nome e a especialidade de todos os médicos:*/
SELECT nome, especialidade FROM medicos;
/*Listar o nome, data de nascimento e telefone de todos os pacientes:*/
SELECT nome, data_nascimento, telefone FROM pacientes;
/*Listar o nome dos médicos e o horário de início e fim de seus atendimentos:*/
SELECT nome AS 'Nome do Médico', horario_inicio, horario_fim FROM medicos;
/*Calcular a média de idade dos pacientes:*/
SELECT AVG(YEAR(CURDATE())-YEAR(data_nascimento)) AS 'Média de idade' FROM pacientes;

/*Agrupar pacientes por data de nascimento:*/
SELECT data_nascimento, COUNT(*)
FROM pacientes
GROUP BY data_nascimento;
/*Agrupar pacientes por endereço e data de nascimento:*/
SELECT endereco, data_nascimento, COUNT(*)
FROM pacientes
GROUP BY endereco, data_nascimento;
/*Agrupar médicos por especialidade e horário de trabalho:*/
SELECT especialidade, horario_inicio, horario_fim, COUNT(*)
FROM medicos
GROUP BY especialidade, horario_inicio, horario_fim;

/*Selecionar o nome de todos os pacientes que têm pelo menos duas consultas:*/
SELECT nome 
FROM pacientes 
INNER JOIN consultas ON pacientes.id = consultas.paciente_id 
GROUP BY pacientes.nome 
HAVING COUNT(consultas.id) >= 2;
/*Selecionar o nome de todos os pacientes que têm pelo menos duas receitas:*/
SELECT nome 
FROM pacientes 
INNER JOIN receitas ON pacientes.id = receitas.paciente_id 
GROUP BY pacientes.nome 
HAVING COUNT(receitas.id) >= 2;
/*Selecionar o nome dos médicos que realizaram pelo menos três consultas:*/
SELECT nome 
FROM medicos 
INNER JOIN consultas ON medicos.id = consultas.medico_id 
GROUP BY medicos.nome 
HAVING COUNT(consultas.id) >= 3;
/*Selecionar o nome dos médicos que prescreveram pelo menos três receitas:*/
SELECT nome 
FROM medicos 
INNER JOIN receitas ON medicos.id = receitas.medico_id 
GROUP BY medicos.nome 
HAVING COUNT(receitas.id) >= 3;
/*Selecionar o nome dos pacientes que têm pelo menos uma consulta com um determinado médico:*/
SELECT nome 
FROM pacientes 
INNER JOIN consultas ON pacientes.id = consultas.paciente_id 
WHERE consultas.medico_id = 3 
GROUP BY pacientes.nome 
HAVING COUNT(consultas.id) >= 1;
/*Selecionar o nome dos pacientes que têm pelo menos uma receita com um determinado médico:*/
SELECT nome 
FROM pacientes 
INNER JOIN receitas ON pacientes.id = receitas.paciente_id 
WHERE receitas.medico_id = 3 
GROUP BY pacientes.nome 
HAVING COUNT(receitas.id) >= 1;
/*Selecionar a especialidade dos médicos que realizaram pelo menos duas consultas:*/
SELECT especialidade 
FROM medicos 
INNER JOIN consultas ON medicos.id = consultas.medico_id 
GROUP BY medicos.especialidade 
HAVING COUNT(consultas.id) >= 1;


