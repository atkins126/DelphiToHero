unit DelphiToHero.View.Pages.Usuarios;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  DelphiToHero.View.Pages.Template,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  System.ImageList,
  Vcl.ImgList,
  Vcl.Buttons,
  Bind4D,
  System.Actions,
  Vcl.ActnList,
  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.StorageBin,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.WinXPanels,
  DelphiToHero.View.Styles.Color,
  Vcl.ComCtrls,
  Bind4D.Attributes,
  Bind4D.Types;

type
  [FormRest('/users', 'guuid', 'name', 'asc')]
  [FormDefault('Cadastro de Usu�rios')]
  TPageUsuarios = class(TFormTemplate)
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, FONT_COLOR3, FONT_NAME)]
    StackPanel1: TStackPanel;
    StackPanel2: TStackPanel;

    [ComponentBindStyle(COLOR_C1, FONT_H8, FONT_COLOR3, FONT_NAME)]
    [Translation('C�digo')]
    lblCodigo: TLabel;

    [FieldJsonBind('guuid'), FbIgnorePost, FbIgnorePut]
    [FieldDataSetBind('guuid', ftString, False, 0, 'C�digo')]
    [Translation('C�digo')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H6, FONT_COLOR3, FONT_NAME)]
    edtCodigo: TEdit;

    [ComponentBindStyle(COLOR_C1, FONT_H8, FONT_COLOR3, FONT_NAME)]
    [Translation('Nome')]
    lblNome: TLabel;

    [FieldJsonBind('name')]
    [FieldDataSetBind('name', ftString, True, 25, 'Nome')]
    [Translation('Nome')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H6, FONT_COLOR3, FONT_NAME)]
    edtNome: TEdit;

    [ComponentBindStyle(COLOR_C1, FONT_H8, FONT_COLOR3, FONT_NAME)]
    [Translation('Telefone')]
    lblFone: TLabel;

    [FieldJsonBind('phone')]
    [FieldDataSetBind('phone', ftString, True, 10, 'Telefone', '!\(##\) #####-####;0;_', taLeftJustify, 700)]
    [Translation('Telefone')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H6, FONT_COLOR3, FONT_NAME, teCell)]
    edtFone: TEdit;

    [ComponentBindStyle(COLOR_C1, FONT_H8, FONT_COLOR3, FONT_NAME)]
    [Translation('Profiss�o')]
    lblProficao: TLabel;

    [FieldJsonBind('occupation')]
    [FieldDataSetBind('occupation', ftString, True, 12, 'Profiss�o', '', taLeftJustify, 1000)]
    [Translation('Profiss�o')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H6, FONT_COLOR3, FONT_NAME)]
    edtProfissao: TEdit;

    [ComponentBindStyle(COLOR_C1, FONT_H8, FONT_COLOR3, FONT_NAME)]
    [Translation('Saldo')]
    lblbalance: TLabel;

    [FieldJsonBind('balance')]
    [FieldDataSetBind('balance', ftCurrency, True, 10, 'Saldo', 'R$ ###,###,##0.00', taLeftJustify, 500)]
    [Translation('Saldo')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H6, FONT_COLOR3, FONT_NAME, teCoin)]
    edtSaldo: TEdit;

    [FieldJsonBind('birthdate')]
    [FieldDataSetBind('birthdate', ftDate, True, 8, 'Data Nasc', '##/##/####;0;_', taLeftJustify, 1150)]
    [Translation('Data Nascimento')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H6, FONT_COLOR3, FONT_NAME)]
    edtbirthdate: TDateTimePicker;

    [ComponentBindStyle(COLOR_C1, FONT_H8, FONT_COLOR3, FONT_NAME)]
    [Translation('Data Nascimento')]
    lblbirthdate: TLabel;

    [FieldJsonBind('lasttransaction')]
    [FieldDataSetBind('lasttransaction', ftTime, True, 7, 'Ultima Trans.', '##:##:##;0;_', taLeftJustify, 1250)]
    [Translation('Ultima Transa��o')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H6, FONT_COLOR3, FONT_NAME)]
    edtlasttransaction: TDateTimePicker;
    [Translation('Ultima Transa��o')]
    lblUltTrans: TLabel;

    [FieldJsonBind('cpf')]
    [FieldDataSetBind('cpf', ftString, True, 8, 'CPF', '###.###.###-##;0;_', taLeftJustify, 800)]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H6, FONT_COLOR3, FONT_NAME, teCPF)]
    edtCPF: TEdit;
    lblCPF: TLabel;


    [FieldJsonBind('cnpj')]
    [FieldDataSetBind('cnpj', ftString, True, 10, 'CNPJ', '##.###.###/####-##;0;_', taLeftJustify, 1400)]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H6, FONT_COLOR3, FONT_NAME, teCNPJ)]
    edtCNPJ: TEdit;
    lblCNPJ: TLabel;


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PageUsuarios: TPageUsuarios;

implementation

{$R *.dfm}

end.
