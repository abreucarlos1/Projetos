unit Unit2;

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

{$R *.DFM}

procedure TForm2.FormPaint(Sender: TObject);
var h, w: integer;
var a, b, c, d: integer;

begin
    h := height - 28;
    w := width - 8;
//
    canvas.brush.style:=bsclear;
    canvas.Pen.Color:=clwhite;
    a := 4*w div 16;
    b := 12*w div 16;
    c := 5* h div 12;
    d := 9* h div 12;
    Canvas.Ellipse(a, c, b, d);

    a := 8 * w div 32;
    b := 24 * w div 32;
    c := 11 * h div 24;
    d := 19 * h div 24;
    Canvas.Ellipse(a, c, b, d);
 // elipse
    canvas.pen.Color := clblack;
    canvas.brush.color := clblue;
    a := 3 * w div 8;
    b := 5 * w div 8;
    c := 2 * h div 6;
    d := 4 * h div 6;
    canvas.brush.style:=bsclear;
    canvas.Ellipse(a, c, b, d);

    canvas.Pen.Color:=clblack;
    canvas.MoveTo(w div 2, h div 6);
    canvas.LineTo(7*w div 8, h div 2);
    canvas.LineTo(w div 2, 5*h div 6);
    canvas.LineTo(w div 8, h div 2);
    canvas.lineTo(w div 2, h div 6);
//preenchimento de cor
    canvas.Brush.color := clGreen;
    canvas.FloodFill(0, 0, clblack, fsborder);

    canvas.Brush.Color := clYellow;
    canvas.Floodfill(w div 4, h div 2, clblack, fsborder);

    canvas.brush.color := clwhite;
    canvas.floodfill(w div 2, 21*h div 48, clwhite, fssurface);
end;

procedure TForm2.FormResize(Sender: TObject);
begin
     invalidate;
end;

end.
 