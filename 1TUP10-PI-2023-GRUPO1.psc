Algoritmo Vacunas
	
	Definir nombres Como Cadena
	Definir edades Como Entero
	Definir dni Como Cadena
	Definir fechasNacimiento Como Cadena
	Definir vacuna Como Cadena
	Definir fechasTurno Como Cadena
	
	Dimension nombres[50]
	Dimension edades[50]
	Dimension dni[50]
	Dimension fechasNacimiento[50]
	Dimension vacuna[50]
	Dimension fechasTurno[50]
	
	Definir diasSemana Como Cadena 
	Definir horarios Como Cadena 
	
	Dimension diasSemana[5]
	diasSemana[1] = "Lunes"
	diasSemana[2] = "Martes"
	diasSemana[3] = "Miércoles"
	diasSemana[4] = "Jueves"
	diasSemana[5] = "Viernes"
	
	Dimension horarios[8]
	horarios[1] = "8:00"
	horarios[2] = "8:30"
	horarios[3] = "9:00"
	horarios[4] = "9:30"
	horarios[5] = "10:00"
	horarios[6] = "10:30"
	horarios[7] = "11:00"
	horarios[8] = "11:30"
	
	// matriz bidimensional
	Definir agendaVacunatorio Como Entero
	Dimension agendaVacunatorio[5,8]
	
	Para dia = 1 Hasta 5 Hacer
		Para hora = 1 Hasta 8 Hacer
			agendaVacunatorio[dia, hora] = 0
		FinPara
	FinPara
	
	definir vacunasPreCargadas Como Caracter
	Dimension vacunasPreCargadas[6]
	
	// vacunas precargadas
	vacunasPreCargadas[1] = "Neumococo conjugada"
	vacunasPreCargadas[2] = "Poliomielitis (IPV o Salk)"
	vacunasPreCargadas[3] = "Quíntuple (o pentavalente)"
	vacunasPreCargadas[4] = "Rotavirus"
	vacunasPreCargadas[5] = "Meningococo"
	vacunasPreCargadas[6] = "Triple Viral"
	
	//stock de vacunas
	Definir stockVacunas Como Entero
	Dimension stockVacunas[6]
	
	//10 unidades de cada vacuna
	Para i = 1 Hasta 6 Hacer
		stockVacunas[i] = 10
	FinPara
	
	Definir totalPacientes Como Entero
	totalPacientes = 1
	
	Definir opciones Como Entero
	
	Repetir
        Escribir "//////Bienvenido al Sistema de Vacunación//////"
		Escribir " "
        Escribir "Menú de Opciones:"
        Escribir "1. Reservar turno"
        Escribir "2. Buscar paciente"
        Escribir "3. Ver agenda del vacunatorio"
        Escribir "4. Ordenar y mostrar lista de pacientes"
        Escribir "  a. Por edad"
        Escribir "  b. Por vacuna a aplicar"
        Escribir "5. Listados"
        Escribir "  a. Cantidad de turnos otorgados por día"
        Escribir "  b. Cantidad de vacunas a aplicar por vacuna"
        Escribir "6. Salir"
        Escribir "Seleccione una opción: "
        Leer opciones
		
		Segun opciones Hacer
            Caso 1:
                ReservarTurno(nombres, edades, dni, fechasNacimiento, vacuna, fechasTurno, totalPacientes ,vacunasPreCargadas, stockVacunas, diasSemana, horarios, agendaVacunatorio)
            Caso 2:
                BuscarPacientePorDNI(nombres, edades, dni, fechasNacimiento, vacuna, fechasTurno, totalPacientes, diasSemana, horarios)
            Caso 3:
                MostrarAgendaVacunatorio(diasSemana, horarios, agendaVacunatorio)
            Caso 4:
                Escribir "Ordenar y mostrar lista de pacientes:"
                Escribir "a. Por edad"
                Escribir "b. Por vacuna a aplicar"
                Escribir "Seleccione una opción (a/b): "
                Leer opcionOrdenamiento
				
				Mientras opcionOrdenamiento <> "a" Y opcionOrdenamiento <> "b" Hacer
					Escribir "Opción no válida. Intente de nuevo."
					Escribir "Seleccione una opción (a/b): "
					Leer opcionOrdenamiento
				FinMientras
                
                Si opcionOrdenamiento = "a" Entonces
                    OrdenarYMostrarPacientesPorEdad(nombres, edades, totalPacientes)
                Sino
                    Si opcionOrdenamiento = "b" Entonces
                        OrdenarYMostrarPacientesPorVacuna(nombres, edades, vacuna, totalPacientes)
                    FinSi
                FinSi
            Caso 5:
                Escribir "Listados:"
                Escribir "a. Cantidad de turnos otorgados por día"
                Escribir "b. Cantidad de vacunas a aplicar por vacuna"
                Escribir "Seleccione una opción (a/b): "
                Leer opcionListados
				
				Mientras opcionListados <> "a" Y opcionListados <> "b" Hacer
					Escribir "Opción no válida. Intente de nuevo."
					Escribir "Seleccione una opción (a/b): "
					Leer opcionListados
				FinMientras
                
                Si opcionListados = "a" Entonces
                    ContarTurnosPorDia(agendaVacunatorio)
                Sino
                    Si opcionListados = "b" Entonces
                        ContarVacunasAplicadasYBuscarIndiceVacuna(nombres, vacuna, totalPacientes, vacunasPreCargadas)
                    FinSi
                FinSi
            Caso 6:
                Escribir "Gracias por utilizar el Sistema de Vacunación. Hasta luego."
            De Otro Modo:
                Escribir "Opción no válida. Intente de nuevo."
        FinSegun
        
    Hasta Que opciones = 6

FinAlgoritmo

Subproceso ReservarTurno(nombres, edades, dni, fechasNacimiento, vacuna, fechasTurno, totalPacientes por referencia, vacunasPreCargadas, stockVacunas, diasSemana, horarios, agendaVacunatorio)
    Escribir "Reservar turno"
	
    Escribir "Nombre del paciente: "
    Leer nombres[totalPacientes]
	Mientras nombres[totalPacientes] = "" Hacer
		Escribir "Ingrese nombre válido: "
		Leer nombres[totalPacientes]
	FinMientras
	
    Escribir "Edad del paciente: "
    Leer edades[totalPacientes]
	Mientras edades[totalPacientes]<=0 o edades[totalPacientes]>120 Hacer
		Escribir "ingrese una edad válida"
		leer edades[totalPacientes]
	FinMientras
	
    Escribir "DNI del paciente: "
    Leer dni[totalPacientes]
	Mientras dni[totalPacientes]="" Hacer
		Escribir "Ingrese un DNI válido"
		leer dni[totalPacientes]
	FinMientras
	
    Escribir "Fecha de nacimiento del paciente: "
    Leer fechasNacimiento[totalPacientes]
	Mientras fechasNacimiento[totalPacientes] = "" Hacer
		Escribir "Ingrese una fecha válida formato DD/MM/AAAA"
		Leer fechasNacimiento[totalPacientes]
	FinMientras
	
	Definir opcionDia Como Entero
	definir opcionHora Como Entero
	
	Escribir "Ingrese un día para el turno: "
    Para i = 1 Hasta 5 Hacer
        Escribir i, ". ", diasSemana[i]
    FinPara
    Leer opcionDia
    Escribir "Horarios disponibles para el día ", diasSemana[opcionDia]
    
    Para i = 1 Hasta 8 Hacer
        Si agendaVacunatorio[opcionDia, i] = 0 Entonces
            Escribir i, ". ", horarios[i]
        Sino
            Escribir i, ". Ocupado"
        FinSi
    FinPara
    
    Leer opcionHora
    
    // Verificar si está ocupado
    Si agendaVacunatorio[opcionDia, opcionHora] = 1 Entonces
        Escribir "El horario seleccionado está ocupado. Por favor, elija otro horario."
    Sino
        // Marcar como ocupado
        agendaVacunatorio[opcionDia, opcionHora] = 1
	FinSi
	
    
    //vacunas disponibles
    Escribir "Vacunas disponibles:"
    Para i = 1 Hasta 6 Hacer
        Escribir i, ". ", vacunasPreCargadas[i], " - Stock: ", stockVacunas[i]
    FinPara
    
    Definir opcionVacuna Como Entero
    Escribir "Seleccione una vacuna (1-6): "
    Leer opcionVacuna
    Mientras opcionVacuna < 1 o opcionVacuna > 6 Hacer
        Escribir "Ingrese una opción válida"
        Leer opcionVacuna
    FinMientras
    
    // Verifica si hay stock disponible
    Si stockVacunas[opcionVacuna] > 0 Entonces
        // Restar una vacuna
        stockVacunas[opcionVacuna] = stockVacunas[opcionVacuna] - 1
        
        vacuna[totalPacientes] = vacunasPreCargadas[opcionVacuna]
		
        totalPacientes = totalPacientes + 1
		
        Escribir "¡Turno reservado!"
		Escribir " "
    Sino
        Escribir "No hay stock disponible para la vacuna seleccionada."
    FinSi
FinSubproceso

Subproceso BuscarPacientePorDNI(nombres, edades, dni, fechasNacimiento, vacuna, fechasTurno, totalPacientes Por Referencia, diasSemana, horarios)
    Definir dniBuscado Como Cadena
    Definir encontrado Como Logico
    encontrado = Falso
	
    Escribir "Ingrese el DNI del paciente que desea buscar: "
    Leer dniBuscado
	
    Definir i Como Entero
    i = 1
    
    Mientras i < totalPacientes Y encontrado = Falso Hacer
        Si dni[i] = dniBuscado Entonces
            encontrado <- Verdadero
            Escribir "Nombre: ", nombres[i]
            Escribir "Edad: ", edades[i]
            Escribir "DNI: ", dni[i]
            Escribir "Fecha de Nacimiento: ", fechasNacimiento[i]
            Escribir "Vacuna: ", vacuna[i]
            Escribir "Fecha de Turno: ", horarios[i], "hs del día "// diasSemana[i]
        Sino
            i = i + 1
        FinSi
    FinMientras
	
    Si encontrado = Falso Entonces
        Escribir "No hay registros del paciente con DNI ", dniBuscado
    FinSi
	Escribir ""
FinSubproceso

Subproceso OrdenarYMostrarPacientesPorEdad(nombres, edades, totalPacientes)
    Para i = 1 Hasta totalPacientes - 2 Hacer 
        pos_menor = i
        Para j = i + 1 Hasta totalPacientes - 1 Hacer
            Si edades[j] < edades[pos_menor] Entonces
                pos_menor = j
            FinSi
        FinPara
		
        // Intercambiar edades
        aux1 = edades[i]
        edades[i] = edades[pos_menor]
        edades[pos_menor] = aux1
		
        aux2 = nombres[i]
        nombres[i] = nombres[pos_menor]
        nombres[pos_menor] = aux2
    FinPara
	
	
    // pacientes ordenada por edad
    Para i = 1 Hasta totalPacientes -1 Hacer
        Escribir "Nombre: ", nombres[i]
        Escribir "Edad: ", edades[i]
    FinPara
	Escribir ""
FinSubproceso

Subproceso MostrarAgendaVacunatorio(diasSemana, horarios, agendaVacunatorio)
    Escribir "Agenda del Vacunatorio:"
    Definir i, j Como Entero
	
    Escribir "Días y Horarios disponibles"
	
    // horarios disponibles y ocupados
    Para i = 1 Hasta 5 Hacer
        Escribir diasSemana[i], ""
        Para j = 1 Hasta 8 Hacer
            Si agendaVacunatorio[i, j] = 0 Entonces
                Escribir horarios[j], " (Disponible) "Sin Saltar
            Sino
                Escribir horarios[j], " (Ocupado) "Sin Saltar
            FinSi
        FinPara
		Escribir ""
    FinPara
	Escribir ""
FinSubproceso

Subproceso OrdenarYMostrarPacientesPorVacuna(nombres, edades, vacuna, totalPacientes)
    // pacientes por vacuna
    Para i = 1 Hasta totalPacientes - 2 Hacer
        pos_menor = i
        Para j = i+1 Hasta totalPacientes - 1 Hacer
            Si vacuna[j] < vacuna[pos_menor] Entonces
                pos_menor = j
            FinSi
        FinPara
		
		
        auxVacuna = vacuna[i]
        vacuna[i] = vacuna[pos_menor]
        vacuna[pos_menor] = auxVacuna
		
		
        auxNombre = nombres[i]
        nombres[i] = nombres[pos_menor]
        nombres[pos_menor] = auxNombre
		
		
        auxEdad = edades[i]
        edades[i] = edades[pos_menor]
        edades[pos_menor] = auxEdad
    FinPara
	
    // pacientes ordenados por vacuna
    Para i = 1 Hasta totalPacientes -1 Hacer
        Escribir "Nombre: ", nombres[i]
        Escribir "Edad: ", edades[i]
        Escribir "Vacuna: ", vacuna[i]
		
    FinPara
	Escribir ""
FinSubproceso

Subproceso ContarTurnosPorDia(agendaVacunatorio)
    // turnos otorgados por día
	Definir contadorTurno Como Entero
	
    Para i=1 Hasta 5 Hacer
		contadorTurno=0
		Para j=1 Hasta 8 Hacer
			si agendaVacunatorio[i,j]=1 Entonces
				
				contadorTurno=contadorTurno+1
				
			FinSi
			
		FinPara
		Escribir "El día ", i, " se otorgaron ", contadorTurno, " turnos"
	FinPara
	Escribir " "
FinSubproceso

Subproceso ContarVacunasAplicadasYBuscarIndiceVacuna(nombres, vacuna, totalPacientes, vacunasPreCargadas)
    // contar las vacunas
    Definir cantidadVacunas Como Entero
    Dimension cantidadVacunas[6]
    
    
    Para i = 1 Hasta 6 Hacer
        cantidadVacunas[i] = 0
    FinPara
    
    Para i = 1 Hasta totalPacientes Hacer
        
        tipoVacuna = vacuna[i]
        
        // Encontrar el índice de la vacuna
        indiceVacuna = 0 
        
        Para j = 1 Hasta 6 Hacer
            Si tipoVacuna = vacunasPreCargadas[j] Entonces
                indiceVacuna = j
            FinSi
        FinPara
        
        Si indiceVacuna > 0 Entonces
            // actualiza la cantidad de vacunas
            cantidadVacunas[indiceVacuna] = cantidadVacunas[indiceVacuna] + 1
        FinSi
		
    FinPara
    
    // cantidad de vacunas aplicadas por tipo
    Para i = 1 Hasta 6 Hacer
        Escribir "Vacuna: ", vacunasPreCargadas[i]
        Escribir "Cantidad de vacunas aplicadas: ", cantidadVacunas[i]
    FinPara
	Escribir ""
FinSubproceso