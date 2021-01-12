unit Ubandeira;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TForm2 = class(TForm)
    procedure FormPaint(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Ubrasil;

{$R *.DFM}

procedure TForm2.FormPaint(Sender: TObject);
var w, h, x1, x2, y1, y2: integer;
begin with canvas do begin
     w := Form2.Width;
     h := Form2.Height;
//     Brush.Style:=Bsclear;
    Brush.Style:=Bsclear;

//faixa
Pen.Color:=clblue;
     x1 := 4*w div 16;
     x2 := 12*w div 16;
     y1 := 5* h div 12;
     y2 := 9* h div 12;
     Ellipse(x1, y1, x2, y2);

     x1 := 8 * w div 32;
     x2 := 24 * w div 32;
     y1 := 11 * h div 24;
     y2 := 19 * h div 24;
     Ellipse(x1, y1, x2, y2);

//bola
     Pen.Color:=clblack;
     x1 := 3*w div 8;
     x2 := 5*w div 8;
     y1 := 2* h div 6;
     y2 := 4* h div 6;
     Ellipse(x1, y1, x2, y2);

//losango
     Pen.Color:=clblack;
     x1 := w div 8;
     y1 := 3 * h div 6;
     MoveTo(x1,y1);
     LineTo(4 * w div 8, h div 6);
     LineTo(7 * w div 8, 3 * h div 6);
     LineTo(4 * w div 8, 5 * h div 6);
     LineTo(w div 8, 3 * h div 6);

//cor retangulo
     Brush.color:=clgreen;
     FloodFill(0,0, clblack, fsborder);
//cor losango
     Brush.color:=clyellow;
     FloodFill(2 * w div 8, 3 * h div 6, clblack, fsborder);
     FloodFill(7*w div 16, 8*h div 12, clblack, fsborder);
//cor faixa
     Brush.color:=clwhite;
     FloodFill(w div 2, 21*h div 48, clsilver, fssurface);
//cor bola
     Brush.color:=clblue;
     FloodFill(7*w div 16, 5*h div 12, clsilver, fssurface);
     FloodFill(w div 2, h div 2, clsilver, fssurface);


     end;
end;

procedure TForm2.FormResize(Sender: TObject);
begin
     invalidate;
end;

end.
