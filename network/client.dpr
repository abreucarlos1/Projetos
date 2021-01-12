program client;

uses
  Forms,
  cliente in 'cliente.pas' {Form1},
  messenger in 'messenger.pas' {mensagens};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tmensagens, mensagens);
  Application.Run;
end.
