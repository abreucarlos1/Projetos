unit cliser;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ScktComp, ComCtrls;

type
  TForm1 = class(TForm)
    ss: TServerSocket;
    cs: TClientSocket;
    Memo1: TMemo;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Memo2: TMemo;
    Button4: TButton;
    Edit2: TEdit;
    procedure Button3Click(Sender: TObject);
    procedure ssListen(Sender: TObject; Socket: TCustomWinSocket);
    procedure ssClientConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure Button2Click(Sender: TObject);
    procedure csConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ssClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure csDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure Button1Click(Sender: TObject);
    procedure ssClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure csRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure csWrite(Sender: TObject; Socket: TCustomWinSocket);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form1: TForm1;



implementation

{$R *.DFM}


procedure TForm1.Button3Click(Sender: TObject);
begin
     if ss.Active then
        begin
             ss.Close;
             button3.Caption:='conecta';
        end
     else
         begin
              ss.Active:=true;
              button3.Caption:='desconecta';
         end;
end;

procedure TForm1.ssListen(Sender: TObject; Socket: TCustomWinSocket);
begin
     memo2.Lines.Append('Esperando conexão...');
end;

procedure TForm1.ssClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
     memo2.Lines.Append('conectado em '+socket.RemoteAddress);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
     if cs.active then
        begin
             cs.Close;
             button2.Caption:='conecta';
        end
     else
         begin
              cs.Active:=true;
              button2.Caption:='desconectar';
         end;

end;

procedure TForm1.csConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
     memo1.Lines.Append('Conectado em '+socket.RemoteAddress);
end;

procedure TForm1.ssClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
     memo2.Lines.Append('desconectado');
end;

procedure TForm1.csDisconnect(Sender: TObject; Socket: TCustomWinSocket);
begin
     memo1.Lines.Append('Desconectado');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
     memo1.Lines.Append(edit1.Text);
     cs.Socket.SendText(edit1.text);
     edit1.text:='';
end;

procedure TForm1.ssClientRead(Sender: TObject; Socket: TCustomWinSocket);
var
   text,lower:string;
begin
     text:=socket.ReceiveText;
     if text[1]='#' then
        begin
             lower:=lowercase(text);
             if lower='#hab' then
                begin
                     memo2.Visible:=true;
                     edit2.Visible:=true;
                     socket.SendText('Controles Habilitados..');
                end;
        end
     else
         memo2.Lines.Append(text);

end;

procedure TForm1.csRead(Sender: TObject; Socket: TCustomWinSocket);
begin
     memo1.Lines.Append(socket.ReceiveText);
end;

procedure TForm1.csWrite(Sender: TObject; Socket: TCustomWinSocket);
begin
     //memo1.Lines.Append(socket.ReceiveText);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
     if ss.Active then
        begin
             memo2.Lines.Append(edit2.text);
             ss.Socket.Connections[ss.Socket.ActiveThreads].SendText(edit2.Text);
             edit2.Text:='';
        end;
end;

end.
