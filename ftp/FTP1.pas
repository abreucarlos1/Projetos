unit FTP1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OleCtrls, isp3;

type
  TForm1 = class(TForm)
    FTP1: TFTP;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
     ftp1.Connect('ftp.hpg.com.br',21);
     ftp1.Authenticate('pacg4','12345');
end;

end.
