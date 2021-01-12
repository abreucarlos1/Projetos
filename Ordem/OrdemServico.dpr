program OrdemServico;

uses
  Forms,
  DataModule in 'DataModule.pas' {DM: TDataModule},
  Principal in 'Principal.pas' {FrmPrincipal},
  Localizar in 'Localizar.pas' {FrmLocaliza},
  OSIMP in 'OSIMP.pas' {FrmOSIMP};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
