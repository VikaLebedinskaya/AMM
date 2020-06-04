unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

const n=10;
type
  TIndex=1..N;
  TMatr=array[TIndex,TIndex]of integer;
  TSet=set of TIndex;
  TPath=array[TIndex] of TIndex;

var
  Roads:TMatr;   //������ ����� ��������
  A,B: TIndex;
  p:TPath;      //����
  len,j:integer; //����� ����
  POpt:TPath;      //����������� ����
  lenOpt:integer; //����� ������������ ����

type
  TForm1 = class(TForm)
    SG: TStringGrid;
    edtRoads: TEdit;
    btnCreateRoads: TButton;
    btnNewRoad: TButton;
    mmoRoads: TMemo;
    btnClear: TButton;
    edtTownA: TEdit;
    edtTownB: TEdit;
    lblTownA: TLabel;
    lblTownB: TLabel;
    procedure btnCreateRoadsClick(Sender: TObject);
    procedure btnNewRoadClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
     
  private
    procedure MainAllPath;
    procedure FindAllPath(t:TIndex; var visited:TSet);{ Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCreateRoadsClick(Sender: TObject);
var i,j:integer;
begin
  for i:=0 to n do
    begin
      SG.Cells[i,0]:=inttostr(i);
      SG.Cells[0,i]:=inttostr(i);
    end;
   Randomize;
  for i := 1 to N do
    begin
      SG.cells[i,i]:=inttostr(0);
      for j := i+1 to N do
        begin
          SG.cells[i,j]:= inttostr(random(30));
          SG.cells[j,i]:= SG.cells[i,j];
        end;
    end;

end;

procedure TForm1.FindAllPath;
  var k,i,road,b: integer;
  s:string;
  begin
   b:= strtoint(edtTownB.Text);
    for k := 1 to N do
      begin
          road:= strtoint(SG.cells[1,k]);
          //����� ������ - k
          if (road <> 0) and not (k in visited) then // k ��������
          begin
            len:=len+road;
            j:=j+1;
            P[j]:=k;  {������� ����� i � ����}
            Include(visited,k);  {�������� i � ��������� �������, �. ��������}

            //������� �� ������ = �� ����� �� ������ B
            if k <> b
            then Form1.FindAllPath(k,visited)
            else
              begin
                if len < 100 then
                  begin
                    s:= '���� - '+inttostr(len);
                    mmoRoads.lines.add(s);
                    s:='';
                    for i := 1 to j do
                    s:=s+inttostr(p[i])+' ';
                    mmoRoads.lines.add(s);
                  end;
              end;

              //��������� i �� ��������� �������, �. ��������
            Exclude(visited,k);
            len:=len-1;
          end;
      end;
  end;

procedure tForm1.MainAllPath;
/// 2.����� ���� �����
var v:TSet;
a:integer;
begin
  //�������� ���� �� ������ A
  len:=1;
  j:=1;
  a:=strtoint(edtTownA.Text);
  P[j]:=a;
  v:=[a];
  Form1.FindAllPath(a,v)
end;

procedure TForm1.btnNewRoadClick(Sender: TObject);
begin
   Form1.MainAllPath;
   mmoRoads.ScrollBars:=ssVertical;
end;

procedure TForm1.btnClearClick(Sender: TObject);
var i,j: integer;
begin
  for i:=1 to n do
  for j:=1 to n do
    begin
      SG.Cells[i,j]:='';
      SG.Cells[j,i]:='';
    end;
  mmoRoads.Clear;
  mmoRoads.lines.add('��� ��������� ���� ����� �������� � � � ������ 100�� : ');
  edtTownA.Text:='';
  edtTownB.Text:='';
end;

end.
