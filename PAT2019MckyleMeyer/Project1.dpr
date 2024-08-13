program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {FrmHome},
  Unit2 in 'Unit2.pas' {frmAdmin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmHome, FrmHome);
  Application.CreateForm(TfrmAdmin, frmAdmin);
  Application.Run;
end.
