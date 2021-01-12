unit about;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type



  TFsobre = class(TForm)
    Timer1: TTimer;
    Ok: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure OkClick(Sender: TObject);
  private
    { Private declarations }
  public


    { Public declarations }
  end;




var
  Fsobre: TFsobre;
  texto: array [1..15] of char;


implementation

{$R *.DFM}

procedure mostra;
begin
     Fsobre.Label2.Caption:='Criado por: Carlos Alberto Gonçalves Abreu'+ chr(13)+
                           'Data: 20 de Julho de 1999'+chr(13)+
                           ' '+chr(13)+
                           'ultima atualização: 26 de Julho de 1999'+chr(13)+
                           'em caso de bugs, enviar e-mail para:'+chr(13)+
                           'carlos@netwalk.com.br';
end;


procedure TFsobre.FormCreate(Sender: TObject);
begin
     mostra;
     texto[1]:='S';
     texto[2]:='o';
     texto[3]:='b';
     texto[4]:='r';
     texto[5]:='e';
     texto[6]:=' ';
     texto[7]:=' ';
     texto[8]:=' ';
     texto[9]:=' ';
     texto[10]:=' ';
     texto[11]:=' ';
     texto[12]:=' ';
     texto[13]:=' ';
     texto[14]:=' ';
     texto[15]:=' ';

end;

procedure TFsobre.Button1Click(Sender: TObject);

begin
    timer1.Enabled:=true;
end;

procedure TFsobre.Timer1Timer(Sender: TObject);
var
   j:byte;
begin
      texto[14]:=texto[1];
              for j:=1 to 14 do
                  texto[j]:=texto[j+1];
              Fsobre.Caption:=texto;
end;

procedure TFsobre.OkClick(Sender: TObject);
begin
     close;
end;

end.
