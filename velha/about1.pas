unit about1;

interface

uses
  Classes;

type
  sobre = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation

{ Important: Methods and properties of objects in VCL can only be used in a
  method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure sobre.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ sobre }

procedure sobre.Execute;
var
   t,k,i:integer;
   j:byte;
   texto: array [1..50] of char;
begin
     for i:=1 to 50 do
         texto[i]:=' ';
     texto[43]:='C';
     texto[44]:='a';
     texto[45]:='r';
     texto[46]:='l';
     texto[47]:='o';
     texto[48]:='s';
  { Place thread code here }
    for i:=1 to 300 do
         begin
              texto[49]:=texto[1];
              for j:=1 to 49 do
                  texto[j]:=texto[j+1];
              button2.Caption:=texto;
              for t:=1 to 1000 do
                  begin
                       for k:=1 to 1000 do
                           begin
                           end;
                  end;
             button2.Caption:=' ';
         end;
end;

end.
 