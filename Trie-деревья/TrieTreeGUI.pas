// Подсчитать количество слов в дереве, содержащие ровно n согласных
unit TrieTreeGUI;

interface
uses TrieTree;
type
  TTrieTreeGUI = class(TTrieTree)
  private
    FFileName:string;
    FModified:Boolean;
  public
    constructor Create;
    function LoadFromFile (AFileName : string):boolean;
    procedure SaveToFile (AFileName:string);
    procedure SaveFile;
//    procedure PrintToMemo (SL : TStrings);
    procedure Clear;
    function Add (word : string):boolean;
//    function IsEmpty:boolean;
    function DeleteWord (word : string ):boolean ;
    property Filename : string  read FFileName;
    property Modified : Boolean read FModified;
  end;

implementation

{ TTrieTreeGUI }

function TTrieTreeGUI.Add(word: string): boolean;
begin
  Result:= inherited Add(word);  {!!!!}
  FModified:=Result or FModified;
end;

procedure TTrieTreeGUI.Clear;
begin
  if not IsEmpty
    then
      begin
        inherited Clear;
        FModified:=True;
      end;
   {!!!!}
end;

constructor TTrieTreeGUI.Create;
begin
  inherited Create;
  FFileName:='';
  FModified:=False;
end;

function TTrieTreeGUI.DeleteWord(word: string): boolean;
begin
  Result:=inherited DeleteWord(word);  {!!!}
  FModified:= Result or FModified;
end;

function TTrieTreeGUI.LoadFromFile(AFileName: string): boolean;
begin
  FFileName:=AFileName;
  Result:= inherited LoadFromFile(FFileName); {!!!!}
  FModified:=False;
end;

procedure TTrieTreeGUI.SaveFile;
begin
  inherited SaveToFile(FFileName);
  FModified:=False;
end;

procedure TTrieTreeGUI.SaveToFile(AFileName: string);
begin
  FFileName:=AFileName;
  FModified:=false;
  inherited SaveToFile(FFileName);
end;

end.
