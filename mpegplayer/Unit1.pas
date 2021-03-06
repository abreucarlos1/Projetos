unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, MPEGPlay, Gauges, ExtCtrls, Buttons, slider, Db, DBTables,
  DBCtrls, Grids, DBGrids, Menus, Mask,sobre, ComCtrls, ToolWin;

type
    TForm1 = class(TForm)

    OpenDialog1: TOpenDialog;
    MPEGPlayer1: TMPEGPlayer;
    Timer1: TTimer;
    ListBox1: TListBox;
    PopupMenu1: TPopupMenu;
    Adiciona1: TMenuItem;
    Toca1: TMenuItem;
    SaveDialog1: TSaveDialog;
    ListBox2: TListBox;
    Bevel1: TBevel;
    grupolista: TRadioGroup;
    Panel2: TPanel;
    grupoprocura: TRadioGroup;
    edit1: TEdit;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    first: TBitBtn;
    prev: TBitBtn;
    next: TBitBtn;
    last: TBitBtn;
    GroupBox1: TGroupBox;
    todatabela: TRadioButton;
    soselecionado: TRadioButton;
    Edit2: TEdit;
    Deletar: TButton;
    GroupBox2: TGroupBox;
    adiciona: TButton;
    Cancela: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Path: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DataSource1: TDataSource;
    Table1: TTable;
    acima: TBitBtn;
    abaixo: TBitBtn;
    deleta: TBitBtn;
    abre: TBitBtn;
    salvar: TBitBtn;
    Gauge1: TGauge;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    SalvarLista1: TMenuItem;
    Abrirlista1: TMenuItem;
    Bancodedados1: TMenuItem;
    Adicionar1: TMenuItem;
    Remover1: TMenuItem;
    ExcluirtodaTabela1: TMenuItem;
    N1: TMenuItem;
    Sobre1: TMenuItem;
    N2: TMenuItem;
    Sair1: TMenuItem;
    Sobre2: TMenuItem;
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    Toolplay: TToolButton;
    pause: TToolButton;
    stop: TToolButton;
    Table1Indice: TFloatField;
    Table1NomedaMsica: TStringField;
    Table1NomedoAutor: TStringField;
    Table1Path: TStringField;
    BitBtn1: TBitBtn;
    musica: TLabel;
    autor: TLabel;
    Label5: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure pauseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure stopClick(Sender: TObject);
    procedure adicionar;
    procedure played(arquivo:string);// toca arquivo
    procedure stoped; // para o tocador
    procedure pegaentrada;// atualiza o No de registros
    procedure pegaprocura(campo:word);// testa qual field indexar
    procedure testaradiogroup;// testa radiogroup para  deletar
    procedure BOFMSG; // verifica inicio de tabela
    procedure EOFMSG; // verifica o fim da tabela
    procedure MSGDELETE;// verifica o item delete selecionado
    procedure EditaRegistros(var indexador:byte;campo,etiqueta:string);
    procedure Delet;//deleta a tabela conforme radiobutton
    procedure Salvalista; //salva o conteudo da listbox
    procedure abrirlista;//procura indice
    procedure Toca1Click(Sender: TObject);// toca o registro selecionado
    procedure tocalista; // toca os itens da listbox
    procedure pathClick(Sender: TObject);// seleciona caminho
    procedure adicionaClick(Sender: TObject);// adiciona musica ao BD
    procedure grupoprocuraClick(Sender: TObject);
    procedure cancelaClick(Sender: TObject);// desfaz adiciona BD
    procedure firstClick(Sender: TObject);// vai 1o registro
    procedure lastClick(Sender: TObject); // vai ultimo registro
    procedure prevClick(Sender: TObject); // vai para o registro anterior
    procedure nextClick(Sender: TObject); // vai para o proximo registro
    procedure zeraitemslista;// zera os indice da listbox
    procedure adicionaitemlista; // soma 1 a listbox
    procedure finaliza (ind:integer); // finaliza entrada no DB
    procedure edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DeletarClick(Sender: TObject);// deleta registros
    procedure paratocador; // para o mpegplayer
    procedure tocaumavez; // chamada toca musica 1 vez
    procedure tocamusica; // chamada com rotulos e tocaumavez
    procedure rotulos; //mostra o nome autor e da musica
    procedure Adiciona1Click(Sender: TObject);
    procedure acimaClick(Sender: TObject);
    procedure abaixoClick(Sender: TObject);
    procedure deletaClick(Sender: TObject);
    procedure salvarClick(Sender: TObject);
    procedure abreClick(Sender: TObject);
    procedure MPEGPlayer1PlayEnd(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Adicionar1Click(Sender: TObject);
    procedure Remover1Click(Sender: TObject);
    procedure ExcluirtodaTabela1Click(Sender: TObject);
    procedure SalvarLista1Click(Sender: TObject);
    procedure Abrirlista1Click(Sender: TObject);
    procedure playClick(Sender: TObject);
    procedure Sobre2Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure grupolistaClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  Form1: TForm1;
  indice:integer;
  control:boolean;

  

implementation

{$R *.DFM}
procedure tform1.tocaumavez;
begin
     played(table1.fields[3].text);
end;

procedure tform1.rotulos;
begin
     musica.Caption:='M�sica: '+table1.Fields[1].Text;
     autor.Caption:='Autor: '+table1.Fields[2].Text;
end;

procedure tform1.tocamusica;
begin
     rotulos;
     tocaumavez;
end;

procedure tform1.paratocador;
begin
      mpegplayer1.Stop;
      stoped;
end;

procedure Tform1.finaliza(ind:integer);
begin
     if (dbedit1.Text='')and(dbedit2.text='') then
        begin
             messagedlg('Os campos devem ser preenchidos!!',mtError,[mbOk],0);
             dbedit1.SetFocus;
        end
     else
         begin
              opendialog1.FileName:='';
              opendialog1.Filter:='Arquivos de mp3|*.mp3';
              if opendialog1.Execute then
                 begin
                      with table1 do
                           begin
                                fieldByName('Indice').Asinteger:=ind;
                                FieldByName('Path').AsString:=opendialog1.FileName;
                                Post;
                           end;
                 end;
         end;
     adiciona.enabled:=true;
     label1.Enabled:=false;
     label2.Enabled:=false;
     dbedit1.Enabled:=false;
     dbedit2.Enabled:=false;
     path.enabled:=false;
     pegaentrada;
end;

procedure Tform1.stoped;// para o tocador
begin
     timer1.Enabled:=false;
     mpegplayer1.Close;
end;

procedure tform1.zeraitemslista;// zera os indices das listbox
begin
     listbox2.ItemIndex:=0;
     listbox1.ItemIndex:=0;
end;

procedure tform1.adicionaitemlista;// acrescenta 1 aos indices das listbox
begin
     listbox1.ItemIndex:=listbox1.ItemIndex+1;
     listbox2.itemindex:=listbox2.itemindex+1;
end;

procedure tform1.adicionar;// adiciona registro
begin
     //dbedit1.SetFocus;
     with table1 do
          begin
               IndexFieldNames:='Indice';
               setkey;
               first;
               indice:=1;
               while not eof do
                     begin
                          if fieldbyname('Indice').Asinteger=indice then
                             indice:=indice+1;
                          next;
                     end;
               Append;
          end;
     adiciona.enabled:=false;
     cancela.Enabled:=true;
     label1.Enabled:=true;
     label2.Enabled:=true;
     dbedit1.Enabled:=true;
     dbedit1.SetFocus;
     dbedit2.Enabled:=true;
     path.enabled:=true;
end;
procedure Tform1.abrirlista;// obtem a lista do arquivo
var
   arquivo:textfile;
   temp:string;
begin
     opendialog1.FileName:='';
     opendialog1.Filter:='Arquivos de Sele��o|*.slm';
     if opendialog1.Execute then
        begin
             assignfile(arquivo,opendialog1.filename);
             reset(arquivo);
             while not eof(arquivo) do
                   begin
                        readln(arquivo,temp);
                        with table1 do
                             begin
                                  IndexFieldNames:='Indice';
                                  setkey;
                                  FieldByName('Indice').asstring:=temp;
                                  GotoNearest;
                             end;
                        listbox1.Items.Add(table1.fields[1].text);
                        listbox2.Items.Add(table1.fields[0].text);
                   end;
             closefile(arquivo);
        end;

end;

procedure Tform1.Salvalista;// salva sele��o da lista em arquivo
var
   arquivo:textfile;
   vezes:word;
begin
     savedialog1.Filter:='Arquivos de Sele��o|*.slm';
     if savedialog1.Execute then
        begin
             assignfile(arquivo,savedialog1.filename);
             rewrite(arquivo);
             for vezes:=0 to listbox2.Items.Count-1 do
                 begin
                      writeln(arquivo,listbox2.items.strings[vezes]);
                 end;
             closefile(arquivo);
        end;
end;

procedure Tform1.Delet; // deleta registros do BD
var
   procura:byte;
begin
     procura:=0;
     if grupoprocura.ItemIndex=0 then
        procura:=1;
     if grupoprocura.ItemIndex=1 then
        procura:=2;
     if soselecionado.Checked then
        if edit2.Text='' then
           MSGDELETE
        else
            if messagedlg('Item da '+table1.Fields[procura].displaylabel+chr(13)+edit2.text+chr(13)+'Voce deseja deletar este item?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
                  begin
                       table1.Delete;
                       pegaentrada;
                  end;
     if todatabela.Checked then
        if messagedlg('ATEN��O!!! Todos os itens ser�o EXCLU�DOS',mtInformation,[mbYes,MbNo],0)=mrYes then
               begin
                    with table1 do
                         begin
                              active:=false;
                              EmptyTable;
                              active:=true;
                         end;
                    pegaentrada;
               end;
end;

procedure Tform1.EditaRegistros(var indexador:byte;campo,etiqueta:string);// procura registros do BD
begin
     with table1 do
          begin
               IndexFieldNames:=campo;
               setkey;
               FieldByName(etiqueta).AsString:=edit1.Text;
               GotoNearest;
          end;
      pegaprocura(indexador);
end;

procedure Tform1.MSGDELETE;
begin
     messagedlg('N�o h� nenhum item selecionado!!',mtinformation,[mbOk],0);
end;

procedure Tform1.testaradiogroup;// testa para procura por autor ou musica
begin
     if grupoprocura.ItemIndex=0 then
        pegaprocura(1);
     if grupoprocura.ItemIndex=1 then
        pegaprocura(2);
end;

procedure Tform1.pegaprocura(campo:word);// obtem texto para procura
begin
     edit2.Text:=table1.Fields[campo].Text;
end;

procedure Tform1.BOFMSG;
begin
     messagedlg('A tabela j� est� no inicio!!',mtInformation,[mbOk],0);
end;

procedure tform1.EOFMSG;
begin
     messagedlg('A tabela j� est� no final!!',mtInformation,[mbOk],0);
end;

procedure Tform1.pegaentrada;// conta registros do BD
begin
     label3.Caption:=inttostr(table1.recordcount);
end;

procedure Tform1.played(arquivo:string);// toca a musica retornada
begin                                  // por 'arquivo'

     if mpegplayer1.Mode=0 then
        begin
             toolbar1.Buttons[0].ImageIndex:=3;
             toolbar1.Buttons[2].ImageIndex:=2;
             toolbar1.Buttons[1].ImageIndex:=1;
        end;
     if mpegplayer1.Mode=2 then
        begin
             toolbar1.Buttons[2].ImageIndex:=2;
             toolbar1.Buttons[0].ImageIndex:=3;
        end;
     if mpegplayer1.Mode=4 then
        begin
             toolbar1.Buttons[1].ImageIndex:=1;
             toolbar1.Buttons[0].ImageIndex:=3;
        end;
         if arquivo='' then
            messagedlg('M�sica n�o v�lida...',MTerror,[mbOk],0)
         else
             begin
                  with mpegplayer1 do
                       begin
                            StreamName:=arquivo;
                            Open;
                            EndPos:=mpegplayer1.Length;
                            gauge1.MaxValue:=mpegplayer1.Length;
                            gauge1.Enabled:=true;
                            Play;
                       end;
                  timer1.Enabled:=true;
             end;
end;


procedure TForm1.Timer1Timer(Sender: TObject);

begin
     gauge1.Progress:=mpegplayer1.CurrentPosition; // modifica o status do gauge
end;

procedure TForm1.pauseClick(Sender: TObject);// bot�o pausa
begin
     if mpegplayer1.Mode=4 then
        begin
             mpegplayer1.Paused:=false;
        end;
     if mpegplayer1.Mode=3 then
        begin
             mpegplayer1.Paused:=true;
        end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
     mpegplayer1.Init;// inicializa a DLL
    pegaentrada;// conta itens do BD

end;

procedure TForm1.stopClick(Sender: TObject);// bot�o stop
begin
     paratocador;
end;

procedure TForm1.Toca1Click(Sender: TObject);// toca o registro selecionado
begin
     toolbar1.Buttons[0].ImageIndex:=3;
     tocamusica;
end;

procedure TForm1.pathClick(Sender: TObject);// bot�o caminho do arquivo
begin
     finaliza(indice);
end;

procedure TForm1.adicionaClick(Sender: TObject);// bot�o adiciona
begin
    adicionar;
end;


procedure TForm1.grupoprocuraClick(Sender: TObject);// escolha musica ou autor
begin
     edit1.setfocus;
     testaradiogroup;
end;

procedure TForm1.cancelaClick(Sender: TObject);// cancela altera��es no BD
begin
     cancela.Enabled:=false;
     table1.Cancel;
     adiciona.Enabled:=true;
     label1.Enabled:=false;
     label2.Enabled:=false;
     dbedit1.Enabled:=false;
     dbedit2.Enabled:=false;
     path.Enabled:=false;
end;

procedure TForm1.firstClick(Sender: TObject);// vai para o 1o registro do BD
begin
     if table1.BOF then
        BOFMSG
     else
         begin
              table1.First;
              testaradiogroup;
         end;

end;

procedure TForm1.lastClick(Sender: TObject);// vai para o ultimo registro do BD
begin
     if table1.EOF then
        EOFMSG
     else
         begin
              table1.Last;
              testaradiogroup;
         end;
end;

procedure TForm1.prevClick(Sender: TObject);// vai para um registro anterior do BD
begin
     if table1.BOF then
        BOFMSG
     else
         begin
              table1.Prior;
              testaradiogroup;
         end;
end;

procedure TForm1.nextClick(Sender: TObject);// vai para um registro posterior do BD
begin
     if table1.EOF then
        EOFMSG
     else
         begin
              table1.Next;
              testaradiogroup;
         end;
end;

procedure TForm1.edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   ind:byte;
begin
     if (mpegplayer1.Mode=0) or (mpegplayer1.Mode=1) then
        begin
             if grupoprocura.ItemIndex=0 then
                begin
                     ind:=1;
                     editaregistros(ind,'NMINDEX','Nome da M�sica');
                end;
             if grupoprocura.ItemIndex=1 then
                begin
                     ind:=2;
                     editaregistros(ind,'NAINDEX','Nome do Autor');
                end;
        end;
end;

procedure TForm1.DeletarClick(Sender: TObject);// bot�o delete
begin
     testaradiogroup;
     delet;
end;

procedure TForm1.Adiciona1Click(Sender: TObject);// adiciona musica � listbox
begin
     listbox1.Items.Add(table1.fieldbyname('Nome da M�sica').AsString);
     listbox2.Items.Add(table1.fieldbyname('Indice').AsString);
end;

procedure TForm1.acimaClick(Sender: TObject);// sobe um item da listbox
begin
     if (listbox1.ItemIndex<=0) and (listbox2.ItemIndex<=0) then
        messagedlg('Lista j� est� no inicio',mtInformation,[mbOk],0)
     else
         begin
              listbox1.ItemIndex:=listbox1.ItemIndex-1;
              listbox2.itemindex:=listbox2.itemindex-1;
         end;
end;

procedure TForm1.abaixoClick(Sender: TObject);// desce um item da listbox
begin
     if (listbox1.ItemIndex>=listbox1.Items.Count-1) and (listbox2.ItemIndex>=listbox2.Items.Count-1) then
        messagedlg('Lista j� est� no final',mtInformation,[mbOk],0)
     else
         begin
              adicionaitemlista;
         end;
end;

procedure TForm1.deletaClick(Sender: TObject);// deleta os itens da listbox
begin
     if grupolista.ItemIndex=0 then
        if messagedlg('Voce quer apagar toda a lista?',mtWarning,[mbYes,mbCancel],0)=mrYes then
           begin
                listbox1.Clear;
                listbox2.Clear;
           end;
     if grupolista.ItemIndex=1 then
        if listbox1.Items.Count<=0 then
           messagedlg('N�o h� items na lista',mtError,[mbOk],0)
        else
            if listbox1.Itemindex=-1 then
               zeraitemslista
            else
                if messagedlg('Voce deseja remover este item?:'+chr(13)+listbox1.Items.Strings[listbox1.ItemIndex],mtWarning,[mbYes,mbCancel],0)=mrYes then
                   begin
                        listbox1.Items.Delete(listbox1.ItemIndex);
                        listbox2.Items.Delete(listbox2.itemIndex);
                   end;

end;

procedure TForm1.salvarClick(Sender: TObject);// bot�o salvar;
begin
     salvalista;
end;

procedure TForm1.abreClick(Sender: TObject);// bot�o abrir
begin
     abrirlista;
end;

procedure TForm1.MPEGPlayer1PlayEnd(Sender: TObject);
begin
     if not control then
        begin
             adicionaitemlista;
             label5.Caption:=inttostr(listbox1.itemindex);
             tocalista;
             if listbox2.ItemIndex=listbox2.Items.Count-1 then
                begin
                     zeraitemslista;
                     paratocador;
                end;
        end
     else
         begin
              control:=false;
              paratocador;
         end;
end;

procedure TForm1.Sair1Click(Sender: TObject);// encerra programa
begin
     Close;
end;

procedure TForm1.Adicionar1Click(Sender: TObject);
begin
     adicionar;
end;

procedure TForm1.Remover1Click(Sender: TObject);
begin
     delet;
end;

procedure TForm1.ExcluirtodaTabela1Click(Sender: TObject);
begin
     todatabela.Checked:=true;
     delet;
end;

procedure TForm1.SalvarLista1Click(Sender: TObject);
begin
     salvalista;
end;

procedure TForm1.Abrirlista1Click(Sender: TObject);
begin
     abrirlista;
end;

procedure tform1.tocalista;// toca a listbox
var
   listitem:integer;
begin
     if (listbox1.Items.Count>0) and (not control) then
        //if messagedlg('Voce deseja tocar m�sica da tabela?',MTinformation,[mbNo,MbYes],0)=mrNo then
             begin
                  if grupolista.ItemIndex=0 then
                     begin
                          if listbox2.Itemindex<0 then
                             zeraitemslista;
                          listitem:=listbox2.itemindex;
                          with table1 do
                               begin
                                    IndexFieldNames:='Indice';
                                    setkey;
                                    FieldByName('Indice').asstring:=listbox2.Items.Strings[listitem];
                                    GotoNearest;
                               end;
                          //played(table1.Fields[3].Text);
                     end;
                  if grupolista.ItemIndex=1 then
                     begin
                          zeraitemslista;
                          with table1 do
                               begin
                                    IndexFieldNames:='Indice';
                                    setkey;
                                    listitem:=listbox2.ItemIndex;
                                    FieldByName('Indice').asstring:=listbox2.Items.Strings[listitem];
                                    GotoNearest;
                               end;
                          //played(table1.Fields[3].Text);
                     end;
             end;
        tocamusica;
end;


procedure TForm1.playClick(Sender: TObject);// bot�o play
begin
     tocalista;
end;

procedure TForm1.Sobre2Click(Sender: TObject);
begin
     form2.ShowModal;
end;

procedure TForm1.ToolButton2Click(Sender: TObject);
begin
     if mpegplayer1.Mode=3 then
        begin
             toolbar1.Buttons[1].ImageIndex:=4;
             mpegplayer1.Paused:=true;
             toolbar1.Buttons[0].ImageIndex:=0;
        end;
     if (mpegplayer1.Mode=4) and (toolbar1.Buttons[1].ImageIndex=4) then
        begin
             mpegplayer1.Paused:=false;
             toolbar1.Buttons[1].ImageIndex:=1;
             toolbar1.Buttons[0].ImageIndex:=3;
        end;
end;

procedure TForm1.ToolButton1Click(Sender: TObject);
begin
     label5.Caption:=inttostr(listbox1.itemindex);
     tocalista;

     {if mpegplayer1.Mode=0 then
        begin
             toolbar1.Buttons[0].ImageIndex:=3;
             toolbar1.Buttons[2].ImageIndex:=2;
             toolbar1.Buttons[1].ImageIndex:=1;
             tocalista;
        end;
     if mpegplayer1.Mode=2 then
        begin
             toolbar1.Buttons[2].ImageIndex:=2;
             toolbar1.Buttons[0].ImageIndex:=3;
             tocalista;
        end;
     if mpegplayer1.Mode=4 then
        begin
             toolbar1.Buttons[1].ImageIndex:=1;
             toolbar1.Buttons[0].ImageIndex:=3;
             tocalista;
        end;}
end;

procedure TForm1.ToolButton3Click(Sender: TObject);
begin
     if mpegplayer1.Mode=3 then
        begin
             toolbar1.Buttons[2].ImageIndex:=5;
             toolbar1.Buttons[1].ImageIndex:=1;
             toolbar1.Buttons[0].ImageIndex:=0;
             musica.Caption:='M�sica:';
             autor.Caption:='Autor:';
             mpegplayer1.Stop;
             stoped;
        end;
end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
begin
     toolbar1.Buttons[0].ImageIndex:=3;
     control:=true;
     tocamusica;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
     listbox1.Items.Add(table1.fieldbyname('Nome da M�sica').AsString);
     listbox2.Items.Add(table1.fieldbyname('Indice').AsString);
end;


procedure TForm1.ListBox1Click(Sender: TObject);
begin
     control:=false;
end;

procedure TForm1.grupolistaClick(Sender: TObject);
begin
     control:=false;
end;

end.
