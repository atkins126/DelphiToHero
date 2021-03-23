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
  DelphiToHero.View.Styles.Color,
  Vcl.DBGrids;

type
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

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H6, COLOR_BACKGROUND_TOP, FONT_NAME)]
    Edit1: TEdit;

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H6, FONT_COLOR, FONT_NAME)]
    DBGrid1: TDBGrid;

    [ComponentBindStyle(clbtnface, FONT_H8, FONT_COLOR3, FONT_NAME)]
    SpeedButton1: TSpeedButton;

    [ComponentBindStyle(clbtnface, FONT_H8, FONT_COLOR3, FONT_NAME)]
    SpeedButton2: TSpeedButton;

    [ComponentBindStyle(clbtnface, FONT_H8, FONT_COLOR3, FONT_NAME)]
    SpeedButton3: TSpeedButton;

    [ComponentBindStyle(clbtnface, FONT_H8, FONT_COLOR3, FONT_NAME)]
    SpeedButton4: TSpeedButton;

    [ComponentBindStyle(clbtnface, FONT_H8, FONT_COLOR3, FONT_NAME)]
    SpeedButton5: TSpeedButton;

    ImageList1: TImageList;
    ActionList1: TActionList;
    acAdicionar: TAction;
    acRelatorio: TAction;
    acConfiguracoes: TAction;
    Line1: TShape;
    Label2: TLabel;
    Line2: TShape;
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure acAdicionarExecute(Sender: TObject);
    procedure acRelatorioExecute(Sender: TObject);
    procedure acConfiguracoesExecute(Sender: TObject);
  private
    { Private declarations }
    FEndPoint: string;
    FPK: string;
    FTitle: string;
    FSort, FOrder: string;
    procedure ApplyStyle;
  public
    { Public declarations }
    function Render: TForm;
    procedure UnRender;
  end;

var
  FormTemplate: TFormTemplate;

implementation

{$R *.dfm}

{ TFormTemplate }

procedure TFormTemplate.acAdicionarExecute(Sender: TObject);
begin
  //
end;

procedure TFormTemplate.acConfiguracoesExecute(Sender: TObject);
begin
  //
end;

procedure TFormTemplate.acRelatorioExecute(Sender: TObject);
begin
  //
end;

procedure TFormTemplate.ApplyStyle;
begin
  Self.Font.Name := FONT_NAME;

  Panel6.Visible := False;
  lblTitle.Caption := FTitle;

  Line1.Brush.Color := COLOR_C2;
  Line2.Brush.Color := COLOR_C2;

  Label2.Font.Size := FONT_H6;
  Label2.Font.Color := COLOR_BACKGROUND_TOP;

  DBGrid1.TitleFont.Name  := FONT_NAME;
  DBGrid1.TitleFont.Size  := FONT_H5;
  DBGrid1.TitleFont.Color := FONT_COLOR4;  
end;

procedure TFormTemplate.FormCreate(Sender: TObject);
begin
  //TBindFormJson.New.BindClassToForm(Self, FEndPoint, FPK, FTitle);
  TBind4D.New
    .Form(Self)
    .BindFormDefault(FTitle)
    .BindFormRest(FEndPoint, FPK, FSort, FOrder)
    .SetStyleComponents;
  ApplyStyle;
end;

function TFormTemplate.Render: TForm;
begin
  Result := Self;
end;

procedure TFormTemplate.UnRender;
begin

end;

end.
