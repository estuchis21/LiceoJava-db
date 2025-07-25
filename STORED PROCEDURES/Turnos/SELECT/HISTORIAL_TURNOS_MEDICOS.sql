USE [tuSanatorio]
GO
/****** Object:  StoredProcedure [dbo].[HistorialTurnosMedico]    Script Date: 09/06/2025 21:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HistorialTurnosMedico]
    @id_medico INT  
AS
BEGIN
    SELECT td.fecha_turno AS 'Fecha del Turno',up.nombres AS 'Paciente',up.DNI AS 'DNI',up.telefono AS'Telefono',up.email AS 'Email'
    FROM 
        Medicos m,
        turnos_disponibles td,
        turnos_asignados ta,
        Pacientes p,
        Usuarios up
    WHERE 
        m.id_medico = @id_medico
        AND m.id_medico = td.id_medico
        AND td.id_turno = ta.id_turno
        AND ta.id_paciente = p.id_paciente
        AND p.id_usuario = up.id_usuario
        AND td.fecha_turno < GETDATE() 
    ORDER BY td.fecha_turno DESC;
END;
