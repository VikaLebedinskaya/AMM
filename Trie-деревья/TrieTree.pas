// Подсчитать количество слов в дереве, содержащие ровно n согласных
unit TrieTree;

interface
uses TrieTreeNode,Classes, SysUtils, ComCtrls,Dialogs;
type
  TTrieTree = Class
  private
    FRoot : TTrieTreeNode;
  public
    constructor Create;
    destructor  Destroy; override;
    function Add (word : string):boolean;
    procedure PrintToMemo (SL : TStrings);
    procedure PrintToTreeView (TV : TTreeView);
    function Count(n:integer):integer;
    function LoadFromFile(AFileName: string):boolean;
    procedure SaveToFile (AFileName : string);
    function IsEmpty:boolean;
    function Find (word : string ): Boolean ;
    procedure Clear;
    function DeleteWord(word:string):boolean;
  end;

implementation

{ TTrieTree }

function IsCorrect (var word : string) : boolean;
var i, Len : integer;
begin
  word:=Trim(word);
  i:=1;
  Len:=Length(word);
  Result:=Len<>0;
  while (i<=len) and Result do
    if word[i] in [first..Last]
      then inc(i)
    else Result:=false;
end;

function TTrieTree.Add(word: string):Boolean;
begin
  Result:=IsCorrect(word);
  if Result
    then
      begin
        if FRoot = nil
          then FRoot:=TTrieTreeNode.Create;
        Result:=FRoot.Add(word)
      end;
end;

procedure TTrieTree.Clear;
begin
  FreeAndNil(FRoot);
end;

function TTrieTree.Count(n: integer): integer;
begin
  if FRoot <> nil
    then Result:=FRoot.Count(n)
    else result:=0;
end;

constructor TTrieTree.Create;
begin
  inherited Create;
  FRoot:=nil;
end;

function TTrieTree.DeleteWord(word: string): boolean;
var
  IsDel:Boolean;
begin
  Result:=IsCorrect(word) and (FRoot<>nil);
  if Result
    then
      begin
        Result:=FRoot.DeleteWord(word,IsDel);
        if IsDel
          then FreeAndNil(FRoot);
      end;
end;

destructor TTrieTree.Destroy;
begin
  Clear;
  inherited Destroy;
end;

function TTrieTree.Find(word: string): Boolean;
begin
  Result:=IsCorrect(word) and (FRoot<>nil) and FRoot.Find(word);
end;

function TTrieTree.IsEmpty: boolean;
begin
  Result:=FRoot=nil;
end;

function TTrieTree.LoadFromFile(AFileName: string):boolean;
var
  f : TextFile;
  word : string;
begin
  Clear;
  Result:=true;
  AssignFile(f, AFileName);
  reset(f);
  while not eof(f) do
    begin
      readln(f, word);
      if not Add(word) then
        Result:=false;
    end;
  CloseFile(f);
end;

procedure TTrieTree.PrintToMemo(SL: TStrings);
begin
  SL.Clear;
  if FRoot <> nil then FRoot.PrintToMemo(SL,'');
end;

procedure TTrieTree.PrintToTreeView(TV: TTreeView);
begin
  TV.Items.Clear;
  if FRoot<>nil then
    FRoot.PrintToTreeView(TV, nil);
  TV.FullExpand;
end;

procedure TTrieTree.SaveToFile(AFileName: string);
var
  F:TextFile;
begin
  AssignFile(F,AFileName);
  Rewrite(F);
  if FRoot<>nil then
    FRoot.SaveToFile(F,'');
  CloseFile(F);
end;

end.
