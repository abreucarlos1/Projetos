unit client;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ScktComp, StdCtrls, Mask;

type
  Tfrmcliente = class(TForm)
    Button2: TButton;
    cs: TClientSocket;
    Label1: TLabel;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    Edit2: TEdit;
    Button1: TButton;
    Label2: TLabel;
    MaskEdit: TMaskEdit;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure csRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    function Match(a,b,c,d:integer):boolean;
    procedure Test(a,b,c,d:integer);
    function RecConteudoMsg(comando,mensagem:string):string;
  public
    { Public declarations }
  end;

var
  frmcliente: Tfrmcliente;
  parar:boolean;

implementation

{$R *.DFM}

function TfrmCliente.Match(a,b,c,d:integer):boolean;
var
   addr:string;
   res:boolean;
begin
     addr:=inttostr(a)+'.'+inttostr(b)+'.'+inttostr(c)+'.'+inttostr(d);
     res:=false;
     try
        cs.Host:=addr;
        cs.close;
        cs.Open;
        if cs.Socket.RemoteHost<>'' then
           res:=true
        else
            cs.close;
     except
           res:=false;
     end;
     result:=res;
end;

procedure Tfrmcliente.Test(a,b,c,d:integer);
var
   at,bt,ct,dt:integer;
begin
     for at:=a to 254 do
         begin
              for bt:=b to 254 do
                  begin
                       for ct:=c to 254 do
                           begin
                                for dt:=d to 254 do
                                    begin
                                         maskedit.Text:=inttostr(at)+inttostr(bt)+inttostr(ct)+inttostr(dt);
                                         frmcliente.Caption:='Procurando Servidor...';
                                         if (match(at,bt,ct,dt)) or (parar) then
                                            begin
                                                 parar:=false;
                                                 exit;
                                            end;
                                         application.ProcessMessages;
                                    end;
                                dt:=0;
                           end;
                       ct:=0;
                  end;
              bt:=0;
         end;
end;

function Tfrmcliente.RecConteudoMsg(comando,mensagem:string):string;
var
   p:integer;
begin
     p:=pos(comando,mensagem);
     if p > 0 then
        Result:=copy(mensagem,p+length(comando),length(mensagem));
end;

procedure Tfrmcliente.Button2Click(Sender: TObject);
var
   a,b,c,d,at,bt,ct,dt:integer;
begin
     parar:=false;
     at:=strtoint(trim(copy(maskedit.text,0,3)));
     bt:=strtoint(trim(copy(maskedit.text,4,3)));
     ct:=strtoint(trim(copy(maskedit.text,7,3)));
     dt:=strtoint(trim(copy(maskedit.text,10,3)));
     test(at,bt,ct,dt);
     while not cs.Socket.Connected do
           application.ProcessMessages;
     frmcliente.Caption:='Cliente ( '+cs.Socket.LocalAddress+' ) @ Servidor( '+cs.Socket.RemoteAddress+' )';
     cs.Socket.SendText('ADDNICK='+Edit1.text);
     button2.Enabled:=false;
     edit1.Enabled:=false;
     memo1.Enabled:=true;
     button1.Enabled:=true;
     edit2.Enabled:=true;
     edit2.SetFocus;

end;

procedure Tfrmcliente.csRead(Sender: TObject; Socket: TCustomWinSocket);
var
   buff:string;
begin
     buff:=socket.ReceiveText;
     if pos('MSG=',buff)>0 then
        memo1.Lines.Add(RecConteudoMsg('MSG=',buff));
end;

procedure Tfrmcliente.Button1Click(Sender: TObject);
begin
     if trim(edit2.text)<>'' then
        begin
             cs.Socket.SendText('MSG=' + '<' + Edit1.text + '>' + Edit2.text);
             edit2.clear;
             edit2.SetFocus;
        end
     else
         beep;
end;

procedure Tfrmcliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     cs.Socket.SendText('DELNICK='+Edit1.text);
end;


procedure Tfrmcliente.Button3Click(Sender: TObject);
begin
     parar:=true;
end;

end.
