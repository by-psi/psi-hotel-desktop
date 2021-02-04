unit md_versaodosistema;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, StdCtrls, jpeg;

type
  TF_versaodosistema = class(TForm)
    Label3: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    assinatura: TImage;
    StaticText_1: TStaticText;
    StaticText_2: TStaticText;
    Label5: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    bt_fechar: TBitBtn;

    procedure FormShow(Sender: TObject);
    procedure bt_fecharClick(Sender: TObject);
    function  AppVersion(App:string):string;
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_versaodosistema: TF_versaodosistema;

implementation

uses
  md_utilities, md_firedac;

{$R *.DFM}

procedure TF_versaodosistema.FormShow(Sender: TObject);
begin
  with dm_firedac do
  begin
    F_versaodosistema.Caption := 'PSI-HOTEL v'+T_empresaVERSAO.Value+' - SUPORTE';
    StaticText_1.Caption := 'Versão '+AppVersion(Application.Exename);
    StaticText_2.Caption := 'Atualizado em '+T_empresaDT_ULTRV.AsString;
  end;
end;

procedure TF_versaodosistema.bt_fecharClick(Sender: TObject);
begin
	CLOSE;
end;

function TF_versaodosistema.AppVersion(App:string):string;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
  V1, V2, V3, V4: Word;
  Prg: string;
begin
  Prg := App;
  VerInfoSize := GetFileVersionInfoSize(PChar(Prg), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(Prg), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
  with VerValue^ do
  begin
    V1 := dwFileVersionMS shr 16;
    V2 := dwFileVersionMS and $FFFF;
    V3 := dwFileVersionLS shr 16;
    V4 := dwFileVersionLS and $FFFF;
  end;
  FreeMem(VerInfo, VerInfoSize);
  result :=
  Copy (IntToStr (100 + v1), 3, 2) + '.' +
  Copy (IntToStr (100 + v2), 3, 2) + '.' +
  Copy (IntToStr (100 + v3), 3, 2) + '.' +
  Copy (IntToStr (100 + v4), length(inttostr(v4)),length(inttostr(v4)));
end;

procedure TF_versaodosistema.FormCreate(Sender: TObject);
begin
//  F_AjustarTela(F_versaodosistema);
end;

end.

