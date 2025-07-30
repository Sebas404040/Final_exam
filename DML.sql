INSERT INTO tipo_medico(nombre) VALUES ("titular"), ("interino"), ("sustituto");

INSERT INTO cargo_empleado(nombre) VALUES ("auxiliar de enfermeria"), ("celador"), ("administrativo");

INSERT INTO horario(hora_entrada, hora_salida) VALUES ("8:00", "18:00"), ("10:00", "20:00"), ("6:00", "14:00");

INSERT INTO paciente(nombre) VALUES ("Juan"), ("Stefany"), ("Carlos"), ("Martin"), ("Nikol");

INSERT INTO empleado(nombre, ubicacion, cargo_empleado_id_cargo, horario_id_horarios) VALUES ("Monica Sanchez", "Giron", "1", "2"), ("Rick Sanchez", "Giron", "2", "2"), ("Morty Dominguez", "Giron", "3", "3");

INSERT INTO medico(nombre, tipo_medico_id_tipo, horario_id_horario) VALUES ("Jose Aguilar", "2", "1"), ("Josue Martinez", "1", "1"), ("Marta", "3", "3");

INSERT INTO vacaciones(disfrutadas, vacacion, empleado_id_empleado) VALUES ("23", "10", "1"), ("30", "20", "2"), ("10", "23", "3");

INSERT INTO vacaciones_medico(disfrutadas, vacacion, medico_id_medico) VALUES ("45", "12", "1"), ("56", "34", "2"), ("21", "45", "3");

INSERT INTO Cita(paciente_id_paciente, medico_id_medico, observaciones, empleado_id_empleado) VALUES ("1", "3", "Presenta malestar", "1"), ("1", "2", "Presenta malestar", "3"), ("2", "2", "Presenta malestar", "1"), ("3", "1", "Presenta malestar", "1"), ("3", "1", "Presenta malestar", "2");