unit DelphiToHero.View.Routers;

interface

type
  TRouters = class
  private
  public
    constructor Create;
    destructor Destroy; override;
  end;

var
  Router: TRouters;

implementation

uses
  Router4D,
  DelphiToHero.View.Pages.Principal,
  DelphiToHero.View.Pages.Usuarios;

{ TRouters }

constructor TRouters.Create;
begin
  TRouter4D
    .Switch
      .Router('Principal', TfrmPagePrincipal)
      .Router('Usuarios', TfrmPageUsuarios);
end;

destructor TRouters.Destroy;
begin

  inherited;
end;


initialization
  Router := TRouters.Create;

finalization
  Router.Free;

end.
