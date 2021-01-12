unit client;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ScktComp, OleCtrls, isp3;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    EDIP: TEdit;
    BtInicializa: TButton;
    Memo1: TMemo;
    Label2: TLabel;
    Memo2: TMemo;
    Label3: TLabel;
    btenvia: TButton;
    Edenvia: TEdit;
    TCP1: TTCP;
    Label4: TLabel;
    procedure CSConnecting(Sender: TObject; Socket: TCustomWinSocket);
    procedure BtInicializaClick(Sender: TObject);
    procedure TCP1Connect(Sender: TObject);
    procedure btenviaClick(Sender: TObject);
    procedure TCP1SendComplete(Sender: TObject);
    procedure TCP1DataArrival(Sender: TObject; bytesTotal: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.CSConnecting(Sender: TObject; Socket: TCustomWinSocket);
begin
     memo1.Lines.Append('Estabelecendo conexão...');

end;

procedure TForm1.BtInicializaClick(Sender: TObject);
begin
     if edip.text<>'' then
        begin
             if btinicializa.caption='Conectar' then
                begin
                     tcp1.Connect(edip.text,666);
                     btinicializa.Caption:='Desconectar';
                end
             else
                 begin
                      tcp1.Close;
                      btinicializa.caption:='Conectar';
                 end;
        end
     else
         messagedlg('O IP tem que ser informado',mterror,[mbok],0);
end;

procedure TForm1.TCP1Connect(Sender: TObject);
begin
     memo2.Lines.Append('Conectado em '+tcp1.RemoteHostIP);
end;

procedure TForm1.btenviaClick(Sender: TObject);
begin
     memo1.Lines.Append(edenvia.Text);
     tcp1.SendData(edenvia.text);
     
end;

procedure TForm1.TCP1SendComplete(Sender: TObject);
begin
     tcp1.Listen;
end;

procedure TForm1.TCP1DataArrival(Sender: TObject; bytesTotal: Integer);
begin
     label4.Caption:=inttostr(BytesTotal);
end;

end.
