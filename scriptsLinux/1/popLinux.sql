USE trabalhoBD;

INSERT INTO pacientes (nome, data_nascimento, endereco, telefone) VALUES
('João Silva', '1990-01-01', 'Rua A, 123', '11 99999-9999'),
('Maria Oliveira', '1985-02-28', 'Rua B, 456', '11 88888-8888'),
('Pedro Albuquerque', '1980-03-20', 'Rua C, 789', '11 77777-7777'),
('Ana Santos', '1995-04-10', 'Rua D, 012', '11 66666-6666'),
('Luiz Henrique', '2000-05-05', 'Rua E, 345', '11 55555-5555'),
('Juliana Fernandes', '1975-06-15', 'Rua F, 678', '11 44444-4444'),
('Fernanda Souza', '1965-07-30', 'Rua G, 901', '11 33333-3333'),
('Carlos Alberto', '1990-08-20', 'Rua H, 234', '11 22222-2222'),
('Eduardo Ribeiro', '1995-09-10', 'Rua I, 567', '11 11111-1111'),
('Gabriela Costa', '1980-10-01', 'Rua J, 890', '11 00000-0000');

INSERT INTO medicos (id, nome, especialidade, horario_inicio, horario_fim) VALUES
(1, 'Dr. João Silva', 'Clínico geral', '09:00', '17:00'),
(2, 'Dra. Maria Oliveira', 'Cardiologista', '08:00', '16:00'),
(3, 'Dr. Luis Rodrigues', 'Ortopedista', '10:00', '18:00'),
(4, 'Dra. Ana Santos', 'Ginecologista', '09:00', '17:00'),
(5, 'Dr. Marcelo Moreira', 'Pediatra', '08:00', '16:00'),
(6, 'Dra. Juliana Ferreira', 'Dermatologista', '10:00', '18:00'),
(7, 'Dr. Gabriel Pinto', 'Oftalmologista', '09:00', '17:00'),
(8, 'Dra. Beatriz Lima', 'Oncologista', '08:00', '16:00'),
(9, 'Dr. Bruno Souza', 'Urologista', '10:00', '18:00'),
(10, 'Dra. Fernanda Almeida', 'Anestesiologista', '09:00', '17:00');


INSERT INTO consultas (data_hora, descricao, paciente_id, medico_id) VALUES
('2023-02-10 10:00:00', 'Consulta de rotina', 1, 1),
('2023-02-11 09:00:00', 'Consulta de retorno', 2, 2),
('2023-02-12 08:00:00', 'Consulta de emergência', 3, 3),
('2023-02-13 14:00:00', 'Consulta de follow-up', 4, 4),
('2023-02-14 15:00:00', 'Consulta de check-up', 5, 5),
('2023-02-15 16:00:00', 'Consulta de acompanhamento', 6, 6),
('2023-02-16 17:00:00', 'Consulta de avaliação', 7, 7),
('2023-02-17 18:00:00', 'Consulta de exame', 8, 8),
('2023-02-18 19:00:00', 'Consulta de tratamento', 9, 9),
('2023-02-19 20:00:00', 'Consulta de diagnóstico', 10, 10);

INSERT INTO receitas (data, descricao, medicamentos, paciente_id, medico_id) VALUES
('2023-01-01', 'Prescrição para dor de cabeça', 'Ibuprofeno 200mg', 1, 1),
('2023-02-01', 'Prescrição para dor de garganta', 'Amoxicilina 500mg', 2, 2),
('2023-03-01', 'Prescrição para dor muscular', 'Diclofenaco 100mg', 3, 3),
('2023-04-01', 'Prescrição para dor de estômago', 'Ranitidina 150mg', 4, 1),
('2023-05-01', 'Prescrição para dor de cabeça', 'Paracetamol 500mg', 5, 2),
('2023-06-01', 'Prescrição para dor de garganta', 'Penicilina 500mg', 6, 3),
('2023-07-01', 'Prescrição para dor muscular', 'Naproxeno 500mg', 7, 1),
('2023-08-01', 'Prescrição para dor de estômago', 'Omeprazol 20mg', 8, 2),
('2023-09-01', 'Prescrição para dor de cabeça', 'Aspirina 500mg', 9, 3),
('2023-10-01', 'Prescrição para dor de garganta', 'Azitromicina 500mg', 10, 1);

INSERT INTO exames (data, descricao, resultados, paciente_id, medico_id) VALUES
('2022-12-01', 'Exame de sangue', 'Tudo normal', 1, 1),
('2022-12-02', 'Raio-X de tórax', 'Tudo normal', 2, 2),
('2022-12-03', 'Resonância magnética', 'Lesão identificada', 3, 3),
('2022-12-04', 'Tomografia', 'Tudo normal', 4, 4),
('2022-12-05', 'Tomografia', 'Nódulo identificado', 5, 5),
('2022-12-06', 'ECG', 'Arritmia identificada', 6, 6),
('2022-12-07', 'Ultra-som abdominal', 'Lesão identificada', 7, 7),
('2022-12-08', 'Endoscopia', 'Lesão identificada', 8, 8),
('2022-12-09', 'Colonoscopia', 'Polipo identificado', 9, 9),
('2022-12-10', 'Eletroencefalografia', 'Tudo normal', 10, 10);

select * from medicos;
