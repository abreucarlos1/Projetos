program server;

uses
  Forms,windows,
  Servidor in 'Servidor.pas' {sv},
  IO in 'IO.pas' {bsd};



{$R *.RES}

begin
  
  Application.Initialize;
  application.ShowMainForm:=false;
  Application.CreateForm(Tsv, sv);
  ShowWindow(application.handle,SW_Hide);
  Application.Run;


  
end.
