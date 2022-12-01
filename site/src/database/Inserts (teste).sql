USE coffeeTech;

INSERT INTO usuario (nome, cpf, email, senha) VALUES ('user','01118411863', 'user@user.com', '123');

INSERT INTO fazenda (nomeFazenda, cnpj, logradouro, numero, complemento, cep) VALUES ('Santana do Deserto', 30456055000171, 'Estrada dos laranjais', 'S/N', NULL, '05541810');

INSERT INTO fazendaTemUsuario (fkFazenda, fkUsuario) VALUES (1,1);

INSERT INTO silo (codigoSilo, temperaturaMin, temperaturaMax, umidadeMin, umidadeMax, fkFazenda) VALUES ('SL001', 25, 30, 10, 12, 1);

INSERT INTO sensor (tipoSensor, fkSilo) VALUES ('DHT 11', 1);

-- Inserts para 12/2021
INSERT INTO historicoMedicoes (dataHora, temperatura, umidade, fkSensor) VALUES
    ('2021-12-01 09:27:00', 32.62, 11.41, 1),
    ('2021-12-01 11:35:00', 33.5, 13.4, 1),
    ('2021-12-01 12:40:00', 35.61, 7.08, 1),
    ('2021-12-02 08:37:00', 33.01, 11.46, 1),
    ('2021-12-02 11:32:00', 30.3, 10.2, 1),
    ('2021-12-02 14:43:00', 32.44, 12.73, 1),
    ('2021-12-03 09:27:00', 28.19, 12.8, 1),
    ('2021-12-03 09:27:00', 22.28, 12.3, 1),
    ('2021-12-03 09:27:00', 18.05, 6.42, 1),    
    ('2021-12-04 09:27:00', 30.51, 14.77, 1),
    ('2021-12-04 09:27:00', 34.07, 7.62, 1),
    ('2021-12-04 09:27:00', 28.32, 10.93, 1),
    ('2021-12-05 09:27:00', 35.42, 14.72, 1),
    ('2021-12-05 09:27:00', 19.2, 15.65, 1),
    ('2021-12-05 09:27:00', 27.93, 6.4, 1),
    ('2021-12-06 09:27:00', 19.09, 9.66, 1),
    ('2021-12-06 09:27:00', 21.3, 11.76, 1),
    ('2021-12-06 09:27:00', 32.29, 11.62, 1),
    ('2021-12-07 09:27:00', 35.93, 13.78, 1),
    ('2021-12-07 09:27:00', 21.44, 12.21, 1),
    ('2021-12-07 09:27:00', 34.02, 7.43, 1),
    ('2021-12-08 09:27:00', 34.52, 12.54, 1),
    ('2021-12-08 09:27:00', 29.64, 8.54, 1),
    ('2021-12-08 09:27:00', 23.22, 10.65, 1),    
    ('2021-12-09 09:27:00', 28.4, 12.13, 1),
    ('2021-12-09 09:27:00', 20.91, 9.24, 1),
    ('2021-12-09 09:27:00', 31.69, 10.79, 1),
    ('2021-12-10 09:27:00', 31.54, 7.03, 1),
    ('2021-12-10 09:27:00', 30.76, 9.77, 1),
    ('2021-12-10 09:27:00', 20.35, 7.7, 1),
    ('2021-12-11 09:27:00', 30.86, 8.11, 1),
    ('2021-12-11 09:27:00', 34.31, 7.69, 1),
    ('2021-12-11 09:27:00', 28.72, 7.25, 1),    
    ('2021-12-12 09:27:00', 21.94, 15.33, 1),
    ('2021-12-12 09:27:00', 21.9, 14.38, 1),
    ('2021-12-12 09:27:00', 28.63, 9.58, 1),    
    ('2021-12-13 09:27:00', 22.15, 10.34, 1),
    ('2021-12-13 09:27:00', 22.95, 15.11, 1),
    ('2021-12-13 09:27:00', 25.97, 14.59, 1),
    ('2021-12-14 09:27:00', 33.82, 12.49, 1),
    ('2021-12-14 09:27:00', 26.86, 15.28, 1),
    ('2021-12-14 09:27:00', 26.53, 13.77, 1),
    ('2021-12-15 09:27:00', 34.01, 13.6, 1),
    ('2021-12-15 09:27:00', 32.5, 14.57, 1),
    ('2021-12-15 09:27:00', 24.45, 15.3, 1),    
    ('2021-12-16 09:27:00', 26.62, 14.63, 1),
    ('2021-12-16 09:27:00', 26.95, 6.1, 1),
    ('2021-12-16 09:27:00', 29.93, 15.56, 1),
    ('2021-12-17 09:27:00', 32.36, 10.17, 1),
    ('2021-12-17 09:27:00', 25.8, 13.81, 1),
    ('2021-12-17 09:27:00', 27.87, 13.54, 1),    
    ('2021-12-18 09:27:00', 28.44, 11.95, 1),
    ('2021-12-18 09:27:00', 29.07, 8.16, 1),
    ('2021-12-18 09:27:00', 28.1, 11.44, 1),
    ('2021-12-19 09:27:00', 33.2, 8.01, 1),
    ('2021-12-19 09:27:00', 21.93, 13.87, 1),
    ('2021-12-19 09:27:00', 35.76, 6.85, 1),
    ('2021-12-20 09:27:00', 22.99, 6.77, 1),
    ('2021-12-20 09:27:00', 20.58, 12.35, 1),
    ('2021-12-20 09:27:00', 30.94, 14.52, 1),
    ('2021-12-21 09:27:00', 26.42, 11.64, 1),
    ('2021-12-21 09:27:00', 34.66, 7.53, 1),
    ('2021-12-21 09:27:00', 22.78, 8, 1),
    ('2021-12-22 09:27:00', 33.76, 9.81, 1),
    ('2021-12-22 09:27:00', 21.39, 8.36, 1),
    ('2021-12-22 09:27:00', 30.24, 13.72, 1),
    ('2021-12-23 09:27:00', 34.31, 11.93, 1),
    ('2021-12-23 09:27:00', 35.95, 8.86, 1),
    ('2021-12-23 09:27:00', 31.21, 14.47, 1),
    ('2021-12-24 09:27:00', 29.38, 9.2, 1),
    ('2021-12-24 09:27:00', 33.63, 11.84, 1),
    ('2021-12-24 09:27:00', 29.32, 10.41, 1),
    ('2021-12-25 09:27:00', 31.06, 8.3, 1),
    ('2021-12-25 09:27:00', 33.25, 9.24, 1),
    ('2021-12-25 09:27:00', 29.99, 9.85, 1); 

-- Inserts para 01/2022
INSERT INTO historicoMedicoes (dataHora, temperatura, umidade, fkSensor) VALUES
    ('2022-01-01 09:27:00', 23.68, 8.17, 1),
    ('2022-01-01 11:35:00', 29.83, 9.48, 1),
    ('2022-01-01 12:40:00', 24.92, 13.59, 1),
    ('2022-01-02 08:37:00', 34.21, 6.24, 1),
    ('2022-01-02 11:32:00', 19.33, 13.77, 1),
    ('2022-01-02 14:43:00', 21.74, 13.91, 1),
    ('2022-01-03 09:27:00', 22.51, 6.32, 1),
    ('2022-01-03 09:27:00', 31.51, 6.52, 1),
    ('2022-01-03 09:27:00', 33.26, 11.17, 1),    
    ('2022-01-04 09:27:00', 32.83, 15.55, 1),
    ('2022-01-04 09:27:00', 18.75, 14.74, 1),
    ('2022-01-04 09:27:00', 23.4, 11.86, 1),
    ('2022-01-05 09:27:00', 24.14, 14.83, 1),
    ('2022-01-05 09:27:00', 29.78, 12.57, 1),
    ('2022-01-05 09:27:00', 32.97, 6.46, 1),
    ('2022-01-06 09:27:00', 23.73, 12.49, 1),
    ('2022-01-06 09:27:00', 21.89, 11.95, 1),
    ('2022-01-06 09:27:00', 18.44, 8.58, 1),
    ('2022-01-07 09:27:00', 33.07, 11.99, 1),
    ('2022-01-07 09:27:00', 29.25, 9.41, 1),
    ('2022-01-07 09:27:00', 28.74, 7.81, 1),
    ('2022-01-08 09:27:00', 34.78, 9.42, 1),
    ('2022-01-08 09:27:00', 21.95, 10.62, 1),
    ('2022-01-08 09:27:00', 35.87, 14.92, 1),    
    ('2022-01-09 09:27:00', 29.75, 7.08, 1),
    ('2022-01-09 09:27:00', 26.78, 15.42, 1),
    ('2022-01-09 09:27:00', 35.56, 13.14, 1),
    ('2022-01-10 09:27:00', 22.91, 10.38, 1),
    ('2022-01-10 09:27:00', 34.24, 15.29, 1),
    ('2022-01-10 09:27:00', 22.36, 9.62, 1),
    ('2022-01-11 09:27:00', 30.99, 14.41, 1),
    ('2022-01-11 09:27:00', 30.82, 9.83, 1),
    ('2022-01-11 09:27:00', 30.58, 7.01, 1),    
    ('2022-01-12 09:27:00', 32.54, 11.74, 1),
    ('2022-01-12 09:27:00', 35.54, 8.28, 1),
    ('2022-01-12 09:27:00', 27.55, 12.14, 1),    
    ('2022-01-13 09:27:00', 27.91, 12.14, 1),
    ('2022-01-13 09:27:00', 20.58, 13.07, 1),
    ('2022-01-13 09:27:00', 24.14, 8.05, 1),
    ('2022-01-14 09:27:00', 23, 7.45, 1),
    ('2022-01-14 09:27:00', 28.81, 12.66, 1),
    ('2022-01-14 09:27:00', 31.46, 8.91, 1),
    ('2022-01-15 09:27:00', 22.83, 8.61, 1),
    ('2022-01-15 09:27:00', 18.04, 13.61, 1),
    ('2022-01-15 09:27:00', 29.21, 8.64, 1),    
    ('2022-01-16 09:27:00', 20.4, 6.03, 1),
    ('2022-01-16 09:27:00', 26.91, 11.09, 1),
    ('2022-01-16 09:27:00', 27.88, 9.78, 1),
    ('2022-01-17 09:27:00', 28.59, 14.58, 1),
    ('2022-01-17 09:27:00', 28.96, 12.67, 1),
    ('2022-01-17 09:27:00', 33.51, 7.59, 1),    
    ('2022-01-18 09:27:00', 23.39, 8.29, 1),
    ('2022-01-18 09:27:00', 24.55, 11.44, 1),
    ('2022-01-18 09:27:00', 33.31, 14.88, 1),
    ('2022-01-19 09:27:00', 31.53, 10.39, 1),
    ('2022-01-19 09:27:00', 28.93, 15.8, 1),
    ('2022-01-19 09:27:00', 30.46, 14, 1),
    ('2022-01-20 09:27:00', 29.14, 6.46, 1),
    ('2022-01-20 09:27:00', 22.09, 12.02, 1),
    ('2022-01-20 09:27:00', 20.6, 15.29, 1),
    ('2022-01-21 09:27:00', 32.24, 6.42, 1),
    ('2022-01-21 09:27:00', 20.84, 9.22, 1),
    ('2022-01-21 09:27:00', 21.55, 7.75, 1),
    ('2022-01-22 09:27:00', 25.98, 10.88, 1),
    ('2022-01-22 09:27:00', 18.71, 8.93, 1),
    ('2022-01-22 09:27:00', 26.6, 8.41, 1),
    ('2022-01-23 09:27:00', 31.63, 8.73, 1),
    ('2022-01-23 09:27:00', 26.26, 14.19, 1),
    ('2022-01-23 09:27:00', 22.97, 9.3, 1),
    ('2022-01-24 09:27:00', 21.41, 7.64, 1),
    ('2022-01-24 09:27:00', 35.14, 7.81, 1),
    ('2022-01-24 09:27:00', 30.66, 15.48, 1),
    ('2022-01-25 09:27:00', 25.26, 7.43, 1),
    ('2022-01-25 09:27:00', 33.06, 8.71, 1),
    ('2022-01-25 09:27:00', 24.77, 12.96, 1),
	('2022-01-25 09:27:00', 30.63, 15.59, 1),
    ('2022-01-25 09:27:00', 18.33, 13.8, 1),
    ('2022-01-25 09:27:00', 32.67, 13.8, 1);

-- Inserts para 02/2022
INSERT INTO historicoMedicoes (dataHora, temperatura, umidade, fkSensor) VALUES
    ('2022-02-01 09:27:00', 32.5, 15.35, 1),
    ('2022-02-01 11:35:00', 29.36, 7.79, 1),
    ('2022-02-01 12:40:00', 29.61, 14.4, 1),
    ('2022-02-02 08:37:00', 35.45, 9.01, 1),
    ('2022-02-02 11:32:00', 27.87, 15.83, 1),
    ('2022-02-02 14:43:00', 19.31, 10.46, 1),
    ('2022-02-03 09:27:00', 26.92, 7.09, 1),
    ('2022-02-03 09:27:00', 31.52, 15.98, 1),
    ('2022-02-03 09:27:00', 25.76, 14.8, 1),    
    ('2022-02-04 09:27:00', 27.63, 10.54, 1),
    ('2022-02-04 09:27:00', 25.14, 9.23, 1),
    ('2022-02-04 09:27:00', 30.22, 14.31, 1),
    ('2022-02-05 09:27:00', 25.43, 6.68, 1),
    ('2022-02-05 09:27:00', 27.34, 7.99, 1),
    ('2022-02-05 09:27:00', 24.65, 14.16, 1),
    ('2022-02-06 09:27:00', 25.4, 13.84, 1),
    ('2022-02-06 09:27:00', 32.9, 10.88, 1),
    ('2022-02-06 09:27:00', 29.06, 7.25, 1),
    ('2022-02-07 09:27:00', 21.2, 12.01, 1),
    ('2022-02-07 09:27:00', 21.21, 9.01, 1),
    ('2022-02-07 09:27:00', 20.93, 14.19, 1),
    ('2022-02-08 09:27:00', 18.18, 8.58, 1),
    ('2022-02-08 09:27:00', 19.26, 15.14, 1),
    ('2022-02-08 09:27:00', 31.29, 11.71, 1),    
    ('2022-02-09 09:27:00', 33.99, 14.01, 1),
    ('2022-02-09 09:27:00', 33.64, 13.79, 1),
    ('2022-02-09 09:27:00', 18.24, 7, 1),
    ('2022-02-10 09:27:00', 34.56, 7.08, 1),
    ('2022-02-10 09:27:00', 26.79, 7.75, 1),
    ('2022-02-10 09:27:00', 20.52, 8.63, 1),
    ('2022-02-11 09:27:00', 22.36, 10.13, 1),
    ('2022-02-11 09:27:00', 35.65, 12.51, 1),
    ('2022-02-11 09:27:00', 26.37, 10.18, 1),    
    ('2022-02-12 09:27:00', 32.75, 10.64, 1),
    ('2022-02-12 09:27:00', 30.26, 11.11, 1),
    ('2022-02-12 09:27:00', 34.99, 9.79, 1),    
    ('2022-02-13 09:27:00', 35.78, 8.73, 1),
    ('2022-02-13 09:27:00', 26.68, 14.75, 1),
    ('2022-02-13 09:27:00', 31.47, 15.97, 1),
    ('2022-02-14 09:27:00', 22.32, 11.23, 1),
    ('2022-02-14 09:27:00', 29.8, 12.31, 1),
    ('2022-02-14 09:27:00', 21.64, 7.78, 1),
    ('2022-02-15 09:27:00', 32.31, 8.11, 1),
    ('2022-02-15 09:27:00', 22.55, 6.55, 1),
    ('2022-02-15 09:27:00', 28.87, 8.39, 1),    
    ('2022-02-16 09:27:00', 29.51, 11.31, 1),
    ('2022-02-16 09:27:00', 23.13, 13.3, 1),
    ('2022-02-16 09:27:00', 31.73, 10.34, 1),
    ('2022-02-17 09:27:00', 21.23, 14.49, 1),
    ('2022-02-17 09:27:00', 24.12, 13.2, 1),
    ('2022-02-17 09:27:00', 26.63, 11.15, 1),    
    ('2022-02-18 09:27:00', 28.7, 13.69, 1),
    ('2022-02-18 09:27:00', 27.5, 10.24, 1),
    ('2022-02-18 09:27:00', 34.43, 12.16, 1),
    ('2022-02-19 09:27:00', 22.46, 11.18, 1),
    ('2022-02-19 09:27:00', 30.24, 10.78, 1),
    ('2022-02-19 09:27:00', 18.46, 12.22, 1),
    ('2022-02-20 09:27:00', 19.05, 12.11, 1),
    ('2022-02-20 09:27:00', 35.16, 13.07, 1),
    ('2022-02-20 09:27:00', 23.48, 9.47, 1),
    ('2022-02-21 09:27:00', 35.23, 7.89, 1),
    ('2022-02-21 09:27:00', 22.17, 6.3, 1),
    ('2022-02-21 09:27:00', 20.3, 11.66, 1),
    ('2022-02-22 09:27:00', 18.37, 14.07, 1),
    ('2022-02-22 09:27:00', 33.4, 11.08, 1),
    ('2022-02-22 09:27:00', 20.48, 7.89, 1),
    ('2022-02-23 09:27:00', 33.74, 9.13, 1),
    ('2022-02-23 09:27:00', 35.77, 8.11, 1),
    ('2022-02-23 09:27:00', 30.01, 6.53, 1),
    ('2022-02-24 09:27:00', 26.49, 7.72, 1),
    ('2022-02-24 09:27:00', 34.45, 9.47, 1),
    ('2022-02-24 09:27:00', 35.01, 6.17, 1),
    ('2022-02-25 09:27:00', 19.07, 8.19, 1),
    ('2022-02-25 09:27:00', 21.96, 8.26, 1),
    ('2022-02-25 09:27:00', 30.15, 13.52, 1),
	('2022-02-25 09:27:00', 22.41, 9.52, 1),
    ('2022-02-25 09:27:00', 33.64, 9.75, 1);

-- Inserts para 11/2022
INSERT INTO historicoMedicoes (dataHora, temperatura, umidade, fkSensor) VALUES
    ('2022-11-01 09:27:00', 32.5, 15.35, 1),
    ('2022-11-01 11:35:00', 29.36, 7.79, 1),
    ('2022-11-01 12:40:00', 29.61, 14.4, 1),
    ('2022-11-02 08:37:00', 35.45, 9.01, 1),
    ('2022-11-02 11:32:00', 27.87, 15.83, 1),
    ('2022-11-02 14:43:00', 19.31, 10.46, 1),
    ('2022-11-03 09:27:00', 26.92, 7.09, 1),
    ('2022-11-03 09:27:00', 31.52, 15.98, 1),
    ('2022-11-03 09:27:00', 25.76, 14.8, 1),    
    ('2022-11-04 09:27:00', 27.63, 10.54, 1),
    ('2022-11-04 09:27:00', 25.14, 9.23, 1),
    ('2022-11-04 09:27:00', 30.22, 14.31, 1),
    ('2022-11-05 09:27:00', 25.43, 6.68, 1),
    ('2022-11-05 09:27:00', 27.34, 7.99, 1),
    ('2022-11-05 09:27:00', 24.65, 14.16, 1),
    ('2022-11-06 09:27:00', 25.4, 13.84, 1),
    ('2022-11-06 09:27:00', 32.9, 10.88, 1),
    ('2022-11-06 09:27:00', 29.06, 7.25, 1),
    ('2022-11-07 09:27:00', 21.2, 12.01, 1),
    ('2022-11-07 09:27:00', 21.21, 9.01, 1),
    ('2022-11-07 09:27:00', 20.93, 14.19, 1),
    ('2022-11-08 09:27:00', 18.18, 8.58, 1),
    ('2022-11-08 09:27:00', 19.26, 15.14, 1),
    ('2022-11-08 09:27:00', 31.29, 11.71, 1),    
    ('2022-11-09 09:27:00', 33.99, 14.01, 1),
    ('2022-11-09 09:27:00', 33.64, 13.79, 1),
    ('2022-11-09 09:27:00', 18.24, 7, 1),
    ('2022-11-10 09:27:00', 34.56, 7.08, 1),
    ('2022-11-10 09:27:00', 26.79, 7.75, 1),
    ('2022-11-10 09:27:00', 20.52, 8.63, 1),
    ('2022-11-11 09:27:00', 22.36, 10.13, 1),
    ('2022-11-11 09:27:00', 35.65, 12.51, 1),
    ('2022-11-11 09:27:00', 26.37, 10.18, 1),    
    ('2022-11-12 09:27:00', 32.75, 10.64, 1),
    ('2022-11-12 09:27:00', 30.26, 11.11, 1),
    ('2022-11-12 09:27:00', 34.99, 9.79, 1),    
    ('2022-11-13 09:27:00', 35.78, 8.73, 1),
    ('2022-11-13 09:27:00', 26.68, 14.75, 1),
    ('2022-11-13 09:27:00', 31.47, 15.97, 1),
    ('2022-11-14 09:27:00', 22.32, 11.23, 1),
    ('2022-11-14 09:27:00', 29.8, 12.31, 1),
    ('2022-11-14 09:27:00', 21.64, 7.78, 1),
    ('2022-11-15 09:27:00', 32.31, 8.11, 1),
    ('2022-11-15 09:27:00', 22.55, 6.55, 1),
    ('2022-11-15 09:27:00', 28.87, 8.39, 1),    
    ('2022-11-16 09:27:00', 29.51, 11.31, 1),
    ('2022-11-16 09:27:00', 23.13, 13.3, 1),
    ('2022-11-16 09:27:00', 31.73, 10.34, 1),
    ('2022-11-17 09:27:00', 21.23, 14.49, 1),
    ('2022-11-17 09:27:00', 24.12, 13.2, 1),
    ('2022-11-17 09:27:00', 26.63, 11.15, 1),    
    ('2022-11-18 09:27:00', 28.7, 13.69, 1),
    ('2022-11-18 09:27:00', 27.5, 10.24, 1),
    ('2022-11-18 09:27:00', 34.43, 12.16, 1),
    ('2022-11-19 09:27:00', 22.46, 11.18, 1),
    ('2022-11-19 09:27:00', 30.24, 10.78, 1),
    ('2022-11-19 09:27:00', 18.46, 12.22, 1),
    ('2022-11-20 09:27:00', 19.05, 12.11, 1),
    ('2022-11-20 09:27:00', 35.16, 13.07, 1),
    ('2022-11-20 09:27:00', 23.48, 9.47, 1),
    ('2022-11-21 09:27:00', 35.23, 7.89, 1),
    ('2022-11-21 09:27:00', 22.17, 6.3, 1),
    ('2022-11-21 09:27:00', 20.3, 11.66, 1),
    ('2022-11-22 09:27:00', 18.37, 14.07, 1),
    ('2022-11-22 09:27:00', 33.4, 11.08, 1),
    ('2022-11-22 09:27:00', 20.48, 7.89, 1),
    ('2022-11-23 09:27:00', 33.74, 9.13, 1),
    ('2022-11-23 09:27:00', 35.77, 8.11, 1),
    ('2022-11-23 09:27:00', 30.01, 6.53, 1),
    ('2022-11-24 09:27:00', 26.49, 7.72, 1),
    ('2022-11-24 09:27:00', 34.45, 9.47, 1),
    ('2022-11-24 09:27:00', 35.01, 6.17, 1),
    ('2022-11-25 09:27:00', 19.07, 8.19, 1),
    ('2022-11-25 09:27:00', 21.96, 8.26, 1),
    ('2022-11-25 09:27:00', 30.15, 13.52, 1),
	('2022-11-25 09:27:00', 22.41, 9.52, 1),
    ('2022-11-25 09:27:00', 33.64, 9.75, 1);