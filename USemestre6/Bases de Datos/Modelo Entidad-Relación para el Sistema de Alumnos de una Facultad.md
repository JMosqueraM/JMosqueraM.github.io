**Materia:** Bases de Datos
**Actividad:** Modelado Entidad-Relacion
**Estudiantes:**
- Jose Miguel Mosquera Moncaleano
- Camilo Alexander Varona Cepeda
## Introducción

Este documento proporciona una descripción detallada del modelo Entidad-Relación (ER) diseñado para representar un sistema de gestión de alumnos en una facultad. El modelo ER se ha creado para capturar y organizar la información relacionada con estudiantes, carreras, materias, docentes, eventos, inscripciones y otros aspectos relevantes de la facultad.

El diseño del modelo ER se basa en los requisitos específicos proporcionados, teniendo en cuenta las entidades involucradas, sus atributos, las relaciones entre ellas y la cardinalidad a partir del caso dado:
```
Se quiere modelar un sistema de alumnos de una facultad. El sistema cuenta con la información personal de cada uno de los alumnos; las carreras que hay en esa facultad, las materias de cada carrera y las materias en las que se inscriben los alumnos con el semestre en el que se inscriben, los eventos, los horarios en los que se inscriben y finalmente la nota que sacaron en cada una de las materias ya finalizadas. De los alumnos sabemos su número de documento, su nombre, su domicilio (discriminado en calle, número, torre, apartamento y ciudad) y su código de estudiante (único por estudiante en la facultad). Cada estudiante está en inscrito en al menos una carrera, y podría estar inscrito en varias carreras. Obviamente, en una carrera puede haber varios estudiantes inscritos. De las carreras sabemos el código que la identifica (único por carrera) y el año en que fue incorporada a la facultad. En cada carrera existen varias materias. De las materias sabemos el código que la identifica (único por carrera); no pueden identificarse dos materias de diferentes carreras con el mismo código, el nombre de la materia, día, horario y el grupo de docentes que trabaja en la misma. De los docentes sabemos su número de documento, nombre, año de ingreso a la facultad y título académico que tiene. Cada docente trabaja en una sola materia, pero en una materia puede haber varios docentes. Cada materia, a su vez, se organiza en eventos en donde cada una tiene un conjunto de horarios de práctica de los cuales el estudiante elige uno para cursar, cada estudiante se inscribe en un único evento. Los eventos se identifican por un número, el aula y el edificio donde se desarrolla. Para aquellos que ya han cursado las materias, además de la información relacionada a la inscripción necesitamos saber cuál fue la nota final y en qué fecha se registró la nota obtenida. Como último requerimiento, sabemos que cada materia tiene una serie de pre-requisitos y co-requisitos que deben conocerse para luego poder identificar si la inscripción del estudiante es correcta
```

## Grafico Modelo Entidad - Relacion

![[Pasted image 20230904221455.png]]
## Entidades y Atributos

A continuación, se detallan las principales entidades identificadas en el modelo, junto con sus atributos correspondientes:

### 1. Alumno

- **Número de documento (PK)**: Número de identificación único para cada estudiante.
- **Nombre**: El nombre completo del estudiante.
- **Domicilio**: Atributo compuesto que incluye calle, número, torre, apartamento y ciudad.
- **Código de estudiante (clave primaria)**: Un código único asignado a cada estudiante en la facultad.

### 2. Carrera

- **Código de carrera (PK)**: Identificador único para cada carrera.
- **Año de incorporación**: Año en que la carrera fue incorporada a la facultad.

### 3. Materia

- **Código de materia (PK)**: Identificador único para cada materia.
- **Nombre**: Nombre de la materia.

### 4. Docente

- **Número de documento (PK)**: Número de identificación único para cada docente.
- **Nombre**: Nombre completo del docente.
- **Año de ingreso**: Año en que el docente ingresó a la facultad.
- **Título académico**: El título académico que posee el docente.

### 5. Evento

- **Número de evento (PK)**: Número único que identifica cada evento.
- **Aula**: Aula en la que se lleva a cabo el evento.
- **Edificio**: Edificio en el que se encuentra el aula del evento.

### 6. Horario

- **Día**: Día en que se programan las clases.
- **Hora**: Hora en que se programan las clases.

### 7. Inscripción

- **Semestre**: Semestre en el que se inscribe el estudiante en una materia.
- **Nota final**: Nota obtenida por el estudiante en la materia.
- **Fecha de registro**: Fecha en que se registra la nota obtenida por el estudiante en la materia.

## Relaciones y Cardinalidad

El modelo Entidad-Relación también describe las relaciones entre las entidades y la cardinalidad de estas relaciones:

### 1. Alumno - Carrera

- **Relación**: Está inscrito en.
- **Cardinalidad**: Un alumno puede estar inscrito en al menos una carrera. Varios estudiantes pueden estar inscritos en la misma carrera (1:N).

### 2. Carrera - Materia

- **Relación**: Ofrece.
- **Cardinalidad**: Una carrera ofrece varias materias, pero una materia solo pertenece a una carrera (1:N).

### 3. Materia - Docente

- **Relación**: Imparte.
- **Cardinalidad**: Un docente imparte una materia, y una materia puede ser impartida por varios docentes (N:1).

### 4. Materia - Evento

- **Relación**: Se organiza en.
- **Cardinalidad**: Una materia se organiza en varios eventos, y un evento pertenece a una única materia (1:N).

### 5. Evento - Horario

- **Relación**: Tiene horario.
- **Cardinalidad**: Un evento tiene varios horarios, y un horario pertenece a un solo evento (1:N).

### 6. Alumno - Evento

- **Relación**: Se inscribe en.
- **Cardinalidad**: Un alumno se inscribe en un evento, y un evento puede tener varios alumnos inscritos (N:N).

### 7. Alumno - Inscripción

- **Relación**: Tiene inscripción.
- **Cardinalidad**: Un alumno puede tener múltiples inscripciones (correspondientes a diferentes materias y semestres), y cada inscripción pertenece a un único alumno (1:N).

## Conclusiones

El modelo Entidad-Relación diseñado proporciona una representación completa y detallada del sistema de gestión de alumnos de la facultad representando la naturaleza de este sistema en el mundo real. Por ello, este modelo serviría como base sólida para el diseño e implementación de una base de datos que gestione eficientemente la información académica de la facultad y las interacciones entre estudiantes, carreras, materias y docentes.