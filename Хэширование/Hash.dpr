program Hash;

uses
  Forms,
  UnitForm in 'UnitForm.pas' {Frm},
  UData in 'UData.pas',
  UTable in 'UTable.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrm, FormMain);
  Application.Run;
end.
