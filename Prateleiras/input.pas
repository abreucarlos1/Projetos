unit input;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  Tfrminput = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frminput: Tfrminput;

implementation

uses Impressao;

{$R *.DFM}

procedure Tfrminput.Button2Click(Sender: TObject);
begin
     close;
end;

procedure Tfrminput.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     action:=cafree;
end;

procedure Tfrminput.Button1Click(Sender: TObject);
begin
     application.CreateForm(TFrmimp,Frmimp);
     frmimp.ShowModal;
end;

end.
