unit DataModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TDM = class(TDataModule)
    DSClientes: TDataSource;
    TBClientes: TTable;
    TBServico: TTable;
    DSServico: TDataSource;
    TBClientesCODIGO: TFloatField;
    TBClientesNOME: TStringField;
    TBClientesENDERECO: TStringField;
    TBClientesBAIRRO: TStringField;
    TBClientesCIDADE: TStringField;
    TBClientesCEP: TStringField;
    TBClientesTELEFONE: TStringField;
    TBClientesCELULAR: TStringField;
    QrOS: TQuery;
    DSOS: TDataSource;
    TBServicoCODCLI: TFloatField;
    TBServicoCODORD: TFloatField;
    TBServicoDATA: TDateField;
    TBServicoDEFEITO: TMemoField;
    TBServicoSOLUCAO: TMemoField;
    TBServicoPRECO: TFloatField;
    TBServicoSTATUS: TSmallintField;
    DSS: TDataSource;
    QrS: TQuery;
    QrOSCODIGO: TFloatField;
    QrOSNOME: TStringField;
    QrOSENDERECO: TStringField;
    QrOSBAIRRO: TStringField;
    QrOSCIDADE: TStringField;
    QrOSCEP: TStringField;
    QrOSTELEFONE: TStringField;
    QrOSCELULAR: TStringField;
    QrSCODCLI: TFloatField;
    QrSCODORD: TFloatField;
    QrSDATA: TDateField;
    QrSDEFEITO: TMemoField;
    procedure DMCreate(Sender: TObject);
    procedure DMDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.DFM}


procedure TDM.DMCreate(Sender: TObject);
begin
     tbclientes.open;
     tbservico.open;
end;

procedure TDM.DMDestroy(Sender: TObject);
begin
     tbclientes.close;
     tbservico.close;
end;


end.
