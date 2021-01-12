program sobre;

uses
  Forms,
  about in 'about.pas' {Fsobre};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFsobre, Fsobre);
  Application.Run;
end.
