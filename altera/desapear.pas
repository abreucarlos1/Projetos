unit desapear;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Phantom, ExtCtrls, StdCtrls, Ftpcli, FileCtrl;

type
  TForm1 = class(TForm)
    Phantom1: TPhantom;
    Timer1: TTimer;
    Button1: TButton;
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure DirectoryListBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }


  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormActivate(Sender: TObject);
begin
     //phantom1.Visible:=false;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
     phantom1.Visible:=true;
end;


procedure TForm1.DirectoryListBox1Change(Sender: TObject);
begin
     filelistbox1.ApplyFilePath(directoryListBox1.Directory);
end;

end.
