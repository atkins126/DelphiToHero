unit DelphiToHero.Model.DAO.REST;

interface

uses
  Data.DB,
  Vcl.Forms,
  System.Generics.Collections,
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
  RESTRequest4D,
  Bind4D,
  DataSet.Serialize,
  DelphiToHero.Model.DAO.Interfaces;

type
  TDAOREST = class(TInterfacedObject, iDAOInterface)
  private
    FDMemTable1: TFDMemTable;
    FBaseUrl: string;
    FEndPoint, FPK, FOrderBy, FSort: string;
    FForm: TForm;
    FParamList: TDictionary<string, string>;
    FPage: Integer;
    FLimit: Integer;
    FTotal: Integer;
    FPages: Integer;
    function PrepareGuuid(aGuuid: string): string;
  public
    constructor Create(AForm: TForm);
    destructor Destroy; override;
    class function New(AForm: TForm) : iDAOInterface;
    function Get : iDAOInterface;
    function Post : iDAOInterface;
    function Put : iDAOInterface;
    function Delete : iDAOInterface;
    function DataSource(ADataSet: TDataSource) : iDAOInterface;
    function DataSet: TDataSet;
    function AddParam(aKey: string; aValue: string) : iDAOInterface;
    function Page: Integer; overload;
    function Page(AValue: Integer): iDAOInterface; overload;
    function Limit: Integer; overload;
    function Limit(AValue: Integer): iDAOInterface; overload;
    function Total(aValue: Integer): iDAOInterface; overload;
    function Total: Integer; overload;
    function Pages(aValue: Integer): iDAOInterface; overload;
    function Pages: Integer; overload;
  end;

implementation

uses
  System.JSON, System.SysUtils, System.StrUtils, Bind4D.Types;

{ TDAOREST }

function TDAOREST.AddParam(aKey, aValue: string): iDAOInterface;
begin
  Result := Self;
  FParamList.Add(aKey, aValue);
end;

constructor TDAOREST.Create(AForm: TForm);
begin
  FDMemTable1 := TFDMemTable.Create(nil);
  FParamList := TDictionary<string, string>.Create;
  FBaseUrl := 'http://localhost:9000';
  FForm := AForm;
  FPage := 1;
  FLimit := 19;

  TBind4D.New.Form(FForm).BindFormRest(FEndPoint, FPK, FSort, FOrderBy);
end;

function TDAOREST.DataSet: TDataSet;
begin
  Result := FDMemTable1;
end;

function TDAOREST.DataSource(ADataSet: TDataSource): iDAOInterface;
begin
  Result := Self;
  ADataSet.DataSet := FDMemTable1;
end;

function TDAOREST.Delete: iDAOInterface;
var
  aJSON: TJSONObject;
begin
  Result := Self;
  aJSON := TBind4D.New.Form(FForm).FormToJson(fbPost);
  try

    TRequest.New
      .BaseURL(FBaseUrl+ FEndPoint + '/' + PrepareGuuid(FDMemTable1.FieldByName(FPK).AsString))
      .Accept('application/json')
      .AddBody(aJSON.ToJSON)
    .Delete;

  finally
    aJSON.Free;
  end;
end;

destructor TDAOREST.Destroy;
begin
  FDMemTable1.Free;
  FParamList.Free;
  inherited;
end;

function TDAOREST.Get: iDAOInterface;
var
  aURL: string;
  Params: TPair<string, string>;
  aJsonResult : TJSONObject;
  aResult : string;
begin
  Result := Self;
  FDMemTable1.Close;

  aURL := FBaseUrl + FEndPoint + '?';

  for Params in FParamList do
    aURL := aURL + Params.Key + '=' + Params.Value + '&';

  aURL := aURL + 'limit='+ IntToStr(FLimit) + '&page=' + IntToStr(FPage);

  aResult :=
    TRequest
      .New
        .BaseURL(aURL)
        .Accept('application/json')
        .AddHeader('X-Paginate', 'true')
//        .DataSetAdapter(FDMemTable1)
      .Get
      .Content;

  aJsonResult := TJSONObject.ParseJSONValue(aResult) as TJSONObject;
  try
    FDMemTable1.DisableControls;
    FTotal := aJsonResult.GetValue<Integer>('total');
    FLimit := aJsonResult.GetValue<Integer>('limit');
    FPage  := aJsonResult.GetValue<Integer>('page');
    FPages := aJsonResult.GetValue<Integer>('pages');

    FDMemTable1.LoadFromJSON(aJsonResult.GetValue<TJSONArray>('docs'), False);
  finally
    FDMemTable1.EnableControls;
    aJsonResult.Free;
  end;
  FParamList.Clear;
end;

function TDAOREST.Limit(AValue: Integer): iDAOInterface;
begin
  Result := Self;
  FLimit := AValue;
end;

function TDAOREST.Limit: Integer;
begin
  Result := FLimit;
end;

class function TDAOREST.New(AForm: TForm) : iDAOInterface;
begin
  Result := Self.Create(AForm);
end;

function TDAOREST.Page(AValue: Integer): iDAOInterface;
begin
  Result := Self;
  FPage := AValue;
end;

function TDAOREST.Pages(aValue: Integer): iDAOInterface;
begin
  Result := Self;
  FPages := aValue;
end;

function TDAOREST.Pages: Integer;
begin
  Result := FPages;
end;

function TDAOREST.Page: Integer;
begin
  Result := FPage;
end;

function TDAOREST.Post: iDAOInterface;
var
  aJSON: TJSONObject;
begin
  Result := Self;
  aJSON := TBind4D.New.Form(FForm).FormToJson(fbPost);
  try

    TRequest.New
      .BaseURL(FBaseUrl + FEndPoint)
      .Accept('application/json')
      .AddBody(aJSON.ToJSON)
    .Post;

  finally
    aJSON.Free;
  end;
end;

function TDAOREST.PrepareGuuid(aGuuid: string): string;
begin
  Result := StringReplace(aGuuid, '{', '', [rfReplaceAll]);
  Result := StringReplace(Result, '}', '', [rfReplaceAll]);
end;

function TDAOREST.Put: iDAOInterface;
var
  aJSON: TJSONObject;
begin
  Result := Self;
  aJSON := TBind4D.New.Form(FForm).FormToJson(fbPost);
  try

    TRequest.New
      .BaseURL(FBaseUrl+ FEndPoint + '/' + PrepareGuuid(FDMemTable1.FieldByName(FPK).AsString))
      .Accept('application/json')
      .AddBody(aJSON.ToJSON)
    .Put;

  finally
    aJSON.Free;
  end;
end;

function TDAOREST.Total(aValue: Integer): iDAOInterface;
begin
  Result := Self;
  FTotal := aValue;
end;

function TDAOREST.Total: Integer;
begin
  Result := FTotal;
end;

end.
