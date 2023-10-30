Algoritmo TPProgramacion1
	Funcion CalcularVentaVuelo(ruta_elegida, num_pasajeros, equipaje)
		Definir capacidad Como Entero
		Definir costos_base Como Real
		Definir limites_incremento Como Entero
		Definir incrementos Como Real
		
		dimension capacidad[1] = 120  // Buenos Aires - Bariloche
		capacidad[2] = 120  // Buenos Aires - Salta
		capacidad[3] = 80   // Rosario - Buenos Aires
		capacidad[4] = 80   // Mar Del Plata - Mendoza
		
		dimension costos_base[1] = 150000  // Buenos Aires - Bariloche
		costos_base[2] = 120000  // Buenos Aires - Salta
		costos_base[3] = 70000   // Rosario - Buenos Aires
		costos_base[4] = 95000   // Mar Del Plata - Mendoza
		
		dimension limites_incremento[1] = 20  // Buenos Aires - Bariloche
		limites_incremento[2] = 20  // Buenos Aires - Salta
		limites_incremento[3] = 10  // Rosario - Buenos Aires
		limites_incremento[4] = 10  // Mar Del Plata - Mendoza
		
		dimension incrementos[1] = 0.10  // Buenos Aires - Bariloche
		incrementos[2] = 0.10  // Buenos Aires - Salta
		incrementos[3] = 0.15  // Rosario - Buenos Aires
		incrementos[4] = 0.15  // Mar Del Plata - Mendoza
		
		Si ruta_elegida < 1 O ruta_elegida > 4 Entonces
			Mostrar "Ruta no válida."
		Fin Si
		
		Si num_pasajeros <= 0 Entonces
			Mostrar "Número de pasajeros no válido."
		Fin Si
		
		Si capacidad[ruta_elegida] < num_pasajeros Entonces
			Mostrar "No hay asientos disponibles para esta ruta."
		Fin Si
		
		costo_base_ruta = costos_base[ruta_elegida]
		limite_incremento_ruta = limites_incremento[ruta_elegida]
		incremento_ruta = incrementos[ruta_elegida]
		
		costo_pasaje = CalcularCostoPasaje(num_pasajeros, costo_base_ruta, limite_incremento_ruta, incremento_ruta)
		
		Si equipaje Entonces
			costo_pasaje = costo_pasaje * 1.05  //recargo por equipaje en bodega
		Fin Si
		
		Mostrar "Resumen del Pasaje:"
		Mostrar "Ruta:", ruta_elegida
		Mostrar "Nombre y Apellido:", ObtenerNombreApellido()
		Mostrar "DNI:", ObtenerDNI()
		Mostrar "Teléfono:", ObtenerTelefono()
		Mostrar "Equipaje en bodega:", equipaje_bodega
		Mostrar "Número pasajero frecuente:", ObtenerNumPasajeroFrecuente()
		Mostrar "Asiento:", ObtenerAsiento(capacidad[ruta_elegida])
		Mostrar "Costo pasaje: $", costo_pasaje
	Fin Funcion
	
	Funcion ObtenerNombreApellido()
		Definir nombre_apellido Como Cadena
		Mientras Verdadero
			Mostrar "Ingrese el nombre y apellido del pasajero: "
			Leer nombre_apellido
			Si nombre_apellido <> "" Entonces
				Escribir nombre_apellido
			Sino
				Mostrar "Nombre y apellido no válido. Debe ingresar un valor no vacío."
			Fin Si
		Fin Mientras
	Fin Funcion
	
	Funcion ObtenerDNI()
		Definir dni Como Entero
		Mientras Verdadero
			Mostrar "Ingrese el número de DNI del pasajero: "
			Leer dni
			Si dni > 11111111 Y dni < 99999999 Entonces
				Escribir dni
			Sino
				Mostrar "Número de DNI no válido. Debe ser mayor a 11111111 y menor a 99999999."
			Fin Si
		Fin Mientras
	Fin Funcion
	
	Funcion ObtenerNumPasajeroFrecuente()
		Definir num_pasajero_frecuente Como Entero
		Mientras num_pasajero_frecuente = 0
			Mostrar "Ingrese el número de pasajero frecuente: "
			Leer num_pasajero_frecuente
		Fin Mientras
		Escribir num_pasajero_frecuente
	Fin Funcion
	
	Funcion ObtenerAsiento(capacidad)
		Definir asiento Como Entero
		Mientras Verdadero
			Mostrar "Ingrese el número de asiento (1-", capacidad, "): "
			Leer asiento
			Si asiento >= 1 Y asiento <= capacidad Entonces
				Escribir asiento
			Sino
				Mostrar "Número de asiento no válido. Debe estar entre 1 y ", capacidad;
			Fin Si
		Fin Mientras
	Fin Funcion
	
	Funcion CalcularCostoPasaje(num_pasajeros, costo_base_ruta, limite_incremento_ruta, incremento_ruta)
		Si num_pasajeros <= limite_incremento_ruta Entonces
			costo_pasaje = num_pasajeros * costo_base_ruta
		Sino
			costo_pasaje = limite_incremento_ruta * costo_base_ruta
			costo_pasaje = costo_pasaje + (num_pasajeros - limite_incremento_ruta) * costo_base_ruta * incremento_ruta
		Fin Si
		Escribir costo_pasaje
	Fin Funcion
	
FinAlgoritmo
