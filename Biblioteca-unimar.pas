program bibliotecaunimar;

uses crt,sysutils;

type                //registro de informacion de los estudiantes
alumno=record
nombre:string;
apellido:string;
id:string;
end;

libro=record  		//registro de informacion de los libros
id:string;
nombre:string;
end;

prestamos=record 	//registro de informacion de los prestamos
id:string;
nombredelibro:string;
end;

var 				//variables
linea:string;		
n:char;
archivo,archivo1,archivo2: text;			//archivos de texto de alumnos, libros y prestamos
persona3:prestamos;							//ruta de prestamos
persona2:libro;								//ruta de libro	
persona1: alumno;							//ruta de alumnos
contador,contador1,contador2,i: integer;

function valnombre(word: String): Boolean;		//validacion de nombre de nombre,  solo letras, sin espacios
begin
  if (word='') then
    begin
        valnombre:=false;
        exit;
    end;
begin
  valnombre := True;
  for i := 1 to Length(word) do
  begin
    if not (UpCase(word[i]) in ['A'..'Z']) then
    begin
      valnombre := False;
      Break;
    end;
  end;
end;
end;

function valID(s: String): Boolean;		//validacion de id
begin
   if (s='') then
    begin
        valID:=false;
        exit;
    end;
begin
  valID := True;
  for i := 1 to Length(s) do
  begin
    if not (s[i] in ['0'..'9']) then
    begin
      valID := False;
      Break;
    end;
  end;
end;
end;

procedure existearchivo; //revisa si existe el archivo de alumnos, si no existe lo crea
begin
    if not (FileExists('alumnos.txt')) then
    begin
		assign(archivo, 'alumnos.txt');
		rewrite(archivo);
		writeln(archivo, 'registro de alumnos');
        close(archivo);
        end
        else
        assign(archivo, 'alumnos.txt');
        end;
        
procedure existearchivo1; 			//revisa si existe el archivo de libros, si no existe lo crea
begin
    if not (FileExists('libros.txt')) then
    begin
		assign(archivo1, 'libros.txt');
		rewrite(archivo1);
		writeln(archivo1, 'registro de libros');
        close(archivo1);
        end
        else
        assign(archivo1, 'libros.txt');
        end;

procedure existearchivo2; 		//revisa si existe el archivo de prestamos, si no lo crea
begin
    if not (FileExists('prestamos.txt')) then
    begin
		assign(archivo2, 'prestamos.txt');
		rewrite(archivo2);
		writeln(archivo2, 'registro de prestamos');
        close(archivo2);
        end
        else
        assign(archivo2, 'prestamos.txt');
        end;
        
procedure RegistrarAlumnos;				//lee los datos del alumno y los guarda en el archivo
begin 
  append(archivo); 
  contador := 1;
repeat
	repeat
	clrscr;
    writeln('Ingrese el nombre del alumno:');
    readln(persona1.nombre);
    if not valnombre(persona1.nombre) then
    writeln('dato ingresado no valido');
    delay(1500);
    until valnombre(persona1.nombre);
    repeat
    clrscr;
    writeln('Ingrese el apellido del alumno:');
    readln(persona1.apellido);
    if not valnombre(persona1.apellido) then
    writeln('dato ingresado no valido');
    delay(1500);
    until valnombre(persona1.apellido);
    repeat
    clrscr;
    writeln('Ingrese la cedula del alumno:');
    readln(persona1.id);
    if not valID(persona1.id) then
    writeln('dato ingresado no valido');
    delay(1500);
    until valID(persona1.id);
    writeln(archivo, 'Nombre: ', persona1.nombre);
    writeln(archivo, 'Apellido: ',persona1.apellido);
    writeln(archivo, 'cedula: ', persona1.id);
    writeln(archivo);
    writeln('¿Desea ingresar otro alumno? (S/N)');
    readln(n);
  until (upcase(n) = 'N');
  close(archivo); // Cierra el archivo
  writeln('Registros guardados en el archivo "alumnos.txt"');
end;

procedure leer; 		//lee el archivo de alumno para leerlo
begin
 reset( archivo );                
    while not eof( archivo) do
    begin
        readLn( archivo, linea );    
        writeLn( linea );  
    end;
    readkey;
    close( archivo );   
    end;
    
procedure leer2;		//lo mismo de arriba pero para libro
begin
 reset( archivo2 );                
    while not eof( archivo2) do
    begin
        readLn( archivo2, linea );    
        writeLn( linea );  
    end;
    readkey;
    close( archivo2 );   
    end;
    
    procedure leer1; //lo mismo mismo pero con prestamos
begin
 reset( archivo1 );                
    while not eof( archivo1) do
    begin
        readLn( archivo1, linea );    
        writeLn( linea );  
    end;
    readkey;
    close( archivo1 );   
    end;
    
procedure registrarprestamos; //registra un prestamo y lo guarda en su archivo
var
n : char;
begin
  append(archivo2); 
  contador2 := 1;
repeat
	writeln('Ingrese la cedula del alumno:');
    readln(persona3.id);
    writeln('Ingrese el nombre del libro:');
    readln(persona3.nombredelibro);
    writeln(archivo2, 'Prestamo ',':');
    writeln(archivo2, 'cedula: ', persona3.id);
    writeln(archivo2, 'nombre de libro: ', persona3.nombredelibro);
    
    writeln('Hacer otro prestamo? S/N');
    n := readkey;
    
  until (upcase(n) = 'N');
  
  close(archivo2); // Cierra el archivo
  
  writeln('Registros guardados en el archivo "prestamos.txt"');
end;

procedure boom; //es un meme
var
  i : longint;
  u : longint;
begin
  WriteLn('run');
  u:=200;
  for i:=10 downto 1 do
  begin
    WriteLn(i);
    Delay(1000);
    sound(u);
    delay(1000);
    nosound;
  end;
  WriteLn('no');
end;

procedure RegistrarLibros;
begin 
  append(archivo1); 
  contador1 := 1;
repeat
    writeln('Ingrese el nombre del libro:');
    readln(persona2.nombre);
    writeln(archivo1, 'Nombre: ', persona2.nombre);
    writeln(archivo1);
    
    writeln('¿Desea ingresar otro libro? (S/N)');
    readln(n);
    
  until (upcase(n) = 'N');
  
  close(archivo1); // Cierra el archivo
  
  writeln('Registros guardados en el archivo "libros.txt"');
end;

BEGIN
   existearchivo;
   existearchivo1;
   existearchivo2;
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
				 writeln('2. ver datos de alumnos');
				 writeln('3. revisar alumnos sancionados');
				 writeln('0. ir al menu');
				 n:=readkey;
				 clrscr;
				   case n of
					'1':begin
						RegistrarAlumnos;
						end;
					'2':begin
						leer;
						end;
					'3':begin
						boom;
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
						registrarprestamos;
						end;
					'2':begin
						leer2;
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
						RegistrarLibros;
						end;
						'2':begin
						leer1;
						end;
						'0':begin
						end;
					end;
			end;
        end;
	until (n='4');
	writeln('gracias por usar la biblioteca de unimar');
END.
