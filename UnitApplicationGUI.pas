unit UnitApplicationGUI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGrids;

type
  TFormSqlSearch = class(TForm)
    btSearchNextFirstName: TButton;
    btSearchFirstName: TButton;
    DBGrid1: TDBGrid;
    edFirstName: TEdit;
    btPartialSearchFirstName: TButton;
    btUnfilter: TButton;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADOTable1: TADOTable;
    lbFirstName: TLabel;
    lbIdDepartment: TLabel;
    edIdDepartment: TEdit;
    btSearchIdDepartment: TButton;
    btSearchNextIdDepartment: TButton;
    btPartialSearchIdDepartment: TButton;
    ADOQuery1: TADOQuery;
    btFindFirstName: TButton;
    btFindIdDepartment: TButton;
    memoFindResults: TMemo;
    procedure btSearchNextFirstNameClick(Sender: TObject);
    procedure btSearchFirstNameClick(Sender: TObject);
    procedure btPartialSearchFirstNameClick(Sender: TObject);
    procedure btUnfilterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edFirstNameChange(Sender: TObject);
    procedure edIdDepartmentChange(Sender: TObject);
    procedure btSearchIdDepartmentClick(Sender: TObject);
    procedure btSearchNextIdDepartmentClick(Sender: TObject);
    procedure btPartialSearchIdDepartmentClick(Sender: TObject);
    procedure btFindFirstNameClick(Sender: TObject);
    procedure btFindIdDepartmentClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormSqlSearch: TFormSqlSearch;

implementation

{$R *.dfm}

procedure TFormSqlSearch.btSearchNextFirstNameClick(Sender: TObject);
var
  Found: Boolean;
begin
  try
    Found := ADOTable1.FindNext;
  except
    Found := False
  end;
  if not Found then
    ShowMessage('Record not found');
end;

procedure TFormSqlSearch.btSearchFirstNameClick(Sender: TObject);
begin
  ADOTable1.DisableControls;
  ADOTable1.Filtered := False;
  ADOTable1.Filter := Format('firstName = %s', [QuotedStr(edFirstName.Text)]);
  ADOTable1.Filtered := True;
  ADOTable1.First;
  ADOTable1.EnableControls;
end;

procedure TFormSqlSearch.btFindFirstNameClick(Sender: TObject);
var
  vQuery: string;
  vFirstName: string;
  vName: string;
  vIdDepartment: string;
  vNamef: string;
  vIdDepartmentf: string;
  vMessage: string;
begin
  memoFindResults.Clear;
  vFirstname := edFirstName.Text;
  vName := 'Name';
  vIdDepartment := 'idDepartment';
  vQuery := Format('SELECT * FROM employee WHERE firstName=%s order by %s', [QuotedStr(vFirstname), QuotedStr(vName)]);
  Adoquery1.Close;
  Adoquery1.SQL.text := vQuery;
  Adoquery1.Open;

  if Adoquery1.RecordCount <= 0 then
    Showmessage(edFirstName.text + ' is not found!')
  else
  begin
    vNamef := Adoquery1.FieldbyName(vName).AsString;
    vIdDepartmentf := Adoquery1.FieldbyName(vIdDepartment).AsString;

    vMessage := format('%s %s : department id %s', [vNamef, vFirstName, vIdDepartmentf]);
    memoFindResults.Lines.Add(vMessage);

    //vMessage := format('The name of %s is %s . He Works in department id : %s', [vFirstName, vNamef, vIdDepartmentf]);
    //Showmessage(vMessage);
  end;
end;

procedure TFormSqlSearch.btFindIdDepartmentClick(Sender: TObject);
var
  vQuery: string;
  vFirstName: string;
  vName: string;
  vFirstNamef: string;
  vNamef: string;
  vIdDepartment: string;
  vMessage: string;
  vid: integer;
begin
  memoFindResults.Clear;
  vFirstname := 'firstName';
  vName := 'Name';
  vIdDepartment := edIdDepartment.Text;
  vQuery := Format('SELECT TOP 2 * FROM employee WHERE idDepartment=%s order by %s', [QuotedStr(vIdDepartment), QuotedStr(vName)]);
  Adoquery1.Close;
  Adoquery1.SQL.text := vQuery;
  Adoquery1.Open;

  if Adoquery1.RecordCount <= 0 then
    Showmessage(edFirstName.text + ' is not found!')
  else
  begin
    memoFindResults.Lines.Add('order by Name');
    Adoquery1.First;
    vid := 0;
    while not Adoquery1.EOF do
    begin
      inc(vid);
      vNamef := Adoquery1.FieldbyName(vName).AsString;
      vFirstNamef := Adoquery1.FieldbyName(vFirstName).AsString;

      vMessage := format('%s %s', [vNamef, vFirstNamef]);
      memoFindResults.Lines.Add(vMessage);

      //vMessage := format('The employee %d in department id : %s is :  %s %s.', [vid, vIdDepartment, vFirstNamef, vNamef]);
      //Showmessage(vMessage);

      Adoquery1.Next;
   end;

  end;
end;

procedure TFormSqlSearch.btPartialSearchFirstNameClick(Sender: TObject);
begin
  if not ADOTable1.Locate('firstName', edFirstName.Text, [loPartialKey, loCaseInsensitive]) then
    ShowMessage('No marching record found');
end;

procedure TFormSqlSearch.btUnfilterClick(Sender: TObject);
begin
  if ADOTable1.Filtered then
    ADOTable1.Filtered := False
  else
    ShowMessage('No filter set');
end;

procedure TFormSqlSearch.btSearchIdDepartmentClick(Sender: TObject);
begin
  ADOTable1.DisableControls;
  ADOTable1.Filtered := False;
  ADOTable1.Filter := Format('idDepartment = %s', [QuotedStr(edIdDepartment.Text)]);
  ADOTable1.Filtered := True;
  ADOTable1.First;
  ADOTable1.EnableControls;
end;

procedure TFormSqlSearch.btSearchNextIdDepartmentClick(Sender: TObject);
var
  Found: Boolean;
begin
  try
    Found := ADOTable1.FindNext;
  except
    Found := False
  end;
  if not Found then
    ShowMessage('Record not found');
end;

procedure TFormSqlSearch.btPartialSearchIdDepartmentClick(Sender: TObject);
begin
  if not ADOTable1.Locate('idDepartment', edIdDepartment.Text, [loPartialKey, loCaseInsensitive]) then
    ShowMessage('No marching record found');
end;

procedure TFormSqlSearch.edFirstNameChange(Sender: TObject);
begin
  ADOTable1.Filter := Format('firstName=%s', [QuotedStr(edFirstName.Text)]);
end;

procedure TFormSqlSearch.edIdDepartmentChange(Sender: TObject);
begin
  ADOTable1.Filter := Format('idDepartment=%s', [QuotedStr(edIdDepartment.Text)]);
end;

procedure TFormSqlSearch.FormCreate(Sender: TObject);
begin
  ADOConnection1.ConnectionString := ''; // put here the connexion string
  ADOConnection1.Connected := True;
  ADOTable1.Active := True;
end;

end.
