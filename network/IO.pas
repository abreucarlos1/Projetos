unit IO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,shellapi;

type
  Tbsd = class(TForm)
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  bsd: Tbsd;

implementation

{$R *.DFM}

procedure Tbsd.FormCreate(Sender: TObject);
type
    display=Tscreen;
var
   sc:display;
begin
     sc:=nil;
     bsd.Width:=sc.Width;
     bsd.Height:=sc.Height;
     bsd.ClientHeight:=sc.Height;
     bsd.ClientWidth:=sc.width;
     bsd.Position:=poScreenCenter;
     memo1.Top:=(bsd.ClientHeight div 2)- 100;
     memo1.Width:=bsd.ClientWidth;

end;

procedure Tbsd.FormKeyPress(Sender: TObject; var Key: Char);
begin
     bsd.Close;
     //bsd.destroy;
end;

procedure Tbsd.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
     bsd.Close;
     //bsd.destroy;
end;

end.
