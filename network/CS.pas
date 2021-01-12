unit CS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ScktComp;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    EDIP: TEdit;
    BtInicializa: TButton;
    CS: TClientSocket;
    SS: TServerSocket;
    Memo1: TMemo;
    Label2: TLabel;
    Memo2: TMemo;
    Label3: TLabel;
    btenvia: TButton;
    Edenvia: TEdit;
    procedure CSConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure CSConnecting(Sender: TObject; Socket: TCustomWinSocket);
    procedure BtInicializaClick(Sender: TObject);
    procedure btenviaClick(Sender: TObject);
    procedure CSLookup(Sender: TObject; Socket: TCustomWinSocket);
    procedure CSDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure SSClientWrite(Sender: TObject; Socket: TCustomWinSocket);
    procedure SSClientConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure SSClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure SSAccept(Sender: TObject; Socket: TCustomWinSocket);
    procedure SSListen(Sender: TObject; Socket: TCustomWinSocket);
    procedure SSClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.CSConnect(Sender: TObject; Socket: TCustomWinSocket);
var
   IP:string;
begin
     ip:=socket.RemoteAddress;
     memo1.Lines.Append('Conectado em '+ip);
end;

procedure TForm1.CSConnecting(Sender: TObject; Socket: TCustomWinSocket);
begin
     memo1.Lines.Append('Estabelecendo conexão...');
     //cs.Address:=ss.Socket.RemoteHost;
end;

procedure TForm1.BtInicializaClick(Sender: TObject);
begin
     {if edip.text<>'' then
        begin}
             if not cs.Socket.Connected then
                begin
                     btinicializa.Caption:='Desconecta';
                     //cs.Address:=edip.Text;
                     //cs.Active:=true;
                     ss.Active:=true;

                end
             else
                 begin
                      btinicializa.Caption:='Conecta';
                      //cs.Close;
                      cs.Active:=false;
                      ss.Close;
                      ss.Active:=false;
                 end;
        {end
     else
         messagedlg('O IP tem que ser informado',mterror,[mbok],0);}
end;

procedure TForm1.btenviaClick(Sender: TObject);
begin
     //ss.Active:=false;
     memo1.Lines.Append(edenvia.text);
     cs.Socket.SendText(edenvia.text);
     edenvia.text:='';
     //ss.Active:=true;
end;

procedure TForm1.CSLookup(Sender: TObject; Socket: TCustomWinSocket);
begin
     memo1.Lines.Append('Procurando servidor...');
end;

procedure TForm1.CSDisconnect(Sender: TObject; Socket: TCustomWinSocket);
begin
     memo1.Lines.Append('Desconectado');
end;

procedure TForm1.SSClientWrite(Sender: TObject; Socket: TCustomWinSocket);
begin
     //memo2.Lines.Append(socket.ReceiveText);
end;

procedure TForm1.SSClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
     //socket.SendText('Conectando');
     memo1.Lines.Append('conectado');
end;

procedure TForm1.SSClientRead(Sender: TObject; Socket: TCustomWinSocket);
begin
     memo2.Lines.Append(socket.ReceiveText);
end;

procedure TForm1.SSAccept(Sender: TObject; Socket: TCustomWinSocket);
begin
     cs.Address:=ss.Socket.Connections[0].remoteaddress;
     cs.Active:=true;
     edip.text:=ss.Socket.Connections[0].RemoteAddress;
end;

procedure TForm1.SSListen(Sender: TObject; Socket: TCustomWinSocket);
begin
     memo1.Lines.Append('Esperando uma conexão...');
     memo1.Lines.Append(socket.LocalAddress);
end;

procedure TForm1.SSClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
     memo1.Lines.Append('Desconectado');
     cs.Active:=false;
     
end;

end.
