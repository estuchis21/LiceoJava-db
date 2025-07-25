-- 1. Roles
CREATE TABLE Roles (
    rol_id INT IDENTITY(1,1) PRIMARY KEY,
    rol VARCHAR(50) NOT NULL
);

-- 2. Especialidades
CREATE TABLE Especialidades (
    id_especialidad INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- 3. Usuarios
CREATE TABLE Usuarios (
    id_usuario INT IDENTITY(1,1) PRIMARY KEY,
    nombres VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    DNI BIGINT NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    contrasena VARCHAR(200) NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    telefono VARCHAR(20) NOT NULL UNIQUE,
    id_rol INT NOT NULL,
    FOREIGN KEY (id_rol) REFERENCES Roles(rol_id)
);

-- 4. Médicos
CREATE TABLE Medicos (
    id_medico INT IDENTITY(1,1) PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_especialidad INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_especialidad) REFERENCES Especialidades(id_especialidad)
);

-- 5. Pacientes
CREATE TABLE Pacientes (
    id_paciente INT IDENTITY(1,1) PRIMARY KEY,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

-- 6. Obras Sociales
CREATE TABLE Obras_sociales (
    id_obra_social INT IDENTITY(1,1) PRIMARY KEY,
    obra_social VARCHAR(100) NOT NULL
);

-- 7. Rangos
CREATE TABLE Rangos (
    id_rango INT IDENTITY(1,1) PRIMARY KEY,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL
);

-- 8. Turnos Disponibles
CREATE TABLE Turnos_disponibles (
    id_turno INT IDENTITY(1,1) PRIMARY KEY,
    id_medico INT NOT NULL,
    id_rango INT NOT NULL,
    fecha_turno DATE NOT NULL,
    FOREIGN KEY (id_medico) REFERENCES Medicos(id_medico),
    FOREIGN KEY (id_rango) REFERENCES Rangos(id_rango)
);

-- 9. Turnos Asignados
CREATE TABLE Turnos_asignados (
    id_turno_asignado INT IDENTITY(1,1) PRIMARY KEY,
    id_turno INT NOT NULL,
    id_paciente INT NOT NULL,
    id_obra_social INT NOT NULL,
    fecha_asignacion DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (id_turno) REFERENCES Turnos_disponibles(id_turno),
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente),
    FOREIGN KEY (id_obra_social) REFERENCES Obras_sociales(id_obra_social)
);

-- 10. Medio de Pago
CREATE TABLE Medio_pago (
    id_medio_pago INT IDENTITY(1,1) PRIMARY KEY,
    medio_pago VARCHAR(50) NOT NULL
);

-- 11. Pagos
CREATE TABLE Pagos (
    id_pago INT IDENTITY(1,1) PRIMARY KEY,
    id_turno_asignado INT NOT NULL,
    id_medio_pago INT NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    fecha_pago DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (id_turno_asignado) REFERENCES Turnos_asignados(id_turno_asignado),
    FOREIGN KEY (id_medio_pago) REFERENCES Medio_pago(id_medio_pago)
);
