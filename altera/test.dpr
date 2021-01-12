program test;

uses
  Forms,
  teste in 'teste.pas' {Form1};

{$R diretorio.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
