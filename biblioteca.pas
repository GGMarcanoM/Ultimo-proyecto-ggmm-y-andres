program untitled;

uses crt,sysutils;
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
archivo: text;
persona1: alumno;
contador: integer;
  
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
procedure existearchivo; 

begin
    if (FileExists('alumnos.txt')) then
    begin
     assign(archivo,'alumnos.txt');
        end
        else
        assign(archivo, 'alumnos.txt');
		rewrite(archivo);
		writeln(archivo, 'registro de alumnos');
        close(archivo);
        end;
procedure RegistrarAlumnos;

begin 
  append(archivo); 
  contador := 1;
repeat
    writeln('Ingrese el nombre del alumno:');
    readln(persona1.nombre);
  
    writeln('Ingrese el id del alumno:');
    readln(persona1.id);
    writeln(archivo, 'alumno ', contador, ':');
    writeln(archivo, 'Nombre: ', persona1.nombre);
    writeln(archivo, 'id: ', persona1.id);
    writeln(archivo);
    
    writeln('¿Desea ingresar otro alumno? (S/N)');
    readln(n);
    
    contador := contador + 1; // Incrementa el contador de personas
  until (upcase(n) = 'N');
  
  close(archivo); // Cierra el archivo
  
  writeln('Registros guardados en el archivo "alumnos.txt"');
end;



BEGIN
   existearchivo;
    writeln('Bienvenido al sistema de biblioteca de unimar ');
    writeln('Presione cualquier tecla para continuar...    ');
    readkey;
    repeat
        clrscr;
        writeln('Por favor indique la operacion a realizar:  ');
        writeln('1. alumno   ');
        writeln('2. Prestamos   ');
        writeln('3. Libros      ');
        writeln('4. Salir.     ');
        n:=readkey;
        clrscr;
        case n of
			'1':begin
					 writeln('Por favor indique la operacion a realizar:    ');
				 writeln('1. ingresar nuevos alumnos');
				 writeln('2. modificar datos de alumnos');
				 writeln('3. revisar alumnos sancionados');
				 writeln('0. ir al menu');
				 n:=readkey;
				 clrscr;
				   case n of
					'1':begin
						RegistrarAlumnos;
						end;
					'2':begin
					
						end;
					'3':begin
					
					end;
					'0':begin
					end;
				end;
			end;
			'2':begin
				 writeln('Por favor indique la operacion a realizar:    ');
				 writeln('1. Registrar prestamos');
				 writeln('2. Revisar prestamos activo');
				 writeln('0. ir al menu');
				 n:=readkey;
				 clrscr;
			     case n of
					'1':begin
						
						end;
					'2':begin
					
						end;
					'0':begin
					end;
				end;
			end;
			'3':begin
				writeln('Por favor indique la operacion a realizar:');
				writeln('1. Ingresar nuevo libro');
				writeln('2. libros disponibles');
				 writeln('0. ir al menu');
				n:=readkey;
				clrscr;
					case n of
						'1':begin
						
						end;
						'2':begin
						
						end;
						'0':begin
						end;
					end;
			end;
        end;
	until (n='4');
	
END.
