USE trabalhoBD;
/*operações para alterar nomes*/

ALTER TABLE pacientes RENAME TO pacientes_antigos;
ALTER TABLE medicos RENAME TO medicos_atuais;
ALTER TABLE consultas RENAME TO Registros_consultas;
ALTER TABLE receitas RENAME TO receitas_medicas;
ALTER TABLE exames RENAME TO Resultados_exames;
ALTER TABLE pacientes_antigos RENAME TO Historico_pacientes;
ALTER TABLE medicos_atuais RENAME TO Profissionais_saude;
ALTER TABLE Registros_consultas RENAME TO Atendimentos_medicos;
ALTER TABLE receitas_medicas RENAME TO Prescricoes_medicas;
ALTER TABLE Resultados_exames RENAME TO Analises_clinicas;

ALTER TABLE Historico_pacientes RENAME TO pacientes;
ALTER TABLE Profissionais_saude RENAME TO medicos ;
ALTER TABLE Atendimentos_medicos RENAME TO consultas;
ALTER TABLE Prescricoes_medicas RENAME TO receitas;
ALTER TABLE Analises_clinicas RENAME TO exames;
