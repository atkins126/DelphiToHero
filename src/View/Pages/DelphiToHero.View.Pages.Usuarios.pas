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
  Vcl.ActnList, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  [ClassToBind('/users', 'id', 'Cadastro de Usuários')]
  TPageUsuarios = class(TFormTemplate)
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
