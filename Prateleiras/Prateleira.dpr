program Prateleira;

uses
  Forms,
  Prateleiras in 'Prateleiras.pas' {SisPrateleiras},
  Impressao in 'Impressao.pas' {frmimp},
  Config in 'Config.pas' {frmconfig},
  input in 'input.pas' {frminput},
  splash in 'splash.pas' {frmsplash};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TSisPrateleiras, SisPrateleiras);
  Application.CreateForm(TFrmsplash, frmsplash);
  frmsplash.show;
  Application.Run;
end.
