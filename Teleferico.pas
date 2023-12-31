program Teleferico;

uses crt;
const
	CAPACIDAD_MAX = 60;
var	
	nombre, apellido, cedula, estacion, estacionAnterior, estacionEntrada, estacionSalida: string;
	nroEntrada, nroMayores, nroMenores, opcionEntrada, edadEntrada: string;
	opcion, opcionTramo: char;
	numeroBoletos, bltosGeneral, bltos3Edad, asientosDisponibles, bltosMenores, errorEntrada, bltosRest, edadMenores: integer; 
	totalBltos, totalAcumulado, totalBltosGral, totalBltos3Edad, totalBltos3a12, totalBltosMenor3: integer;
	i, j, k, contApellido, contNombre, contCedula, contEstacion, cont3a12, contMenor3, contVentas: integer;
	totalGeneral, total3Edad, totalMenores, total, ventasGral, ventas3Edad, ventas3a12, ventasTotal: real;
	nombreValido, cedulaValida, estacionValida, continuar, apellidoValido: boolean;

BEGIN
	asientosDisponibles:= CAPACIDAD_MAX;
	contVentas:= 0;
	// Se inicializan varibales para registrar el número de boletos vendidos de cada tipo
	totalAcumulado:= 0;
	totalBltosGral:= 0;
	totalBltos3Edad:= 0;
	totalBltos3a12:= 0;
	totalBltosMenor3:= 0;
	// Se inicializan varibales para almacenar el total de ventas de cada tipo de boleto
	ventasGral:= 0;
	ventas3Edad:= 0;
	ventas3a12:= 0;
	ventasTotal:= 0;
	
	while True do
	begin
		repeat
			clrscr;
			writeln('Teleferico de Merida');
			writeln();
			writeln('|---------Menu----------|');
			writeln('|-----------------------|');
			writeln('|1. Comprar boletos     |');
			writeln('|2. Ver Sistema         |');
			writeln('|3. Salir               |');
			writeln('|-----------------------|');
			readln(opcion);
			case opcion of
			'1': begin
				clrscr;
				repeat
					write('Por favor ingrese su nombre: ');
					readln(nombre);
					nombreValido:= True; 
					for contNombre:= 1 to length(nombre) do // Bucle que pasa por cada caracter de la variable nombre
					begin
						if not (nombre[contNombre] in ['A'..'Z', 'a'..'z']) then // Verifica que el nombre solo tiene letras y espacios
						begin
							nombreValido:= False; // En caso de que no se cumpla la condición, la variable se le asigan el valor False
							break;                 
						end;
					end;
					if not nombreValido then
					begin
						writeln('Nombre invalido.'); // Imprime un mensaje de error si la variable tiene el valor False
					end;
				until nombreValido;
				
				repeat
					write('Por favor ingrese su apellido: '); 
					readln(apellido);
					apellidoValido:= True; 
					for contApellido:= 1 to length(apellido) do // Bucle que pasa por cada caracter de la variable nombre
					begin
						if not (apellido[contApellido] in ['A'..'Z', 'a'..'z']) then // Verifica que el nombre solo tiene letras y espacios
						begin
							apellidoValido:= False; // En caso de que no se cumpla la condición, la variable se le asigan el valor False
							break;                 
						end;
					end;
					if not apellidoValido then
					begin
						writeln('Apellido invalido.'); // Imprime un mensaje de error si la variable tiene el valor False
					end
					else
					begin
						writeln('!Bienvenido al teleferico de Merida ', nombre, ' ', apellido, '!'); 
						writeln();
					end;
				until apellidoValido;
				
				repeat
					write('Por favor ingrese su cedula: ');
					readln(cedula);
					cedulaValida:= True;
					for contCedula:= 1 to length(cedula) do
					begin
						if not (cedula[contCedula] in ['0'..'9', '.']) then // Verifica que la cédula solo contenga números y puntos
						begin
							cedulaValida:= False;
							break;
						end;
					end;
					if not cedulaValida then
					begin
						writeln('Identificacion Invalida.'); 
					end; 
				until cedulaValida;
				
				clrscr;
				writeln('El teleferico de Merida esta dividido en las siguientes 5 estaciones y 4 tramos:');
				writeln();
				writeln('|-------------------------|'); // Imprime la lista de estaciones
				writeln('|-------Estaciones--------|');
				writeln('|-------------------------|');
				writeln('| - Barinitas             |');
				writeln('| - La Montana            |');
				writeln('| - La Aguada             |');
				writeln('| - Loma Redonda          |');
				writeln('| - Pico Espejo           |');
				writeln('|-------------------------|');
				gotoxy(30, 3);
				writeln('|------------------------------|');  // Imprime la lista de tramos
				gotoxy(30, 4);
				writeln('|------------Tramos------------|');
				gotoxy(30, 5);
				writeln('|------------------------------|');
				gotoxy(30, 6);
				writeln('| - Barinitas - La Montana     |');
				gotoxy(30, 7);
				writeln('| - La Montana - La Aguada     |');
				gotoxy(30, 8);
				writeln('| - La Aguada - Loma Redonda   |');
				gotoxy(30, 9);
				writeln('| - Loma Redonda - Pico Espejo |');
				gotoxy(30, 10);
				writeln('|------------------------------|');
				writeln();
				writeln();
				
				repeat
					write('Por favor ingrese la estacion en la que desea entrar: '); // Pide al usuario que ingrese una estación
					readln(estacion);
					for i:= 1 to length(estacion) do  // Este bucle convierte la entrada a mayúsculas
					begin
						estacion[i]:= UpCase(estacion[i]);
					end;
					estacionValida:= True;
					for contEstacion:= 1 to length(estacion) do  // Bucle para verificar si la entrada es válida
					begin
						if not (estacion[contEstacion] in ['A'..'Z', ' ']) then // La condición no maneja la letra 'ñ' o 'Ñ'
						begin
							estacionValida:= False;
							break;
						end;
					end;            // Si la entrada no es válida o el usuario no ingresa una de las estaciones en la lista, se imprime un mensaje de error
					if not estacionValida or (estacion <> 'BARINITAS') and (estacion <> 'LA MONTANA') and (estacion <> 'LA AGUADA') and (estacion <> 'LOMA REDONDA') and (estacion <> 'PICO ESPEJO') then
					begin
						writeln('La estacion que ha ingresado no es valida.');
					end
					else
					begin
						writeln('Ha seleccionado la estacion ', estacion); // Si la entrada es válida se imprime un mensaje de confirmación
						write('Continuar...');
						readln();
					end;     // El bucle se repite hasta que el usuario ingrese una estación válida
					estacionEntrada:= estacion; // Guarda en la variable la estación en la cual entra el usuario
				until (estacion = 'BARINITAS') or (estacion = 'LA MONTANA') or (estacion = 'LA AGUADA') or (estacion = 'LOMA REDONDA') or (estacion = 'PICO ESPEJO');
				
				continuar:= True; // Inicializa la variable que controla el bucle de los tramos
				
				while continuar do // El bucle se repite hasta que el usuario decida salir del teleférico
				begin
					if (estacion = 'BARINITAS') then  // Si el usuario elige la estación Barinitas, puede elegir el tramo que avanza a la siguiente estación o salir del teleférico
					begin
						repeat  // Se repite hasta que el usuario elija una opción válida
							Clrscr;
							writeln('Estacion Barinitas');
							writeln();
							writeln('Elija la opcion que desee.');
							writeln('1. Tramo: Barinitas - La Montaña');
							writeln('2. Salir de la estacion'); // salir de la estacion se repite en todas las estaciones 
							writeln();
							readln(opcionTramo);
							case opcionTramo of
							'1': begin
								estacion:= 'LA MONTANA';
							end;
							'2': begin
							    estacionSalida:='BARINITAS';
								Clrscr;
								writeln('Ruta recorrida---->');
								writeln();
								continuar:= False;  // Se le asigna nuevo valor a la variable para salir del bucle y volver al menú del programa
							end
							else
							begin
								writeln('Opcion invalida.');
								readln();
							end;
							end;
						until (opcionTramo = '1') or (opcionTramo = '2');
					end;
					if (estacion = 'LA MONTANA') then // Desde esta estación el usuario puede elegir entre dos tramos
					begin   
						repeat
							estacionAnterior:= 'BARINITAS'; // Asigna el nombre de la estación anterior a la variable
							Clrscr;
							writeln('Estacion La Montaña');
							writeln();
							writeln('Por favor elija que tramo desea recorrer.');
							writeln('1. Tramo: La Montaña - La Aguada'); // Opción de tramo que avanza a la siguiente estación
							writeln('2. Regresar a la estacion anterior'); // Opción de tramo que regresa a la estación anterior
							writeln('3. Salir de la estacion');
							writeln();
							readln(opcionTramo);
							case opcionTramo of
							'1': begin
								estacion:= 'LA AGUADA';
							end;
							'2': begin
								estacion:= estacionAnterior;
							end;
							'3': begin
							    estacionSalida:='LA MONTANA'; 
								Clrscr;
								writeln('Ruta recorrida---->');
								writeln();
								continuar:= False;
							end
							else
							begin
								writeln('Opcion invalida.');
								readln();
							end;
							end;
						until (opcionTramo = '1') or (opcionTramo = '2') or (opcionTramo = '3');
					end;
					if (estacion = 'LA AGUADA') then 
					begin 
						repeat
							Clrscr;
							writeln('Estacion La Aguada');
							writeln();
							writeln('Por favor elija que tramo desea recorrer.');
							writeln('1. Tramo: La Aguada - Loma Redonda');
							writeln('2. Regresar a la estacion anterior');
							writeln('3. Salir de la estacion');
							writeln();
							readln(opcionTramo);
							case opcionTramo of
							'1': begin
								estacion:= 'LOMA REDONDA';
							end;
							'2': begin
								estacion:= 'LA MONTANA';
							end;
							'3': begin
							    estacionSalida:='LA AGUADA';
								Clrscr;
								writeln('Ruta recorrida---->');
								writeln();
								continuar:= False;
							end
							else
							begin
								writeln('Opcion invalida.');
								readln();
							end;
							end;
						until (opcionTramo = '1') or (opcionTramo = '2') or (opcionTramo = '3');
					end;
					if (estacion = 'LOMA REDONDA') then
					begin  
						repeat
							Clrscr;
							writeln('Estacion Loma Redonda');
							writeln();
							writeln('Por favor elija que tramo desea recorrer.');
							writeln('1. Tramo: Loma Redonda - Pico Espejo');
							writeln('2. Regresar a la estacion anterior');
							writeln('3. Salir de la estacion');
							writeln();
							readln(opcionTramo);
							case opcionTramo of
							'1': begin
								estacion:= 'PICO ESPEJO';
							end;
							'2': begin
								estacion:= 'LA AGUADA';
							end;
							'3': begin
							    estacionSalida:='LOMA REDONDA';
								Clrscr;
								writeln('Ruta recorrida---->');
								writeln();
								continuar:= False;
							end
							else
							begin
								writeln('Opcion invalida.');
								readln();
							end;
							end;
						until (opcionTramo = '1') or (opcionTramo = '2') or (opcionTramo = '3');
					end;
					if ( estacion = 'PICO ESPEJO') then
					begin
						repeat
							Clrscr;
							writeln('Estacion Pico Espejo');
							writeln();
							writeln('1. Regresar a la estacion anterior'); // En esta estación el usuario solo puede usar el tramo que conduce a la estación anterior
							writeln('2. Salir de la estacion');
							writeln();
							readln(opcionTramo);
							case opcionTramo of
							'1': begin
								estacion:= 'LOMA REDONDA';
							end;
							'2': begin
							    estacionSalida:= 'PICO ESPEJO';
								Clrscr;
								writeln('Ruta recorrida---->');
								writeln();
								continuar:= False;
							end
							else
							begin
								writeln('Opcion invalida.');
								readln();
							end;
							end;
						until (opcionTramo = '1') or (opcionTramo = '2');
					end;
				end; 
				gotoxy(21, 1);
				writeln('Estacion de entrada: ', estacionEntrada);
				gotoxy(21, 2);
				writeln('Estacion de salida: ', estacionSalida);
				readln();
				
				Clrscr;
				writeln('Asientos Disponibles para este viaje: ', asientosDisponibles);
				write('Presione enter para continuar. '); // Imprime el número de asientos que quedan antes de cada viaje
				readln();
				if (asientosDisponibles = 0) then // Si no quedan asientos disponibles imprime un mensaje diciéndole al usuario que no puede ingresar en el viaje
			    begin
					writeln('Este viaje ya no cuenta con mas asientos disponibles, por favor espere por el siguiente viaje.');
					readln();
			    end
				else
				begin
					repeat
						cont3a12:= 0; // Contador para niños entre 3 y 12 años
						contMenor3:= 0; // Contador para niños menores a 3 años
						bltos3Edad:= 0;
						Clrscr;
						writeln('Cuantos boletos desea comprar?');
						readln(nroEntrada);
						Val(nroEntrada, numeroBoletos, errorEntrada); // Intenta convertir la entrada del usuario a un número entero
						if (errorEntrada <> 0) or ((numeroBoletos < 1) or (numeroBoletos > asientosDisponibles)) then // Si la entrada no es un número o el número es menor a 1 o mayor a 60, imprime un mensaje de error
						begin
							writeln('Entrada invalida.');
							readln();
							Clrscr;
							errorEntrada:= 1;
						end;
					until (errorEntrada = 0) and ((numeroBoletos >= 1) and (numeroBoletos <= asientosDisponibles)); // Repite el bucle hasta que el usuario ingrese un número entre 1 y 60
					
					bltosRest:= numeroBoletos;
					bltosGeneral:= numeroBoletos;
					asientosDisponibles:= asientosDisponibles - numeroBoletos;
				   
					repeat
						writeln('Va a viajar con adultos de la 3ra Edad y/o niños? (s/n)');
						readln(opcionEntrada);
						for j:= 1 to length(opcionEntrada) do
						begin
							opcionEntrada[j]:= UpCase(opcionEntrada[j]); // Convierte la entrada en mayúsculas
						end;
						if (opcionEntrada <> 'S') and (opcionEntrada <> 'N') and (opcionEntrada <> 'SI') and (opcionEntrada <> 'NO') then // Se verifica si la entrada es válida
						begin
							writeln('Opcion invalida.');
							readln();
							Clrscr;
						end;
					until (opcionEntrada = 'S') or (opcionEntrada = 'N') or (opcionEntrada = 'SI') or (opcionEntrada = 'NO'); // El bucle se repite hasta que la entrada sea válida
					
					if (opcionEntrada = 'S') or (opcionEntrada = 'SI') then // Si la entrada del usuario es 's' o 'si' procede a preguntar por el número de adultos mayores y niños 
					begin
						repeat
							Clrscr;
							write('Cuantos adultos de tercera edad van a viajar? ');
							readln(nroMayores);
							Val(nroMayores, bltos3Edad, errorEntrada); // Convierte la entrada a un entero pata verificar si la entrada es un número
							if (errorEntrada <> 0) or (bltos3Edad > numeroBoletos) or (bltos3Edad < 0) then // Si la entrada no es un número o el número es mayor al número de boletos que el usuario ingresó antes, o es negativo se imprime un error
							begin
								writeln('Entrada invalida.');
								readln();
								errorEntrada:= 1;
							end;
						until (errorEntrada = 0) and ((bltos3Edad >= 0) and (bltos3Edad <= numeroBoletos)); // El bucle se repite hasta que se ingrese un número válido
						
						bltosRest:= numeroBoletos - bltos3Edad; // Se actualiza variable para limitar el numero de entradas de niños que puede ingresar el usuario
						
						repeat
							Clrscr;
							write('Cuantos niños van a viajar? ');
							readln(nroMenores);
							Val(nroMenores, bltosMenores, errorEntrada); 
							if (errorEntrada <> 0) or ((bltosMenores > bltosRest) or (bltosMenores < 0 )) then // Verifica que el número de niños no sea mayor al número de boletos restantes
							begin
								writeln('Entrada invalida.');
								readln();
								errorEntrada:= 1;
							end;
						until (errorEntrada = 0) and ((bltosMenores >= 0) and (bltosMenores <= bltosRest));
						bltosGeneral:= bltosGeneral - bltos3Edad - bltosMenores;
						
						if (bltosMenores > 0) then // Si hay niños entonces se verifican las edades de los niños que vana viajar
						begin
							for k:= 1 to bltosMenores do // El bucle le pide al usuario la edad de cada niño 
							begin
								repeat
									Clrscr;
									write('Ingrese la edad del niño ', k, ': ');
									readln(edadEntrada);
									Val(edadEntrada, edadMenores, errorEntrada);
									if (errorEntrada <> 0) or ((edadMenores < 0) or (edadMenores > 12)) then // Verifica que la entrada del usuario sea un número y además sea positivo y no mayor de 12
									begin
										writeln('Edad invalida.');
										readln();
										errorEntrada:= 1;
									end;
								until (errorEntrada = 0) and ((edadMenores >= 3) and (edadMenores <= 12) or (edadMenores < 3));
								if (edadMenores >= 3) and (edadMenores <= 12) then
								begin
									cont3a12:= cont3a12 + 1; // Incrementa el contador por cada niño entre 3 y 12 años
								end
								else if (edadMenores < 3) then
								begin
									contMenor3:= contMenor3 + 1; // Incrementa el contador por cada niño menor a 3 años
								end;
							end;
						end;
					end;
					contVentas:= contVentas + 1;
					totalBltos:= bltosGeneral + bltos3Edad + cont3a12 + contMenor3;
					totalGeneral:= bltosGeneral * 20;
					total3Edad:= bltos3Edad * 12;
					totalMenores:= cont3a12 * 12;
					total:= totalGeneral + total3Edad + totalMenores;
					Clrscr;
					// Se imprimen la cantidad de boletos de cada tipo y el total a pagar de cada boleto por el usuario
					writeln('-------------------FACTURA------------------------');
					writeln('--------------------------------------------------');
					writeln();
					writeln('Nombre: ', nombre, ' ', apellido);
					writeln('Cedula: ', cedula);
					writeln();
					writeln('--------------------------------------------------');
					writeln('Boletos Generales-----------------------', bltosGeneral, 'x20$');
					writeln('Costo-----------------------------------', totalGeneral:0:2, '$');
					writeln();
					writeln('Boletos de 3ra Edad---------------------', bltos3Edad, 'x12$');
					writeln('Costo-----------------------------------', total3Edad:0:2, '$');
					writeln();
					writeln('Boletos de Niños-----------------------', bltosMenores);
					writeln('Boletos de niños entre 3-12 años------', cont3a12, 'x12$');
					writeln('Costo-----------------------------------', totalMenores:0:2, '$');
					writeln();
					writeln('Boletos de niños menores de 3 años----', contMenor3, 'x0$');
					writeln('Costo-----------------------------------0.00$'); 
					writeln();
					writeln('-------------------------------------------------');
					writeln('Total a pagar---------------------------', total:0:2, '$');
					readln();
				end;
				// Se calcula el número de boletos vendidos de cada tipo y se actualiza cada vez que se compren más boletos
				totalAcumulado:= totalAcumulado + totalBltos; 
				totalBltosGral:= totalBltosGral + bltosGeneral;
				totalBltos3Edad:= totalBltos3Edad + bltos3Edad;
				totalBltos3a12:= totalBltos3a12 + cont3a12;
				totalBltosMenor3:= totalBltosMenor3 + contMenor3;
				// Se calculan las ventas totales para cada tipo de boleto y y las ventas totales
				ventasGral:= ventasGral + totalGeneral;
				ventas3Edad:= ventas3Edad + total3Edad;
				ventas3a12:= ventas3a12 + totalMenores;
				ventasTotal:= ventasTotal + total;
			end;
			'2': begin
				Clrscr;
				// Se imprimen el número de boletos que se han vendido de cada tipo y en total
				writeln('--------------------------------------');
				writeln('---------Control de Boletos-----------');
				writeln('--------------------------------------');
				writeln('Total de boletos vendidos: ', totalAcumulado);
				writeln('Boletos Generales vendidos: ', totalBltosGral);
				writeln('Boletos de 3ra Edad vendidos: ', totalBltos3Edad);
				writeln('Boletos de niños vendidos: ', totalBltos3a12);
				writeln('Boletos de menores exonerados: ', totalBltosMenor3);
				writeln();
				// Se imprime el número de asientos disponibles para el viaje
				writeln('--------------------------------------');
				writeln('Asientos Disponibles: ', asientosDisponibles);
				writeln('--------------------------------------');
				// Se imprimen las ventas generadas por cada tipo de boletos comprado y el total de todas las ventas
				writeln();
				writeln('--------------------------------------');
				writeln('------Reporte de Ventas del Dia-------');
				writeln('--------------------------------------');
				writeln('Ventas realizadas: ', contVentas);
				writeln('Ventas de Boletos Generales: ', ventasGral:0:2);
				writeln('Ventas de Boletos de 3ra Edad: ', ventas3Edad:0:2);
				writeln('Ventas de Boletos de Niños: ', ventas3a12:0:2);
				writeln('Ventas Totales: ', ventasTotal:0:2);
				readln();
			end;
			'3': begin
				Clrscr;
				writeln('SALIENDO DEL SISTEMA DEL TELEFERICO DE MERIDA');
				write('Presione la tecla enter para salir. ');
				readln();
				exit();
			end
			else
			begin
				writeln('Opcion Invalida.');
				readln();
			end;
			end;
		until (opcion = '1') or (opcion = '2') or (opcion = '3');	
	end;
END.
