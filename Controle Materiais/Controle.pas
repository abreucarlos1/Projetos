unit Controle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Grids, DBGrids, ExtCtrls, DBCtrls, StdCtrls;

type
  TControleMat = class(TForm)
    MainMenu: TMainMenu;
    Arquivo1: TMenuItem;
    Impressora1: TMenuItem;
    DBGrid: TDBGrid;
    DBnav: TDBNavigator;
    GBProcura: TGroupBox;
    GBEntrada: TGroupBox;
    GBSaida: TGroupBox;
    RBCodigo: TRadioButton;
    RbDescr: TRadioButton;
    Edprocura: TEdit;
    EdEntrada: TEdit;
    EdSaida: TEdit;
    Btentrada: TButton;
    Btsaida: TButton;
    Configurao1: TMenuItem;
    Inclusao: TMenuItem;
    Delecao: TMenuItem;
    PopupMenu1: TPopupMenu;
    Excluir1: TMenuItem;
    Incluir1: TMenuItem;
    btecancel: TButton;
    Btscancel: TButton;
    Button1: TButton;
    Exportar1: TMenuItem;
    Exportar2: TMenuItem;
    N1: TMenuItem;
    ExportarTabela1: TMenuItem;
    ImportarTabela1: TMenuItem;
    N2: TMenuItem;
    OpenDialog: TOpenDialog;
    procedure InclusaoClick(Sender: TObject);
    procedure DelecaoClick(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure Incluir1Click(Sender: TObject);
    procedure EdprocuraChange(Sender: TObject);
    procedure BtentradaClick(Sender: TObject);
    procedure BtsaidaClick(Sender: TObject);
    procedure btecancelClick(Sender: TObject);
    procedure BtscancelClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Exportar2Click(Sender: TObject);
    procedure ExportarTabela1Click(Sender: TObject);
  private
    { Private declarations }
    procedure Exportar;
    procedure Importar;
  public
    { Public declarations }
  end;

var
  ControleMat: TControleMat;


implementation

uses Database, Manutencao;

{$R *.DFM}


Procedure TcontroleMat.Exportar;
const
     separador= '·'; // alt+0183
var
   arquivo:textfile;
   codigo,desc,saldo:string;
begin
     assignfile(arquivo,'Tabela.tbl');
     rewrite(arquivo);
     dm.TbMaterial.DisableControls;
     dm.TbMaterial.First;
     while not dm.TbMaterial.EOF do
           begin
                codigo:=dm.TbMaterial.fieldbyname('Codigo').AsString;
                desc:=dm.TbMaterial.fieldbyname('Descricao').AsString;
                saldo:=dm.TbMaterial.fieldbyname('Saldo').AsString;
                writeln(arquivo,codigo+separador,desc+separador,saldo);
                dm.TbMaterial.Next;
           end;
     dm.TbMaterial.First;
     dm.TbMaterial.EnableControls;
     closefile(arquivo);
end;

procedure TcontroleMat.Importar;
const
     separador ='·';
var
   arquivo:textfile;
   codigo,desc,saldo:string;
begin

end;


procedure TControleMat.InclusaoClick(Sender: TObject);
begin
     application.CreateForm(Tfrmmanut,frmmanut);
     frmmanut.Caption:='Inclusão de Registro';
     frmmanut.btok.Caption:='Incluir';
     frmmanut.ShowModal;

end;

procedure TControleMat.DelecaoClick(Sender: TObject);
begin
     application.CreateForm(Tfrmmanut,frmmanut);
     frmmanut.Caption:='Exclusão de Registro';
     frmmanut.btok.Caption:='Excluir';
     frmmanut.ShowModal;

end;

procedure TControleMat.Excluir1Click(Sender: TObject);
begin
     dm.TbMaterial.edit;
     if messagedlg('Voce tem certeza de Excluir o Registro?',Mtinformation,[mbyes,mbno],0)=mryes then
        dm.TbMaterial.delete
     else
         dm.TbMaterial.cancel;
end;

procedure TControleMat.Incluir1Click(Sender: TObject);
begin
     inclusao.Click;
end;

procedure TControleMat.EdprocuraChange(Sender: TObject);
begin

     if rbcodigo.Checked then
        begin
             dm.TbMaterial.Active:=false;
             dm.TbMaterial.IndexFieldNames:='Codigo';
             dm.TbMaterial.Active:=true;
             dm.TbMaterial.SetKey;
             dm.TbMaterial.FieldByName('Codigo').AsString:=edprocura.Text;
             dm.TbMaterial.GotoNearest;
        end;
     if rbdescr.Checked then
        begin
             dm.TbMaterial.Active:=false;
             dm.TbMaterial.IndexName:='indexDesc';
             dm.TbMaterial.Active:=true;
             dm.TbMaterial.SetKey;
             dm.TbMaterial.FieldByName('Descricao').AsString:=edprocura.Text;
             dm.TbMaterial.GotoNearest;
        end;

end;

procedure TControleMat.BtentradaClick(Sender: TObject);
var
   saldo:integer;
begin
     saldo:=dm.TbMaterial.fieldbyname('Saldo').AsInteger;
     saldo:=saldo+strtoint(edentrada.Text);
     dm.TbMaterial.edit;
     dm.TbMaterial.FieldByName('Saldo').AsString:=inttostr(saldo);
     dm.TbMaterial.Post;
     dm.TbMaterial.ApplyUpdates;
     dm.TbMaterial.CommitUpdates;

end;

procedure TControleMat.BtsaidaClick(Sender: TObject);
var
   saldo:integer;
begin
     saldo:=dm.TbMaterial.fieldbyname('Saldo').AsInteger;
     saldo:=saldo-strtoint(edsaida.Text);
     dm.TbMaterial.edit;
     dm.TbMaterial.FieldByName('Saldo').AsString:=inttostr(saldo);
     dm.TbMaterial.Post;
     dm.TbMaterial.ApplyUpdates;
     dm.TbMaterial.CommitUpdates;

end;



procedure TControleMat.btecancelClick(Sender: TObject);
begin
     dm.TbMaterial.CancelUpdates;
     dm.TbMaterial.CommitUpdates;
end;

procedure TControleMat.BtscancelClick(Sender: TObject);
begin
     dm.TbMaterial.CancelUpdates;
     dm.TbMaterial.CommitUpdates;
end;

procedure TControleMat.Button1Click(Sender: TObject);
begin
     close;
end;

procedure TControleMat.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     dm.TbMaterial.ApplyUpdates;
     dm.TbMaterial.CommitUpdates;
     CanClose:=true;
end;

procedure TControleMat.Exportar2Click(Sender: TObject);
begin
     EXPORTAR;
end;

procedure TControleMat.ExportarTabela1Click(Sender: TObject);
begin
     exportar;
end;

end.
