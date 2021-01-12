unit Impressao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,printers, ExtCtrls, ComCtrls;

type
  Tfrmimp = class(TForm)
    lbdata: TLabel;
    Label1: TLabel;
    Eddata: TEdit;
    Edhora: TEdit;
    btimpressao: TButton;
    btCancelar: TButton;
    PrintDialog: TPrintDialog;
    rich: TRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btconfigClick(Sender: TObject);
    procedure btimpressaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmimp: Tfrmimp;

implementation

uses Prateleiras, input;



{$R *.DFM}

procedure Tfrmimp.FormCreate(Sender: TObject);
Const
     linha = '*';
     espaco = ' ';
var
   arquivo:textfile;
   texto1,texto2,cliente,path,temp1,comp,larg,esp:string;
   i:integer;
begin
     frminput.Close;
     cliente:=frminput.Edit1.Text;
     path:=extractfilepath(application.ExeName);
     if fileExists(path+'\config.ini') then
        begin
             assignfile(arquivo,path+'\Config.ini');
             reset(arquivo);
             readln(arquivo,texto1);
             readln(arquivo,texto2);
             closefile(arquivo);

        end;
     eddata.Text:=datetostr(date);
     edhora.Text:=timetostr(now);
     temp1:='';

     for i:=1 to 120 do
         begin
              temp1:=temp1+linha;
         end;
     rich.Clear;
     //rich.Paragraph.Alignment:=taleftjustify;
     rich.Paragraph.Alignment:=taCenter;
     //rich.Lines.Append(temp1);
     rich.Lines.Append(' ');
     rich.Lines.Append(' ');
     rich.Lines.Append(texto1);
     //rich.Lines.Append(temp1);
     rich.Lines.Append(' ');
     rich.Lines.Append(' ');
     rich.Lines.Append(' ');
     rich.Paragraph.Alignment:=taleftjustify;
     rich.Lines.Append('          Cliente: '+cliente);
     rich.Lines.Append('          Responsável Técnico: '+texto2);

     rich.Lines.Append('          Data: '+eddata.text);
     rich.Lines.Append('          Hora: '+edhora.text);
     rich.Paragraph.Alignment:=tacenter;
     //rich.Lines.Append(temp1);
     rich.Lines.Append(' ');
     rich.Lines.Append(' ');
     rich.Lines.Append('Características Técnicas da Prateleira');
     rich.Lines.Append(' ');
     rich.Lines.Append(' ');
     rich.Lines.Append(' ');
     rich.Paragraph.Alignment:=taleftjustify;
     comp:=sisprateleiras.MEcomp.text;
     larg:=sisprateleiras.MElargura.text;
     esp:=formatfloat('0.00',strtofloat(sisprateleiras.Meesp.text));
     if sisprateleiras.Edref.Text<>'' then
        rich.lines.append('          Prateleira Tipo: R'+sisprateleiras.MEReforco.Text+' de '+comp+'C X '+larg+'L X '+esp+'E  (mm)')
     else
         rich.lines.append('         Prateleira Tipo: R0 de '+comp+'C X '+larg+'L X '+esp+'E  (mm)');
     rich.Lines.Append(' ');
     rich.Lines.Append('          Comprimento: '+comp);
     rich.Lines.Append(' ');
     rich.Lines.Append('          Largura: '+larg);
     rich.Lines.Append(' ');
     rich.Lines.Append('          Espessura: '+esp);
     rich.Lines.Append(' ');
     if sisprateleiras.Edref.Text<>'' then
        begin
             rich.Lines.Append('          Número de reforço(s): '+sisprateleiras.Mereforco.text);
             rich.Lines.Append(' ');
             rich.Lines.Append('          Espessura do Reforço: '+sisprateleiras.Edref.Text);
             rich.Lines.Append(' ');
        end;
     rich.Lines.Append('          Capacidade de Carga: '+sisprateleiras.Edcapcarg.Text);
     rich.Lines.Append(' ');
     rich.Lines.Append('          Peso Total: '+sisprateleiras.Edpeso.Text);
     rich.Lines.Append(' ');
     rich.Lines.Append('          Momento de Resistência Do Comprimento: '+sisprateleiras.Edmomcomp.Text);
     rich.Lines.Append(' ');
     rich.Lines.Append('          Momento de Resistência Da Largura: '+sisprateleiras.edmomöööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööö