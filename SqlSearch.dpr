program SqlSearch;

uses
  Forms,
  UnitApplicationGUI in 'UnitApplicationGUI.pas' {FormSqlSearch};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormSqlSearch, FormSqlSearch);
  Application.Run;
end.
