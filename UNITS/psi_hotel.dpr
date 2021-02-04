program psi_hotel;

uses
  Vcl.Forms,
  md_principal in 'md_principal.pas' {F_principal},
  md_utilities in 'md_utilities.pas',
  md_login in 'md_login.pas' {F_login},
  md_empresa in 'md_empresa.pas' {F_empresa},
  md_usuarios in 'md_usuarios.pas' {F_usuarios},
  md_dadosdousuario in 'md_dadosdousuario.pas' {F_dadosdousuario},
  md_apartamentos in 'md_apartamentos.pas' {F_apartamentos},
  md_feriados in 'md_feriados.pas' {F_feriados},
  md_fornecedores in 'md_fornecedores.pas' {F_fornecedores},
  md_grupos in 'md_grupos.pas' {F_grupos},
  md_produtos in 'md_produtos.pas' {F_produtos},
  md_configdb in 'md_configdb.pas' {F_configdb},
  md_versaodosistema in 'md_versaodosistema.pas' {F_versaodosistema},
  md_diarias in 'md_diarias.pas' {F_diarias},
  md_editardiaria in 'md_editardiaria.pas' {F_editardiaria},
  md_aberturadeponto in 'md_aberturadeponto.pas' {F_aberturadeponto},
  md_aberturadeconta in 'md_aberturadeconta.pas' {F_aberturadeconta},
  md_fechamentodeconta in 'md_fechamentodeconta.pas' {F_fechamentodeconta},
  md_fechamentodeponto in 'md_fechamentodeponto.pas' {F_fechamentodeponto},
  md_resumodecaixa in 'md_resumodecaixa.pas' {F_relatoriodecaixa},
  md_rouparia in 'md_rouparia.pas' {F_rouparia},
  md_transferenciadeconta in 'md_transferenciadeconta.pas' {F_transferenciadeconta},
  md_comandas in 'md_comandas.pas' {F_comandas},
  md_resumodaconta in 'md_resumodaconta.pas' {F_resumodaconta},
  md_detalhesdaconta in 'md_detalhesdaconta.pas' {F_detalhesdaconta},
  md_coletas in 'md_coletas.pas' {F_coletas},
  md_entregas in 'md_entregas.pas' {F_entregas},
  md_firedac in 'md_firedac.pas' {dm_firedac: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'PSI-HOTEL v10.3';
  Application.CreateForm(Tdm_firedac, dm_firedac);
  Application.CreateForm(TF_principal, F_principal);
  Application.CreateForm(TF_login, F_login);
  Application.Run;
end.
