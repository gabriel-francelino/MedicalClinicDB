USE trabalhoBD;
/*operações para alterar nomes*/

ALTER TABLE Pacientes RENAME TO Pacientes_antigos;
ALTER TABLE Medicos RENAME TO Medicos_atuais;
ALTER TABLE Consultas RENAME TO Registros_consultas;
ALTER TABLE Receitas RENAME TO Receitas_medicas;
ALTER TABLE Exames RENAME TO Resultados_exames;
ALTER TABLE Pacientes_antigos RENAME TO Historico_pacientes;
ALTER TABLE Medicos_atuais RENAME TO Profissionais_saude;
ALTER TABLE Registros_consultas RENAME TO Atendimentos_medicos;
ALTER TABLE Receitas_medicas RENAME TO Prescricoes_medicas;
ALTER TABLE Resultados_exames RENAME TO Analises_clinicas;

ALTER TABLE Historico_pacientes RENAME TO Pacientes;
ALTER TABLE Profissionais_saude RENAME TO Medicos ;
ALTER TABLE Atendimentos_medicos RENAME TO Consultas;
ALTER TABLE Prescricoes_medicas RENAME TO Receitas;
ALTER TABLE Analises_clinicas RENAME TO Exames;
