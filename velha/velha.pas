unit velha;

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
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  aux,i:integer;
  velha: array [1..9] of char;

implementation

{$R *.DFM}









procedure TForm1.FormCreate(Sender: TObject);
begin
     for i:=1 to 9 do
         velha[i]:='v'
     randomize;
     aux:=random(9);
     velha[aux]:='X';
     case aux of
          1:
            begin
                 button1.Caption:='X';
                 button1.enable:=false;
            end;
          2:
            begin
                 button2.Caption:='X';
                 button2.Enabled:=false;
            end;
          3:
            begin
                 button3.Caption:='X';
                 button3.Enabled:=false;
            end;
          4:
             begin
                 button4.Caption:='X';
                 button4.Enabled:=false;
            end;
          5:
             begin
                 button5.Caption:='X';
                 button5.Enabled:=false;
            end;
          6:
             begin
                 button6.Caption:='X';
                 button6.Enabled:=false;
            end;
          7:
             begin
                 button7.Caption:='X';
                 button7.Enabled:=false;
            end;
          8:
             begin
                 button8.Caption:='X';
                 button8.Enabled:=false;
            end;
          9:
             begin
                 button9.Caption:='X';
                 button9.Enabled:=false;
            end;
     end;
     


end;

end.
