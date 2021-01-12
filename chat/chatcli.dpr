program chatcli;

uses
  Forms,
  client in 'client.pas' {frmcliente};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(Tfrmcliente, frmcliente);
  Application.Run;
end.
