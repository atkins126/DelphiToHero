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
  Vcl.ActnList, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TFormTemplate = class(TForm, iRouter4DComponent)
    pnlPrincipal: TPanel;
    pnlBody: TPanel;
    pnlHeader: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    ImageList1: TImageList;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    ActionList1: TActionList;
    acAdicionar: TAction;
    acRelatorio: TAction;
    acConfiguracoes: TAction;
    Panel2: TPanel;
    Panel3: TPanel;
    Line1: TShape;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Panel4: TPanel;
    Label2: TLabel;
    Edit1: TEdit;
    Line2: TShape;
    Panel5: TPanel;
    Panel6: TPanel;
    DBGrid1: TDBGrid;
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

uses DelphiToHero.View.Styles.Color;

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

  pnlPrincipal.Color := COLOR_BACKGROUND;
  pnlHeader.Color := COLOR_C1;
  pnlBody.Color := COLOR_BACKGROUND;
  Panel1.Color := COLOR_C1;
  Panel2.Color := COLOR_BACKGROUND;
  Panel3.Color := COLOR_BACKGROUND;
  Panel4.Color := COLOR_BACKGROUND;
  Panel5.Color := COLOR_BACKGROUND;
  Panel6.Color := COLOR_BACKGROUND;

  Panel6.Visible := False;
  
  Line1.Brush.Color := COLOR_C2;
  Line2.Brush.Color := COLOR_C2;

  Label1.Caption := FTitle;
  Label1.Font.Size := FONT_H6;
  Label1.Font.Color := FONT_COLOR3;
//  Label1.Font.Name := 'Segoe UI';

  Label2.Font.Size := FONT_H6;
  Label2.Font.Color := COLOR_BACKGROUND_TOP;
//  Label2.Font.Name := 'Segoe UI';

  Edit1.Font.Size := FONT_H6;
  Edit1.Font.Color := COLOR_BACKGROUND_TOP;
  Edit1.Color := COLOR_BACKGROUND;

  DBGrid1.Font.Size := FONT_H6;
  DBGrid1.Font.Color := FONT_COLOR;
//  DBGrid1.Font.Name := 'Segoe UI';
  DBGrid1.TitleFont.Size := FONT_H5;
//  DBGrid1.TitleFont.Name := 'Segoe UI';
  DBGrid1.TitleFont.Color := FONT_COLOR4;  
end;

procedure TFormTemplate.FormCreate(Sender: TObject);
begin
  TBindFormJson.New.BindClassToForm(Self, FEndPoint, FPK, FTitle);
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
