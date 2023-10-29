program Teleferico;

uses crt;
const
	CAPACIDAD_MAX = 60;
	BOLETO_GRAL = 20;
	BOLETO_3RAEDAD_NINOS = 12;
var	

	nombre, cedula, estacion, estacionAnterior, estacionEntrada, estacionSalida: string;

	opcion, opcionTramo: char;
	numeroBoletos, bltosVendidosGeneral, bltosVendidos3raEdadNinos, asientosDisponibles: integer;
	i, contNombre, contCedula, contEstacion: integer;
	nombreValido, cedulaValida, estacionValida, continuar: boolean;

BEGIN
	bltosVendidosGeneral:= 0;
	bltosVendidos3raEdadNinos:= 0;
	asientosDisponibles:= CAPACIDAD_MAX;
	while True do
	begin
		repeat
			clrscr;
			writeln('Teleferico de Merida');
			writeln();
			writeln('---------Menu----------');
			writeln('1. Comprar boletos');
			writeln('2. Ver Sistema');
			writeln('3. Salir');
			opcion:= readkey();
			case opcion of
			'1': begin
				clrscr;
				repeat
					write('Por favor ingrese su nombre y apellido: ');
					readln(nombre);
					nombreValido:= True; 
					for contNombre:= 1 to length(nombre) do // Bucle que pasa por cada caracter de la variable nombre
					begin
						if not (nombre[contNombre] in ['A'..'Z', 'a'..'z', ' ']) then // Verifica que el nombre solo tiene letras y espacios
						begin
							nombreValido:= False; // En caso de que no se cumpla la condición, la variable se le asigan el valor False
							break;                 
						end;
					end;
					if not nombreValido then
					begin
						writeln('Nombre Invalido.'); // Imprime un mensaje de error si la variable tiene el valor False
					end
					else
					begin
						writeln('Bienvenido al teleferico de Merida ', nombre, '!');
					end;
				until nombreValido;
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
					end; //vamos por aqui 
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
					write('Por favor seleccione la estacion en la que desea ingresar: '); // Pide al usuario que ingrese una estación
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
						readln();
					end;     // El bucle se repite hasta que el usuario ingrese una estación válida
					estacionEntrada:= estacion; // Guarda en la variable la estación en la cual entra el usuario
				until (estacion = 'BARINITAS') or (estacion = 'LA MONTANA') or (estacion = 'LA AGUADA') or (estacion = 'LOMA REDONDA') or (estacion = 'PICO ESPEJO');
				Clrscr;
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
							writeln('1. Tramo: Barinitas - La Montana');
							writeln('2. Salir de la estacion'); // salir de la estacion se repite en todas las estaciones 
							readln(opcionTramo);
							case opcionTramo of
							'1': begin
								estacion:= 'LA MONTANA';
							end;
							'2': begin
							    estacionSalida:='BARINITAS';
								Clrscr;
								writeln('Gracias por usar el teleferico de Merida');
								writeln('Por favor vuelva pronto');
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
							writeln('Estacion La Montana');
							writeln();
							writeln('Por favor elija que tramo desea recorrer.');
							writeln('1. Tramo: La Montana - La Aguada'); // Opción de tramo que avanza a la siguiente estación
							writeln('2. Regresar a la estacion anterior'); // Opción de tramo que regresa a la estación anterior
							writeln('3. Salir de la estacion');
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
								writeln('Gracias por usar el teleferico de Merida');
								writeln('Por favor vuelva pronto');
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
								writeln('Gracias por usar el teleferico de Merida');
								writeln('Por favor vuelva pronto');
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
								writeln('Gracias por usar el teleferico de Merida');
								writeln('Por favor vuelva pronto');
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
							readln(opcionTramo);
							case opcionTramo of
							'1': begin
								estacion:= 'LOMA REDONDA';
							end;
							'2': begin
							    estacionSalida:= 'PICO ESPEJO';
								Clrscr;
								writeln('Gracias por usar el teleferico de Merida');
								writeln('Por favor vuelva pronto');
								continuar:= False;
							end
							else
							begin
								writeln('Opcion invalida.');
								readln();
							end;
							end;
						until (opcionTramo = '1')or (opcionTramo = '2');
					end;
					writeln('Estacion de entrada: ', estacionEntrada , ' Estacion de salida: ', estacionSalida);
				end;
				readln();
			end;
			'2': begin
				writeln('PRUEBA 2');
				readln();
			end;
			'3': begin
				writeln('PRUEBA 3');
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
