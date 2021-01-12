unit server;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OleCtrls, isp3, ScktComp;

type
  TForm1 = class(TForm)
    FTP: TFTP;
    btconect: TButton;
    SSkt: TServerSocket;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Memo1: TMemo;
    Edit1: TEdit;
    btenv: TButton;
    Memo2: TMemo;
    Label3: TLabel;
    procedure btconectClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SSktAccept(Sender: TObject; Socket: TCustomWinSocket);
    procedure SSktClientConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure SSktClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure SSktListen(Sender: TObject; Socket: TCustomWinSocket);
    procedure btenvClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.btconectClick(Sender: TObject);
begin
     if sskt.Socket.Connected then
        begin
             sskt.Active:=false;
             btconect.Caption:='Conectar';
             memo2.Lines.Append('Desconectado');
        end
     else
         begin
              sskt.Active:=true;
              btconect.Caption:='Desconectar';
         end;

end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     sskt.Active:=false;
end;

procedure TForm1.SSktAccept(Sender: TObject; Socket: TCustomWinSocket);
begin
     memo2.Lines.Append('Pronto');
     btenv.Enabled:=true;
end;

procedure TForm1.SSktClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
    // if socket.RemoteAddress='127.0.0.1' then // tirar esta linha
        //begin
              label1.Caption:='Conectado em: Remoto';
              label2.Caption:='IP Remoto: '+socket.RemoteAddress;
        //end;

     memo2.Lines.Append('Conectado em '+socket.RemoteAddress);
end;

procedure TForm1.SSktClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
     memo2.Lines.Append('Desconectado');
     label1.Caption:='Conectado';
     label2.Caption:='IP Remoto:';
     label3.Caption:='IP Local: '+socket.LocalAddress;
end;

procedure TForm1.SSktListen(Sender: TObject; Socket: TCustomWinSocket);
begin
     if socket.LocalAddress='0.0.0.0' then // trocar = por <>
        begin
             memo2.Lines.Append('Esperando conexão...');
             label3.Caption:='IP Local: '+socket.LocalAddress;
        end;
end;

procedure TForm1.btenvClick(Sender: TObject);
begin
     memo1.Lines.Append(edit1.Text);
     sskt.Socket.SendText(edit1.text);
     edit1.text:='';
end;

end.
