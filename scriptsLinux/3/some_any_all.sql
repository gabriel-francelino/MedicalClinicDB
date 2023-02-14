USE trabalhoBD;

-- Selecione o nome e a especialidade dos médicos cujo o horário de início é anterior ao horário de fim de pelo menos uma consulta agendada deles.
SELECT nome, especialidade FROM medicos
WHERE horario_inicio < SOME (SELECT horario_fim FROM consultas WHERE medico_id = medicos.id);

-- Selecione o nome de todos os médicos cujo horário de término é depois do horário de início de pelo menos uma das consultas.(Usando ANY)
SELECT nome FROM medicos
WHERE horario_fim > ANY (SELECT data_hora FROM consultas);


--  Selecione o nome e a especialidade dos médicos cujo horário de fim é posterior ao horário de início de todas as consultas agendadas para eles.
SELECT nome, especialidade FROM medicos
WHERE horario_fim > ALL (SELECT horario_inicio FROM consultas WHERE medico_id = medicos.id);

-- Selecione médicos que atendam pelo menos uma consulta entre 17/02/2023 às 18h e 20/02/2023 às 20h.
SELECT m.nome FROM medicos m
WHERE EXISTS (
  SELECT * FROM consultas c
  WHERE m.id = c.medico_id AND c.data_hora BETWEEN '2023-02-17 18:00:00' AND '2023-02-20 20:00:00'
);

-- Selecione médicos que atendam todas as consultas entre 10/02/2023 às 10h e 14/02/2023 às 15h.
SELECT m.nome
FROM medicos m
WHERE NOT EXISTS (
  SELECT * FROM consultas c
  WHERE m.id = c.medico_id AND c.data_hora NOT BETWEEN '2023-02-10 10:00:00' AND '2023-02-14 15:00:00'
);












