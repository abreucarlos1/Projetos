unit velhaca1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, ExtCtrls,about, Buttons, ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    MainMenu1: TMainMenu;
    Novo1: TMenuItem;
    Sair1: TMenuItem;
    Timer1: TTimer;
    ColorDialog1: TColorDialog;
    PopupMenu1: TPopupMenu;
    Color1: TMenuItem;
    PopupMenu2: TPopupMenu;
    Fonte1: TMenuItem;
    fontdialog1: TFontDialog;
    Sobre1: TMenuItem;
    Opcao: TMenuItem;
    Fonte2: TMenuItem;
    CordeFundo1: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Novo1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Color1Click(Sender: TObject);
    procedure Fonte1Click(Sender: TObject);
    procedure Button1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button7MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button8MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button9MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure CordeFundo1Click(Sender: TObject);
    procedure Fonte2Click(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);

private
         procedure escolhe; // 1a jogada do computador
         procedure inicializa; // zera os botões
         procedure mensagem1; // mostra mensagem que não houve ganhador
         procedure ganhador(ganha:char); // mensagem para ganhador
         procedure tecla; // testa tecla já escolhida
         procedure testa (valor:byte); // testa se há ganhador
         procedure jogada; // testa jogadas possiveis
  { Private declarations }
  public

    { Public declarations }



  end;

var
  Form1: TForm1;
  jog,first,ganhos,perdas,empates,jogos:byte;
  vez:boolean;
  table: array [1..9] of byte;
  Mens: array [1..20] of char;
  cor: string;

implementation

{$R *.DFM}


procedure Tform1.escolhe; // coloca a jogada do computador no meio (pos 5)
label A;
begin
     if (vez) and (jog=0) then
        button5.Caption:='X';
     if (not vez) and (jog=1) then
        begin
             randomize;
             A:
             first:=random(8)+1;
             case first of
                  1:if button1.Caption='' then
                       button1.Caption:='X'
                       else
                           goto A;
                  2:if button2.Caption='' then
                       button2.Caption:='X'
                       else
                           goto A;
                  3:if button3.Caption='' then
                       button3.Caption:='X'
                       else
                           goto A;
                  4:if button4.Caption='' then
                       button4.Caption:='X'
                       else
                           goto A;
                  5:if button5.Caption='' then
                       button5.Caption:='X'
                       else
                           goto A;
                  6:if button6.Caption='' then
                       button6.Caption:='X'
                       else
                           goto A;
                  7:if button7.Caption='' then
                       button7.Caption:='X'
                       else
                           goto A;
                  8:if button8.Caption='' then
                       button8.Caption:='X'
                       else
                           goto A;
                  9:if button9.Caption='' then
                       button9.Caption:='X'
                       else
                           goto A;
             end;
        end;
end;

procedure Tform1.inicializa; // zera os botões
          begin
               jogos:=jogos+1;
               label1.Caption:=inttostr(jogos);
               label2.Caption:=inttostr(empates);
               label3.Caption:=inttostr(ganhos);
               label4.Caption:=inttostr(perdas);
               button1.Caption:='';
               Button2.Caption:='';
               Button3.Caption:='';
               Button4.Caption:='';
               Button5.Caption:='';
               Button6.Caption:='';
               Button7.Caption:='';
               Button8.Caption:='';
               Button9.Caption:='';
               vez:= not vez;
               jog:=0;  // zera o contador de jogadas
               escolhe;
          end;

procedure Tform1.mensagem1; // mostra opção de saida caso não haja ganhadores
begin
     if messagedlg('Não houve ganhador, deseja continuar?',mtInformation,[mbYes,mbNo],0)= mrNo then
        Close
     else
         begin
              empates:=empates+1;
              inicializa;
         end;
end;

procedure Tform1.ganhador(ganha:char); // mostra o ganhador
begin
     if ganha='X' then
        if messagedlg('O computador ganhou,deseja continuar?',mtInformation,[mbYes,mbNo],0)=mrNo then
           Close
        else
            begin
                 ganhos:=ganhos+1;
                 inicializa;
            end
     else
         if messagedlg('Voce venceu!!,deseja continuar?',mtInformation,[mbYes,mbNo],0)=mrNo then
            Close
         else
             begin
                  perdas:=perdas+1;
                  inicializa;
             end;
end;

procedure Tform1.tecla; // verifica tecla já pressionada
begin
     MessageDlg('Tecla já escolhida, tente outra!!',mtWarning,[mbOK],0);
end;

procedure Tform1.testa (valor:byte); // obtem o ganhador da jogada
begin
     if (valor=5) and (not vez) then
        mensagem1
     else
     if (valor=4) and (vez) then
        mensagem1
     else
     begin
     if (Button1.Caption='X') and (Button2.Caption='X') and (Button3.Caption='X') then
        ganhador('X');
     if (Button1.Caption='O') and (Button2.Caption='O') and (Button3.Caption='O') then
        ganhador('O');
     if (Button4.Caption='X') and (Button5.Caption='X') and (Button6.Caption='X') then
        ganhador('X');
     if (Button4.Caption='O') and (Button5.Caption='O') and (Button6.Caption='O') then
        ganhador('O');
     if (Button7.Caption='X') and (Button8.Caption='X') and (Button9.Caption='X') then
        ganhador('X');
     if (Button7.Caption='O') and (Button8.Caption='O') and (Button9.Caption='O') then
        ganhador('O');
     if (Button1.Caption='X') and (Button4.Caption='X') and (Button7.Caption='X') then
        ganhador('X');
     if (Button1.Caption='O') and (Button4.Caption='O') and (Button7.Caption='O') then
        ganhador('O');
     if (Button2.Caption='X') and (Button5.Caption='X') and (Button8.Caption='X') then
        ganhador('X');
     if (Button2.Caption='O') and (Button5.Caption='O') and (Button8.Caption='O') then
        ganhador('O');
     if (Button3.Caption='X') and (Button6.Caption='X') and (Button9.Caption='X') then
        ganhador('X');
     if (Button3.Caption='O') and (Button6.Caption='O') and (Button9.Caption='O') then
        ganhador('O');
     if (Button1.Caption='X') and (Button5.Caption='X') and (Button9.Caption='X') then
        ganhador('X');
     if (Button1.Caption='O') and (Button5.Caption='O') and (Button9.Caption='O') then
        ganhador('O');
     if (Button7.Caption='X') and (Button5.Caption='X') and (Button3.Caption='X') then
        ganhador('X');
     if (Button7.Caption='O') and (Button5.Caption='O') and (Button3.Caption='O') then
        ganhador('O');
     end;



end;

procedure Tform1.jogada; // testa jogadas possiveis( IA)
begin
     if (Button1.Caption='') and (Button2.Caption='X') and (Button3.Caption='X') then
        Button1.Caption:='X'
     else
     if (button1.caption='X') and (button2.caption='X') and (button3.caption='') then
        button3.caption:='X'
     else
     if (Button1.Caption='X') and (Button4.Caption='X') and (Button7.Caption='') then
        Button7.Caption:='X'
     else
     if (Button1.Caption='') and (Button4.Caption='X') and (Button7.Caption='X') then
        Button1.Caption:='X'
     else
     if (Button7.Caption='X') and (Button8.Caption='X') and (Button9.Caption='') then
        Button9.Caption:='X'
     else
     if (Button7.Caption='') and (Button8.Caption='X') and (Button9.Caption='X') then
        Button7.Caption:='X'
     else
     if (Button9.Caption='X') and (Button6.Caption='X') and (Button3.Caption='') then
        Button3.Caption:='X'
     else
     if (Button9.Caption='') and (Button6.Caption='X') and (Button3.Caption='X') then
        Button9.Caption:='X'
     else
     if (Button5.Caption='X') and (Button3.Caption='X') and (Button7.Caption='') then
        Button7.Caption:='X'
     else
     if (Button5.Caption='X') and (Button2.Caption='X') and (Button8.Caption='') then
        Button8.Caption:='X'
     else
     if (Button5.Caption='X') and (Button1.Caption='X') and (Button9.Caption='') then
        Button9.Caption:='X'
     else
     if (Button5.Caption='X') and (Button4.Caption='X') and (Button6.Caption='') then
        Button6.Caption:='X'
     else
     if (Button5.Caption='X') and (Button7.Caption='X') and (Button3.Caption='') then
        Button3.Caption:='X'
     else
     if (Button5.Caption='X') and (Button8.Caption='X') and (Button2.Caption='') then
        Button2.Caption:='X'
     else
     if (Button5.Caption='X') and (Button9.Caption='X') and (Button1.Caption='') then
        Button1.Caption:='X'
     else
     if (Button5.Caption='X') and (Button6.Caption='X') and (Button4.Caption='') then
        Button4.Caption:='X'
     else
     if (Button1.Caption='X') and (Button3.Caption='X') and (Button2.Caption='') then
        Button2.Caption:='X'
     else
     if (Button1.Caption='X') and (Button7.Caption='X') and (Button4.Caption='') then
        Button4.Caption:='X'
     else
     if (Button7.Caption='X') and (Button9.Caption='X') and (Button8.Caption='') then
        Button8.Caption:='X'
     else
     if (Button9.Caption='X') and (Button3.Caption='X') and (Button6.Caption='') then
        Button6.Caption:='X'
     else
     if (Button2.Caption='X') and (Button8.Caption='X') and (Button5.Caption='') then
        Button5.Caption:='X'
     else
     if (Button4.Caption='X') and (Button6.Caption='X') and (Button5.Caption='') then
        Button5.Caption:='X'
     else
     if (Button3.Caption='X') and (Button7.Caption='X') and (Button5.Caption='') then
        Button5.Caption:='X'
     else
     if (Button1.Caption='X') and (Button9.Caption='X') and (Button5.Caption='') then
        Button5.Caption:='X'
     else
     if (button1.Caption='O') and (button2.Caption='') and (button3.Caption='O') then  //extremos
        button2.Caption:='X'
     else
     if (button1.Caption='O') and (button4.Caption='') and (button7.Caption='O') then
        button4.Caption:='X'
     else
     if (button7.Caption='O') and (button8.Caption='') and (button9.Caption='O') then
        button8.Caption:='X'
     else
     if (button9.Caption='O') and (button6.Caption='') and (button3.Caption='O') then
        button6.Caption:='X'
     else
     if (button1.Caption='O') and (button5.Caption='') and (button9.Caption='O') then
        button5.Caption:='X'
     else
     if (button3.Caption='O') and (Button5.Caption='') and (button7.Caption='O') then
        button5.Caption:='X'
     else
     if (button4.Caption='O') and (button5.Caption='') and (button6.Caption='O') then
        button5.Caption:='X'
     else
     if (button2.Caption='O') and (button5.Caption='') and (button8.Caption='O') then
        button5.Caption:='X'
     else
     if (Button1.Caption='') and (Button2.Caption='O') and (Button3.Caption='O') then
        Button1.Caption:='X'
     else
     if (Button1.Caption='O') and (Button2.Caption='O') and (Button3.Caption='') then
        Button3.Caption:='X'
     else
     if (Button1.Caption='O') and (Button4.Caption='O') and (Button7.Caption='') then
        Button7.Caption:='X'
     else
     if (Button1.Caption='') and (Button4.Caption='O') and (Button7.Caption='O') then
        Button1.Caption:='X'
     else
     if (Button7.Caption='O') and (Button8.Caption='O') and (Button9.Caption='') then
        Button9.Caption:='X'
     else
     if (Button7.Caption='') and (Button8.Caption='O') and (Button9.Caption='O') then
        Button7.Caption:='X'
     else
     if (Button9.Caption='O') and (Button6.Caption='O') and (Button3.Caption='') then
        Button3.Caption:='X'
     else
     if (Button9.Caption='') and (Button6.Caption='O') and (Button3.Caption='O') then
        Button9.Caption:='X'
     else
     if (Button5.Caption='O') and (Button3.Caption='O') and (Button7.Caption='') then
        Button7.Caption:='X'
     else
     if (Button5.Caption='O') and (Button2.Caption='O') and (Button8.Caption='') then
        Button8.Caption:='X'
     else
     if (Button5.Caption='O') and (Button1.Caption='O') and (Button9.Caption='') then
        Button9.Caption:='X'
     else
     if (Button5.Caption='O') and (Button4.Caption='O') and (Button6.Caption='') then
        Button6.Caption:='X'
     else
     if (Button5.Caption='O') and (Button7.Caption='O') and (Button3.Caption='') then
        Button3.Caption:='X'
     else
     if (Button5.Caption='O') and (Button8.Caption='O') and (Button2.Caption='') then
        Button2.Caption:='X'
     else
     if (button3.Caption='O') and (button6.Caption='') and (button9.Caption='O') then
        button6.Caption:='X'
     else
     if (Button5.Caption='O') and (Button9.Caption='O') and (Button1.Caption='') then
        Button1.Caption:='X'
     else
     if (Button5.Caption='O') and (Button6.Caption='O') and (Button4.Caption='') then
        Button4.Caption:='X'
     else
     if (Button1.Caption='O') and (Button2.Caption='') and (Button3.Caption='O') then
        Button2.Caption:='X'
     else
     if (Button1.Caption='O') and (Button4.Caption='') and (Button7.Caption='O') then
        Button4.Caption:='X'
     else
     if (Button7.Caption='O') and (Button8.Caption='') and (Button9.Caption='O') then
        Button8.Caption:='X'
     else
     if (Button2.Caption='O') and (Button5.Caption='') and (Button8.Caption='O') then
        Button5.Caption:='X'
     else
     if (Button4.Caption='O') and (Button5.Caption='') and (Button6.Caption='O') then
        Button5.Caption:='X'
     else
     if (Button3.Caption='O') and (Button5.Caption='') and (Button7.Caption='O') then
        Button5.Caption:='X'
     else
     if (Button1.Caption='O') and (Button5.Caption='') and (Button9.Caption='O') then
        Button5.Caption:='X'
     else
     if (Button5.Caption='X') and (Button3.Caption='O') and (Button9.Caption='') then
        Button9.Caption:='X'
     else
     if (Button5.Caption='X') and (Button2.Caption='O') and (Button1.Caption='') then
        Button1.Caption:='X'
     else
     if (Button5.Caption='X') and (Button1.Caption='O') and (Button3.Caption='') then
        Button3.Caption:='X'
     else
     if (Button5.Caption='X') and (Button4.Caption='O') and (Button7.Caption='') then
        Button7.Caption:='X'
     else
     if (Button5.Caption='X') and (Button7.Caption='O') and (Button4.Caption='') then
        Button4.Caption:='X'
     else
     if (Button5.Caption='X') and (Button8.Caption='O') and (Button9.Caption='') then
        Button9.Caption:='X'
     else
     if (Button5.Caption='X') and (Button9.Caption='O') and (Button6.Caption='') then
        Button6.Caption:='X'
     else
     if (Button5.Caption='X') and (Button6.Caption='O') and (Button3.Caption='') then
        Button3.Caption:='X'
     else
     if (Button5.Caption='X') and (Button1.Caption='') and (Button9.Caption<>'') then
        Button1.Caption:='X'
     else
     if (Button5.Caption='X') and (Button3.Caption='') and (Button1.Caption<>'') then
        Button3.Caption:='X'
     else
     if (Button5.Caption='X') and (Button2.Caption='') and (Button3.Caption<>'') then
        Button2.Caption:='X'
     else
     if (Button5.Caption='X') and (Button1.Caption='') and (Button7.Caption<>'') then
        Button1.Caption:='X'
     else
     if (Button5.Caption='X') and (Button8.Caption='') and (Button4.Caption<>'') then
        Button8.Caption:='X'
     else
     if (Button5.Caption='X') and (Button7.Caption='') and (Button9.Caption<>'') then
        Button7.Caption:='X'
     else
     if (Button5.Caption='X') and (Button7.Caption='') and (Button6.Caption<>'') then
        Button7.Caption:='X'
     else
     if (Button5.Caption='X') and (Button9.Caption='') and (Button3.Caption<>'') then
        Button9.Caption:='X'
     else
     if (Button5.Caption='O') and (Button3.Caption='X') and (Button2.Caption='') then // verificar linha!!!
        Button2.Caption:='X'
     else
     if (button5.Caption='O') and (button3.Caption='X') and (button1.Caption='') then
        button1.Caption:='X'
     else
     if (button5.Caption='O') and (button2.Caption='X') and (button3.Caption='') then
        button3.Caption:='X'
     else
     if (button5.Caption='O') and (button2.Caption='X') and (Button1.Caption='') then
        button1.Caption:='X'
     else
     if (button5.Caption='O') and (button1.Caption='X') and (button3.Caption='') then // 1a quadra
        button3.Caption:='X'
     else
     if (button5.Caption='O') and (button1.Caption='X') and (Button2.Caption='') then
        button2.Caption:='X'
     else
     if (button5.Caption='O') and (button1.Caption='X') and (button4.Caption='') then
        button4.Caption:='X'
     else
     if (button5.Caption='O') and (button1.Caption='X') and (button7.Caption='') then
        button7.Caption:='X'
     else
     if (button5.Caption='O') and (button4.Caption='X') and (button1.Caption='') then // 2a quadra
        button1.Caption:='X'
     else
     if (button5.Caption='O') and (button4.Caption='X') and (button7.Caption='') then
        button7.Caption:='X'
     else
     if (button5.Caption='O') and (button7.Caption='X') and (button1.Caption='') then
        button1.Caption:='X'
     else
     if (button5.Caption='O') and (button7.Caption='X') and (button4.Caption='') then
        button4.Caption:='X'
     else
     if (button5.Caption='O') and (button7.Caption='X') and (button8.Caption='') then
        button8.Caption:='X'
     else
     if (button5.Caption='O') and (button7.Caption='X') and (button9.Caption='') then
        button9.Caption:='X'
     else
     if (button5.Caption='O') and (button8.Caption='X') and (button7.Caption='') then
        button7.Caption:='X'
     else
     if (button5.Caption='O') and (button8.Caption='X') and (button9.Caption='') then
        button9.Caption:='X'
     else
     if (button5.Caption='O') and (button9.Caption='X') and (button3.Caption='') then  // 3a quadra
        button3.Caption:='X'
     else
     if (button5.Caption='O') and (button9.Caption='X') and (button6.Caption='') then
        button6.Caption:='X'
     else
     if (button5.Caption='O') and (button9.Caption='X') and (button8.Caption='') then
        button8.Caption:='X'
     else
     if (button5.Caption='O') and (button9.Caption='X') and (button7.Caption='') then
        button7.Caption:='X'
     else
     if (button5.Caption='O') and (button6.Caption='X') and (button3.Caption='') then
        button3.Caption:='X'
     else
     if (button5.Caption='O') and (button6.Caption='X') and (button9.Caption='') then
        button9.Caption:='X'
     else
     if (button3.Caption<>'') and (button2.Caption<>'') and (button1.Caption<>'') and (button5.Caption='') then
        button5.Caption:='X'
     else
     if (button3.Caption<>'') and (button2.Caption<>'') and (button1.Caption<>'') and (button7.Caption='') then
        button7.Caption:='X'
     else
     if (button3.Caption<>'') and (button2.Caption<>'') and (button1.Caption<>'') and (button8.Caption='') then
        button8.Caption:='X'
     else
     if (button3.Caption<>'') and (button2.Caption<>'') and (button1.Caption<>'') and (button9.Caption='') then
        button9.Caption:='X'
     else
     if (button1.Caption<>'') and (button4.Caption<>'') and (button7.Caption<>'') and (button5.Caption='') then
        button5.Caption:='X'
     else
     if (button1.Caption<>'') and (button4.Caption<>'') and (button7.Caption<>'') and (button3.Caption='') then
        button3.Caption:='X'
     else
     if (button1.Caption<>'') and (button4.Caption<>'') and (button7.Caption<>'') and (button6.Caption='') then
        button6.Caption:='X'
     else
     if (button1.Caption<>'') and (button4.Caption<>'') and (button7.Caption<>'') and (button9.Caption='') then
        button9.Caption:='X'
     else
     if (button7.Caption<>'') and (button8.Caption<>'') and (button9.Caption<>'') and (button5.Caption='') then
        button5.Caption:='X'
     else
     if (button7.Caption<>'') and (button8.Caption<>'') and (button9.Caption<>'') and (button1.Caption='') then
        button1.Caption:='X'
     else
     if (button7.Caption<>'') and (button8.Caption<>'') and (button9.Caption<>'') and (button2.Caption='') then
        button2.Caption:='X'
     else
     if (button7.Caption<>'') and (button8.Caption<>'') and (button9.Caption<>'') and (button3.Caption='') then
        button3.Caption:='X'
     else
     if (button3.Caption<>'') and (button6.Caption<>'') and (button9.Caption<>'') and (button5.Caption='') then
        button5.Caption:='X'
     else
     if (button3.Caption<>'') and (button6.Caption<>'') and (button9.Caption<>'') and (button1.Caption='') then
        button1.Caption:='X'
     else
     if (button3.Caption<>'') and (button6.Caption<>'') and (button9.Caption<>'') and (button4.Caption='') then
        button4.Caption:='X'
     else
     if (button3.Caption<>'') and (button6.Caption<>'') and (button9.Caption<>'') and (button7.Caption='') then
        button7.Caption:='X'
     else
     if (not vez) or (jog<2) then
        escolhe;
     testa(jog);

end;


procedure TForm1.FormCreate(Sender: TObject);
begin
     jogos:=0;
     empates:=0;
     ganhos:=0;
     perdas:=0;
     mens[1]:=' ';
     mens[2]:=' ';
     mens[3]:=' ';
     mens[4]:='J';
     mens[5]:='o';
     mens[6]:='g';
     mens[7]:='o';
     mens[8]:=' ';
     mens[9]:='d';
     mens[10]:='a';
     mens[11]:=' ';
     mens[12]:='V';
     mens[13]:='e';
     mens[14]:='l';
     mens[15]:='h';
     mens[16]:='a';
     mens[17]:=' ';
     mens[18]:=' ';
     mens[19]:=' ';
     mens[20]:=' ';
     vez:=false;
     jog:=0;
     inicializa; // chama a procedure inicializa
     {escolhe;}
end;

procedure TForm1.Sair1Click(Sender: TObject);
begin
     Close; // fecha o programa atraves do menu
end;

procedure TForm1.Novo1Click(Sender: TObject);
begin
     vez:=false;
     jog:=0;
     inicializa; // chama a procedure
     {escolhe;    // 1a jogada do computador}
end;


procedure TForm1.Button1Click(Sender: TObject);
begin
     if button1.Caption='' then
        begin
             button1.Caption:='O';
             jog:=jog+1;
             testa(jog);
             jogada;
        end
     else
         tecla;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
     if button2.Caption='' then
        begin
             button2.Caption:='O';
             jog:=jog+1;
             testa(jog);
             jogada;
        end
     else
         tecla;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
     if button3.Caption='' then
        begin
             button3.Caption:='O';
             jog:=jog+1;
             testa(jog);
             jogada;
        end
     else
         tecla;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
     if button4.Caption='' then
        begin
             button4.Caption:='O';
             jog:=jog+1;
             testa(jog);
             jogada;
        end
     else
         tecla;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
     if button5.Caption='' then
        begin
             button5.Cursor:=crHandPoint;
             button5.Caption:='O';
             jog:=jog+1;
             testa(jog);
             jogada;
        end
     else
         tecla;

end;

procedure TForm1.Button6Click(Sender: TObject);
begin
     if button6.Caption='' then
        begin
             button6.Caption:='O';
             jog:=jog+1;
             testa(jog);
             jogada;
        end
     else
         tecla;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
     if button7.Caption='' then
        begin
             button7.Caption:='O';
             jog:=jog+1;
             testa(jog);
             jogada;
        end
     else
         tecla;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
     if button8.Caption='' then
        begin
             button8.Caption:='O';
             jog:=jog+1;
             testa(jog);
             jogada;
        end
     else
         tecla;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
     if button9.Caption='' then
        begin
             button9.Caption:='O';
             jog:=jog+1;
             testa(jog);
             jogada;
        end
     else
         tecla;
end;





procedure TForm1.Timer1Timer(Sender: TObject);
var
   j:byte;
begin
     mens[19]:=mens[1];
              for j:=1 to 19 do
                  mens[j]:=mens[j+1];
              form1.Caption:=mens;
end;

procedure TForm1.Color1Click(Sender: TObject);
begin
     colordialog1.Color:=form1.color;
     if colordialog1.Execute then
        form1.color:=colordialog1.Color;
end;

procedure TForm1.Fonte1Click(Sender: TObject);
begin
     fontdialog1.font:=button1.Font;
     if fontdialog1.Execute then
        begin
             button1.Font:=fontdialog1.Font;
             button2.Font:=fontdialog1.Font;
             button3.Font:=fontdialog1.Font;
             button4.Font:=fontdialog1.Font;
             button5.Font:=fontdialog1.Font;
             button6.Font:=fontdialog1.Font;
             button7.Font:=fontdialog1.Font;
             button8.Font:=fontdialog1.Font;
             button9.Font:=fontdialog1.Font;
        end;
end;

procedure TForm1.Button1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
     if button1.Caption='' then
        button1.Cursor:=crHandPoint
     else
         button1.Cursor:=crNo;
end;

procedure TForm1.Button2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
     if button2.Caption='' then
        button2.Cursor:=crHandPoint
     else
         button2.Cursor:=crNo;
end;

procedure TForm1.Button3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
     if button3.Caption='' then
        button3.Cursor:=crHandPoint
     else
         button3.Cursor:=crNo;
end;

procedure TForm1.Button4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
     if button4.Caption='' then
        button4.Cursor:=crHandPoint
     else
         button4.Cursor:=crNo;
end;

procedure TForm1.Button5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
     if button5.Caption='' then
        button5.Cursor:=crHandPoint
     else
         button5.Cursor:=crNo;
end;

procedure TForm1.Button6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
     if button6.Caption='' then
        button6.Cursor:=crHandPoint
     else
         button6.Cursor:=crNo;
end;

procedure TForm1.Button7MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
     if button7.Caption='' then
        button7.Cursor:=crHandPoint
     else
         button7.Cursor:=crNo;
end;

procedure TForm1.Button8MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
     if button8.Caption='' then
        button8.Cursor:=crHandPoint
     else
         button8.Cursor:=crNo;
end;

procedure TForm1.Button9MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
     if button9.Caption='' then
        button9.Cursor:=crHandPoint
     else
         button9.Cursor:=crNo;
end;


procedure TForm1.CordeFundo1Click(Sender: TObject);
begin
     colordialog1.Color:=form1.color;
     if colordialog1.Execute then
        form1.color:=colordialog1.Color;
end;

procedure TForm1.Fonte2Click(Sender: TObject);
begin
      fontdialog1.font:=button1.Font;
     if fontdialog1.Execute then
        begin
             button1.Font:=fontdialog1.Font;
             button2.Font:=fontdialog1.Font;
             button3.Font:=fontdialog1.Font;
             button4.Font:=fontdialog1.Font;
             button5.Font:=fontdialog1.Font;
             button6.Font:=fontdialog1.Font;
             button7.Font:=fontdialog1.Font;
             button8.Font:=fontdialog1.Font;
             button9.Font:=fontdialog1.Font;
        end;
end;

procedure TForm1.Sobre1Click(Sender: TObject);
begin
     timer1.Enabled:=false;
     Fsobre.ShowModal;
     timer1.Enabled:=true;
end;
















end.
