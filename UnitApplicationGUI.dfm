object FormSqlSearch: TFormSqlSearch
  Left = 0
  Top = 0
  Caption = 'Sql Search'
  ClientHeight = 358
  ClientWidth = 846
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbFirstName: TLabel
    Left = 21
    Top = 13
    Width = 70
    Height = 13
    Caption = 'filter firstname'
  end
  object lbIdDepartment: TLabel
    Left = 21
    Top = 56
    Width = 90
    Height = 13
    Caption = 'filter idDepartment'
  end
  object btSearchNextFirstName: TButton
    Left = 313
    Top = 8
    Width = 75
    Height = 25
    Caption = 'search next'
    TabOrder = 0
    OnClick = btSearchNextFirstNameClick
  end
  object btSearchFirstName: TButton
    Left = 224
    Top = 8
    Width = 75
    Height = 25
    Caption = 'search'
    TabOrder = 1
    OnClick = btSearchFirstNameClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 143
    Width = 588
    Height = 208
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object edFirstName: TEdit
    Left = 120
    Top = 8
    Width = 98
    Height = 21
    TabOrder = 3
    Text = 'dany'
    OnChange = edFirstNameChange
  end
  object btPartialSearchFirstName: TButton
    Left = 402
    Top = 8
    Width = 75
    Height = 25
    Caption = 'partial search'
    TabOrder = 4
    OnClick = btPartialSearchFirstNameClick
  end
  object btUnfilter: TButton
    Left = 21
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Un-Filter'
    TabOrder = 5
    OnClick = btUnfilterClick
  end
  object edIdDepartment: TEdit
    Left = 120
    Top = 53
    Width = 98
    Height = 21
    TabOrder = 6
    Text = '4'
    OnChange = edIdDepartmentChange
  end
  object btSearchIdDepartment: TButton
    Left = 224
    Top = 51
    Width = 75
    Height = 25
    Caption = 'search'
    TabOrder = 7
    OnClick = btSearchIdDepartmentClick
  end
  object btSearchNextIdDepartment: TButton
    Left = 313
    Top = 51
    Width = 75
    Height = 25
    Caption = 'search next'
    TabOrder = 8
    OnClick = btSearchNextIdDepartmentClick
  end
  object btPartialSearchIdDepartment: TButton
    Left = 402
    Top = 51
    Width = 75
    Height = 25
    Caption = 'partial search'
    TabOrder = 9
    OnClick = btPartialSearchIdDepartmentClick
  end
  object btFindFirstName: TButton
    Left = 616
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Find'
    TabOrder = 10
    OnClick = btFindFirstNameClick
  end
  object btFindIdDepartment: TButton
    Left = 616
    Top = 51
    Width = 75
    Height = 25
    Caption = 'Find'
    TabOrder = 11
    OnClick = btFindIdDepartmentClick
  end
  object memoFindResults: TMemo
    Left = 616
    Top = 143
    Width = 201
    Height = 207
    TabOrder = 12
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 264
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 32
    Top = 152
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    TableName = 'employee'
    Left = 32
    Top = 200
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    DataSource = DataSource1
    Parameters = <>
    Left = 112
    Top = 208
  end
end
