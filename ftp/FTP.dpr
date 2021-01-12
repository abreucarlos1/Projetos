program FTP;

uses
  Forms,
  FTP1 in 'FTP1.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
