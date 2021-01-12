unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, jpeg;

type
  TForm2 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label1Click(Sender: TObject);
    procedure Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.DFM}

procedure TForm2.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     ReleaseCapture;
     Form2.Perform(Wm_SysCommand,$F012,0);
end;

procedure TForm2.Label1Click(Sender: TObject);
begin
     label1.Font.Color:=clBlack;
     Form2.Close;
end;

procedure TForm2.Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
     if label1.Font.Color<>clyellow then label1.Font.Color:=clyellow; 
end;

procedure TForm2.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
     if label1.Font.Color<>clblack then label1.Font.Color:=clBlack;
end;

end.
