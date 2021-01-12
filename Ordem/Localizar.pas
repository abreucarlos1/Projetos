unit Localizar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons,DB,DBTables;

type
  TFrmLocaliza = class(TForm)
    Edit1: TEdit;
    Btblocaliza: TBitBtn;
    btbsair: TBitBtn;
    RGOp: TRadioGroup;
    procedure FormActivate(Sender: TObject);
    procedure BtblocalizaClick(Sender: TObject);
    procedure btbsairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure dados(database:string);
  end;

var
  FrmLocaliza: TFrmLocaliza;
  data:TTable;

implementation

uses Datamodule;

{$R *.DFM}

procedure TfrmLocaliza.dados(database:string);
begin
     if database='Clientes' then
        data:=dm.tbclientes
     else
         data:=dm.tbServico;
end;

procedure TFrmLocaliza.FormActivate(Sender: TObject);
begin
     edit1.SetFocus;
end;


procedure TFrmLocaliza.BtblocalizaClick(Sender: TObject);
var
 SearchOptions: TLocateOptions;
 campo1,campo2:string;
begin
     SearchOptions:=[loPartialKey];
     if data=dm.tbclientes then
        begin
             campo1:='Nome';
             campo2:='Telefone';
        end
     else
         if (data=dm.tbservico) Then
            begin
                 campo1:='Data';
                 campo2:='Numero';
            end;
     with data do
          begin
               disablecontrols;
               if rgop.ItemIndex=0 then
                  begin
                       if not Locate(campo1,edit1.text ,SearchOptions) then
                          showmessage('Registro não Encontrado');
                  end
               else
                   if not Locate(campo2,edit1.text ,SearchOptions) then
                      showmessage('Registro não Encontrado');
              enablecontrols;
          end;
end;

procedure TFrmLocaliza.btbsairClick(Sender: TObject);
begin
     close;
end;

procedure TFrmLocaliza.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     action:=cafree;
end;

end.
