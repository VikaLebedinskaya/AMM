program TTree;

uses
  Forms,
  Unit_Main in 'Unit_Main.pas' {MainForm},
  TrieTreeNode in 'TrieTreeNode.pas',
  TrieTree in 'TrieTree.pas',
  TrieTreeGUI in 'TrieTreeGUI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
