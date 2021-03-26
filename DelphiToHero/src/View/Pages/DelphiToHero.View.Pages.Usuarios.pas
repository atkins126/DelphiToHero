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
  DelphiToHero.View.Styles.Color, Vcl.ComCtrls;

type
  [FormRest('/users', 'guuid', 'name', 'asc')]
  [FormDefault('Cadastro de Usuários')]
  TPageUsuarios = class(TFormTemplate)
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, FONT_COLOR3, FONT_NAME)]
    StackPanel1: TStackPanel;
    StackPanel2: TStackPanel;

    [ComponentBindStyle(COLOR_C1, FONT_H8, FONT_COLOR3, FONT_NAME)]
    lblCodigo: TLabel;

    [FieldJsonBind('guuid'), FbIgnorePost, FbIgnorePut]
    [FieldDataSetBind('guuid', ftString, False, 10, 'Código')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H6, FONT_COLOR3, FONT_NAME)]
    edtCodigo: TEdit;

    [ComponentBindStyle(COLOR_C1, FONT_H8, FONT_COLOR3, FONT_NAME)]
    lblNome: TLabel;

    [FieldJsonBind('name')]
    [FieldDataSetBind('name', ftString, True, 20, 'nome')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H6, FONT_COLOR3, FONT_NAME)]
    edtNome: TEdit;

    [ComponentBindStyle(COLOR_C1, FONT_H8, FONT_COLOR3, FONT_NAME)]
    lblFone: TLabel;

    [FieldJsonBind('phone')]
    [FieldDataSetBind('phone', ftString, True, 10, 'Telefone', '!\(##\) #####-####;0;_')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H6, FONT_COLOR3, FONT_NAME, teCell)]
    edtFone: TEdit;

    [ComponentBindStyle(COLOR_C1, FONT_H8, FONT_COLOR3, FONT_NAME)]
    lblProficao: TLabel;

    [FieldJsonBind('occupation')]
    [FieldDataSetBind('occupation', ftString, True, 10, 'Profissão')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H6, FONT_COLOR3, FONT_NAME)]
    edtProfissao: TEdit;

    [ComponentBindStyle(COLOR_C1, FONT_H8, FONT_COLOR3, FONT_NAME)]
    lblbalance: TLabel;

    [FieldJsonBind('balance')]
    [FieldDataSetBind('balance', ftCurrency, True, 10, 'Saldo', 'R$ #0.00;0;_', taLeftJustify)]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H6, FONT_COLOR3, FONT_NAME, teCoin)]
    edtSaldo: TEdit;

    [ComponentBindStyle(COLOR_C1, FONT_H8, FONT_COLOR3, FONT_NAME)]
    lblbirthdate: TLabel;

    [FieldJsonBind('birthdate')]
    [FieldDataSetBind('birthdate', ftDateTime, True, 10, 'Data Nasc', '##/##/####;0;_')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H6, FONT_COLOR3, FONT_NAME)]
    edtbirthdate: TDateTimePicker;


    Label1: TLabel;

    [FieldJsonBind('lasttransaction')]
    [FieldDataSetBind('lasttransaction', ftDateTime, True, 10, 'Ultima Trans.', '##/##/####;0;_')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H6, FONT_COLOR3, FONT_NAME)]
    edtlasttransaction: TDateTimePicker;
    Label3: TLabel;

    [FieldJsonBind('cpf')]
    [FieldDataSetBind('cpf', ftString, True, 10, 'cpf', '###.###.###-##;0;_')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H6, FONT_COLOR3, FONT_NAME, teCPF)]
    edtCPF: TEdit;
    lblTra: TLabel;


    [FieldJsonBind('cnpj')]
    [FieldDataSetBind('cnpj', ftString, True, 10, 'cnpj', '##.###.###/####-##;0;_')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H6, FONT_COLOR3, FONT_NAME, teCNPJ)]
    edtCNPJ: TEdit;


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
