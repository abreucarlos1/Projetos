program Calculadora;

uses
  Forms,
  Calc in 'Calc.pas' {FrmCalc};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFrmCalc, FrmCalc);
  Application.Run;
end.
