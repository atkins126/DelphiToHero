unit DelphiToHero.View.Pages.Template;

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
  Vcl.ExtCtrls,
  Router4D.Interfaces,
  Vcl.StdCtrls,
  Vcl.Buttons,
  System.ImageList,
  Vcl.ImgList,
  Bind4D,
  System.Actions,
  Vcl.ActnList,
  Data.DB,
  Vcl.Grids,
  DelphiToHero.View.Styles.Color,
  Vcl.DBGrids,
  RESTRequest4D,
  Bind4D.Attributes,
  Bind4D.Types,
  DelphiToHero.Model.DAO.Interfaces,
  DelphiToHero.Model.DAO.REST;

type
  TTypeOperation = (toNull, toPost, toPut);

  TFormTemplate = class(TForm, iRouter4DComponent)

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, FONT_COLOR3, FONT_NAME)]
    pnlPrincipal: TPanel;

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, FONT_COLOR3, FONT_NAME)]
    pnlBody: TPanel;

    [ComponentBindStyle(COLOR_C1, FONT_H5, FONT_COLOR3, FONT_NAME)]
    pnlHeader: TPanel;

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, FONT_COLOR3, FONT_NAME)]
    pnlMainBody: TPanel;

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, FONT_COLOR3, FONT_NAME)]
    Panel3: TPanel;

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, FONT_COLOR3, FONT_NAME)]
    Panel4: TPanel;

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, FONT_COLOR3, FONT_NAME)]
    Panel5: TPanel;

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, FONT_COLOR3, FONT_NAME)]
    Panel6: TPanel;

    [ComponentBindStyle(COLOR_C1, FONT_H5, FONT_COLOR3, FONT_NAME)]
    Panel1: TPanel;

    [ComponentBindStyle(clbtnface, FONT_H6, FONT_COLOR3, FONT_NAME)]
    lblTitle: TLabel;

    [ComponentBindStyle(clbtnface, FONT_H6, FONT_COLOR3, FONT_NAME)]
    lblPagina: TLabel;

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H6, COLOR_BACKGROUND_TOP, FONT_NAME)]
    Edit1: TEdit;

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H7, FONT_COLOR, FONT_NAME)]
    DBGrid1: TDBGrid;

    [ComponentBindStyle(clbtnface, FONT_H8, FONT_COLOR3, FONT_NAME)]
    [Translation('CONFIGURAÇÕES')]
    btnCONFIG: TSpeedButton;

    [ComponentBindStyle(clbtnface, FONT_H8, FONT_COLOR3, FONT_NAME)]
    [Translation('RELATÓRIO')]
    btnREPORT: TSpeedButton;

    [ComponentBindStyle(clbtnface, FONT_H8, FONT_COLOR3, FONT_NAME)]
    [Translation('HISTÓRICO')]
    btnHISTORY: TSpeedButton;

    [ComponentBindStyle(clbtnface, FONT_H8, FONT_COLOR3, FONT_NAME)]
    [Translation('NOVO')]
    btnADD: TSpeedButton;

    [ComponentBindStyle(clbtnface, FONT_H8, FONT_COLOR3, FONT_NAME)]
    [Translation('ATUALIZAR')]
    btnREFRESH: TSpeedButton;

    [ComponentBindStyle(clbtnface, FONT_H8, FONT_COLOR3, FONT_NAME)]
    [Translation('EXCLUIR')]
    btnDELETE: TSpeedButton;

    [ComponentBindStyle(clbtnface, FONT_H8, FONT_COLOR3, FONT_NAME)]
    [Translation('CANCELAR')]
    btnCANCEL: TSpeedButton;

    [ComponentBindStyle(clbtnface, FONT_H8, FONT_COLOR3, FONT_NAME)]
    [Translation('SALVAR')]
    btnSAVE: TSpeedButton;

    ImageList1: TImageList;
    ActionList1: TActionList;
    acAdd: TAction;
    acRelatorio: TAction;
    acConfiguracoes: TAction;
    Line1: TShape;
    Label2: TLabel;
    Line2: TShape;
    DataSource1: TDataSource;
    acHistory: TAction;
    acSave: TAction;
    acCancel: TAction;
    acDelete: TAction;
    acRefresh: TAction;
    Panel2: TPanel;
    pnlPaginate: TPanel;
    btnNEXT: TSpeedButton;
    btnPRIOR: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure acRelatorioExecute(Sender: TObject);
    procedure acConfiguracoesExecute(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
    procedure acHistoryExecute(Sender: TObject);
    procedure acSaveExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure btnPRIORClick(Sender: TObject);
    procedure btnNEXTClick(Sender: TObject);
  private
    { Private declarations }
    FTypeOperation: TTypeOperation;
    FEndPoint: string;
    FPK: string;
    FTitle: string;
    FSort, FOrder: string;
    FDAO: iDAOInterface;
    FPage: Integer;
    procedure ApplyStyle;
    procedure GetEndPoint;
    procedure FormatList;
    procedure AlterListForm;
    procedure RestOperationPost;
    procedure RestOperationPut;
  public
    { Public declarations }
    function Render: TForm;
    procedure UnRender;
  end;

var
  FormTemplate: TFormTemplate;

implementation

uses
  System.JSON,
  System.StrUtils;

{$R *.dfm}

{ TFormTemplate }

procedure TFormTemplate.acAddExecute(Sender: TObject);
begin
  FTypeOperation := toPost;
  AlterListForm;
  TBind4D.New.Form(Self).ClearFieldForm;
end;

procedure TFormTemplate.acCancelExecute(Sender: TObject);
begin
  AlterListForm;
  FTypeOperation := toNull;
end;

procedure TFormTemplate.acConfiguracoesExecute(Sender: TObject);
begin
  //
end;

procedure TFormTemplate.acDeleteExecute(Sender: TObject);
begin
  FDAO.Delete;
  GetEndPoint;
  AlterListForm;
  FTypeOperation := toNull;
end;

procedure TFormTemplate.acHistoryExecute(Sender: TObject);
begin
  // historico
end;

procedure TFormTemplate.acRefreshExecute(Sender: TObject);
begin
  GetEndPoint;
end;

procedure TFormTemplate.acRelatorioExecute(Sender: TObject);
begin
  //
end;

procedure TFormTemplate.acSaveExecute(Sender: TObject);
begin
  case FTypeOperation of
    toNull: ;
    toPost: RestOperationPost;
    toPut: RestOperationPut;
  end;
end;

procedure TFormTemplate.ApplyStyle;
begin
  Self.Font.Name := FONT_NAME;

  Panel6.Visible := False;
  DBGrid1.Align := alClient;

  lblTitle.Caption := TBind4D.New.Translator.Google.Params.Query(FTitle).&End.Execute;

  Line1.Brush.Color := COLOR_C2;
  Line2.Brush.Color := COLOR_C2;

  Label2.Font.Size := FONT_H6;
  Label2.Font.Color := COLOR_BACKGROUND_TOP;

  DBGrid1.TitleFont.Name  := FONT_NAME;
  DBGrid1.TitleFont.Size  := FONT_H5;
  DBGrid1.TitleFont.Color := FONT_COLOR4;
end;

procedure TFormTemplate.DBGrid1DblClick(Sender: TObject);
begin
  FTypeOperation := toPut;
  TBind4D.New.Form(Self).BindDataSetToForm(FDAO.DataSet);
  AlterListForm;
end;

procedure TFormTemplate.DBGrid1TitleClick(Column: TColumn);
begin
  FOrder := ifThen(FOrder = 'desc', 'asc', 'desc');
  FDAO
    .AddParam('sort', Column.FieldName)
    .AddParam('order', FOrder)
    .Page(1)
  .Get;
  FormatList;
end;

procedure TFormTemplate.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    FDAO
      .AddParam('sort', FSort)
      .AddParam('order', FOrder)
      .AddParam('searchfields', TBind4D.New.Form(Self).GetFieldsByType(fbGet))
      .AddParam('searchvalue', Edit1.Text)
      .Page(1)
    .Get;
    FormatList;
  end;
end;

procedure TFormTemplate.FormCreate(Sender: TObject);
begin
  FPage := 1;
  FTypeOperation := toNull;
  FDAO := TDAOREST.New(Self).DataSource(DataSource1);
  TBind4D.New
    .Form(Self)
    .BindFormDefault(FTitle)
    .BindFormRest(FEndPoint, FPK, FSort, FOrder)
    .SetStyleComponents;
  ApplyStyle;
  GetEndPoint;
end;

procedure TFormTemplate.FormResize(Sender: TObject);
begin
//  GetEndPoint;
  FormatList;
end;

procedure TFormTemplate.GetEndPoint;
begin
  FDAO
    .AddParam('sort', FSort)
    .AddParam('order', FOrder)
    .Page(FPage)
  .Get;
  FormatList;
end;

function TFormTemplate.Render: TForm;
begin
  Result := Self;
end;

procedure TFormTemplate.RestOperationPost;
begin
  FDAO.Post;
  GetEndPoint;
  AlterListForm;
  FTypeOperation := toNull;
end;

procedure TFormTemplate.RestOperationPut;
begin
  FDAO.Put;
  GetEndPoint;
  AlterListForm;
  FTypeOperation := toNull;
end;

procedure TFormTemplate.btnPRIORClick(Sender: TObject);
begin
  if FDAO.Page > 1 then
  begin
    FPage := FDAO.Page -1;
    GetEndPoint;
  end;
end;

procedure TFormTemplate.btnNEXTClick(Sender: TObject);
begin
  if FDAO.Page < FDAO.Pages then
  begin
    FPage := FDAO.Page +1;
    GetEndPoint;
  end;
end;

procedure TFormTemplate.UnRender;
begin

end;

procedure TFormTemplate.AlterListForm;
begin
  Panel6.Visible := not Panel6.Visible;
  DBGrid1.Visible := not DBGrid1.Visible;
end;

procedure TFormTemplate.FormatList;
begin
  TBind4D.New.Form(Self).BindFormatListDataSet(FDAO.DataSet, DBGrid1);
  lblPagina.Caption := 'Página '+ FDAO.Page.ToString + ' de ' + FDAO.Pages.ToString;
  lblPagina.Caption := TBind4D.New.Translator.Google.Params.Query(lblPagina.Caption).&End.Execute;
end;

end.
