unit UnitForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UTable, Grids;

type
  TFrm = class(TForm)
    Download: TButton;
    OpenDialog: TOpenDialog;
    Grid: TStringGrid;
    BtnSave: TButton;
    SaveDialog: TSaveDialog;
    q: TEdit;
    BtnSearch: TButton;
    BtnDelete: TButton;
    BtnNew: TButton;
    txtTitle: TLabel;
    txtDirector: TLabel;
    txtActor: TLabel;
    txtSummary: TLabel;
    EditTitle: TEdit;
    EditDirector: TEdit;
    EditActor: TEdit;
    EditSummary: TEdit;
    BtnAdd: TButton;
    procedure DownloadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnSearchClick(Sender: TObject);
    procedure CleanEdits;
    procedure UnVisibleEdits;
    procedure VisibleEdits;
    procedure DisabledEdits;
    procedure EnabledEdits;
    procedure BtnNewClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  
var
  FormMain: TFrm;
  Table:THTable;
  Filename: string;
  count:integer;

implementation
  uses UData;
{$R *.dfm}

procedure TFrm.EnabledEdits;
begin
  EditTitle.Enabled:=true;
  EditActor.Enabled:=true;
  EditDirector.Enabled:=true;
  EditSummary.Enabled:=true;
end;

procedure TFrm.DisabledEdits;
begin
  EditTitle.Enabled:=false;
  EditActor.Enabled:=false;
  EditDirector.Enabled:=false;
  EditSummary.Enabled:=false;
end;

procedure TFrm.VisibleEdits;
begin
  EditTitle.Visible:=true;
  EditActor.Visible:=true;
  EditDirector.Visible:=true;
  EditSummary.Visible:=true;
  txtTitle.Visible:=true;
  txtActor.Visible:=true;
  txtDirector.Visible:=true;
  txtSummary.Visible:=true;
end;

procedure TFrm.UnVisibleEdits;
begin
  EditTitle.Visible:=false;
  EditActor.Visible:=false;
  EditDirector.Visible:=false;
  EditSummary.Visible:=false;
  txtTitle.Visible:=false;
  txtActor.Visible:=false;
  txtDirector.Visible:=false;
  txtSummary.Visible:=false;
  
  BtnAdd.Visible:=false;
end;

procedure TFrm.CleanEdits;
begin
  EditTitle.Text:='';
  EditActor.Text:='';
  EditDirector.Text:='';
  EditSummary.Text:='';
end;

procedure TFrm.FormCreate(Sender: TObject);
begin
  CleanEdits;
  UnVisibleEdits;
  Grid.Cells[0,0]:='Номер';
  Grid.Cells[1,0]:='Название фильма';
  Grid.Cells[2,0]:='Режиссер';
  Grid.Cells[3,0]:='Актеры';
  Grid.Cells[4,0]:='Краткое содержание';
  BtnNew.Visible:=false;
  BtnSave.Visible:=false;
  BtnSearch.Visible:=false;
  BtnDelete.Visible:=false;
  q.Visible:=false;
end;

procedure TFrm.DownloadClick(Sender: TObject);
begin
  if OpenDialog.Execute then
    begin
    filename:=OpenDialog.FileName;
    Caption:=filename;
    if Table=nil then Table:=THTable.Create;
    Table.Clear;
    count:=Table.LoadFromFile(filename);
    if count = 0 then showmessage('Ошибка добавления записей');
    Table.Print(Grid, count);
    BtnNew.Visible:=true;
    BtnSave.Visible:=true;
    BtnSearch.Visible:=true;
    BtnDelete.Visible:=true;
    q.Visible:=true;
    end;
end;

procedure TFrm.BtnSaveClick(Sender: TObject);
begin
  if Filename<>'' then Table.SaveToFile(filename)
else if SaveDialog.Execute then
  begin
  Table.SaveToFile(Savedialog.FileName);
  FileName:=Savedialog.FileName;
  Caption:=Filename;
  ShowMessage('Записи сохранены!');
  end;
end;

procedure TFrm.BtnSearchClick(Sender: TObject);
var s: string;
    searchResult:TFilmInfo;
begin
  s:=q.Text;
  searchResult := nil;
  if s <> '' then searchResult:=Table.Find(s);
  if searchResult = nil then ShowMessage('Такой фильм не найден!')
  else
    begin
      CleanEdits;
      DisabledEdits;
      VisibleEdits;
      EditTitle.Text:=searchResult.Title;
      EditDirector.Text:=searchResult.Director;
      EditActor.Text:=searchResult.Actors;
      EditSummary.Text:=searchResult.Summary;
    end;
end;

procedure TFrm.BtnNewClick(Sender: TObject);
begin
  CleanEdits;
  VisibleEdits;
  EnabledEdits;
  BtnAdd.Visible:=true;
end;

procedure TFrm.BtnAddClick(Sender: TObject);
var newRec:TFilmInfo;
begin
  if EditTitle.Text <> '' then
  begin
    newRec:=TFilmInfo.Create;
    newRec.LoadFromText(EditTitle.Text, EditDirector.Text, EditActor.Text, EditSummary.Text);
    Table.Add(newRec);
    inc(count);
    Table.Print(Grid, count);
    CleanEdits;
  end
  else
    ShowMessage('Введите название фильма');
end;

procedure TFrm.BtnDeleteClick(Sender: TObject);
var s: string;
    searchResultDelete:boolean;
begin
  s:=q.Text;
  searchResultDelete:=false;
  if s <> '' then searchResultDelete:=Table.Delete(s);
  if not searchResultDelete then ShowMessage('Такой фильм не найден!')
  else
    begin
    dec(count);
    Table.Print(Grid,count);
    end;
end;

end.
