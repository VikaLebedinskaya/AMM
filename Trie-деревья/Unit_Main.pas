// В Trie-дереве подсчитать количество слов, содержащих определенное количество согласных
unit Unit_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  QDialogs, ComCtrls, TrieTreeGUI, StdCtrls, Menus, Dialogs;

type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    Menu: TMenuItem;
    NOpen: TMenuItem;
    NSave: TMenuItem;
    NSaveAs: TMenuItem;
    NExit: TMenuItem;
    memo_current: TMemo;
    dlgOpen: TOpenDialog;
    dlgSave: TSaveDialog;
    L1: TMenuItem;
    NCount: TMenuItem;
    NNew: TMenuItem;
    N1: TMenuItem;
    NAdd: TMenuItem;
    NDelete: TMenuItem;
    NClear: TMenuItem;
    NSearch: TMenuItem;
    NClose: TMenuItem;
    N2: TMenuItem;
    procedure NOpenClick(Sender: TObject);
    procedure NSaveClick(Sender: TObject);
    procedure NSaveAsClick(Sender: TObject);
    procedure NExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NCountClick(Sender: TObject);
    procedure NAddClick(Sender: TObject);
    procedure NCloseClick(Sender: TObject);
    procedure NNewClick(Sender: TObject);
    procedure NDeleteClick(Sender: TObject);
    procedure NClearClick(Sender: TObject);
    procedure NSearchClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    Tree:TTrieTreeGUI;
    procedure MyIdle(sender: TObject; var Done:Boolean);
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}
const
  separators = [' ',',',';','.','?','!',':','-'];

function NextWord(s:string; var i:Integer):string;
var
  Len:Integer;
begin
  Len:=Length(s);
  while (i<=Len) and (s[i] in separators) do inc(i);
  Result:='';
  while (i<=Len) and (not (s[i] in separators)) do
  begin
    Result:=Result+s[i];
    inc(i);
  end;
end;

procedure TMainForm.NSearchClick(Sender: TObject);
var
  word:string;
begin
  word:='';
  if InputQuery('Поиск', 'Введите слово', word) then
    begin
      if Tree.Find(word) then
        ShowMessage('Слово Найдено')
      else
        ShowMessage('Слово не найдено');
    end;
end;

procedure TMainForm.NOpenClick(Sender: TObject);
begin

  if dlgOpen.Execute
    then
      begin
        if Tree <> nil
          then NClose.Click;
        if Tree = nil
          then
            begin
              Tree:=TTrieTreeGUI.Create;
              Tree.LoadFromFile(dlgOpen.FileName);
              Tree.PrintToMemo(memo_current.Lines);
            end;
   //     Tree.PrintToTreeView(TV);
      end;
end;

procedure TMainForm.NSaveClick(Sender: TObject);
begin
  if Tree.Filename = ''
    then NSaveAs.Click
    else Tree.SaveFile;
end;

procedure TMainForm.NSaveAsClick(Sender: TObject);
begin
  dlgSave.FileName:=Tree.Filename;
  if dlgSave.Execute
    then Tree.SaveToFile(dlgSave.FileName);
end;

procedure TMainForm.NExitClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Tree:=nil;
  Application.OnIdle:=MyIdle;
  dlgOpen.InitialDir:=ExtractFilePath(Application.ExeName);
  dlgSave.InitialDir:=dlgOpen.InitialDir;
end;

procedure TMainForm.NCountClick(Sender: TObject);
var
  n:Integer;
begin
  n:=0;
  if QDialogs.InputQuery('Обработка дерева','Введите количество согласных',n, 0)
    then ShowMessage('Количество слов с '+intToStr(n)+' согласной(ыми) = '+IntToStr(Tree.Count(n)));
end;

procedure TMainForm.NAddClick(Sender: TObject);
var
  temp,inp_str:string;
  i,len,CountWords:Integer;
  ErrorAdd:Boolean;
begin
  inp_str:='';
  CountWords:=0;
  ErrorAdd:=False;
  if QDialogs.InputQuery('Добавление слов','Введите слова:',inp_str)
    then
      begin
        Len:=Length(inp_str);
        while (i <= Len) and not ErrorAdd do
        begin
          temp:=NextWord(inp_str,i);
          if temp <> ''
           then
              if Tree.Add(temp)
                then inc(CountWords)
                else
                  begin
                    ErrorAdd:=True;
                    ShowMessage('Cлово уже есть в дереве, либо некорректно. Успешно считано '+inttostr(CountWords)+' слов');
                  end;
        end;
      end;
  if CountWords >0
    then Tree.PrintToMemo(memo_current.Lines);
end;

procedure TMainForm.NCloseClick(Sender: TObject);
var
  CanClose:Boolean;
begin
  Canclose:=True;
  if (Tree<>nil) and (Tree.Modified)
    then
      case MessageDlg('Сохранить изменения?', mtConfirmation,[mbYes,mbNo,mbCancel],0) of
        mrNo:;
        mrCancel: CanClose:=False;
        mrYes:
          begin
            NSave.Click;
            CanClose:= not Tree.Modified;
          end;
      end;
  if CanClose
    then FreeAndNil(Tree);
end;

procedure TMainForm.NNewClick(Sender: TObject);
begin
  if Tree <> nil
    then NClose.Click;

  if Tree = nil
    then
      begin
        Tree:=TTrieTreeGUI.Create;
        memo_current.Text:='';
      end;
end;

procedure TMainForm.NDeleteClick(Sender: TObject);
var
  word:string;
begin
  word:='';
  if QDialogs.InputQuery('Удаление слова','Введите слов',word)
    then
      if Tree.DeleteWord(word)
        then
          begin
            Tree.PrintToMemo(memo_current.Lines);
            ShowMessage('Слово удалено');
          end
        else MessageDlg('Ошибка удаления слова',mtError,[mbCancel],0)
end;

procedure TMainForm.NClearClick(Sender: TObject);
begin
   case MessageDlg('Вы действительно хотите очистить дерево? ',mtConfirmation,[mbYes,mbNo], 0) of
      mrYes :
        begin
          Tree.Clear;
          memo_current.Text:='';
        end ;
      mrNo:;
   end;
end;

procedure TMainForm.MyIdle(sender: TObject; var Done: Boolean);
begin
  Done:=True;
  memo_current.Visible:=Tree<>nil;
  NSave.Enabled:=Tree<>nil;
  NSaveAs.Enabled:=Tree<>nil;
  NClose.Enabled:=Tree<>nil;
  NAdd.Enabled:=Tree<>nil;
  NDelete.Enabled:=(Tree<>nil) and not Tree.IsEmpty;
  NClear.Enabled:=NDelete.Enabled;
  NSearch.Enabled:=NDelete.Enabled;
  NCount.Enabled:=NDelete.Enabled;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Tree<>nil
    then NClose.Click;
  CanClose:=Tree = nil;
end;

end.
