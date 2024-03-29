program Bibliotecaunimar;

uses crt;
type
alumno=record
nombre:string;
id:string;
end;
libro=record
id:string;
nombre:string;
end;
var 
n:char;
alumnos : text;
function valID(s: string): boolean;
var i: integer;
begin
    valID:=true;
    if (s='') then
    begin
        valID:=false;
        exit;
    end;
    for i:=1 to length(s) do
    begin
        if not (s[i] in ['0'..'9']) then
        begin
            valID:=false;
            exit;
        end;
    end;
end;
BEGIN
    
    writeln('|Bienvenido al sistema de biblioteca de unimar|');
    writeln('Presione cualquier tecla para continuar...    ');
    readkey;
    repeat
        clrscr;
        writeln('Por favor indique la operacion a realizar:  ');
        writeln('1. Registrar nuevo alumno   ');
        writeln('2. Prestamos   ');
        writeln('3. Libros      ');
        writeln('0. Salir.     ');
        n:=readkey;
        case n of
			'1':begin
			begin
			assign(alumnos, 'alumnos.txt');
			rewrite(alumnos);
			writeln(alumnos, 'hola');
			writeln(alumnos, 'secso');
			close(alumnos);
			end;
			end;
			'2':begin
				clrscr;
				 writeln('Por favor indique la operacion a realizar:    ');
				 writeln('1. Registrar prestamos');
				 writeln('2. Revisar prestamos activo');
				 n:=readkey;
			     case n of
					'1':begin
						
						end;
					'2':begin
					
						end;
						
				end;
			end;
			'3':begin
				clrscr;
				writeln('Por favor indique la operacion a realizar:');
				writeln('1. Ingresar nuevo libro');
				writeln('2. libros disponibles');
				n:=readkey;
					case n of
						'1':begin
						
						end;
						'2':begin
						
						end;
					end;
			end;
        end;
	until (n='0');
	writeln('Gracias por usar la biblioteca de la unimar, vuelva pronto!');
END.
