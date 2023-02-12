USE trabalhoBD;


/*Operações com strings:*/

/*Encontrar todos os registros na tabela "Pacientes" com sobrenosme "Oliveira":*/
SELECT * FROM Pacientes WHERE nome LIKE '%Oliveira';
/*Encontrar todos os registros na tabela "Medicos" cujos as especialiade contêm a palavra "logista":*/
SELECT * FROM Medicos WHERE especialidade LIKE '%dista';
/*Encontrar todos os registros na tabela "Medicos" cujos o horario inicio seja às "09:00":*/
SELECT * FROM Medicos WHERE horario_inicio LIKE '09%';
/*Para encontrar todos os registros na tabela Medicos onde o endereço contém "Dra":*/
SELECT * FROM Medicos WHERE INSTR(Nome, 'Dra') > 0;
/*Selecionar o ome completo de todos os pacientes:*/
SELECT nome AS "Nome completo" FROM Pacientes;
/*Concatenar o nome do paciente com seu endereço e exibir o resultado:*/
SELECT CONCAT(nome, ', ', endereco) AS "Nome e endereço" FROM Pacientes;
/*Selecionar o nome completo de todos os médicos e colocar "Dr." ou "Dra." antes de seus nomes:*/
SELECT CONCAT(IF(id % 2 = 1, 'Dr. ', 'Dra. '), nome) AS "Nome completo" FROM Medicos;
/*Selecionar o nome completo de todos os pacientes e exibir apenas as primeiras 3 letras de seus nomes:*/
SELECT CONCAT(LEFT(nome, 3), SUBSTRING(nome, 4)) AS "Nome completo" FROM Pacientes;
/*Selecionar o nome completo de todos os pacientes e colocar todas as letras em maiúsculas:*/
SELECT UPPER(nome) AS "Nome completo" FROM Pacientes;

/*Selecionar a data de nascimento dos pacientes no formato "dd/mm/yyyy":*/
SELECT DATE_FORMAT(data_nascimento, '%d/%m/%Y') as Data_Nascimento FROM Pacientes;
/*Selecionar o nome e a especialidade dos médicos:*/
SELECT nome as Nome, especialidade as Especialidade FROM Medicos;
/*Concatenar o nome e a especialidade dos médicos em uma única coluna:*/
SELECT concat(nome, ', ', especialidade) as Nome_Especialidade FROM Medicos;
/*Selecionar somente a especialidade do médico a partir da coluna "Nome_Especialidade":*/
SELECT substring_index(Nome_Especialidade, ',', -1) as Especialidade FROM (
  SELECT concat(nome, ', ', especialidade) as Nome_Especialidade FROM Medicos
) as t;
/*Reverse de uma coluna de nomes de pacientes:*/
SELECT nome, REVERSE(nome) AS nome_reversed
FROM Pacientes;

