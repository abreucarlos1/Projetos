unit messenger;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls,shellapi;

type
  Tmensagens = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    RGicon: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    RGtype: TRadioGroup;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RGtypeClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
     sp='�'; //alt 0128

var
  mensagens: Tmensagens;
  icone,botao:string;
  simbolo:integer;
  title,capt:Pchar;
  tipo:integer;
  

implementation

{$R *.DFM}
uses cliente;



procedure Tmensagens.BitBtn1Click(Sender: TObject);
begin
     icone:='0';
     simbolo:=0;
end;

procedure Tmensagens.BitBtn2Click(Sender: TObject);
begin
     icone:='1';
     simbolo:=MB_ICONEXCLAMATION;
end;

procedure Tmensagens.BitBtn3Click(Sender: TObject);
begin
     icone:='2';
     simbolo:=MB_ICONINFORMATION;
end;

procedure Tmensagens.BitBtn4Click(Sender: TObject);
begin
     icone:='3';
     simbolo:=MB_ICONSTOP;
end;

procedure Tmensagens.BitBtn5Click(Sender: TObject);
begin
     icone:='4';
     simbolo:=MB_ICONQUESTION;
end;

procedure Tmensagens.Button2Click(Sender: TObject);

begin

     getmem(title,100);
     getmem(capt,500);
     strPcopy(title,edit1.text);
     strPcopy(capt,edit2.text);
     Tipo:=Tipo+Simbolo;
     messagebox(0,title,capt,tipo);
     freemem(title,100);
     freemem(capt,500);

end;

procedure Tmensagens.RGtypeClick(Sender: TObject);
begin
     if RGtype.itemindex=0 then
        begin
             tipo:=MB_ABORTRETRYIGNORE;
             botao:='1';
        end;
     if rgtype.ItemIndex=1 then
        begin
             tipo:=MB_OKCANCEL;
             botao:='2';
        end;
     if rgtype.ItemIndex=2 then
        begin
             tipo:=MB_RETRYCANCEL;
             botao:='3';
        end;
     if rgtype.ItemIndex=3 then
        begin
             tipo:=MB_YESNO;
             botao:='4';
        end;
     if rgtype.ItemIndex=4 then
        begin
             tipo:=MB_YESNOCANCEL;
             botao:='5';
        end;
     if rgtype.ItemIndex=-1 then
        begin
             tipo:=0;
            botao:='0';
        end;
end;

procedure Tmensagens.Button3Click(Sender: TObject);
begin
     mensagens.Close;
end;

procedure Tmensagens.Button1Click(Sender: TObject);
var
   texto:string;
begin
     if edit1.Text='' then
        edit1.Text:=' ';
     if edit2.Text='' then
        edit2.Text:=' ';
     texto:='@msg{'+edit2.text+sp+edit1.text+sp+botao+sp+icone+'}';
     form1.cs.Socket.SendText(texto);
     mensagens.Close;
end;

procedure Tmensagens.FormActivate(Sender: TObject);
begin
     icone:='0';
     botao:='0';
     simbolo:=0;
     tipo:=0;
end;

end.
