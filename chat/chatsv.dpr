program chatsv;

uses
  Forms,
  server in 'server.pas' {frmservidor};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(Tfrmservidor, frmservidor);
  Application.Run;
end.
