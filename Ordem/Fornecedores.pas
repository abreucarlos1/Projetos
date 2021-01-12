unit Fornecedores;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, Mask, ExtCtrls, Grids, DBGrids, ComCtrls,
  Buttons,dialogs;

type
  TFrmClientes = class(TForm)
    PageControl1: TPageControl;
    TSClientes: TTabSheet;
    TSServico: TTabSheet;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    EditNome: TDBEdit;
    EditEndereco: TDBEdit;
    EditBairro: TDBEdit;
    EditCidade: TDBEdit;
    EditCEP: TDBEdit;
    EditTelefone: TDBEdit;
    EditCel: TDBEdit;
    btbincluir: TBitBtn;
    Btbeditar: TBitBtn;
    BtbDel: TBitBtn;
    Btbcancel: TBitBtn;
    Btbprocurar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btbincluirClick(Sender: TObject);
    procedure BtbeditarClick(Sender: TObject);
    procedure BtbDelClick(Sender: TObject);
    procedure BtbcancelClick(Sender: TObject);
    procedure BtbprocurarClick(Sender: TObject);
    procedure EditPrazoKeyPress(Sender: TObject; var Key: Char);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FrmClientes: TFrmClientes;
  index:integer;

implementation

{$R *.DFM}

uses Datamodule, Localizar;


procedure TFrmClientes.FormCreate(Sender: TObject);
begin
     editprazo.Text:='0';
end;

procedure TFrmClientes.btbincluirClick(Sender: TObject);
begin
     if btbincluir.Caption='&Incluir' then
        begin
             btbincluir.Caption:='&Ok';
             btbeditar.Enabled:=false;
             btbdel.Enabled:=false;
             EditNome.SetFocus;
             dm.TBForn.DisableControls;
             dm.TBForn.Last;
             index:=dm.TBForn.fieldbyname('CODIGO').AsInteger;
             dm.TBForn.EnableControls;
             dm.TBForn.Append;
        end
     else
         begin
              if EDITNome.Text='' then
                 begin
                      showmessage('O campo Nome não pode estar vazio.');
                      EDITNome.SetFocus;
                 end
              else
                  begin
                       btbincluir.Caption:='&Incluir';
                       btbeditar.Enabled:=true;
                       btbdel.Enabled:=true;
                       dm.TBForn.FieldByName('CODIGO').AsInteger:=index+1;
                       dm.tbforn.Post;
                  end;
         end;
end;

procedure TFrmClientes.BtbeditarClick(Sender: TObject);
begin
     btbIncluir.Caption:='&Ok';
     btbeditar.Enabled:=false;
     btbdel.Enabled:=false;
     EditNome.SetFocus;
     dm.tbforn.edit;
end;

procedure TFrmClientes.BtbDelClick(Sender: TObject);
begin
     if dm.TBForn.RecordCount>0 then
        if messagedlg('Você deseja apagar este registro?',MTInformation,[mbYes,Mbno],0)=mryes then
           dm.tbforn.delete;
end;

procedure TFrmClientes.BtbcancelClick(Sender: TObject);
begin
     dm.tbforn.cancel;
     btbIncluir.Caption:='&Incluir';
     btbeditar.Enabled:=true;
     btbdel.Enabled:=true;
end;


procedure TFrmClientes.BtbprocurarClick(Sender: TObject);
begin
     application.CreateForm(TfrmLocaliza,frmlocaliza);
     frmlocaliza.dados('Forn');
     frmlocaliza.RGOp.Items.Append('Nome');
     frmlocaliza.RGOp.Items.Append('Vendedor');
     frmlocaliza.RGOp.ItemIndex:=0;
     frmlocaliza.showmodal;
end;

procedure TFrmClientes.EditPrazoKeyPress(Sender: TObject; var Key: Char);
begin
     if not (key in ['0'..'9']) then
        if key=#8 then
           key:=#8
        else
            key:=#0;
end;


end.
