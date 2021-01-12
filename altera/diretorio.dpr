program diretorio;

uses
  Forms,
  dir in 'dir.pas' {MI2};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMI2, MI2);
  Application.Run;
end.
