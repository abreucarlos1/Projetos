unit Config;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  Tfrmconfig = class(TForm)
    Lbempresa: TLabel;
    Edempresa: TEdit;
    Lbrespon: TLabel;
    EdResp: TEdit;
    Btok: TButton;
    btcancelar: TButton;
    procedure btcancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtokClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmconfig: Tfrmconfig;
  arquivo:Textfile;
  path:string;

implementation

{$R *.DFM}



procedure Tfrmconfig.btcancelarClick(Sender: TObject);
begin
     if messagedlg('Voce deseja encerrar a configuração?',MTinformation,[mbyes,mbno],0)=mryes then
        frmconfig.Close;
end;

procedure Tfrmconfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     action:=cafree;
end;

procedure Tfrmconfig.FormCreate(Sender: TObject);
var
   texto1,texto2:string;
begin
     path:=extractfilepath(application.ExeName);
     if fileExists(path+'\config.ini') then
        begin
             assignfile(arquivo,path+'\Config.ini');
             reset(arquivo);
             readln(arquivo,texto1);
             readln(arquivo,texto2);
             closefile(arquivo);
             edempresa.Text:=texto1;
             edresp.Text:=texto2;
        end;
end;

procedure Tfrmconfig.BtokClick(Sender: TObject);
begin
     assignfile(arquivo,path+'\Config.ini');
     rewrite(arquivo);
     Writeln(arquivo,edempresa.text);
     writeln(arquivo,edresp.text);
     closefile(arquivo);
     close;
end;

end.
