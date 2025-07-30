-- 1. Número de pacientes atendidos por cada médico

SELECT M.nombre, COUNT(CT.paciente_id_paciente) AS pacientes_atendidos
FROM medico AS M
JOIN Cita AS CT ON M.id_medico = CT.medico_id_medico
GROUP BY (M.nombre); 

-- 11.Empleados con mayor número de pacientes atendidos por los médicos bajo su supervisión
SELECT E.nombre, COUNT(CT.paciente_id_paciente) AS pacientes_atendidos
FROM empleado AS E
JOIN Cita AS CT ON E.id_empleado = CT.empleado_id_empleado
WHERE COUNT(CT.paciente_id_paciente) > (
	SELECT AVG(CT2.paciente_id_paciente)
    FROM Cita
    WHERE CT2.empleado_id_empleado = CT2.empleado_id_empleado
);