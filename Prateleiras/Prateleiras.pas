unit Prateleiras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls,math, Menus,printers;

type
  TSisPrateleiras = class(TForm)
    Lbtitle: TLabel;
    GBentrada: TGroupBox;
    lbcomp: TLabel;
    MEcomp: TMaskEdit;
    LbLargura: TLabel;
    MElargura: TMaskEdit;
    Lbespess: TLabel;
    Lbquantref: TLabel;
    MEReforco: TMaskEdit;
    Lbespref: TLabel;
    MEEspref: TMaskEdit;
    Meesp: TMaskEdit;
    RGTipo: TRadioGroup;
    GBresult: TGroupBox;
    lbprateleira: TLabel;
    Lbnumref: TLabel;
    EdTipo: TEdit;
    EdNumref: TEdit;
    Lbref: TLabel;
    Edref: TEdit;
    lbmomref: TLabel;
    Edmomref: TEdit;
    Lbcapcarg: TLabel;
    Edcapcarg: TEdit;
    Lbmomcomp: TLabel;
    Edmomcomp: TEdit;
    lbmomlarg: TLabel;
    edmomlarg: TEdit;
    btCalcular: TButton;
    BtCancelar: TButton;
    Btimprimir: TButton;
    Btsair: TButton;
    Lbpeso: TLabel;
    Edpeso: TEdit;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Impressora1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    Opes1: TMenuItem;
    PrinterSetup: TPrinterSetupDialog;
    config1: TMenuItem;
    procedure MeespKeyPress(Sender: TObject; var Key: Char);
    procedure MEEsprefKeyPress(Sender: TObject; var Key: Char);
    procedure RGTipoClick(Sender: TObject);
    procedure BtsairClick(Sender: TObject);
    procedure btCalcularClick(Sender: TObject);
    procedure MEcompKeyPress(Sender: TObject; var Key: Char);
    procedure MElarguraKeyPress(Sender: TObject; var Key: Char);
    procedure MEReforcoKeyPress(Sender: TObject; var Key: Char);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtimprimirClick(Sender: TObject);
    procedure Impressora1Click(Sender: TObject);

    procedure config1Click(Sender: TObject);
  private
    { Private declarations }
     function convmm_m(valor:integer):real; // converte de milimetros em metros 
     function PesoPrat(Comprimento,Largura:integer;Espessura:real):real; // Calcula peso da prateleira
     function PesoRef(comprimento:integer;espreforco:real):real; // calcula peso de referencia
  public
    { Public declarations }
  end;

const
     densidade = 7.85;

var
  SisPrateleiras: TSisPrateleiras;


implementation

uses Impressao, Config, input, splash;

{$R *.DFM}

function TsisPrateleiras.convmm_m(valor:integer):real;
begin
     convmm_m:=valor/1000;
end;

function TsisPrateleiras.PesoPrat(Comprimento,Largura:integer;Espessura:real):real; // Calcula peso da prateleira
const
     desenv1 = 0.058;
     desenv2 = 0.088;
var
   comp,larg:real;
begin
     comp:=convmm_m(comprimento);
     larg:=convmm_m(largura);
     pesoprat:=(comp+desenv1)*(larg+desenv2)*espessura*densidade;
end;

function Tsisprateleiras.PesoRef(comprimento:integer;espreforco:real):real; // calcula peso de referencia
const
     const1 = 0.11;
var
   comp:real;
begin
     comp:=convmm_m(comprimento);
     pesoref:=const1*(comp-0.008)*espreforco*densidade;
end;

procedure TSisPrateleiras.MeespKeyPress(Sender: TObject; var Key: Char);
begin

     if not (key in ['0'..'9']) then
        if (key='.') or (key=',') then
           key:=','
     else
        if key=#13 then
           if rgtipo.itemindex=0 then
              btcalcular.SetFocus
           else
               Mereforco.SetFocus
        else
            key:=#0;

end;

procedure TSisPrateleiras.MEEsprefKeyPress(Sender: TObject; var Key: Char);
begin
     if not (key in ['0'..'9']) then
        if (key='.') or (key=',') then
           key:=','

     else
        if key=#13 then
           btcalcular.SetFocus
        else
            key:=#0;
end;

procedure TSisPrateleiras.RGTipoClick(Sender: TObject);
begin
     if Rgtipo.ItemIndex=0 then
        begin
             lbquantref.Visible:=false;
             mereforco.Visible:=false;
             lbespref.Visible:=false;
             meespref.Visible:=false;
             lbnumref.Visible:=false;
             ednumref.Visible:=false;
             lbref.Visible:=false;
             edref.Visible:=false;
             lbmomref.Visible:=false;
             edmomref.Visible:=false;

        end
     else
        begin
             lbquantref.Visible:=true;
             mereforco.Visible:=true;
             lbespref.Visible:=true;
             meespref.Visible:=true;
             lbnumref.Visible:=true;
             ednumref.Visible:=true;
             lbref.Visible:=true;
             edref.Visible:=true;
             lbmomref.Visible:=true;
             edmomref.Visible:=true;
        end;
end;

procedure TSisPrateleiras.BtsairClick(Sender: TObject);
begin
     if messagedlg('Voce deseja encerrar o programa?',MTinformation,[mbyes,mbno],0)=mryes then
        Sisprateleiras.Close;
end;

procedure TSisPrateleiras.btCalcularClick(Sender: TObject);
var
   d1,d2,d3,wxr,wxc,wxl,dl,adl,jal,jxl,dc,adc,jac,jxc,qc,ql,qr,esp,espref,peso:real;
   comprimento,largura,tipo:integer;
   erro:boolean;
begin
     erro:=false;
     if mecomp.Text='' then
        begin
             messagedlg('O campo Comprimento deve ser preenchido.',Mterror,[mbok],0);
             mecomp.SetFocus;
             erro:=true;
        end
     else
         if melargura.Text='' then
            begin
                 messagedlg('O campo Largura deve ser preenchido.',Mterror,[mbok],0);
                 melargura.SetFocus;
                 erro:=true;
            end
         else
             if meesp.Text='' then
                begin
                     messagedlg('O campo Espessura deve ser preenchido.',Mterror,[mbok],0);
                     meesp.SetFocus;
                     erro:=true;
                end;
         if rgtipo.ItemIndex=1 then
            begin
                 if mereforco.Text='' then
                    begin
                         messagedlg('O campo Quantidade de Reforços deve ser preenchido.',Mterror,[mbok],0);
                         mereforco.SetFocus;
                         erro:=true;
                    end
                 else
                     if meespref.Text='' then
                        begin
                             messagedlg('O campo Espessura do Reforços deve ser preenchido.',Mterror,[mbok],0);
                             meespref.SetFocus;
                             erro:=true;
                        end;
            end;
         if not erro then
            begin
                 comprimento:=strtoint(mecomp.Text);
                 largura:=strtoint(melargura.Text);
                 esp:=strtofloat(meesp.Text);
                 comprimento:=comprimento div 10;
                 largura:=largura div 10;
                 esp:=esp/10;
                 d1:=0.5*largura-7.2;
                 d2:=largura+9.4-4*esp;
                 dl:=(esp*d1+17.25)/d2;
                 d3:=power(esp*d1+17.25,2);
                 adl:=(esp*d3)/d2;
                 jal:=(esp/6)*(227.5-141*esp+(2*largura+38.8)*power(esp,2)-8*power(esp,3));
                 jxl:=jal-adl;
                 wxl:=jxl/(2.5-dl);
                 d1:=0.5*comprimento-5.8;
                 d2:=comprimento+6.6-4*esp;
                 dc:=(esp*d1+10.25)/d2;
                 d3:=power(esp*d1+10.25,2);
                 adc:=(esp*d3)/d2;
                 jac:=(esp/6)*(122.5-99*esp+(2*comprimento+33.2)*power(esp,2)-8*power(esp,3));
                 jxc:=jac-adc;
                 wxc:=jxc/(2.5-dc);
                 if Rgtipo.ItemIndex=0 then
                    begin
                         ql:=8000*wxc/largura;
                         qc:=8000*wxl/comprimento;
                         edtipo.Text:='SEM REFORÇO - Tipo: '+Mecomp.Text+ 'C X '+Melargura.Text+ 'L X '+formatfloat('0.00',strtofloat(MEesp.Text))+ 'Esp (mm)';
                         d1:=ql;
                         peso:=pesoprat(strtoint(mecomp.text),strtoint(melargura.text),strtofloat(meesp.text));
                    end
                 else
                     begin
                          espref:=strtofloat(meespref.Text);
                          espref:=espref/10;
                          wxr:=(4/3)*(2-(2-espref)*power((1-espref),3));
                          tipo:=strtoint(Mereforco.text);
                          qc:=(8800*wxc/largura)*(strtofloat(MEreforco.Text)+0.5);
                          qr:=(8800*(wxl+(strtofloat(mereforco.text)*wxr)))/comprimento;
                          d1:=qr;
                          edmomref.Text:='(WxR) '+formatfloat('0.00',wxr)+' cm³';
                          edref.Text:=formatfloat('0.00',strtofloat(Meespref.Text))+' mm';
                          ednumref.Text:=Mereforco.Text;
                          d2:=pesoref(strtoint(mecomp.text),strtofloat(meespref.text));
                          peso:=pesoprat(strtoint(mecomp.text),strtoint(melargura.text),strtofloat(meesp.text))+d2*strtoint(mereforco.text);;
                          edtipo.Text:='Tipo '+inttostr(tipo)+'R com '+Mecomp.Text+ 'C X '+Melargura.Text+ 'L X '+formatfloat('0.00',strtofloat(MEesp.Text))+ 'Esp (mm)' ;
                     end;
                     edpeso.Text:=formatfloat('0.000',peso)+' Kg';
                     if d1<qc then
                        edcapcarg.Text:='(Qc) '+formatfloat('0.00',d1)+' Kgf'
                     else
                         edcapcarg.Text:='(Qc) '+formatfloat('0.00',qc)+' Kgf';
                     edmomlarg.Text:='(WxL) '+formatfloat('0.00',wxl)+' cm³';
                     edmomcomp.Text:='(WxC) '+formatfloat('0.00',wxc)+' cm³';
                     btimprimir.Enabled:=true;
            end;

end;



procedure TSisPrateleiras.MEcompKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#13 then
        Melargura.SetFocus;
end;

procedure TSisPrateleiras.MElarguraKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key=#13 then
        Meesp.SetFocus;
end;

procedure TSisPrateleiras.MEReforcoKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key=#13 then
        MeEspref.SetFocus;
end;

procedure TSisPrateleiras.BtCancelarClick(Sender: TObject);
begin
     Mecomp.Clear;
     Melargura.Clear;
     Meesp.Clear;
     mereforco.Clear;
     meespref.Clear;
     edpeso.Clear;
     edtipo.Clear;
     edcapcarg.Clear;
     edmomcomp.Clear;
     edmomlarg.Clear;
     edref.Clear;
     ednumref.clear;
     edmomref.Clear;
     rgtipo.ItemIndex:=0;
     rgtipo.SetFocus;
     btimprimir.Enabled:=false;
end;

procedure TSisPrateleiras.BtimprimirClick(Sender: TObject);
begin
     application.CreateForm(Tfrminput,frminput);
     frminput.ShowModal;
end;

procedure TSisPrateleiras.Impressora1Click(Sender: TObject);
begin
     try
        printersetup.Execute;
     except on EPrinter do
            messagedlg('Não existe impressoras disponíveis',mterror,[mbok],0);
     end;
end;

procedure TSisPrateleiras.config1Click(Sender: TObject);
begin
     application.CreateForm(Tfrmconfig,frmconfig);
     frmconfig.ShowModal;
end;

end.


