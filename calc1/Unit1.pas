unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, math, StdCtrls, ExtCtrls, jpeg;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    BgImg: TImage;
    Img0: TImage;
    Img1: TImage;
    img4: TImage;
    img5: TImage;
    IMg2: TImage;
    img3: TImage;
    img6: TImage;
    img7: TImage;
    img8: TImage;
    img9: TImage;
    ImgPlus: TImage;
    ImgMin: TImage;
    ImgMult: TImage;
    ImgDiv: TImage;
    ImgEqual: TImage;
    ImgClose: TImage;
    ImgMinimize: TImage;
    PointImg: TImage;
    PiImg: TImage;
    InvImg: TImage;
    XyImg: TImage;
    ExpImg: TImage;
    SinImg: TImage;
    CosImg: TImage;
    TanImg: TImage;
    XinvImg: TImage;
    RootImg: TImage;
    X2Img: TImage;
    LogImg: TImage;
    LnImg: TImage;
    PmImg: TImage;
    McImg: TImage;
    MrImg: TImage;
    MpImg: TImage;
    CImg: TImage;
    AcImg: TImage;
    Image1: TImage;
    RanImg: TImage;
    Label3: TLabel;
    RoundImg: TImage;
    IntImg: TImage;
    FactImg: TImage;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnDivClick(Sender: TObject);
    Procedure Do_Operation;
    Procedure FindResult(Op:Byte);
    procedure Img0MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Img0MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Img0MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ImgMinimizeClick(Sender: TObject);
    procedure ImgCloseClick(Sender: TObject);
    procedure BgImgMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  numb1,numb2,result,mem1:Extended;
  Operation:byte; //1=addition, 2=subtr., 3=Multip., 4=div.
  comma,ok,Xy,Pressed:boolean;

implementation

uses Unit2;

{$R *.dfm}

Procedure TForm1.Do_Operation;
begin
     if operation=0 then begin
        numb1:=StrToFloat(Label1.Caption);
     end
     else begin
          numb2:=StrToFloat(label1.caption);
          FindResult(Operation);
     end;
     Ok:=True;
     Comma:=False;
end;

Procedure TForm1.FindResult(Op:byte);
begin
     case Op of
          1: Result:=(numb1+numb2);
          2: Result:=(numb1-numb2);
          3: Result:=(numb1*numb2);
          4: Result:=(numb1/numb2);
     else
         exit;
     end;
     numb1:=result;
     label1.Caption:=FloatToStr(result);
     Operation:=0;
end;

procedure TForm1.FormCreate(Sender: TObject);
var i:byte;
    Rgn:Thandle;
begin
     Rgn:=CreateRoundRectRgn(0,0,BgImg.width,BgImg.Height,20,20);
     SetWindowRgn(handle,Rgn,true);
     DeleteObject(Rgn);
     Label1.Caption:='0';
     numb1:=0;
     numb2:=0;
     Mem1:=0;
     comma:=false;
     Xy:=False;
     Operation:=0;
     Result:=0;
     Pressed:=False;
     for i:=0 to ComponentCount-1 do
         if (Components[i] is TImage) then
            if (TImage(Components[i]).Tag<1000) then
               TImage(Components[i]).Picture.Bitmap.LoadFromResourceID
               (hInstance,(TImage(Components[i]).Tag+1)*10);
end;

procedure TForm1.BtnDivClick(Sender: TObject);
begin
     if Ok then exit;
     Do_Operation;
     Operation:=4;
end;

procedure TForm1.Img0MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     if Button<>MBLeft then exit;
     TImage(sender).Picture.Bitmap.LoadFromResourceID(hInstance,(Timage(sender).Tag+1)*10+1);
     Pressed:=True;
end;

procedure TForm1.Img0MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var i,m:extended;
begin
     if (Button<>MBLeft) or not Pressed then exit;
     TImage(sender).Picture.Bitmap.LoadFromResourceID(hInstance,(Timage(sender).Tag+1)*10);
     case TImage(sender).Tag of
     0..9: begin // numbers 0..9
           if (Label1.Caption='0') then Label1.Caption:='';
           if (Ok and not Comma) then begin
              Label1.Caption:='';
              Ok:=False;
           end;
           if Length(Label1.Caption)>=15 then exit;
           Label1.Caption:=Label1.Caption+IntToStr(TImage(sender).Tag)
           end;
     10..13: begin  // opeartions +-*/
             if Ok then exit;
             Do_Operation;
             Operation:=TImage(sender).tag-9;
             end;
     14: begin   // equal =
         if (numb1=0) or (Operation=0) and Not xy then exit;
         numb2:=StrToFloat(Label1.Caption);
         if Operation<>0 then FindResult(Operation)
         else if xy then begin
              numb1:=Power(numb1,numb2);
              Label1.Caption:=FloatToStr(numb1);
              Label2.Visible:=False;
              xy:=False;
         end;
         comma:=false;
         Numb1:=StrToFloat(Label1.caption);
         numb2:=0;
         Result:=0;
         end;
     15: begin // comma (point)
         if (Pos(',',Label1.Caption)>0) and (Operation=0)  then exit;
         if not ok then
            Label1.Caption:=Label1.Caption+','
         else
             Label1.Caption:='0,';
         comma:=True;
         end;
     16: begin // pi
              Label1.Caption:=FloatToStr(pi);
              Comma:=True;
              ok:=False;
         end;
     17: begin // inverse
              Label2.Caption:='Inverse';
              Label2.Hint:='Inverse function';
              if xy then begin
                 Label2.Visible:=False;
                 xy:=False;
                 Label1.Caption:=FloatToStr(numb1);
              end;
              Label2.Visible:=not Label2.Visible;
         end;
     18: begin // Power Xy
         if (label1.Caption='0') and not xy then exit;
         if not xy then begin
            Label2.Caption:='Power';
            Label2.Hint:='Power function (x^y)';
            Label2.Visible:=True;
            xy:=True;
            numb1:=StrToFloat(Label1.Caption);
            Label1.Caption:='0';
         end else begin
             Label2.Visible:=False;
             xy:=False;
             Label1.Caption:=FloatToStr(numb1);
         end;
         ok:=False;
         end;
     19: begin // exponential E
         if Label1.Caption='0' then Label1.Caption:='';
         If Operation=0 then begin
            Label1.Caption:=Label1.Caption+('E');
            numb1:=StrToFloat(Label1.Caption);
         end else begin
            Label1.Caption:=('E');
            numb2:=StrToFloat(Label1.Caption);
         end;
         end;
     20: begin  //sine and sine inverse
         if label1.Caption='' then exit;
         i:=StrToFloat(Label1.Caption);
         if label2.Visible and not xy then begin
            if (i<-1)or(i>1) then exit;
            i:=ArcSin(i)*180/pi;
            Label2.Visible:=False;
         end else i:=sin(i*pi/180);
         Label1.Caption:=FloatToStr(i);
         ok:=False;
         end;
     21: begin // cosine and cosine inverse
         if label1.Caption='' then exit;
         i:=StrToFloat(Label1.Caption);
         if label2.Visible and not xy then begin
            if (i<-1)or(i>1) then exit;
            i:=ArcCos(i)*180/pi;
            Label2.Visible:=False;
         end else i:=cos(i*pi/180);
         Label1.Caption:=FloatToStr(i);
         ok:=False;
         end;
     22: begin // tan and tan inverse
         if label1.Caption='' then exit;
         i:=StrToFloat(Label1.Caption);
         if label2.Visible and not xy then begin
            i:=Arctan(i)*180/pi;
            Label2.Visible:=False;
         end else i:=tan(i*pi/180);
         Label1.Caption:=FloatToStr(i);
         ok:=False;
         end;
     23: begin // 1/x
         if Label1.caption='0' then exit;
         i:=StrToFloat(Label1.Caption);
         i:=(1/i);
         Label1.Caption:=FloatToStr(i);
         ok:=False;
         end;
     24: begin // root
         if (label1.Caption='0') then exit
         else if (Copy(Label1.Caption,1,1)='-') then begin
              messagebox(handle,'Negative numbers are not allowed!','Negative Numbers',MB_Ok);
              exit;
         end;
         i:=StrToFloat(Label1.Caption);
         i:=sqrt(i);
         Label1.Caption:=FloatToStr(i);
         end;
     25: begin // x square
         if label1.Caption='0' then exit;
         i:=StrToFloat(Label1.Caption);
         i:=sqr(i);
         Label1.Caption:=FloatToStr(i);
         end;
     26: begin // log and 10^(x)
         if label1.Caption='0' then exit;
         i:=StrToFloat(Label1.Caption);
         if label2.Visible then begin
            i:=Power(10,i);
            Label2.Visible:=False;
         end else i:=Log10(i);
         Label1.Caption:=FloatToStr(i);
         ok:=False;
         end;
     27: begin // Ln and exp(x)
         if label1.Caption='0' then exit;
         i:=StrToFloat(Label1.Caption);
         if label2.Visible then begin
            i:=exp(i);
            Label2.Visible:=False;
        end else i:=Ln(i);
        Label1.Caption:=FloatToStr(i);
        ok:=False;
         end;
     28: begin // +/-
         if Label1.Caption='0' then exit;
         If Copy(label1.Caption,Length(Label1.Caption),1)='E' then
            Label1.Caption:=Label1.Caption+'-'
         else if Copy(label1.Caption,Length(Label1.Caption),1)='-' then
              Copy(label1.Caption,1,Length(Label1.Caption)-1)
         else if copy(Label1.Caption,1,1)='-' then
              Label1.Caption:=copy(Label1.Caption,2,Length(label1.Caption))
         else
             Label1.Caption:='-'+Label1.Caption;
         If Operation=0 then numb1:=StrToFloat(Label1.Caption);
         end;
     29: begin //Mc
         mem1:=0;
         label3.Visible:=False;
         end;
     30: begin //MR
         Label1.Caption:=FloatToStr(mem1);
         If Operation=0 then numb1:=StrToFloat(Label1.Caption)
         else numb2:=StrToFloat(Label1.Caption);
         end;
     31: begin //M+
         Mem1:=Mem1+StrToFloat(Label1.caption);
         Label3.Visible:=True;
         end;
     32: begin //C
         if operation=0 then numb1:=0
         else numb2:=0;
         Label1.Caption:='0';
         end;
     33: begin //AC
         numb1:=0;
         numb2:=0;
         Result:=0;
         Comma:=False;
         Ok:=False;
         Operation:=0;
         Label1.Caption:='0';
         end;
     34: begin // Random number
         Randomize;
         i:=(random(1000)+1)/1000;
         Label1.Caption:=FloatToStr(i);
         end;
     35: Begin // Fictorial;
         if Pos(',',Label1.Caption)>0  then begin
            Application.messageBox('Real numbers are not allowed!','Error',MB_Ok+MB_IconStop);
            ok:=False;
            exit;
         end;
         if Label1.Caption='0' then begin
            Label1.Caption:='1';
            exit;
         end;
         i:=StrToFloat(Label1.Caption);
         if i>60 then begin
            messageBox(handle,'Large value!','Error',MB_Ok+MB_IconStop);
            ok:=False;
            exit;
         end;
         m:=i;
         Repeat
               m:=m-1;
               i:=i*m;
         until m<=1;
         Label1.Caption:=FloatToStr(i);
         end;
     36: begin // Integer value
         i:=strTofloat(label1.caption);
         i:=Int(i);
         Label1.caption:=FloatToStr(i);
         comma:=False;
         Ok:=False;
         end;
     37: begin  // Rounded to the nearest integer
         i:=strTofloat(label1.caption);
         i:=Round(i);
         Label1.caption:=FloatToStr(i);
         Comma:=False;
         Ok:=False;
         end;
     end; //case
end;

procedure TForm1.Img0MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
     If Not (ssLeft in shift) then exit;
     if (x<=0) or (x>=(sender as TImage).width) or
        (y<=0) or (y>=(sender as TImage).Height) then begin
        TImage(sender).Picture.Bitmap.LoadFromResourceID
        (hInstance,(Timage(sender).Tag+1)*10);
        Pressed:=False;
     end
     else begin
         TImage(sender).Picture.Bitmap.LoadFromResourceID
         (hInstance,(Timage(sender).Tag+1)*10+1);
         Pressed:=True;
     end;
end;

procedure TForm1.ImgMinimizeClick(Sender: TObject);
begin
     Application.Minimize;
end;

procedure TForm1.ImgCloseClick(Sender: TObject);
begin
     Application.Terminate;
end;

procedure TForm1.BgImgMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     ReleaseCapture;
     Form1.Perform(Wm_SysCommand,$F012,0);
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
     Form2.ShowModal;
end;

end.
