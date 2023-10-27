program Teleferico;

uses crt;
var	
	nombre, cedula, estacion, tramo: string;
	opcion: char;
	pasajeros: integer;
	precioGeneral, precio3raEdad: real;

BEGIN
	writeln('TELEFERICO DE MERIDA');
	writeln()
	repeat
		writeln('Ingrese la opcion que desee.');
		writeln('1. Comprar boletos');
		writeln('2. Ver Sistema');
		writeln('3. Salir');
		opcion:= readkey();
		case opcion of
		'1': begin
		end;
		'2': begin
		end;
		'3': begin
		end
		else
		begin
			writeln('Opcion Invalida.');
		end;
		end;
	until (opcion = '1') or (opcion = '2') or (opcion = '3');	
END.

