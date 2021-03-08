unit DelphiToHero.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, DelphiToHero.View.Styles.Color,
  Vcl.Buttons, Router4D;

type
  TForm2 = class(TForm)
    pnlContent: TPanel;
    pnlFull: TPanel;
    pnlMenu: TPanel;
    pnlLayout: TPanel;
    pnlHeader: TPanel;
    pnlLogo: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    procedure ApplyStyle;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses DelphiToHero.View.Pages.Principal;

procedure TForm2.FormCreate(Sender: TObject);
begin
  ApplyStyle;

  TRouter4D.Render<TfrmPagePrincipal>.SetElement(pnlLayout, pnlContent);
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  TRouter4D.Link.&To('Usuarios');
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
  TRouter4D.Link.&To('Principal');
end;

procedure TForm2.ApplyStyle;
begin
  pnlLayout.Color := COLOR_BACKGROUND;
  pnlHeader.Color := COLOR_BACKGROUND_TOP;
  pnlLogo.Color := COLOR_BACKGROUND_DESTAK;
  pnlMenu.Color := COLOR_BACKGROUND_MENU;

  Self.Font.Color := FONT_COLOR;
  Self.Font.Size := FONT_H6;
end;

end.
