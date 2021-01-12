unit server;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ScktComp, StdCtrls, Db, DBTables;

type
  Tfrmservidor = class(TForm)
    ss: TServerSocket;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Memo2: TMemo;
    Button1: TButton;
    Button2: TButton;
    ListBox1: TListBox;
    procedure FormActivate(Sender: TObject);
    procedure ssClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ssClientConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ssClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    function RecConteudoMsg(comando,mensagem:string):string;
    procedure EnviarMsgBroadcast(msg:string);
  public
    { Public declarations }
  end;


var
  frmservidor: Tfrmservidor;

implementation

{$R *.DFM}

function Tfrmservidor.RecConteudoMsg(comando,mensagem:string):string;
var
   p:integer;
begin
     p:=pos(comando,mensagem);
     if p > 0 then
        Result:=copy(mensagem,p+length(comando),length(mensagem));
end;

procedure Tfrmservidor.EnviarMsgBroadcast(msg:string);
var
   i:integer;
begin
     try
        for i:=0 to ss.Socket.ActiveConnections-1 do
            ss.Socket.Connections[i].SendText(msg);
     except
           beep;
     end;
end;

procedure Tfrmservidor.FormActivate(Sender: TObject);
begin
     ss.Open;
end;

procedure Tfrmservidor.ssClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
     label2.Caption:=inttostr(ss.Socket.ActiveConnections);
end;

procedure Tfrmservidor.ssClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
     label2.Caption:=inttostr(ss.Socket.ActiveConnections);

end;

procedure Tfrmservidor.ssClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
   buff:string;
begin
     buff:=socket.ReceiveText;
     if pos('ADDNICK',buff)>0 then
        begin
             listbox1.Items.Add(RecConteudoMsg('ADDNICK=',buff));
             memo2.Lines.Add('<'+RecConteudoMsg('ADDNICK=',buff)+' > entrou na sala.');
             EnviarMsgBroadcast('MSG=<' +RecConteudoMsg('ADDNICK=',buff)+'> entrou na sala.');
        end;
     if pos('DELNICK=',buff)>0 then
        begin
             listbox1.Items.Delete(Listbox1.items.indexof(RecConteudoMsg('DELNICK=',Buff)));
             memo2.Lines.Add('<' + RecConteudoMsg('DELNICK=',buff)+ '> deixou a sala.');
             while socket.Connected do
                   application.ProcessMessages;
             EnviarMsgBroadcast('MSG=<' + RecConteudoMsg('DELNICK=',buff)+ '> deixou a sala.');
        end;
     if pos('MSG=',buff)>0 then
        begin
             memo2.Lines.Add(RecConteudoMsg('MSG=',buff));
             EnviarMsgBroadcast(Buff);
        end;
end;

procedure Tfrmservidor.Button1Click(Sender: TObject);
begin
     if listbox1.ItemIndex > -1 then
        begin
             ss.Socket.Connections[listbox1.ItemIndex].Close;
             listbox1.Items.Delete(listbox1.itemIndex);
        end;
end;

procedure Tfrmservidor.Button2Click(Sender: TObject);
begin
     if button2.Caption = 'Desligar' then
        begin
             EnviarMsgBroadcast('Servidor Desligando!');
             listbox1.Items.clear;
             ss.close;
             label2.Caption:='0';
             button2.Caption:='Religar';
        end
     else
         begin
              ss.Open;
              button2.Caption:='Desligar';
         end;
end;

end.
