unit UnitHome;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, unit2,unit3;

type
  TFrmHome = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    PnlHome: TPanel;
    Label1: TLabel;
    PnlAdministrasie: TPanel;
    PnlAannemings: TPanel;
    PnlDonasies: TPanel;
    PnlHulp: TPanel;
    Timer1: TTimer;
    procedure PnlAdministrasieClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    function RndColorVal: integer;
    procedure PnlAannemingsClick(Sender: TObject);
    function PicRand : integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHome: TFrmHome;
  SwoordText: TextFile;
  Snaam, sdata: string;

implementation

{$R *.dfm}

procedure TFrmHome.PnlAannemingsClick(Sender: TObject);
begin
Frmaanames.Show;
FrmHome.Hide;
end;

procedure TFrmHome.PnlAdministrasieClick(Sender: TObject);
var
  toetsW: string;
  itry: integer;
  UserName: string;
begin
  itry := 3;
  Snaam := Inputbox('Naam', 'Tik  jou naam', '');
  if FileExists(Snaam + '.txt') then
  begin
    toetsW := Inputbox('Welkom', Snaam + ' tik asseblief jou wagwoord', '');
    AssignFile(SwoordText, Snaam + '.txt');
    reset(SwoordText);
    Readln(SwoordText, UserName);
    Readln(SwoordText, sdata);
    CloseFile(SwoordText);

    { if toetsW = sdata then

      begin
      ShowMessage('Jy is in gelog');
      frmadmin.show;
      FrmHome.Hide;

      end

      else } if not(sdata = toetsW) then
    begin


      begin
        repeat
        itry := itry - 1;
          toetsW := Inputbox('Wagwoord is verkeerd',
            'Jy het ' + inttostr(itry) + ' kanse oor', '');
        until (sdata = toetsW) or (itry = 1);

      end;

    end;

    if toetsW = sdata then

    begin
      ShowMessage('Jy is in gelog');
      frmadmin.show;
      FrmHome.Hide;

    end
    else

      if itry = 1 then
    begin
      ShowMessage('Jy het al jou kanse gebruik');
      Application.Terminate;
    end;

    { else
      AssignFile(SwoordText, Snaam + '.txt');
      Rewrite(SwoordText);
      Writeln(SwoordText, Snaam);
      CloseFile(SwoordText); }

  end;
end;

function TFrmHome.RndColorVal: integer;
begin
  result := random(100000000)
end;

procedure TFrmHome.Timer1Timer(Sender: TObject);
begin
  Label1.font.Color := RndColorVal;
end;

end.
