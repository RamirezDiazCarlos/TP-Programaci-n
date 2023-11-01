Algoritmo TPM
	Definir opciones, dni, telefono, num_pasajeros, capacidad,contCapacidad1, ruta_elegida Como Entero
	Definir nombre_apellido Como Caracter
	Definir costos_base Como Real
	contCapacidad1 = 0
	Dimension capacidad[4]
	capacidad[0] = 120 // Buenos Aires - Bariloche
	capacidad[1] = 120 // Buenos Aires - Salta
	capacidad[2] = 80 // Rosario - Buenos Aires
	capacidad[3] = 80 // Mar Del Plata  - Mendoza
	Dimension  costos_base[4] 
	costos_base[0] = 150000 // Buenos Aires - Bariloche
	costos_base[1] = 120000 // Buenos Aires - Salta
	costos_base[2] = 70000 // Rosario - Buenos Aires
	costos_base[3] = 95000 // Mar del Plata - Mendoza
	Dimension  limites_incremento[4]
	limites_incremento[0] = 20 // Buenos Aires - Bariloche
	limites_incremento[1] = 20 // Buenos Aires - Salta
	limites_incremento[2] = 10 // Rosario - Buenos Aires
	limites_incremento[3] = 10 // Mar del Plata - Mendoza
	Dimension limites_incremento2[4]
	limites_incremento2[0] = 60 // Buenos Aires - Bariloche
	limites_incremento2[1] = 60 // Buenos Aires - Salta
	limites_incremento2[2] = 40 // Rosario - Buenos Aires
	limites_incremento2[3] = 40 // Mar del Plata - Mendoza
	Repetir
	Escribir "Bienvenidos, por favor ingrese la opcion que desea realizar: "
	Escribir "1. Venta pasaje"
	Escribir "2. Buscar pasaje vendido"
	Escribir "3. Buscar pasajero"
	Escribir "4. Ordenar y mostrar lista pasajeros"
	Escribir "5. Listado/s"
	Leer opciones
	Segun opciones Hacer
		Opcion 1:
				Escribir "Seleccione la ruta aérea a comprar: "
				Escribir "1. Buenos Aires - Bariloche"
				Escribir "2. Bueno Aires - Salta"
				Escribir "3. Rosario - Buenos Aires"
				Escribir "4. Mar Del Plata - Mendoza"
			Repetir	
				Leer ruta_elegida
				validar_ruta(ruta_elegida);
			Mientras Que ruta_elegida < 1 o ruta_elegida > 4
			Segun ruta_elegida Hacer
				Opcion 1:
					contCapacidad1 = contCapacidad1 + 1
					Si capacidad[0] >=  contCapacidad1 Entonces
						Mostrar "Hay plazas disponibles."
					SiNo
						Mostrar "No hay plazas disponibles."
					Fin Si
					Escribir "Ingrese nombre y apellido del pasajero:"
					Leer nombre_apellido
					obtener_nombre_apellido(nombre_apellido)
				    obtener_dni;
					obtener_num_telefono;
					obtener_equipaje_bodega;
					obtener_num_pasajero_frecuente;
					costo_base_ruta = costos_base[ruta_elegida]
					limite_incremento_ruta = limites_incremento[ruta_elegida]
					limite_incremento_ruta2 = limites_ incremento2[ruta_elegida]
					incremento_ruta = incrementos[ruta_elegida]
					costo_pasaje = CalcularCostoPasaje(num_pasajeros, costo_base_ruta, limite_incremento_ruta, incremento_ruta)
				Opcion 2:
					
				Opcion 3:
					
				Opcion 4:
					
			FinSegun
	FinSegun
	Mientras Que opciones <> 0
FinAlgoritmo


Funcion validar_num_pasajero
	Si num_pasajeros <= 0 Entonces
		Mostrar "Número de pasajeros no válido."
	Fin Si
FinFuncion

Funcion validar_ruta(num)
	Si num < 1 O num > 4 Entonces
		Mostrar "Ruta no válida."
	Fin Si
FinFuncion

SubProceso obtener_nombre_apellido(nombre_apellido)
	
	Mientras nombre_apellido = "" Hacer
		Si nombre_apellido = "" Entonces
			Mostrar "Nombre y apellido no válido. Debe ingresar un valor no vacío."			
		Fin Si
	Fin Mientras
FinSubProceso

SubProceso  obtener_dni
	Definir dni Como Entero
	Repetir 
		Mostrar "Ingrese el número de DNI del pasajero: "
		Leer dni
		Si dni < 11111111 o dni > 99999999 entonces
			Mostrar "Número de DNI no válido."
		Fin Si
	Mientras Que dni < 11111111 o dni > 99999999
FinSubProceso

SubProceso  obtener_num_pasajero_frecuente
	Definir num_pasajero_frecuente Como Entero
	Mientras num_pasajero_frecuente = 0
		Mostrar "Ingrese el número de pasajero frecuente: "
		Leer num_pasajero_frecuente
	Fin Mientras
FinSubProceso

SubProceso obtener_num_telefono
	Definir num_telefono Como Entero
	Repetir
		Escribir "Ingrese un telefono de contacto: "
		Leer num_telefono
		Si num_telefono < 99999999 o num_telefono > 9999999999 Entonces
			Escribir "Número de telefono inválido."
		FinSi
	Mientras Que num_telefono < 99999999 o num_telefono > 9999999999
	Mientras num_telefono = 0 Hacer
		
	FinMientras
FinSubProceso

SubProceso obtener_equipaje_bodega
	Definir equipaje Como Entero
	Repetir
		Escribir "Equipaje en bodega 1:Si - 2:No "
		Leer equipaje
		Si equipaje = 1 Entonces
			Escribir "Verdadero"
		SiNo
			Escribir "Falso"
		FinSi
	Mientras Que equipaje < 1 o equipaje > 2
FinSubProceso

Función calcular_costo_pasaje(contCapacidad1, costo_base_ruta, limite_incremento_ruta, incremento_ruta)
si equipaje = 1 Entonces
	costo_pasaje = costo_base_ruta * 0.05
SiNo
	costo_pasaje = costo_base_ruta
FinSi
Si contCapacidad1 <= limite_incremento_ruta Entonces
		costo_pasaje = costo_pasaje  
	Sino
		Si contCapacidad1 > limite_incremento_ruta O contCapacidad1 < limite_incremento_ruta_2 Entonces
			costo_pasaje = costo_base_ruta *
		FinSi
		costo_pasaje = limite_incremento_ruta * costo_base_ruta
		costo_pasaje = costo_pasaje + (contCapacidad1 - limite_incremento_ruta) * costo_base_ruta * incremento_ruta 
	Fin Si
	Escribir costo_pasaje
FinFuncion

