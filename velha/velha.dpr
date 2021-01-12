program velha;

uses
  Forms,
  velhaca1 in 'velhaca1.pas' {Form1},
  about in 'about.pas' {Fsobre};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Jogo da Velha';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFsobre, Fsobre);
  Application.Run;
end.
