unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  pilha: array [1..200] of string;
  topo,num1,num2,num3:integer;
  operation:byte;
  ok:boolean;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
     if (label1.Caption='0') or ok then
        label1.Caption:='1'
     else
         label1.Caption:=label1.caption+'1';
     ok:=false;

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
     if (label1.Caption='0') or ok then
        label1.Caption:='2'
     else
         label1.Caption:=label1.caption+'2';
     ok:=false;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
     num1:=0;
     num2:=0;
     num3:=0;
     topo:=0;
     operation:=0;
     ok:=false;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
     //Se operação igual a Zero
     if operation=0 then
        begin
             //Então num1 recebe conteúdo do pndisp
             num1:=StrToint(label1.caption);//pndisp
             operation:=1;
        end

     else
         begin
              //Se não, num2 recebe conteúdo do pndisp
              num2:=StrToint(label1.caption);//pndisp
              //Calcula, conforme operação
              label1.caption:=inttostr(num1+num2);

              operation:=0;
         end;
     //Ok é verdadeira
     Ok:=True;

end;

end.
