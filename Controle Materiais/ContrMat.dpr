program ContrMat;

uses
  Forms,
  Controle in 'Controle.pas' {ControleMat},
  Database in 'Database.pas' {DM: TDataModule},
  Manutencao in 'Manutencao.pas' {frmManut};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TControleMat, ControleMat);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
