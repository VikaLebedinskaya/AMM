unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type Trec = record
             ch : char;
             key : integer;
            end;
     mas = array [1..100] of Trec;
type
  TForm1 = class(TForm)
    Label1: TLabel;
    edtRecCount: TEdit;
    lbl2: TLabel;
    mmoRecStart: TMemo;
    mmoRecRes: TMemo;
    lbl3: TLabel;
    lbl4: TLabel;
    btnSort: TButton;
    btnClear: TButton;
    btnCreate: TButton;
    procedure btnCreateClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnSortClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  mRec:mas;

implementation

{$R *.dfm}


procedure TForm1.btnCreateClick(Sender: TObject);
var rec: Trec;
i,n,code:integer;
s,keys:string;
begin
  val(edtRecCount.text,n,code) ;
  for i:=1 to 100 do
    begin
      rec.ch:=#0;
      rec.key:=0;
      mRec[i]:=rec;
    end;

  for i:=1 to n do
    begin
      randomize;
      rec.ch:=chr(random(96) + 32);
      randomize;
      rec.key:=random(20)+1;
      mRec[i]:=rec;
    end;
  s:=''; Keys:='';
  for i:=1 to n do
    begin
      str(mrec[i].key,keys);
      s:='ch: '+mrec[i].ch+' key: '+keys;
      mmoRecStart.Lines.Add(s);
    end;

end;

procedure TForm1.btnClearClick(Sender: TObject);
var i,n:integer;
begin
  mmoRecStart.Clear;
  mmoRecRes.Clear;
  edtRecCount.Text:='';
end;

procedure DisCalculat(var mRec:mas; n: integer);
var Count:array[1..100] of integer;
i,j,k:integer;
begin
  k:=1;
  for k:=1 to 100 do
    count[k]:=0;
  for i:=1 to n do
  with mRec[i] do
    Count[key]:= Count[key] +1;
  j:=0;
  for k:=1 to 100 do
    for i:=1 to count[k] do
      begin
        j:=j+1;
        mRec[j].key :=k;
      end;

end;

procedure TForm1.btnSortClick(Sender: TObject);
var i,n,code:integer;
s,keys:string;
begin
  val(edtRecCount.text,n,code);
  DisCalculat(mRec,n);
  s:=''; keys:='';
  for i:=1 to n do
    begin
      str(mrec[i].key,keys);
      s:='ch: '+mrec[i].ch+' key: '+keys;
      mmoRecRes.Lines.Add(s);
    end;

end;

end.
