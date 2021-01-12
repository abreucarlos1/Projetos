unit Database;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TDM = class(TDataModule)
    DSMaterial: TDataSource;
    TbMaterial: TTable;
    TbMaterialCodigo: TStringField;
    TbMaterialDescricao: TStringField;
    TbMaterialSaldo: TFloatField;
    procedure DMCreate(Sender: TObject);
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
var
   path:string;
begin
     path:=extractfilepath(application.ExeName);
     tbmaterial.TableName:=path+'\data\Materiais';
     try
        tbmaterial.open;
     Except on EDBEngineError do
        tbmaterial.close;   
     end;
end;

end.
