unit UTable;

interface
  uses UData, Grids, SysUtils;
  Const
    N=11;
  Type
    TIndex=0..N-1;
    TState=(sfree,sfull,sdel);
    TList = ^PList;
    PList = record
      Info:TFilmInfo;
      State:TState;
      next: TList;
      end;
    TCell=record
      Info:TFilmInfo;
      State:TState;
      List:TList;
      end;
    TTable=array[TIndex] of TCell;
    THTable=class
      private
      FCount:integer;
      FTable:TTable;
      protected
      function Hash(key:TKey):integer;
      public
      constructor Create;
      destructor Destroy; override;
      procedure Clear;
      procedure Add(info:TFilmInfo);
      function Find(key:Tkey):TFilmInfo;
      function Delete(key:TKey):boolean;
      procedure Print(var tab:TStringGrid; count: Integer);
      procedure SaveToFile(FileName:string);
      function LoadFromFile(FileName:string):integer;
      end;


implementation

{ THTable }

function THTable.Hash(key:TKey): integer;
var
  i: integer;
begin
result:=0;
  for i:=1 to length(key) do
    result:=result + ord(key[i]);     // result:=result + ord(key[i])*i;
  result := result mod N;
end;

procedure THTable.Add(info: TFilmInfo);
var
  hashIndex:TIndex; node,pre:TList;
begin
  hashIndex:= Hash(info.Title);
  if not(FTable[hashIndex].State=sfull) then
  begin
    FTable[hashIndex].info:=info;
    FTable[hashIndex].State:=sfull;
    FTable[hashIndex].List:=nil;
  end
  else
    begin
      new(node);
      node^.Info:=info;
      node^.State:=sfull;
      pre:=nil;
      if pre = nil then
        begin
        node^.next:=FTable[hashIndex].List;
        FTable[hashIndex].List:=node;
        end;
    end;
end;

procedure THTable.Clear;
var i:integer;
begin
for i:=0 to n-1 do
  begin
  FTable[i].Info.Free;
  FTable[i].Info:=nil;
  FTable[i].State:=sfree;
  end;
end;

constructor THTable.Create;
var i:integer;
begin
FCount:=0;
for i:=0 to n-1 do
  begin
    FTable[i].State:=sfree;
    FTable[i].List:=nil;
  end
end;

function THTable.Delete(key: TKey): boolean;
var ind:integer;
    p,e:TList;
begin
  ind:=Hash(key);
  result:=false;
  if (FTable[ind].Info <> nil) then
    begin
    if (FTable[ind].Info.Title = key) then
      begin
      if FTable[ind].List<> nil then
        begin
        FTable[ind].Info.WTitle:=FTable[ind].List.Info.Title;
        FTable[ind].Info.WDirector:=FTable[ind].List.Info.Director;
        FTable[ind].Info.WActors:=FTable[ind].List.Info.Actors;
        FTable[ind].Info.WSummary:=FTable[ind].List.Info.Summary;
        FTable[ind].List:=FTable[ind].List.next;
        result:=true;
        end
      else
        begin
        FTable[ind].State:=sfree;
        result:=true;
        end;
      end
    else
      begin
      if FTable[ind].List<> nil then
        begin
        if FTable[ind].List.Info.Title = key then
          begin
          FTable[ind].List:=FTable[ind].List.next;
          result:=true;
          end
        else
          begin
          p:=FTable[ind].List;
          While (p.next<>nil) and(p.next.Info.Title<>key) do
            p:=p.next;
          e:=p.next; // первый элемент списка - который надо удалить
          p.next:=e.next;  // список без элемента который надо было удалить
          result:=true;
          end;
        end;
      end;
    end;
end;


destructor THTable.Destroy;
begin
  Clear;
  inherited;
end;

function THTable.Find(key: Tkey): TFilmInfo;
var hashIndex: TIndex;
    p:TList;
begin
  hashIndex:= Hash(key);
  result:=nil;
  if FTable[hashIndex].info <> nil then
    begin
    if FTable[hashIndex].List = nil then
      Result:=FTable[hashIndex].info
    else
      begin
      if FTable[hashIndex].Info.Title = key then Result:=FTable[hashIndex].Info
      else
      begin
        p:=FTable[hashIndex].List;
        While p<>nil do
          begin
          if p.Info.Title = key then Result:=p.info;
          p:=p.next;
          end;
        end;
      end;
    end;
end;

function THTable.LoadFromFile(FileName:string): integer;
var f:TextFile;
    info:TFilmInfo;
    ok:boolean;
begin
  Assign(f,FileName);
  Reset(f);
  result:=0;
  ok:= true;
  while (not eof(f)) and ok do
  begin
    info:=TFilmInfo.Create;
    ok:=info.LoadFromFile(f);
    if ok then
    begin
      Add(info);
      if not eof(f) then Readln(f);
    end;
    if ok then
      inc(result)
    else
      result:=0;
  end;
  CloseFile(f);
end;

procedure THTable.Print(var tab: TStringGrid; count: Integer);
  var i,j,y :integer; p:TList;
begin
  for i:=1 to tab.RowCount do
    for j:=0 to 4 do
      tab.Cells[j,i]:='';
  i:=0;
  j:=0;
  y:=N;
  While (i<=y) and (j<N) do
    begin
      tab.Cells[0,i+1]:=IntToStr(j);
      if FTable[j].State=sfull then
      begin
        tab.Cells[1,i+1]:=FTable[j].Info.Title;
        tab.Cells[2,i+1]:=FTable[j].Info.Director;
        tab.Cells[3,i+1]:=FTable[j].Info.Actors;
        tab.Cells[4,i+1]:=FTable[j].Info.Summary;
        p:=FTable[j].List;
        While p<>nil do
          begin
            inc(i);
            tab.Cells[1,i+1]:=p.Info.Title;
            tab.Cells[2,i+1]:=p.Info.Director;
            tab.Cells[3,i+1]:=p.Info.Actors;
            tab.Cells[4,i+1]:=p.Info.Summary;
            p:=p.next;
            inc(y);
          end;
      end;
      inc(j);
      inc(i);
      tab.RowCount:=y+1;
    end;
end;

procedure THTable.SaveToFile(FileName: string);
var f:TextFile;
    i:integer;
    p:TList;
begin
       Assign(f,FileName);
       Rewrite(f);
       for i:=0 to N do
        if FTable[i].State=sfull then
        begin
          Ftable[i].Info.SaveToFile(f);
          p:=FTable[i].List;
          While p<>nil do
          begin
            p.Info.SaveToFile(f);
            p:=p.next;
          end
        end;
       CloseFile(f);
end;

end.
