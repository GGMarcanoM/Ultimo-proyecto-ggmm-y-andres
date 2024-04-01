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

castigo=record
nombre:string;
cedula:string;
razon: string;
end;

trabajo=record
nombre : string
end;

var 				//variables
linea:string;		
n:char;
archivo,archivo1,archivo2,archivo3,archivo4: text;			//archivos de texto de alumnos, libros y prestamos
persona3:prestamos;							//ruta de prestamos
persona5:castigo;
persona2:libro;								//ruta de libro	
persona1: alumno; 						//ruta de alumnos
persona4:trabajo;						//ruta de trabajo
contador,contador1,contador2,i: integer;

function valnombre(word: String): Boolean;		//validacion de nombre de nombre,  solo letras, sin espacios, ni numeros.
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
        
procedure existearchivo3; 		//revisa si existe el archivo de prestamos, si no lo crea
begin
    if not (FileExists('trabajo.txt')) then
    begin
		assign(archivo4, 'trabajo.txt');
		rewrite(archivo4);
		writeln(archivo4, 'registro de trabajos');
        close(archivo4);
        end
        else
        assign(archivo4, 'trabajo.txt');
        end;
        
procedure existearchivo4; 		//revisa si existe el archivo de castigo, si no lo crea
begin
    if not (FileExists('castigo.txt')) then
    begin
		assign(archivo3, 'castigo.txt');
		rewrite(archivo3);
		writeln(archivo3, 'registro de castigo');
        close(archivo3);
        end
        else
        assign(archivo3, 'castigo.txt');
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

procedure leer; 		//abre el archivo de alumno para leerlo
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
    
procedure leer3;		//lo mismo de arriba pero para trabajo
begin
 reset( archivo4 );                
    while not eof( archivo4) do
    begin
        readLn( archivo4, linea );    
        writeLn( linea );  
    end;
    readkey;
    close( archivo4 );   
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
    
 procedure leer5; //lo mismo mismo pero con prestamos
begin
 reset( archivo3 );                
    while not eof( archivo3) do
    begin
        readLn( archivo3, linea );    
        writeLn( linea );  
    end;
    readkey;
    close( archivo3 );   
    end;
    
 
    
procedure registrarprestamos; //registra un prestamo y lo guarda en su archivo
var
n : char;
begin
  append(archivo2); 
  contador2 := 1;
repeat
repeat
	writeln('Ingrese la cedula del alumno:');
    readln(persona3.id);
    if not valID(persona3.id) then
    writeln('dato ingresado no valido');
    until valID(persona3.id);
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

procedure registrarTrabajos; //registra trabajos y los guarda en el archivo
begin 
  append(archivo4); 
  contador1 := 1;
repeat

    writeln('Ingrese el nombre del Trabajo:');
    readln(persona4.nombre);
    writeln(archivo4, 'Nombre: ', persona4.nombre);
    writeln(archivo4);
    
    writeln('¿Desea ingresar otro trabajo? (S/N)');
    readln(n);
    
  until (upcase(n) = 'N');
  
  close(archivo4); // Cierra el archivo
  
end;

procedure registrarcastigo; //registra trabajos y los guarda en el archivo
begin 
  append(archivo3); 
  contador1 := 1;
repeat
repeat
    writeln('Ingrese el nombre del estudiante:');
    readln(persona5.nombre);
    if not valnombre(persona5.nombre) then
    writeln('dato ingresado no valido');
    until valnombre(persona5.nombre);
    writeln(archivo3, 'Nombre: ', persona5.nombre);
    
    
    repeat
    writeln('Ingrese la cedula del estudiante');
    readln(persona5.cedula);
    if not ValID (persona5.cedula) then
    writeln('dato ingresado no valido');
    until ValID(persona5.cedula);
    writeln(archivo3, 'cedula ', persona5.cedula);
    

    writeln('Ingrese la razon de la penalizacion');
    readln(persona5.razon);
    writeln(archivo3, 'Razon: ',persona5.razon);
    writeln(archivo3);
    
    writeln('¿Desea registrar otro castigo? (S/N)');
    readln(n);
    
  until (upcase(n) = 'N');
  
  close(archivo3); // Cierra el archivo
  
end;

BEGIN
   existearchivo;
   existearchivo1;
   existearchivo2;
   existearchivo3;
   existearchivo4;
    writeln('Bienvenido al sistema de biblioteca de unimar ');
    writeln('Presione cualquier tecla para continuar...    ');
    readkey;
    repeat
        clrscr;
        writeln('Por favor indique el apartado:  ');
        writeln('1. alumno   ');
        writeln('2. Prestamos   ');
        writeln('3. Libros y trabajos  ');
        writeln('0. Salir.     ');
        n:=readkey;
        clrscr;
        case n of
			'1':begin
					 writeln('Por favor indique la operacion a realizar:    ');
				 writeln('1. ingresar nuevos alumnos');
				 writeln('2. ver datos de alumnos');
				 writeln('3. Ingresar alumno sancionado');
				 writeln('4. Ver alumnos sancionados');
				 writeln('5. ir al menu');
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
						registrarcastigo;
					end;
					'4':begin
					leer5;
					end;
					'5':begin
					end;
				end;
			end;
			'2':begin
				 writeln('Por favor indique la operacion a realizar:    ');
				 writeln('1. Registrar prestamos');
				 writeln('2. Revisar prestamos activo');
				 writeln('5. ir al menu');
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
				writeln('3. Ingresar trabajos');
				writeln('4. Trabajos disponibles');
				
				 writeln('5. ir al menu');
				n:=readkey;
				clrscr;
					case n of
						'1':begin
						RegistrarLibros;
						end;
						'2':begin
						leer1;
						end;
						'3': begin
						registrarTrabajos;
						end;
						'4': begin
						leer3;
						end;
						'0':begin
						end;
					end;
			end;
        end;
	until (n='0');
	writeln('gracias por usar la biblioteca de unimar');
END.
