program Teleferico;

uses crt;
const
	CAPACIDAD_MAX = 60;
	BOLETO_GRAL = 20;
	BOLETO_3RAEDAD_NINOS = 12;
var	
	nombre, cedula, estacion, tramo: string;
	opcion: char;
	numeroBoletos, bltosVendidosGeneral, bltosVendidos3raEdadNinos, asientosDisponibles: integer;
	contMayus, contNombre, contCedula: integer;
	nombreValido, cedulaValida: boolean;
	precioGeneral, precio3raEdad: real;

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
			writeln('Ingrese la opcion que desee.');
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
					for contMayus:= 1 to length(nombre) do
				
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
						writeln('Bienvenido al telferico de Merida ', nombre, '!');
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
					end;
				until cedulaValida;
				// vamos por aquí
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

