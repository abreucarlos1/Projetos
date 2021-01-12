unit velhaca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, ExtCtrls;

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
    N1: TMenuItem;
    Sobre1: TMenuItem;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  F: string;
  jog:byte;



implementation

{$R *.DFM}

procedure escolhe(); // coloca a jogada do computador no meio (pos 5)

begin
     Form1.button5.Caption:='X';
end;

procedure inicializa; // zera os botões
          begin
               form1.button1.Caption:='';
               form1.Button2.Caption:='';
               form1.Button3.Caption:='';
               form1.Button4.Caption:='';
               form1.Button5.Caption:='';
               form1.Button6.Caption:='';
               form1.Button7.Caption:='';
               form1.Button8.Caption:='';
               form1.Button9.Caption:='';
               jog:=0;  // zera o contador de jogadas
          end;

procedure mensagem; // mostra opção de saida caso não haja ganhadores
begin
     if messagedlg('Não houve ganhador, deseja continuar?',mtInformation,[mbYes,mbNo],0)= mrNo then
        form1.Close
     else
         inicializa;
end;

procedure testa; // obtem o ganhador da jogada
begin
     if (form1.Button1.Caption='X')and(form1.Button2.Caption='X')and(form1.Button3.Caption='X')or
        (form1.button1.Caption='X')and(form1.Button5.Caption='X')and(form1.Button9.Caption='X')or
        (form1.Button1.Caption='X')and(form1.Button4.Caption='X')and(form1.Button7.Caption='X')or    // computador
        (form1.Button2.Caption='X')and(form1.Button5.Caption='X')and(form1.Button8.Caption='X')or
        (form1.Button3.Caption='X')and(form1.Button6.Caption='X')and(form1.Button9.Caption='X')or
        (form1.Button4.Caption='X')and(form1.Button5.Caption='X')and(form1.Button6.Caption='X')or
        (form1.Button7.Caption='X')and(form1.Button8.Caption='X')and(form1.Button9.Caption='X') then
        begin
             if messagedlg('O computador ganhou, deseja continuar?',mtinformation,[mbYes,mbNo],0)= mrYes then
                begin
                     inicializa;
                     escolhe;
                end
             else
                 form1.Close;
        end
     else
         if (form1.Button1.Caption='O')and(form1.Button2.Caption='O')and(form1.Button3.Caption='O')or
        (form1.button1.Caption='O')and(form1.Button5.Caption='O')and(form1.Button9.Caption='O')or
        (form1.Button1.Caption='O')and(form1.Button4.Caption='O')and(form1.Button7.Caption='O')or
        (form1.Button2.Caption='O')and(form1.Button5.Caption='O')and(form1.Button8.Caption='O')or   // jogador
        (form1.Button3.Caption='O')and(form1.Button6.Caption='O')and(form1.Button9.Caption='O')or
        (form1.Button4.Caption='O')and(form1.Button5.Caption='O')and(form1.Button6.Caption='O')or
        (form1.Button7.Caption='O')and(form1.Button8.Caption='O')and(form1.Button9.Caption='O') then
        if messagedlg('Você ganhou, deseja continuar?',mtinformation,[mbYes,mbNo],0)= mrYes then
          inicializa
       else
           form1.Close;

end;



procedure jogada; // testa jogadas possiveis( IA)
begin
     if (jog>4) then
        mensagem
     else
     begin
     if form1.Button3.Caption='' then
        begin
             form1.Button3.Caption:='X';
             testa; // chama a procedure para testar tecla pressionada
        end
     else
         if form1.Button1.Caption='' then
            begin
                 form1.Button1.Caption:='X';
                 testa;
            end
         else
             if form1.Button5.Caption='' then
                begin
                     form1.Button5.Caption:='X';
                     testa;
                end
             else
                 if form1.Button9.Caption='' then
                    begin
                         form1.Button9.Caption:='X';
                         testa;
                    end
                 else
                     if form1.Button6.Caption='' then
                        begin
                             form1.Button6.Caption:='X';
                             testa;
                        end
                     else
                         if form1.Button4.Caption='' then
                            begin
                                 form1.Button4.Caption:='X';
                                 testa;
                            end
                         else
                             if form1.Button8.Caption='' then
                                begin
                                     form1.Button8.Caption:='X';
                                     testa;
                                end
                             else
                                 if form1.Button7.Caption='' then
                                    begin
                                         form1.Button7.Caption:='X';
                                         testa;
                                    end
                                 else
                                     if form1.Button2.Caption='' then
                                        begin
                                             form1.Button2.Caption:='X';
                                             testa;
                                        end;
             end;


end;


procedure TForm1.FormCreate(Sender: TObject);
begin
     inicializa; // chama a procedure inicializa
     escolhe;
end;

procedure TForm1.Sair1Click(Sender: TObject);
begin
     Close; // fecha o programa atraves do menu
end;

procedure TForm1.Novo1Click(Sender: TObject);
begin
     inicializa; // chama a procedure
     escolhe;    // 1a jogada do computador
end;


procedure TForm1.Button1Click(Sender: TObject);
begin
     if button1.Caption='' then
        begin
             button1.Caption:='O';
             jog:=jog+1;
             jogada;
        end
     else
         MessageDlg('Tecla já escolhida, tente outra!!',mtWarning,[mbOK],0);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
     if button2.Caption='' then
        begin
             button2.Caption:='O';
             jog:=jog+1;
             jogada;
        end
     else
         MessageDlg('Tecla já escolhida, tente outra!!',mtWarning,[mbOK],0);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
     if button3.Caption='' then
        begin
             button3.Caption:='O';
             jog:=jog+1;
             jogada;
        end
     else
         MessageDlg('Tecla já escolhida, tente outra!!',mtWarning,[mbOK],0);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
     if button4.Caption='' then
        begin
             button4.Caption:='O';
             jog:=jog+1;
             jogada;
        end
     else
         MessageDlg('Tecla já escolhida, tente outra!!',mtWarning,[mbOK],0);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
     if button5.Caption='' then
        begin
             button5.Caption:='O';
             jog:=jog+1;
             jogada;
        end
     else
         MessageDlg('Tecla já escolhida, tente outra!!',mtWarning,[mbOK],0);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
     if button6.Caption='' then
        begin
             button6.Caption:='O';
             jog:=jog+1;
             jogada;
        end
     else
         MessageDlg('Tecla já escolhida, tente outra!!',mtWarning,[mbOK],0);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
     if button7.Caption='' then
        begin
             button7.Caption:='O';
             jog:=jog+1;
             jogada;
        end
     else
         MessageDlg('Tecla já escolhida, tente outra!!',mtWarning,[mbOK],0);
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
     if button8.Caption='' then
        begin
             button8.Caption:='O';
             jog:=jog+1;
             jogada;
        end
     else
         MessageDlg('Tecla já escolhida, tente outra!!',mtWarning,[mbOK],0);
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
     if button9.Caption='' then
        begin
             button9.Caption:='O';
             jog:=jog+1;
             jogada;
        end
     else
         MessageDlg('Tecla já escolhida, tente outra!!',mtWarning,[mbOK],0);
end;





end.
