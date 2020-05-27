unit UData;

interface
  uses Classes;

  Type
    TKey=string;
    TFilmInfo=class
      private
        FTitle:TKey;
        FDirector:string;
        FActors:string;
        FSummary:string;
      public
        property Title: TKey read FTitle;
        property WTitle:TKey write FTitle;
        property Director: string read FDirector;
        property WDirector: string write FDirector;
        property Actors: string read FActors;
        property WActors: string write FActors;
        property Summary: string  read FSummary;
        property WSummary: string write FSummary;

      function LoadFromFile(var f:TextFile):boolean;
      procedure LoadFromText(t1,t2,t3,t4:string);
      procedure SaveToFile(var f:TextFile);
    end;



implementation

{ TFilmInfo }

function TFilmInfo.LoadFromFile(var f: TextFile): boolean;
begin
  result:=true;
  if not eof(f) then Readln(f,FTitle);
  if FTitle='' then result:=false;
  if not eof(f) then Readln(f,FDirector);
  if not eof(f) then Readln(f,FActors);
  if not eof(f) then Readln(f,FSummary);
end;

procedure TFilmInfo.LoadFromText(t1, t2, t3, t4: string);
begin
  FTitle:=t1;
  FDirector:=t2;
  FActors:=t3;
  FSummary:=t4;
end;

procedure TFilmInfo.SaveToFile(var f: TextFile);
begin
  Writeln(f,FTitle);
  Writeln(f,FDirector);
  Writeln(f,FActors);
  Writeln(f,FSummary);
  Writeln(f);
end;

end.
 