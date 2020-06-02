// Подсчитать количество слов в дереве, содержащие ровно n согласных
unit TrieTreeNode;

interface
uses Classes, SysUtils, ComCtrls;
const
  first = 'a';
  last = 'z';
  glas= ['a','o','u','e','i','y'];

type
  TIndex = first..Last;

  TTrieTreeNode = class
  private
    FEow : boolean;
    FNext : array [TIndex] of TTrieTreeNode;
  public
    constructor Create;
    destructor  Destroy; override;
    function Add(var word: string):boolean;
    function DeleteWord(const word:string; var IsDel:boolean):Boolean;
    function Find(const word:string):Boolean;
    function IsEmpty:boolean;
    procedure SaveToFile(var F:TextFile; word:string);
    function Count(n:integer):Integer;  {!!!!}
    procedure PrintToMemo (SL : TStrings; word : string);
    procedure PrintToTreeView (TV : TTreeView; AParentNode : TTreeNode);
  end;
implementation

{ TTrieTreeNode }

function TTrieTreeNode.Add(var word: string):boolean;
var
  FirstLet:TIndex;
begin
  if word = ''
    then
      begin
        result:= not FEow;
        FEow:=True;
      end
    else
      begin
        FirstLet:=word[1];
        Delete(word,1,1);
        if FNext[FirstLet]=nil
          then FNext[FirstLet]:=TTrieTreeNode.Create;
        Result:=FNext[FirstLet].Add(word);
      end;
end;

function TTrieTreeNode.Count(n:integer):Integer;
var
  i:TIndex;
begin
  Result:=Ord(FEow and (n=0));
  if n>=0
    then
      for i:=first to last do
        if FNext[i] <> nil
          then Result:=Result+FNext[i].Count(n-Ord(not (i in glas)));
end;

constructor TTrieTreeNode.Create;
var
  i:TIndex;
begin
  FEoW:=False;
  for i:=first to last do FNext[i]:=nil;
end;

function TTrieTreeNode.DeleteWord(const word: string; var IsDel:Boolean): Boolean;
begin
  if word=''
    then
      begin
        result:=FEow;
        FEow:=False;
      end
    else
      if FNext[word[1]]<>nil
        then
          begin
            Result:=FNext[word[1]].DeleteWord(Copy(word,2,Length(word)-1),IsDel);
            if IsDel
              then FreeAndNil(FNext[word[1]])
          end
        else result:=False;
  IsDel:=Isempty;
end;

destructor TTrieTreeNode.Destroy;
var
  i:TIndex;
begin
  for i:=first to Last do FNext[i].Free;
  inherited Destroy;
end;

function TTrieTreeNode.Find(const word: string): Boolean;
begin
  if word = ''
    then Result:=FEow
    else Result:=(FNext[word[1]]<>nil) and (FNext[word[1]].Find(Copy(word,2,Length(word)-1)));
end;

function TTrieTreeNode.IsEmpty: boolean;
var
  i:TIndex;
begin
  Result:=not FEow and (FNext[first]=nil);
  if Result
    then
      begin
        i:=first;
        repeat
          inc(i);
          Result:=FNext[i]=nil
        until (i=Last) or not Result;
      end;
end;

procedure TTrieTreeNode.PrintToMemo(SL: TStrings; word: string);
var
  i:TIndex;
begin
  if FEow
    then SL.Add(word);
  for i:=first to last do
  if FNext[i] <> nil
    then
      begin
        word:=word+i;
        FNext[i].PrintToMemo(SL,word);
        delete(word, length(word), 1);
      end;
end;

procedure TTrieTreeNode.PrintToTreeView(TV: TTreeView;
  AParentNode: TTreeNode);
Var
  i:TIndex;
begin
  if FEow
    then TV.Items.AddChild(AParentNode,'*');
  for i:= first to last do
    if FNext[i]<>nil
      then FNext[i].PrintToTreeView(TV, TV.Items.AddChild(AParentNode, i));
end;

procedure TTrieTreeNode.SaveToFile(var F: TextFile; word:string);
var
  i:TIndex;
begin
  if FEow
    then Writeln(F,word);
  for i:=first to last do
  if FNext[i] <> nil
    then
      begin
        word:=word+i;
        FNext[i].SaveToFile(F,Word);
        delete(word, length(word), 1);
      end;

end;

end.
