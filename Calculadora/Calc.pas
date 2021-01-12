unit Calc;
{ Programa realizado por Frederico Delso Lopes Triboni
RGM: 162542
Turma: 4EN
Professor: Luiz Sergio Heinzelmann
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls,Math, Buttons;

type
  TFrmCalc = class(TForm)
    PNDisp: TPanel;
    Panel2: TPanel;
    Bt0: TButton;
    Btpoint: TButton;
    Btsinal: TButton;
    Bt1: TButton;
    Bt2: TButton;
    Bt3: TButton;
    Bt4: TButton;
    Bt5: TButton;
    Bt6: TButton;
    Bt7: TButton;
    Bt8: TButton;
    Bt9: TButton;
    BtDiv: TButton;
    Btmult: TButton;
    BtSub: TButton;
    BtSoma: TButton;
    BTigual: TButton;
    BTC: TButton;
    BTAC: TButton;
    Panel1: TPanel;
    BTMC: TButton;
    BTMR: TButton;
    BTMAdd: TButton;
    BTBxy: TBitBtn;
    LBM: TLabel;
    Btbraiz: TBitBtn;
    BTBlog: TBitBtn;
    BTBex: TBitBtn;
    btbpi: TBitBtn;
    btpercent: TButton;
    BTBSIN: TBitBtn;
    BTBSininv: TBitBtn;
    BtbCos: TBitBtn;
    BtbCosInv: TBitBtn;
    BtbTan: TBitBtn;
    BtbTanInv: TBitBtn;
    Lboper: TLabel;
    Btbmod: TBitBtn;
    BtbBin: TBitBtn;
    LBTipo: TLabel;
    Btbdec: TBitBtn;
    BtbHex: TBitBtn;
    Btboct: TBitBtn;
    Btband: TBitBtn;
    btbor: TBitBtn;
    Btbxor: TBitBtn;
    btb2nd: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lb2nd: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtDivClick(Sender: TObject);
    procedure Bt0Click(Sender: TObject);
    procedure Bt1Click(Sender: TObject);
    procedure Bt2Click(Sender: TObject);
    procedure Bt3Click(Sender: TObject);
    procedure Bt4Click(Sender: TObject);
    procedure Bt5Click(Sender: TObject);
    procedure Bt6Click(Sender: TObject);
    procedure Bt7Click(Sender: TObject);
    procedure Bt8Click(Sender: TObject);
    procedure Bt9Click(Sender: TObject);
    procedure BtSomaClick(Sender: TObject);
    procedure BtSubClick(Sender: TObject);
    procedure BtmultClick(Sender: TObject);
    procedure BTigualClick(Sender: TObject);
    procedure BtpointClick(Sender: TObject);
    procedure BtsinalClick(Sender: TObject);
    procedure BTCClick(Sender: TObject);
    procedure BTACClick(Sender: TObject);
    procedure BTMCClick(Sender: TObject);
    procedure BTMRClick(Sender: TObject);
    procedure BTMAddClick(Sender: TObject);
    procedure BTBxyClick(Sender: TObject);
    procedure BtbraizClick(Sender: TObject);
    procedure BTBlogClick(Sender: TObject);
    procedure BTBexClick(Sender: TObject);
    procedure btbpiClick(Sender: TObject);
    procedure btpercentClick(Sender: TObject);
    procedure BTBSINClick(Sender: TObject);
    procedure BTBSininvClick(Sender: TObject);
    procedure BtbCosClick(Sender: TObject);
    procedure BtbCosInvClick(Sender: TObject);
    procedure BtbTanClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtbTanInvClick(Sender: TObject);
    procedure BtbmodClick(Sender: TObject);
    procedure BtbBinClick(Sender: TObject);
    procedure BtbdecClick(Sender: TObject);
    procedure BtbHexClick(Sender: TObject);
    procedure BtboctClick(Sender: TObject);
    procedure BtbandClick(Sender: TObject);
    procedure btborClick(Sender: TObject);
    procedure BtbxorClick(Sender: TObject);
    procedure btb2ndClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazOperacao; //obt�m o primeiro operando e calcula conforme operecao
    Procedure Calcular(Op:Byte); //Calcula conforme opera��o
    Function funcoes(func:byte):string; //Calcula as fun��es cient�ficas
    function fatorial(n:longint):longint; //Calcula o fatorial de n
    function randomico:extended; // Gera n�meros rand�micos
    Procedure TeclaPress(Tecla:string); //Verifica a tecla pressionada
    Procedure Operacoes(Oper:string); //Verifica a opera��o escolhida
    Function floattobin(float:extended):string; //Converte de Decimal -> Bin�rio
    function bintofloat(bin:string):extended; //Converte de Bin�rio -> Decimal
    function floattohex(float:extended):string; //Converte de Decimal -> Hexadecimal
    function hextofloat(hex:string):extended; //Converte de Hexadecimal -> Decimal
    Function floattooct(float:extended):string; //Converte de Decimal -> Octal
    function octtofloat(oct:string):extended; //Converte de Octal -> Decimal

  public
    { Public declarations }
  end;

var
  FrmCalc: TFrmCalc;
  num1,num2,num3,result,mem1:Extended; //Variaveis Globais
  i,j:integer; //Usados no mod
  Operation:byte; //1=soma, 2=subtr., 3=Multip., 4=div.
  ponto,ok,Xy,erro,restdiv:boolean; //Variaveis de controle


implementation

{$R *.DFM}

Procedure TFrmCalc.FazOperacao;
var
   n1:string;
begin
     //Se erro for verdadeiro
     if erro then
        //Ent�o sai da rotina
        exit;
     //Faz a convers�o antes da opera��o
     if lbtipo.Caption='HEX' then
        n1:=floattostr(hextofloat(pndisp.caption))
     else
         if lbtipo.caption='BIN' then
            n1:=floattostr(bintofloat(pndisp.caption))
         else
             if lbtipo.caption='OCT' then
                n1:=floattostr(octtofloat(pndisp.caption))
             else
                 n1:=pndisp.caption;
     //Se opera��o igual a Zero
     if operation=0 then
        //Ent�o num1 recebe conte�do do pndisp
        num1:=StrToFloat(n1)//pndisp
     else
         begin
              //Se n�o, num2 recebe conte�do do pndisp
              num2:=StrToFloat(n1);//pndisp
              //Calcula, conforme opera��o
              Calcular(Operation);
         end;
     //Ok � verdadeira
     Ok:=True;
     //Ponto flutuante � falso
     ponto:=False;
end;

Procedure TFrmCalc.Calcular(Op:byte);
begin
     //Caso Op seja....
     case Op of
          //Soma
          1: Result:=(num1+num2);
          //Subtra��o
          2: Result:=(num1-num2);
          //Multiplica��o
          3: Result:=(num1*num2);
          //Divis�o
          4: begin
                  //Verifica se � divis�o por Zero
                  if num2=0 then
                     begin
                          //Se for, erro � verdadeiro
                          erro:=true;
                          //Result � zero
                          Result:=0;
                     end
                  else
                      //Se n�o, faz a divis�o
                      Result:=(num1/num2);
              end;
           5: Result:=(Variant(num1) and Variant(num2));
           6: Result:=(Variant(num1) or Variant(num2));
           7: Result:=(Variant(num1) xor Variant(num2));
          else
              //Se n�o, sai da rotina
              exit;
     end;
     //Num1 recebe o conte�do de result
     num1:=result;
     //Nenhuma Opera��o
     Operation:=0;
end;

procedure Tfrmcalc.TeclaPress(Tecla:string);
begin
     //Se erro for verdadeiro
     if erro then
        //Ent�o sai da rotina
        exit;
     //Se pndisp=0
     if (pndisp.Caption='0') then
        //Ent�o pndisp=''
        pndisp.Caption:='';
     //Se Ok E N�O for ponto flutuante
     if (Ok and not ponto) then
        begin
             //Ent�o pndisp=''
             pndisp.Caption:='';
             //OK = falso
             Ok:=False;
        end;
     //Se tamanho de pndisp maior ou igual a 30
     if Length(pndisp.Caption)>=30 then
        //Ent�o sai
        exit;
     //pndisp recebe o conte�do de pndisp + Tecla
     pndisp.Caption:=pndisp.Caption+Tecla;
end;

Procedure TFrmCalc.Operacoes(Oper:string);
begin
     //Se Ok for verdadeiro E Num2 for diferente de 0
     if Ok and (num2<>0)  then
        //Ent�o sai da sub-rotina
        exit;
     //Faz a opera��o
     FazOperacao;
     //Se Oper � igual a +
     if Oper='+' then
        //Ent�o atribui 1 a operation
        Operation:=1
     else
         //Se n�o, se Oper � igual a -
         if Oper='-' then
            //Ent�o atribui 2 a operation
            Operation:=2
         else
             //Se n�o, se Oper � igual a *
             if Oper='*' then
                //Ent�o atribui 3 a operation
               Operation:=3
             else
                 //Se n�o, se Oper � igual a /
                 if Oper='/' then
                    //Ent�o atribui 4 a operation
                    Operation:=4
                 else
                     //Se n�o, se Oper � igual a & (AND)
                     if Oper='&' then
                        //Ent�o atribui 5 a operation
                        Operation:=5
                     else
                         //Se n�o, se Oper � igual a ^ (Or)
                         if oper='^' then
                            //Ent�o atribui 6 a operation
                            operation:=6
                         else
                             //Se n�o, se Oper � igual a @ (Xor)
                             if oper='@' then
                                //Ent�o atribui 7 a operation
                                operation:=7;
     //Se oper = AND
     if oper='&' then
        //Ent�o oper = && (1 & s� mostra underline)
        oper:='&&';
     //Mostra a opera��o no label oper
     lboper.Caption:=oper;
end;

function TfrmCalc.funcoes(func:byte):string;
var
   res:extended;
begin
     //Se display for igual a zero OU ocorreu um erro
     if (pndisp.Caption='') or erro then
        begin
             //Ent�o retorna erro
             funcoes:='Erro';
             //Sai da sub-rotina
             exit;
        end;
     //Res recebe o conteudo de display
     res:=strtofloat(pndisp.caption);
     //Tenta fazer at� que uma excess�o ocorrer
     try
        //Caso func for...
        case func of
             //1 = Quadrado
             1:funcoes:=FloatToStr(sqr(res));
             //2 = Raiz Quadrada
             2:funcoes:=FloatToStr(sqrt(res));
             //3 = Logaritmo na base 10
             3:funcoes:=FloatToStr(log10(res));
             //4 = Logaritimo Neperiano
             4:funcoes:=FloatToStr(Ln(res));
             //5 = Exponencial
             5:funcoes:=FloatToStr(exp(res));
             //6 = Inverso
             6:funcoes:=Floattostr(1/res);
             //7 = Pot�ncia x^y
             7://Se n�o for potencia
               if not xy then
                  begin
                       //Ent�o potencia xy � verdadeiro
                       xy:=True;
                       //Num1 recebe conteudo do display
                       num1:=res;
                       //Display recebe zero
                       funcoes:='0';
                  end
               else
                   begin
                        //Se n�o, potencia xy recebe falso
                        xy:=False;
                        //Mostra conteudo de num1 no display
                        funcoes:=FloatToStr(num1);
                   end;
             //8 = Seno
             8:funcoes:=FloatToStr(sin(res*pi/180));
             //9 = Arco Seno (Seno inverso)
             9:begin
                    if (res<-1)or(res>1) then
                       begin
                            funcoes:='0';
                            exit;
                       end;
                    funcoes:=floattostr(ArcSin(res)*180/pi);
               end;
             //10 = Coseno
             10:funcoes:=FloatToStr(cos(res*pi/180));
             //11 = Arco Coseno (Coseno inverso)
             11:begin
                    if (res<-1)or(res>1) then
                       begin
                            funcoes:='0';
                            exit;
                       end;
                    funcoes:=floattostr(ArcCos(res)*180/pi);
               end;
             //12 = Tangente
             12:funcoes:=FloatToStr(Tan(res*pi/180));
             //13 = Arco Tangente (Tangente inverso)
             13:funcoes:=floattostr(ArcTan(res)*180/pi);
             //14 = Seno Hiperb�lico
             14:funcoes:=floattostr(sinh(res));
             //15 = Coseno Hiperb�lico
             15:funcoes:=floattostr(cosh(res));
             //16 = Tangente Hiperb�lico
             16:funcoes:=floattostr(tanh(res));
             //17 = Arco Seno Hiperb�lico
             17:funcoes:=floattostr(arcsinh(res));
             //18 = Arco Coseno Hiperb�lico
             18:funcoes:=floattostr(arccosh(res));
             //19 = Arco Tangente Hiperb�lico
             19:funcoes:=floattostr(arctanh(res));
             //20 = Fatorial
             20:funcoes:=floattostr(fatorial(strtoint(pndisp.caption)));
             //21 = Randomico
             21:funcoes:=floattostr(randomico);
             //22 = Arredondamento para cima
             22:funcoes:=inttostr(ceil(res));
             //23 = Arredondamento para baixo
             23:funcoes:=inttostr(floor(res));
             //24 = CoTangente
             24:funcoes:=floattostr(cotan(res));
             //25 = Log na Base 2
             25:funcoes:=floattostr(log2(res));

        end;
     Except
           begin
                //Ocoreu excess�o, erro � verdadeiro
                erro:=true;
                //Retorna Erro
                funcoes:='Erro';
                //Sai sub rotina
                exit;
           end;
     end;
end;

function Tfrmcalc.fatorial(n:longint):longint;
var
   x,j:longint;
begin
     if n=0 then
        n:=1;
     //J recebe 1
     j:=1;
     //Para x igual a 1 at� n fa�a
     for x:=1 to n do
         //J recebe valor de j*x
         j:=j*x;
     //Retorna valor de j
     fatorial:=j;
end;

function tfrmcalc.randomico:extended;
begin
     //Gera semente aleat�ria
     Randomize;
     //Retorna o valor de Random 
     randomico:=(random(1000)+1)/1000;
end;

function Tfrmcalc.floattobin(float:extended):string;
var
   pilha: array [1..25] of string;// Pilha para parte inteira
   decimal: array [1..25] of string;// Pilha para parte flutuante
   i, inteiro,count: integer;
   deci:extended;
   ftstr: string;
   iszero:boolean;
begin
     //Inicializa variaveis
     iszero:=false;
     count:=1;
     ftstr:='';
     // Para i=1 at� tamanho da pilha
     for i:=1 to 25 do
         begin
              //Preenche a pilha com Vazio (inicializa��o das pilhas)
              pilha[i]:='';
              decimal[i]:='';
         end;
     //Inteiro recebe parte inteira do numero
     inteiro:=trunc(float);
     //Dec recebe a parte flutuante do numero
     deci:=frac(float);
     // Se inteiro for zero
     if inteiro=0 then
        begin
             //Ent�o iszero � verdadeiro
             iszero:=true;
             //Primeira posi��o da pilha recebe zero
             pilha[1]:='0';
        end;
     //Enquanto N�O for zero fa�a
     while not iszero do
           begin
                //Pilha[count] recebe o resto da divis�o
                pilha[count]:=inttostr(inteiro mod 2);
                //Inteiro recebe a divis�o inteira de inteiro por 2
                inteiro:=inteiro div 2;
                //Se inteiro for zero
                if inteiro=0 then
                   //Ent�o iszero � verdadeiro
                   iszero:=true;
                //Incrementa count
                inc(count);
           end;
     //Se dec for diferente de Zero
     if (deci<>0) then
        //Ent�o ponto � verdadeiro
        ponto:=true;
     //Para i = count decrementando at� 1 fa�a
     for i:=count downto 1 do
         //ftstr recebe ftstr + conteudo da pilha[i]
         ftstr:=ftstr+pilha[i];
     //Se ponto for verdadeiro
     if ponto then
        begin
             //i = 1
             i:=1;
             while (i<=12) and (deci>0) do
                 begin
                      //deci recebe a parte flutuante de deci * 2
                      deci:=frac(deci)*2;
                      //Decimal[i] recebe a parte inteira de deci
                      decimal[i]:=inttostr(trunc(deci));
                      inc(i);
                 end;
             //Coloca o ponto flutuante em ftstr
             ftstr:=ftstr+',';
             //Para i = 1 at� i-2
             for count:=1 to i-2 do
                 //ftstr recebe ftstr + conteudo de decimal[i]
                 ftstr:=ftstr+decimal[count];
        end;
     if ftstr='' then
        ftstr:='0';
     //Retorna o valor de ftstr
     floattobin:=ftstr;
end;

function Tfrmcalc.bintofloat(bin:string):extended;
var
   i,j,counti,countd,cnt,tam:integer;
   inteiro,decimal:string;
   soma:extended;
begin
     //Inicializa as variaveis
     i:=1;
     counti:=1;
     countd:=1;
     soma:=0;
     inteiro:='';
     decimal:='';
     //Tam recebe o tamanho da string Bin
     tam:=length(bin);
     //Enquanto Tam maior ou igual a i E conteudo de bin[i] for  diferente de ponto fa�a
     while (tam>=i) and (bin[i]<>',') do
           begin
                //inteiro recebe inteiro + conteudo de bin[i]
                inteiro:=inteiro+bin[i];
                //Incrementa i e counti
                inc(i);
                inc(counti);
           end;
     //Se conteudo de Bin tiver virgula
     if bin[counti]=',' then
        //Ent�o ponto flutuante � verdadeiro
        ponto:=true
     else
         //Se n�o, � falso
         ponto:=false;
     //cnt recebe counti+1
     cnt:=counti+1;
     //Se tiver ponto flutuante
     if ponto  then
        //Ent�o, enquanto conteudo de bin[cnt] for diferente de vazio fa�a
        while (bin[cnt]<>'') do
              begin
                   //Decimal recebe decimal + conteudo de bin[cnt]
                   decimal:=decimal+bin[cnt];
                   //Incremente countd e cnt
                   inc(countd);
                   inc(cnt);
              end;
     //J recebe counti-2
     j:=counti-2;
     //Para i = 1 at� counti-1 fa�a
     for i:=1 to counti-1 do
         begin
              //Soma recebe soma + conteudo de inteiro[i] * potencia 2^j
              soma:=soma+(strtoint(inteiro[i])*power(2,j));
              //Decrementa j
              dec(j);
         end;
     //Se decimal for diferente de Vazio
     if ponto then
        begin
             //Ent�o , J recebe 1
             j:=1;
             //Para i = 1 at� countd-1 fa�a
             for i:=1 to countd-1 do
                 begin
                      //Soma recebe soma + conteudo de decimal[i] * potencia 2^j*-1
                      soma:=soma+(strtoint(decimal[i])*power(2,j*-1));
                      //Incrementa j
                      inc(j);
                 end;
        end;
     //Retorna o resultado de soma
     bintofloat:=soma;
end;

function TFrmcalc.floattohex(float:extended):string;
var
   dectohex: array [0..15] of string;
   pilha: array [1..25] of string;// Pilha para parte inteira
   decimal: array [1..25] of string;// Pilha para parte flutuante
   i, inteiro,count: integer;
   deci:extended;
   ftstr: string;
   iszero:boolean;
begin
     for i:=0 to 15 do
         dectohex[i]:=inttohex(i,1);
     //Inicializa variaveis
     iszero:=false;
     count:=1;
     ftstr:='';
     // Para i=1 at� tamanho da pilha
     for i:=1 to 25 do
         begin
              //Preenche a pilha com Vazio (inicializa��o das pilhas)
              pilha[i]:='';
              decimal[i]:='';
         end;
     //Inteiro recebe parte inteira do numero
     inteiro:=trunc(float);
     //Dec recebe a parte flutuante do numero
     deci:=frac(float);
     // Se inteiro for zero
     if inteiro=0 then
        begin
             //Ent�o iszero � verdadeiro
             iszero:=true;
             //Primeira posi��o da pilha recebe zero
             pilha[1]:='0';
        end;
     //Enquanto N�O for zero fa�a
     while not iszero do
           begin
                //Pilha[count] recebe o resto da divis�o
                pilha[count]:=inttostr(inteiro mod 16);
                //Inteiro recebe a divis�o inteira de inteiro por 16
                inteiro:=inteiro div 16;
                //Se inteiro for zero
                if inteiro=0 then
                   //Ent�o iszero � verdadeiro
                   iszero:=true;
                //Incrementa count
                inc(count);
           end;
     //Se dec for diferente de Zero
     if (deci<>0) then
        //Ent�o ponto � verdadeiro
        ponto:=true;
     //Para i = count decrementando at� 1 fa�a
     for i:=count-1 downto 1 do
         begin
              //ftstr recebe ftstr + conteudo da pilha[i]
              ftstr:=ftstr+dectohex[strtoint(pilha[i])];
         end;
     //Se ponto for verdadeiro
     if ponto then
        begin
             //i = 1
             i:=1;
             while (i<=12) and (deci>0) do
                 begin
                      //deci recebe a parte flutuante de deci * 16
                      deci:=frac(deci)*16;
                      //Decimal[i] recebe a parte inteira de deci
                      decimal[i]:=inttostr(trunc(deci));
                      inc(i);
                 end;
             //Coloca o ponto flutuante em ftstr
             ftstr:=ftstr+',';
             //Para i = 1 at� i-2
             for count:=1 to i-2 do
                 //ftstr recebe ftstr + conteudo de decimal[i]
                 ftstr:=ftstr+dectohex[strtoint(decimal[count])];
        end;
     //Se o resultado for vazio ou zero
     if (ftstr='') or (ftstr='0') then
        //Ent�o ftstr recebe Zero
        ftstr:='0';
     //Retorna o valor de ftstr
     floattohex:=ftstr;

end;

function Tfrmcalc.hextofloat(hex:string):extended;
var
   i,j,k,counti,countd,cnt,tam:integer;
   dectohex: array [0..15] of string;
   inteiro,decimal: string;
   soma:extended;
begin
     //Inicializa as variaveis
     for i:=0 to 15 do
         dectohex[i]:=inttohex(i,1);
     i:=1;
     counti:=1;
     countd:=1;
     soma:=0;
     inteiro:='';
     decimal:='';
     //Tam recebe o tamanho da string Hex
     tam:=length(hex);
     //Enquanto Tam maior ou igual a i E conteudo de hex[i] for  diferente de ponto fa�a
     while (tam>=i) and (hex[i]<>',') do
           begin
                //inteiro recebe inteiro + conteudo de hex[i]
                inteiro:=inteiro+hex[i];
                //Incrementa i e counti
                inc(i);
                inc(counti);
           end;
     //Se conteudo de HEX tiver virgula
     if hex[counti]=',' then
        //Ent�o ponto flutuante � verdadeiro
        ponto:=true
     else
         //Se n�o, � falso
         ponto:=false;
     //cnt recebe counti+1
     cnt:=counti+1;
     //Se tiver ponto flutuante
     if ponto then
        //Ent�o, enquanto conteudo de Hex[cnt] for diferente de vazio fa�a
        while hex[cnt]<>'' do
              begin
                   //Decimal recebe decimal + conteudo de Hex[cnt]
                   decimal:=decimal+hex[cnt];
                   //Incremente countd e cnt
                   inc(countd);
                   inc(cnt);
              end;
     //J recebe counti-2
     j:=counti-2;
     //Para i = 1 at� counti-1 fa�a
     for i:=1 to counti-1 do
         begin
              //Para k = 0 at� 15 (0 a F)
              for k:=0 to 15 do
                  //Se conteudo de dectohex=conteudo de inteiro
                  if dectohex[k]=inteiro[i] then
                     begin
                          //Ent�o soma recebe soma + k * potencia 16^j
                          soma:=soma+(k*power(16,j));
                          //Termina o loop caso encontre o valor correspondente ao valor convertido
                          break;
                       end;
              //Decrementa j
              dec(j);
         end;
     //Se tiver ponto flutuante
     if ponto then
        begin
             //Ent�o J recebe 1
             j:=1;
             //Para i = 1 at� countd-1 fa�a
             for i:=1 to countd-1 do
                 begin
                      //Para k=0 at� 15 (0 a F)
                      for k:=0 to 15 do
                          //Se conteudo de dectohex = conteudo de decimal
                          if dectohex[k]=decimal[i] then
                             begin
                                  //Ent�o soma recebe soma + k * potencia 16^j*-1
                                  soma:=soma+(k*power(16,j*-1));
                                  //Termina o loop caso encontre o valor correspondente ao valor convertido
                                  break;
                             end;
                      //Incrementa j
                      inc(j);
                 end;
        end;
     //Retorna o resultado de soma
     hextofloat:=soma;
end;

function Tfrmcalc.floattooct(float:extended):string;
var
   pilha: array [1..25] of string;// Pilha para parte inteira
   decimal: array [1..25] of string;// Pilha para parte flutuante
   i, inteiro,count: integer;
   deci:extended;
   ftstr: string;
   iszero:boolean;
begin
     //Inicializa variaveis
     iszero:=false;
     count:=1;
     ftstr:='';
     // Para i=1 at� tamanho da pilha
     for i:=1 to 25 do
         begin
              //Preenche a pilha com Vazio (inicializa��o das pilhas)
              pilha[i]:='';
              decimal[i]:='';
         end;
     //Inteiro recebe parte inteira do numero
     inteiro:=trunc(float);
     //Dec recebe a parte flutuante do numero
     deci:=frac(float);
     // Se inteiro for zero
     if inteiro=0 then
        begin
             //Ent�o iszero � verdadeiro
             iszero:=true;
             pilha[1]:='0';
        end;
     //Enquanto N�O for zero fa�a
     while not iszero do
           begin
                //Pilha[count] recebe o resto da divis�o por 8
                pilha[count]:=inttostr(inteiro mod 8);
                //Inteiro recebe a divis�o inteira de inteiro por 8
                inteiro:=inteiro div 8;
                //Se inteiro for zero
                if inteiro=0 then
                   //Ent�o iszero � verdadeiro
                   iszero:=true;
                //Incrementa count
                inc(count);
           end;
     //Se dec for diferente de Zero
     if (deci<>0) then
        //Ent�o ponto � verdadeiro
        ponto:=true;
     //Para i = count decrementando at� 1 fa�a
     for i:=count downto 1 do
         //ftstr recebe ftstr + conteudo da pilha[i]
         ftstr:=ftstr+pilha[i];
     //Se ponto for verdadeiro
     if ponto then
        begin
             //i = 1
             i:=1;
             while (i<=12) and (deci>0) do
                 begin
                      //deci recebe a parte flutuante de deci * 8
                      deci:=frac(deci)*8;
                      //Decimal[i] recebe a parte inteira de deci
                      decimal[i]:=inttostr(trunc(deci));
                      //Incrementa i
                      inc(i);
                 end;
             //Coloca o ponto flutuante em ftstr
             ftstr:=ftstr+',';
             //Para i = 1 at� i-2
             for count:=1 to i-2 do
                 //ftstr recebe ftstr + conteudo de decimal[count]
                 ftstr:=ftstr+decimal[count];
        end;
     if ftstr='' then
        ftstr:='0';
     //Retorna o valor de ftstr
     floattooct:=ftstr;
end;

function Tfrmcalc.octtofloat(oct:string):extended;
var
   i,j,counti,countd,cnt,tam:integer;
   inteiro,decimal: string;
   soma:extended;
begin
     //Inicializa as variaveis
     i:=1;
     counti:=1;
     countd:=1;
     soma:=0;
     inteiro:='';
     decimal:='';
     //Tam recebe o tamanho da string Oct
     tam:=length(oct);
     //Enquanto Tam maior ou igual a i E conteudo de Oct[i] for  diferente de ponto fa�a
     while (tam>=i) and (oct[i]<>',') do
           begin
                //inteiro recebe inteiro + conteudo de Oct[i]
                inteiro:=inteiro+oct[i];
                //Incrementa i e counti
                inc(i);
                inc(counti);
           end;
     //Se conteudo de Bin tiver virgula
     if oct[counti]=',' then
        //Ent�o ponto flutuante � verdadeiro
        ponto:=true
     else
         //Se n�o, � falso
         ponto:=false;
     //cnt recebe counti+1
     cnt:=counti+1;
     //Se tiver ponto flutuante
     if ponto then
        //Enquanto conteudo de oct[cnt] for diferente de vazio fa�a
        while oct[cnt]<>'' do
              begin
                   //Decimal recebe decimal + conteudo de oct[cnt]
                   decimal:=decimal+oct[cnt];
                   //Incremente countd e cnt
                   inc(countd);
                   inc(cnt);
              end;
     //J recebe counti-2
     j:=counti-2;
     //Para i = 1 at� counti-1 fa�a
     for i:=1 to counti-1 do
         begin
              //Soma recebe soma + conteudo de inteiro[i] * potencia 8^j
              soma:=soma+(strtoint(inteiro[i])*power(8,j));
              //Decrementa j
              dec(j);
         end;
     //Se tiver ponto flutuante
     if ponto then
        begin
             //Ent�o, J recebe 1
             j:=1;
             //Para i = 1 at� countd-1 fa�a
             for i:=1 to countd-1 do
                 begin
                      //Soma recebe soma + conteudo de inteiro[i] * potencia 8^j*-1
                      soma:=soma+(strtoint(decimal[i])*power(8,j*-1));
                      //Incrementa j
                      inc(j);
                 end;
        end;
     //Retorna o resultado de soma
     octtofloat:=soma;
end;

procedure TFrmCalc.FormCreate(Sender: TObject);
begin
     //Inicializa as vari�veis ao criar o formul�rio
     pndisp.Caption:='0'; //Display
     num1:=0; //Variavel do primeiro n�mero
     num2:=0; //Variavel do segundo n�mero
     Mem1:=0; //Variavel mem�ria
     i:=0; //Variavel mod
     j:=0; //Variavel mod
     restdiv:=false; //Indica resto da divisao (mod)
     ponto:=false; //Indica ponto flutuante caso verdadeiro
     Xy:=False; //Indica que � func�o Pot�ncia caso verdadeiro
     Operation:=0; //Indica a opera��o a fazer, 0 indica nenhuma opera��o
     Result:=0; //Variavel resultado das opera�oes
     ok:=true; //Variavel que indica que algum digito ou fun��o foi digitado se falso;
     //Hints dos bot�es
     btb2nd.Hint:='Ativa a segunda Fun��o.'+#10#13+'A em Hexadecimal.';
     btbpi.Hint:='Constante Pi.'+#10#13+'N�meros Rand�micos.'+#10#13+'B em Hexadecimal.';
     btbsin.Hint:='Seno de um angulo.'+#10#13+'Seno Hiperb�lico de um angulo.';
     btbsininv.Hint:='Arco Seno de um angulo.'+#10#13+'Arco Seno Hiperb�lico de um angulo.';
     btbdec.Hint:='Converte para decimal.';
     btbxy.Hint:='N�mero elevado a pot�ncia y.'+#10#13+'Fatorial de um n�mero.'+#10#13+'C em Hexadecimal.';
     btbraiz.Hint:='Raiz quadrada de um n�mero.'+#10#13+'N�mero elevado ao quadrado.'+#10#13+'D em Hexadecimal.';
     btbcos.Hint:='Coseno de um angulo.'+#10#13+'Coseno Hiperb�lico de um angulo.';
     btbcosinv.Hint:='Arco Coseno de um angulo.'+#10#13+'Arco Coseno Hiperb�lico de um angulo.';
     btbbin.Hint:='Converte para bin�rio.';
     btblog.Hint:='Logaritmo na base 10 de um n�mero.'+#10#13+'Logaritmo Natural de um n�mero.'+#10#13+'E em Hexadecimal.';
     btbex.Hint:='Constante E elevado a um n�mero.'+#10#13+'Inverso de um n�mero.'+#10#13+'F em Hexadecimal.';
     btbtan.Hint:='Tangente de um angulo.'+#10#13+'Tangente Hiperb�lico de um angulo.';
     btbtaninv.Hint:='Arco Tangente de um angulo.'+#10#13+'Arco Tangente Hiperb�lico de um angulo.';
     btbhex.Hint:='Converte para hexadecimal.';
     btband.Hint:='Opera��o L�gica E entre 2 n�meros.'+#10#13+'Arredondamento para cima.';
     btbor.Hint:='Opera��o L�gica OU entre 2 n�meros.'+#10#13+'Arredondamento para baixo.';
     btbxor.Hint:='Opera��o L�gica OU-EXCLUSIVO entre 2 n�meros.'+#10#13+'Cotangente de um angulo.';
     btbmod.Hint:='Resto da divis�o entre 2 n�meros.'+#10#13+'Logaritmo na base 2 de um n�mero.';
     btboct.Hint:='Converte para Octal.';
end;

procedure TFrmCalc.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin
     //Se tecla tem valor ASCII entre 47 e 58
     if (key>47) and (key<58) then
        //Ent�o, a tecla pressionada � um numero de 0~9
        teclapress(inttostr(key-48))
     else
         //Se n�o, se tecla for BackSpace
         if key=8 then
            //Ent�o pressiona btc (bot�o corrige)
            btc.Click;
end;

procedure TFrmCalc.FormKeyPress(Sender: TObject; var Key: Char);
begin
     //Testa se a tecla pressionada equivale a alguma opera��o
     if key='+' then
        operacoes(key)
     else
         if key='-' then
            operacoes(key)
         else
             if (key='*') or (key='x') or (key='X') then
                operacoes('*')
             else
                 if key='/' then
                    operacoes(key)
                 else
                     if key='=' then
                        btigual.Click
                     else
                         if (key='.') or (key=',') then
                            btpoint.Click
                         else
                             //Testa de lbtipo = DEC
                             if (lbtipo.caption='DEC') or (lbtipo.caption='BIN') then
                                //Ent�o sai da sub rotina
                                exit
                             else
                                 begin
                                      //Se n�o, testa qual tecla foi pressionada
                                      if (key='A') or (key='a') then
                                         teclapress('A')
                                      else
                                          if (key='B') or (key='b') then
                                             teclapress('B')
                                          else
                                              if (key='C') or (key='c') then
                                                 teclapress('C')
                                              else
                                                  if (key='D') or (key='d') then
                                                     teclapress('D')
                                                  else
                                                      if (key='E') or (key='e') then
                                                         teclapress('E')
                                                      else
                                                          if (key='F') or (key='f') then
                                                             teclapress('F');
                                 end;
end;

procedure TFrmCalc.Bt0Click(Sender: TObject);
begin
     //Sub-rotina tecla pressionada
     teclapress('0');
end;

procedure TFrmCalc.Bt1Click(Sender: TObject);
begin
     //Sub-rotina tecla pressionada
     teclapress('1');
end;

procedure TFrmCalc.Bt2Click(Sender: TObject);
begin
     //Sub-rotina tecla pressionada
     teclapress('2');
end;

procedure TFrmCalc.Bt3Click(Sender: TObject);
begin
     //Sub-rotina tecla pressionada
     teclapress('3');
end;

procedure TFrmCalc.Bt4Click(Sender: TObject);
begin
     //Sub-rotina tecla pressionada
     teclapress('4');
end;

procedure TFrmCalc.Bt5Click(Sender: TObject);
begin
     //Sub-rotina tecla pressionada
     teclapress('5');
end;

procedure TFrmCalc.Bt6Click(Sender: TObject);
begin
     //Sub-rotina tecla pressionada
     teclapress('6');
end;

procedure TFrmCalc.Bt7Click(Sender: TObject);
begin
     //Sub-rotina tecla pressionada
     teclapress('7');
end;

procedure TFrmCalc.Bt8Click(Sender: TObject);
begin
     //Sub-rotina tecla pressionada
     teclapress('8');
end;

procedure TFrmCalc.Bt9Click(Sender: TObject);
begin
     //Sub-rotina tecla pressionada
     teclapress('9');
end;

procedure TFrmCalc.BtSomaClick(Sender: TObject);
begin
     //Sub-rotina opera��o selecionada
     Operacoes('+');
end;

procedure TFrmCalc.BtSubClick(Sender: TObject);
begin
     //Sub-rotina opera��o selecionada
     Operacoes('-');
end;

procedure TFrmCalc.BtmultClick(Sender: TObject);
begin
     //Sub-rotina opera��o selecionada
     Operacoes('*');
end;

procedure TFrmCalc.BtDivClick(Sender: TObject);
begin
     //Sub-rotina opera��o selecionada
     Operacoes('/');
end;

procedure TFrmCalc.BTigualClick(Sender: TObject);
var
   n1:string;
begin
     //Se tiver resto da divis�o
     if restdiv then
        //Ent�o bot�o mod � clicado
        btbmod.Click;
     //Se num1 igual a Zero OU Nenhuma opera��o E N�O for Pot�ncia xy
     if (num1=0) or (Operation=0) and Not xy then
        //Sai da sub-rotina
        exit;
     //Faz a convers�o de tipo
     if lbtipo.Caption='HEX' then
        n1:=floattostr(hextofloat(pndisp.caption))
     else
         if lbtipo.caption='BIN' then
            n1:=floattostr(bintofloat(pndisp.caption))
         else
             if lbtipo.caption='OCT' then
                n1:=floattostr(octtofloat(pndisp.caption))
             else
                 n1:=pndisp.caption;
     //Num2 recebe o conte�do de pndisp
     num2:=StrToFloat(n1);
     //Se n�o, se operation for diferente de Zero
     if Operation<>0 then
        //Ent�o Calcula conforme opera��o escolhida
        Calcular(Operation)
     else
         //Se n�o, Se Potencia xy
         if xy then
            begin
                 //Ent�o num1 recebe o valor da potencia num1 elevado a num2
                 result:=Power(num1,num2);
                 //Mostra resultado em pndisp
                 //pndisp.Caption:=FloatToStr(num1);
                 //Fun��o potencia � falsa
                 xy:=False;
            end;
     //Ponto flutuante � falso
     ponto:=false;
     //Faz a convers�o de tipos
     if lbtipo.caption='DEC' then
        pndisp.Caption:=FloatToStr(result)
     else
         if lbtipo.caption='HEX' then
            pndisp.Caption:=floattohex(result)
         else
             if lbtipo.Caption='OCT' then
                pndisp.Caption:=floattooct(result)
             else
                 pndisp.Caption:=floattobin(result);
     //Se n�o tiver erro
     if not erro then
        begin
             //Ent�o, se for Hexadecimal
             if lbtipo.Caption='HEX' then
                //Ent�o converte para decimal
                num1:=hextofloat(pndisp.caption)
             else
                 //Se n�o, Num1 recebe o conteudo de pndisp
                 Num1:=StrToFloat(pndisp.caption);
        end
     else
         begin
              //Se n�o, escreve erro no display
              pndisp.caption:='Erro';
              //Num1 recebe zero
              num1:=0;
         end;
     //Inicializa num2 e result
     num2:=0;
     Result:=0;
     //Ok � verdadeiro
     ok:=true;
     //Indicador de opera��o � vazio
     lboper.Caption:='';
end;

procedure TFrmCalc.BtpointClick(Sender: TObject);
begin
     //Se a virgula se encontra em Display E ponto for verdadeiro OU erro
     if ((Pos(',',pndisp.Caption)>0) and ponto) or erro  then
        //Ent�o sai da sub-rotina
        exit;
     //Se Display for diferente de Zero
     if (pndisp.caption<>'0') then
        //Acrescenta a virgula ao conteudo do display
        pndisp.caption:=pndisp.caption+','
     else
         //Se n�o, pndisp recebe ZeroVirgula
         pndisp.Caption:='0,';
     //Ponto flutuante � igual a verdadeiro
     ponto:=True;
end;

procedure TFrmCalc.BtsinalClick(Sender: TObject);
begin
     //Se display = zero ou tem erro
     if (pndisp.Caption='0') or erro then
        //Ent�o sai da subrotina
        exit;
     //Se o primeiro caracter de display for -
     if Copy(pndisp.Caption,Length(pndisp.Caption),1)='-' then
        //Ent�o, retira o sinal
        Copy(pndisp.Caption,1,Length(pndisp.Caption)-1)
     else
         //Se tiver o sinal + 1 caracter
         if copy(pndisp.Caption,1,1)='-' then
            //Ent�o retira o sinal
            pndisp.Caption:=copy(pndisp.Caption,2,Length(pndisp.Caption))
         else
             //Se n�o, coloca o sinal
             pndisp.Caption:='-'+pndisp.Caption;
     //Se n�o tem opera��o a fazer
     if Operation=0 then
        //Ent�o, num1 recebe o conteudo do display
        num1:=StrToFloat(pndisp.Caption);
end;

procedure TFrmCalc.BTCClick(Sender: TObject);
begin
     //Se n�o tiver opera��o
     if operation=0 then
        //Ent�o num1 � igual a zero
        num1:=0
     else
         //Se n�o, num2 � igual a zero
         num2:=0;
     //Mostra zero no Display
     pndisp.Caption:='0';
     //Erro recebe falso
     erro:=false;
     //Indicador � vazio
     lboper.Caption:='';
end;

procedure TFrmCalc.BTACClick(Sender: TObject);
begin
     //Inicializa as vari�veis
     num1:=0;
     num2:=0;
     Result:=0;
     ponto:=False;
     Ok:=False;
     Operation:=0;
     pndisp.Caption:='0';
     lboper.Caption:='';
     erro:=false;
     btbdec.Click;
end;

procedure TFrmCalc.BTMCClick(Sender: TObject);
begin
     //Se N�O tiver erro
     if not erro then
        begin
             //Ent�o Zera mem�ria
             mem1:=0;
             //Deixa invisivel a mensagem
             lbm.Visible:=False;
        end;
end;

procedure TFrmCalc.BTMRClick(Sender: TObject);
begin
     //Se N�O tiver erro
     if not erro then
        begin
             //Ent�o coloca o conteudo da memoria no Display
             pndisp.Caption:=FloatToStr(mem1);
             //Se n�o tiver opera��o
             If Operation=0 then
                //Ent�o coloca o conteudo do display em num1
                num1:=StrToFloat(pndisp.Caption)
             else
                 //Se n�o, coloca o conteudo do display em num2
                 num2:=StrToFloat(pndisp.Caption);
        end;
end;

procedure TFrmCalc.BTMAddClick(Sender: TObject);
begin
     //Se N�O tiver erro
     if not erro then
        begin
             //Ent�o soma o conteudo da memoria com display
             Mem1:=Mem1+StrToFloat(pndisp.caption);
             //Mostra a mensagem de mem�ria
             Lbm.Visible:=True;
        end;
end;

procedure TFrmCalc.btpercentClick(Sender: TObject);
begin
     //Se OK for falso
     if not ok then
        begin
             //Ent�o num2 recebe num1*conteudo do Display dividido por 100
             num2:=num1*(strtofloat(pndisp.caption)/100);
             //Faz a opera��o correspondente
             calcular(operation);
             //Mostra resultado em display
             pndisp.Caption:=floattostr(result);
             lboper.Caption:='';
             //Ok � verdadeiro
             ok:=true;
        end;

end;

procedure TFrmCalc.btb2ndClick(Sender: TObject);
begin
     //Se for hexadecimal
     if lbtipo.caption='HEX' then
        //Ent�o equivale a tecla A
        teclapress('A')
     else
         //Se n�o, habilita/desabilita a 2a fun��o
         lb2nd.Visible:=not lb2nd.Visible;
end;

procedure TFrmCalc.btbpiClick(Sender: TObject);
begin
     //Se for Hexadecimal
     if lbtipo.caption='HEX' then
        //Ent�o a tecla equivale a B
        teclapress('B')
     else
         begin
              //Se n�o, se 2a fun��o estiver ativa
              if lb2nd.Visible then
                 begin
                      //Ent�o chama a 2a fun��o
                      pndisp.Caption:=funcoes(21);
                      //Desabilita a 2a fun��o
                      lb2nd.Visible:=false;
                 end
              else
                  //Se n�o, Chama fun��o principal
                  pndisp.Caption:=FloatToStr(pi);
              //Ponto flutuante � verdadeiro
              ponto:=True;
              //OK � verdadeiro
              ok:=true;
         end;
end;

procedure TFrmCalc.BTBSINClick(Sender: TObject);
begin
     //Se 2a fun��o estiver ativa
     if lb2nd.Visible then
        begin
             //Ent�o chama a 2a fun��o
             pndisp.Caption:=funcoes(14);
             //2a fun��o � desabilitada
             lb2nd.Visible:=false;
        end
     else
         //Se n�o, chama a fun��o principal
         pndisp.Caption:=funcoes(8);
     //OK � verdadeiro
     ok:=true;
end;

procedure TFrmCalc.BTBSininvClick(Sender: TObject);
begin
     //Se 2a fun��o estiver ativa
     if lb2nd.Visible then
        begin
             //Ent�o chama a 2a fun��o
             pndisp.caption:=funcoes(17);
             //2a fun��o � desabilitada
             lb2nd.Visible:=false;
        end
     else
         //Se n�o, chama a fun��o principal
         pndisp.Caption:=funcoes(9);
     //Ok � verdadeiro
     ok:=true;
end;

procedure TFrmCalc.BtbdecClick(Sender: TObject);
begin
     //Se for Decimal
     if lbtipo.caption='DEC' then
        //Ent�o sai da sub-rotina
        exit
     else
         begin
              //Se n�o, faz a convers�o entre os tipos
              if lbtipo.Caption='BIN' then
                 pndisp.Caption:=floattostr(bintofloat(pndisp.caption))
              else
                  if lbtipo.Caption='HEX' then
                     pndisp.Caption:=floattostr(hextofloat(pndisp.caption))
                  else
                      if lbtipo.Caption='OCT' then
                         pndisp.Caption:=floattostr(octtofloat(pndisp.caption));
              //Inicializa os bot�es
              btb2nd.Enabled:=true;
              btbpi.Enabled:=true;
              btbxy.Enabled:=true;
              btbraiz.Enabled:=true;
              btblog.Enabled:=true;
              btbex.Enabled:=true;
              btbTan.enabled:=true;
              btbmod.enabled:=true;
              btbsin.Enabled:=true;
              btbsininv.Enabled:=true;
              btbcos.Enabled:=true;
              btbcosinv.Enabled:=true;
              btbtaninv.Enabled:=true;
              bt9.Enabled:=true;
              bt8.Enabled:=true;
              bt7.Enabled:=true;
              bt6.Enabled:=true;
              bt5.Enabled:=true;
              bt4.Enabled:=true;
              bt3.Enabled:=true;
              bt2.Enabled:=true;
              btsinal.Enabled:=true;
              btpercent.Enabled:=true;
              btmc.Enabled:=true;
              btmr.Enabled:=true;
              btmAdd.Enabled:=true;
              //Muda a cor da fonte do tipo
              lbtipo.Font.Color:=clblack;
              //Mostra tipo em lbtipo
              lbtipo.caption:='DEC';
              //Ok � verdadeiro
              ok:=true;
         end;
end;

procedure TFrmCalc.BTBxyClick(Sender: TObject);
begin
     // Se for Hexadecimal
     if lbtipo.caption='HEX' then
        //Ent�o a tecla equivale a C
        teclapress('C')
     else
         begin
              //Se n�o, se 2a fun��o estiver ativa
              if lb2nd.Visible then
                 begin
                      //Ent�o chama a 2a fun��o
                      pndisp.Caption:=funcoes(20);
                      //Desabilita a 2a fun��o
                      lb2nd.Visible:=false;
                 end
              else
                  //Se n�o, chama a fun��o principal
                  pndisp.Caption:=funcoes(7);
              //Ok � verdadeiro
              ok:=true;
         end;
end;

procedure TFrmCalc.BtbraizClick(Sender: TObject);
begin
     //Se for Hexadecimal
     if lbtipo.caption='HEX' then
        //Ent�o a tecla equivale a D
        teclapress('D')
     else
         begin
              //Se n�o, se 2a fun��o estiver ativa
              if lb2nd.Visible then
                 begin
                      //Ent�o chama a 2a fun��o
                      pndisp.caption:=funcoes(1);
                      //Desabilita a 2a fun��o
                      lb2nd.visible:=false;
                 end
              else
                  //Se n�o, chama a fun��o principal
                  pndisp.Caption:=funcoes(2);
              //Ok � verdadeiro
              ok:=true;
         end;
end;

procedure TFrmCalc.BtbCosClick(Sender: TObject);
begin
     //Se 2a fun��o estiver ativa
     if lb2nd.Visible then
        begin
             //Ent�o chama a 2a fun��o
             pndisp.caption:=funcoes(15);
             //2a fun��o � desabilitada
             lb2nd.Visible:=false;
        end
     else
         //Se n�o, chama a fun��o principal
         pndisp.Caption:=funcoes(10);
     //OK � verdadeiro
     ok:=true;
end;

procedure TFrmCalc.BtbCosInvClick(Sender: TObject);
begin
     //Se 2a fun��o estiver ativa
     if lb2nd.Visible then
        begin
             //Ent�o chama a 2a fun��o
             pndisp.Caption:=funcoes(18);
             //2a fun��o � desabilitada
             lb2nd.Visible:=false;
        end
     else
         //Se n�o, chama a fun��o principal
         pndisp.Caption:=funcoes(11);
     //Ok � verdadeiro
     ok:=true;
end;

procedure TFrmCalc.BtbBinClick(Sender: TObject);
var
   x:extended;
begin
     //Se for Bin�rio
     if lbtipo.caption='BIN' then
        //Ent�o sai da sub rotina
        exit
     else
         begin
              //Se n�o, faz a convers�o
              if lbtipo.caption='DEC' then
                 pndisp.caption:=floattobin(strtofloat(pndisp.caption))
              else
                  if lbtipo.Caption='HEX' then
                     begin
                          x:=hextofloat(pndisp.caption);
                          pndisp.Caption:=floattobin(x);
                     end
                  else
                      if lbtipo.Caption='OCT' then
                         begin
                              x:=octtofloat(pndisp.caption);
                              pndisp.Caption:=floattobin(x);
                         end;
              //configura os bot�es
              btbTan.enabled:=false;
              btblog.enabled:=false;
              btbmod.enabled:=false;
              btbxy.Enabled:=false;
              btbex.Enabled:=false;
              btbsin.Enabled:=false;
              btbsininv.Enabled:=false;
              btbpi.Enabled:=false;
              btbraiz.Enabled:=false;
              btbcos.Enabled:=false;
              btbcosinv.Enabled:=false;
              btbtaninv.Enabled:=false;
              btb2nd.Enabled:=false;
              bt9.Enabled:=false;
              bt8.Enabled:=false;
              bt7.Enabled:=false;
              bt6.Enabled:=false;
              bt5.Enabled:=false;
              bt4.Enabled:=false;
              bt3.Enabled:=false;
              bt2.Enabled:=false;
              btsinal.Enabled:=false;
              btpercent.Enabled:=false;
              btmc.Enabled:=false;
              btmr.Enabled:=false;
              btmAdd.Enabled:=false;
              //Ok � verdadeiro
              ok:=true;
              //Muda a cor da fonte do tipo
              lbtipo.Font.Color:=clblack;
              //Mostra o tipo no lbtipo
              lbtipo.caption:='BIN';
         end;
end;

procedure TFrmCalc.BTBlogClick(Sender: TObject);
begin
     //Se for Hexadecimal
     if lbtipo.caption='HEX' then
        //Ent�o a tecla equivale a E
        teclapress('E')
     else
         begin
              //Se n�o, se 2a fun��o estiver ativa
              if lb2nd.Visible then
                 begin
                      //Ent�o chama a 2a fun��o
                      pndisp.caption:=funcoes(4);
                      //Desabilita a 2a fun��o
                      lb2nd.Visible:=false;
                 end
              else
                  //Se n�o, Chama fun��o principal
                  pndisp.Caption:=Funcoes(3);
              //OK � verdadeiro
              ok:=true;
         end;
end;


procedure TFrmCalc.BTBexClick(Sender: TObject);
begin
     //Se for Hexadecimal
     if lbtipo.caption='HEX' then
        //Ent�o a tecla equivale a F
        teclapress('F')
     else
         begin
              //Se n�o, se 2a fun��o estiver ativa
              if lb2nd.Visible then
                 begin
                      //Ent�o chama a 2a fun��o
                      pndisp.Caption:=funcoes(6);
                      //Desabilita a 2a fun��o
                      lb2nd.Visible:=false;
                 end
              else
                  //Se n�o, Chama fun��o principal
                  pndisp.Caption:=funcoes(5);
              //Ok � verdadeiro
              ok:=true;
         end;
end;


procedure TFrmCalc.BtbTanClick(Sender: TObject);
begin
     //Se for Hexadecimal
     if lbtipo.Caption='HEX' then
        //Ent�o a tecla equivale a B
        teclapress('C')
     else
         begin
              //Se n�o, se 2a fun��o estiver ativa
              if lb2nd.Visible then
                 begin
                      //Ent�o chama a 2a fun��o
                      pndisp.caption:=funcoes(16);
                      //Desabilita a 2a fun��o
                      lb2nd.visible:=false;
                 end
              else
                  //Se n�o, Chama fun��o principal
                  pndisp.caption:=funcoes(12);
              //Ok � verdadeiro
              ok:=true;
         end;
end;

procedure TFrmCalc.BtbTanInvClick(Sender: TObject);
begin
     //Se 2a fun��o estiver ativa
     if lb2nd.Visible then
        begin
             //Ent�o chama a 2a fun��o
             pndisp.caption:=funcoes(19);
             //2a fun��o � desabilitada
             lb2nd.Visible:=false;
        end
     else
         //Se n�o, chama a fun��o principal
         pndisp.Caption:=funcoes(13);
     //Ok � verdadeiro
     ok:=true;
end;

procedure TFrmCalc.BtbHexClick(Sender: TObject);
var
   x:extended;
begin
     //Se for hexadecimal
     if lbtipo.caption='HEX' then
        //Ent�o sai da sub-rotina
        exit
     else
         begin
              //Se n�o, faz as convers�o entre os tipos
              if lbtipo.Caption='DEC' then
                 pndisp.Caption:=floattohex(strtofloat(pndisp.caption))
              else
                  if lbtipo.Caption='BIN' then
                     begin
                          x:=bintofloat(pndisp.caption);
                          pndisp.Caption:=floattohex(x);
                     end
                  else
                      if lbtipo.Caption='OCT' then
                         begin
                              x:=octtofloat(pndisp.caption);
                              pndisp.Caption:=floattohex(x);
                         end;
              //Inicializa os bot�es
              btb2nd.Enabled:=true;
              btbpi.Enabled:=true;
              btbxy.Enabled:=true;
              btbraiz.Enabled:=true;
              btblog.Enabled:=true;
              btbex.Enabled:=true;
              btbTan.enabled:=false;
              btbmod.enabled:=false;
              bt9.Enabled:=true;
              bt8.Enabled:=true;
              bt7.Enabled:=true;
              bt6.Enabled:=true;
              bt5.Enabled:=true;
              bt4.Enabled:=true;
              bt3.Enabled:=true;
              bt2.Enabled:=true;
              btsinal.Enabled:=false;
              btpercent.Enabled:=false;
              btmc.Enabled:=false;
              btmr.Enabled:=false;
              btmAdd.Enabled:=false;
              btbsin.Enabled:=false;
              btbsininv.Enabled:=false;
              btbcos.Enabled:=false;
              btbcosinv.Enabled:=false;
              btbtaninv.Enabled:=false;
              //Muda a cor da fonte do tipo
              lbtipo.Font.Color:=clred;
              //Mostra tipo
              lbtipo.caption:='HEX';
              //Ok � verdadeiro
              ok:=true;
         end;
end;

procedure TFrmCalc.BtbandClick(Sender: TObject);
begin
     //Se 2a fun��o estiver ativa
     if lb2nd.Visible then
        begin
             //Ent�o chama a 2a fun��o
             pndisp.Caption:=funcoes(22);
             //Desabilita a 2a fun��o
             lb2nd.Visible:=false;
             //Ok � verdadeiro
             ok:=true;
        end
     else
         //Sub-rotina opera��o selecionada
         Operacoes('&');
end;

procedure TFrmCalc.btborClick(Sender: TObject);
begin
     //Se 2a fun��o estiver ativa
     if lb2nd.Visible then
        begin
             //Ent�o chama a 2a fun��o
             pndisp.Caption:=funcoes(23);
             //Desabilita a 2a fun��o
             lb2nd.Visible:=false;
             //Ok � verdadeiro
             ok:=true;
        end
     else
         //Sub-rotina opera��o selecionada
         Operacoes('^');
end;


procedure TFrmCalc.BtbxorClick(Sender: TObject);
begin
     //Se 2a fun��o estiver ativa
     if lb2nd.Visible then
        begin
             //Ent�o chama a 2a fun��o
             pndisp.Caption:=funcoes(24);
             //Desabilita a 2a fun��o
             lb2nd.Visible:=false;
             //Ok � verdadeiro
             ok:=true;
        end
     else
         //Sub-rotina opera��o selecionada
         Operacoes('@');
end;

procedure TFrmCalc.BtbmodClick(Sender: TObject);
begin
     //Se 2a fun��o estiver ativa
     if lb2nd.Visible then
        begin
             //Ent�o chama a 2a fun��o
             pndisp.Caption:=funcoes(25);
             //Desativa a 2a fun��o
             lb2nd.Visible:=false;
        end
     else
         begin
              //Se n�o, se erro for verdadeiro
              if erro then
                 //Ent�o sai da rotina
                 exit;
              //Tenta fazer as instru�oes
              try
                 //Se N�O Restdiv
                 if not restdiv then
                    begin
                         //Ent�o i recebe conte�do do pndisp
                         i:=StrToint(pndisp.Caption);
                         //Restdiv � verdadeiro
                         restdiv:=true;
                    end
                 else
                     begin
                          //Se n�o, j recebe conte�do do pndisp
                          j:=StrToint(pndisp.caption);
                          //Calcula  o resto da divis�o
                          pndisp.caption:=inttostr(i mod j);
                          //Restdiv � falso;
                          restdiv:=false;
                     end;
                 //Ponto flutuante � falso
                 ponto:=False;
                 Except
                       //Ocorreu erro
                       erro:=true;
                       //Mostra erro no display
                       pndisp.caption:='Erro';
                       //Caso ocorra excess�o, sai sub rotina
                       exit;
                 end;
         end;
     //Ok � verdadeira
     Ok:=True;
end;

procedure TFrmCalc.BtboctClick(Sender: TObject);
var
   x:extended;
begin
     //Se for Octal
     if lbtipo.caption='OCT' then
        //Ent�o sai da sub rotina
        exit
     else
         begin
              //Se n�o, faz a convers�o entre os tipos
              if lbtipo.caption='DEC' then
                 pndisp.caption:=floattooct(strtofloat(pndisp.caption))
              else
                  if lbtipo.Caption='HEX' then
                     begin
                          x:=hextofloat(pndisp.caption);
                          pndisp.Caption:=floattooct(x);
                     end
                  else
                      if lbtipo.Caption='BIN' then
                         begin
                              x:=Bintofloat(pndisp.caption);
                              pndisp.Caption:=floattooct(x);
                         end;
              //Inicializa os bot�es
              btbTan.enabled:=false;
              btblog.enabled:=false;
              btbmod.enabled:=false;
              btbxy.Enabled:=false;
              btbex.Enabled:=false;
              btbsin.Enabled:=false;
              btbsininv.Enabled:=false;
              btbpi.Enabled:=false;
              btbraiz.Enabled:=false;
              btbcos.Enabled:=false;
              btbcosinv.Enabled:=false;
              btbtaninv.Enabled:=false;
              btb2nd.Enabled:=false;
              bt9.Enabled:=false;
              bt8.Enabled:=false;
              bt7.Enabled:=true;
              bt6.Enabled:=true;
              bt5.Enabled:=true;
              bt4.Enabled:=true;
              bt3.Enabled:=true;
              bt2.Enabled:=true;
              btsinal.Enabled:=false;
              btpercent.Enabled:=false;
              btmc.Enabled:=false;
              btmr.Enabled:=false;
              btmAdd.Enabled:=false;
              //Ok � verdadeiro
              ok:=true;
              //Muda a cor da fonte do tipo
              lbtipo.Font.Color:=clblack;
              //Mostra o tipo no lbtipo
              lbtipo.caption:='OCT';
         end;
end;


end.
