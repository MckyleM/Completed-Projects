unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, unit2, unit3, ComCtrls;

type
  TFrmHome = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Label1: TLabel;
    PnlAdministrasie: TPanel;
    Timer1: TTimer;
    PnlLogTime: TPanel;
    EdtName: TEdit;
    LblName: TLabel;
    BtnStopColorAndPic: TButton;
    redoutput: TRichEdit;
    BtnReset: TButton;
    EdtTime: TEdit;
    TimeEdt: TTimer;
    PnlHome: TPanel;
    PnlKliente: TPanel;
    ComboBox1: TComboBox;
    ChkDonasies: TCheckBox;
    ChklHulp: TCheckBox;
    chkAan: TCheckBox;
    PnlDonasies: TPanel;
    PnlHulp: TPanel;
    PnlAannames: TPanel;
    RedDonasies: TRichEdit;
    LblR50: TLabel;
    LblR100: TLabel;
    LblR150: TLabel;
    LblR200: TLabel;
    RedHulp: TRichEdit;
    BtnConfirm: TButton;
    PnlDogSize: TPanel;
    pnlGeaardheid: TPanel;
    PnlFunksie: TPanel;
    BtnSpesifiseer: TButton;
    redDogtype: TRichEdit;
    BtnHulpBegin: TButton;
    BtnEBedrag: TButton;
    procedure PnlAdministrasieClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    function RndColorVal: integer;
    function PicRand1: integer;
    function PicRand2: integer;
    function PicRand3: integer;
    function PicRand4: integer;
    procedure BtnStopColorAndPicClick(Sender: TObject);
    procedure PnlLogTimeClick(Sender: TObject);
    procedure TimeEdtTimer(Sender: TObject);
    procedure ChkDonasiesClick(Sender: TObject);
    procedure chkAanClick(Sender: TObject);
    procedure ChklHulpClick(Sender: TObject);
    procedure PnlDogSizeClick(Sender: TObject);
    procedure pnlGeaardheidClick(Sender: TObject);
    procedure PnlFunksieClick(Sender: TObject);
    procedure BtnSpesifiseerClick(Sender: TObject);
    procedure BtnHulpBeginClick(Sender: TObject);
    procedure LblR50Click(Sender: TObject);
    procedure LblR100Click(Sender: TObject);
    procedure LblR150Click(Sender: TObject);
    procedure LblR200Click(Sender: TObject);
    procedure BtnEBedragClick(Sender: TObject);
    procedure BtnConfirmClick(Sender: TObject);
    procedure BtnResetClick(Sender: TObject);

  private
    { Private declarations }
  var
    wname, wvan, ucode: string;
    dGrote, Dgeaard, Dfunksie, Dspesifiseer: string;
    totaalD: integer;
  public
    { Public declarations }
  end;

var
  FrmHome: TFrmHome;
  SwoordText: TextFile;
  Snaam, sdata, ctoets, cuser: string;

implementation

{$R *.dfm}

procedure TFrmHome.BtnHulpBeginClick(Sender: TObject);
var
  Naam, van, email, nommer,werk: string;
  k: integer;
begin
  for k := 1 to 5 do
    if k = 1 then
      Naam := InputBox('Naam', 'Tik asseblief jou naam', '')
    else if k = 2 then
      van := InputBox('Van', 'Tik asseblief jou van', '')
    else if k = 3 then
      email := InputBox('Email', 'Gee asseblief n geskikte Email adress', '')
    else if k = 4 then
      nommer := InputBox('Selfoon nommer',
        'Gee asseblief n nommer waaeop ons jou kan skakel', '')
        else
        if k=5  then
        werk:= InputBox('Verkiesde werk','Watter werk sal jy graag meer wil help?','');
  RedHulp.Lines.Add('Naam : ' + Naam);
  RedHulp.Lines.Add('Van : ' + van);
  RedHulp.Lines.Add('Email : ' + email);
  RedHulp.Lines.Add('Nommer : ' + nommer);
   RedHulp.Lines.Add('Verkiesde werk : ' + werk);
end;

procedure TFrmHome.BtnResetClick(Sender: TObject);
begin
Abort;
RedDonasies.Clear;
redDogtype.Clear;
RedHulp.Clear;
ChkDonasies.Checked := false;
ChklHulp.Checked := false;
chkAan.Checked:=false;
totaald:=0;
redoutput.Clear;
EdtName.Clear;


end;

procedure TFrmHome.BtnSpesifiseerClick(Sender: TObject);
begin
  Dspesifiseer := InputBox('Spesifieke broei',
    'Vir watter broei moet ons op die uitkyk wees vir jou?', '');
    redDogtype.Lines.Add('Spesifieke broei : ' + Dspesifiseer);
end;

procedure TFrmHome.BtnStopColorAndPicClick(Sender: TObject);
begin
  Timer1.Enabled := false;
end;

procedure TFrmHome.BtnConfirmClick(Sender: TObject);
begin
showmessage('Dankie vir jou tyd ons sal jou oor enige verdere inligting laatweet')
end;

procedure TFrmHome.BtnEBedragClick(Sender: TObject);
begin

  RedDonasies.Lines.Add(inttostr(totaalD) + ' Rand')

end;

procedure TFrmHome.chkAanClick(Sender: TObject);
begin
  if chkAan.Checked = true then
  begin
    PnlDogSize.Enabled := true;
    pnlGeaardheid.Enabled := true;
    PnlFunksie.Enabled := true;
    BtnSpesifiseer.Enabled := true;
    redDogtype.Enabled := true;
    PnlAannames.Enabled := true;
    PnlDogSize.visible := true;
    pnlGeaardheid.visible := true;
    PnlFunksie.visible := true;
    BtnSpesifiseer.visible := true;
    redDogtype.visible := true;
    PnlAannames.visible := true;

  end
  else
  begin
    PnlDogSize.Enabled := false;
    pnlGeaardheid.Enabled := false;
    PnlFunksie.Enabled := false;
    BtnSpesifiseer.Enabled := false;
    PnlAannames.Enabled := false;
    redDogtype.Enabled := false;
    PnlDogSize.visible := false;
    pnlGeaardheid.visible := false;
    PnlFunksie.visible := false;
    BtnSpesifiseer.visible := false;
    PnlAannames.visible := false;
    redDogtype.visible := false;

  end;
end;

procedure TFrmHome.ChkDonasiesClick(Sender: TObject);
begin
  if ChkDonasies.Checked = true then
  begin

    PnlDonasies.Enabled := true;
    LblR50.Enabled := true;
    LblR100.Enabled := true;
    LblR150.Enabled := true;
    LblR200.Enabled := true;
    RedDonasies.Enabled := true;
    PnlDonasies.visible := true;
    LblR50.visible := true;
    LblR100.visible := true;
    LblR150.visible := true;
    LblR200.visible := true;
    RedDonasies.visible := true;
  end
  else
  begin
    PnlDonasies.Enabled := false;
    LblR50.Enabled := false;
    LblR100.Enabled := false;
    LblR150.Enabled := false;
    LblR200.Enabled := false;
    RedDonasies.Enabled := false;
    PnlDonasies.visible := false;
    LblR50.visible := false;
    LblR100.visible := false;
    LblR150.visible := false;
    LblR200.visible := false;
    RedDonasies.visible := false;
  end;

end;

procedure TFrmHome.ChklHulpClick(Sender: TObject);
begin
  if ChklHulp.Checked = true then
  begin
    PnlHulp.Enabled := true;
    RedHulp.Enabled := true;
    BtnHulpBegin.Enabled := true;
    PnlHulp.visible := true;
    RedHulp.visible := true;
    BtnHulpBegin.visible := true;
  end
  else
  begin
    PnlHulp.Enabled := false;
    RedHulp.Enabled := false;
    BtnHulpBegin.Enabled := false;
    PnlHulp.visible := false;
    RedHulp.visible := false;
    BtnHulpBegin.visible := false;
  end;

end;

procedure TFrmHome.LblR100Click(Sender: TObject);
begin
  totaalD := totaalD + 100;
  RedDonasies.Lines.Add('100 Rand')
end;

procedure TFrmHome.LblR150Click(Sender: TObject);
begin
  totaalD := totaalD + 150;
  RedDonasies.Lines.Add('150 Rand')
end;

procedure TFrmHome.LblR200Click(Sender: TObject);
begin
  totaalD := totaalD + 200;
  RedDonasies.Lines.Add('200 Rand')
end;

procedure TFrmHome.LblR50Click(Sender: TObject);
begin
  totaalD := totaalD + 50;
  RedDonasies.Lines.Add('50 Rand')
end;

{ function Emailtest(const aValue: string): string;
  const
  CHARS = ['0'..'9', 'a'..'z', 'A'..'Z'];
  var
  i: Integer;
  begin
  Result := aValue.Trim;
  for i := 1 to Length(Result) do
  begin
  if not (Result[i] in CHARS) then
  raise Exception.Create('Non valido');
  end;
  end; }

function TFrmHome.PicRand1: integer;
var
  pic1, pic2, pic3, pic4: integer;
begin
  result := Random(11);

  { pic2 := Random(11);
    pic3 := Random(11);
    pic4 := Random(11);
    repeat
    if (pic1 = pic2) or (pic1 = pic3) or (pic1 = pic4) {or (pic2 = pic3)
    or (pic2 = pic4) or (pic3=pic4) then
    pic1 := pic1 + 1;


    until (pic1 <> pic2) and (pic1 <> pic3) and (pic1 <> pic4) and (pic2 <> pic3)
    and (pic2 <> pic4) and (pic3<>pic4); }
  begin
    // repeat
    case result of
      1:
        Image1.Picture.LoadFromFile('Wit husk.jpg');
      2:
        Image1.Picture.LoadFromFile('Alsation.jpg');
      3:
        Image1.Picture.LoadFromFile('Blom Lab.jpg');
      4:
        Image1.Picture.LoadFromFile('Cody.jpg');
      5:
        Image1.Picture.LoadFromFile('German Shepard.jpg');
      6:
        Image1.Picture.LoadFromFile('koliHond.jpg');
      7:
        Image1.Picture.LoadFromFile('Kwaai Husk.jpg');
      8:
        Image1.Picture.LoadFromFile('Pug.jpg');
      9:
        Image1.Picture.LoadFromFile('ToiPom.jpg');
      10:
        Image1.Picture.LoadFromFile('Welkom Woef.jpg');
      11:
        Image1.Picture.LoadFromFile('Wit Lab.jpg');
    end;
    { case pic2 of
      1:
      Image2.Picture.LoadFromFile('Wit husk.jpg');
      2:
      Image2.Picture.LoadFromFile('Alsation.jpg');
      3:
      Image2.Picture.LoadFromFile('Blom Lab.jpg');
      4:
      Image2.Picture.LoadFromFile('Cody.jpg');
      5:
      Image2.Picture.LoadFromFile('German Shepard.jpg');
      6:
      Image2.Picture.LoadFromFile('koliHond.jpg');
      7:
      Image2.Picture.LoadFromFile('Kwaai Husk.jpg');
      8:
      Image2.Picture.LoadFromFile('Pug.jpg');
      9:
      Image2.Picture.LoadFromFile('ToiPom.jpg');
      10:
      Image2.Picture.LoadFromFile('Welkom Woef.jpg');
      11:
      Image2.Picture.LoadFromFile('Wit Lab.jpg');
      end;
      case pic3 of
      1:
      Image3.Picture.LoadFromFile('Wit husk.jpg');
      2:
      Image3.Picture.LoadFromFile('Alsation.jpg');
      3:
      Image3.Picture.LoadFromFile('Blom Lab.jpg');
      4:
      Image3.Picture.LoadFromFile('Cody.jpg');
      5:
      Image3.Picture.LoadFromFile('German Shepard.jpg');
      6:
      Image3.Picture.LoadFromFile('koliHond.jpg');
      7:
      Image3.Picture.LoadFromFile('Kwaai Husk.jpg');
      8:
      Image3.Picture.LoadFromFile('Pug.jpg');
      9:
      Image3.Picture.LoadFromFile('ToiPom.jpg');
      10:
      Image3.Picture.LoadFromFile('Welkom Woef.jpg');
      11:
      Image3.Picture.LoadFromFile('Wit Lab.jpg');
      end;
      case pic4 of
      1:
      Image4.Picture.LoadFromFile('Wit husk.jpg');
      2:
      Image4.Picture.LoadFromFile('Alsation.jpg');
      3:
      Image4.Picture.LoadFromFile('Blom Lab.jpg');
      4:
      Image4.Picture.LoadFromFile('Cody.jpg');
      5:
      Image4.Picture.LoadFromFile('German Shepard.jpg');
      6:
      Image4.Picture.LoadFromFile('koliHond.jpg');
      7:
      Image4.Picture.LoadFromFile('Kwaai Husk.jpg');
      8:
      Image4.Picture.LoadFromFile('Pug.jpg');
      9:
      Image4.Picture.LoadFromFile('ToiPom.jpg');
      10:
      Image4.Picture.LoadFromFile('Welkom Woef.jpg');
      11:
      Image4.Picture.LoadFromFile('Wit Lab.jpg');
      end;
      { // repeat
      case pic2 of
      1:
      Image2.Picture.LoadFromFile('Wit husk.jpg');
      2:
      Image2.Picture.LoadFromFile('Alsation.jpg');
      3:
      Image2.Picture.LoadFromFile('Blom Lab.jpg');
      4:
      Image2.Picture.LoadFromFile('Cody.jpg');
      5:
      Image2.Picture.LoadFromFile('German Shepard.jpg');
      6:
      Image2.Picture.LoadFromFile('koliHond.jpg');
      7:
      Image2.Picture.LoadFromFile('Kwaai Husk.jpg');
      8:
      Image2.Picture.LoadFromFile('Pug.jpg');
      9:
      Image2.Picture.LoadFromFile('ToiPom.jpg');
      10:
      Image2.Picture.LoadFromFile('Welkom Woef.jpg');
      11:
      Image2.Picture.LoadFromFile('Wit Lab.jpg'); }

  end;
end;

{ function TFrmHome.PicRand2: integer;
  var
  pic2: integer;
  begin
  case pic2 of
  1:
  Image2.Picture.LoadFromFile('Wit husk.jpg');
  2:
  Image2.Picture.LoadFromFile('Alsation.jpg');
  3:
  Image2.Picture.LoadFromFile('Blom Lab.jpg');
  4:
  Image2.Picture.LoadFromFile('Cody.jpg');
  5:
  Image2.Picture.LoadFromFile('German Shepard.jpg');
  6:
  Image2.Picture.LoadFromFile('koliHond.jpg');
  7:
  Image2.Picture.LoadFromFile('Kwaai Husk.jpg');
  8:
  Image2.Picture.LoadFromFile('Pug.jpg');
  9:
  Image2.Picture.LoadFromFile('ToiPom.jpg');
  10:
  Image2.Picture.LoadFromFile('Welkom Woef.jpg');
  11:
  Image2.Picture.LoadFromFile('Wit Lab.jpg');
  end;

  end; }

function TFrmHome.PicRand2: integer;
begin
  result := Random(11);
  begin
    case result of
      1:
        Image2.Picture.LoadFromFile('Wit husk.jpg');
      2:
        Image2.Picture.LoadFromFile('Alsation.jpg');
      3:
        Image2.Picture.LoadFromFile('Blom Lab.jpg');
      4:
        Image2.Picture.LoadFromFile('Cody.jpg');
      5:
        Image2.Picture.LoadFromFile('German Shepard.jpg');
      6:
        Image2.Picture.LoadFromFile('koliHond.jpg');
      7:
        Image2.Picture.LoadFromFile('Kwaai Husk.jpg');
      8:
        Image2.Picture.LoadFromFile('Pug.jpg');
      9:
        Image2.Picture.LoadFromFile('ToiPom.jpg');
      10:
        Image2.Picture.LoadFromFile('Welkom Woef.jpg');
      11:
        Image2.Picture.LoadFromFile('Wit Lab.jpg');
    end;
  end;

end;

function TFrmHome.PicRand3: integer;
begin
  result := Random(11);
  begin
    case result of
      1:
        Image3.Picture.LoadFromFile('Wit husk.jpg');
      2:
        Image3.Picture.LoadFromFile('Alsation.jpg');
      3:
        Image3.Picture.LoadFromFile('Blom Lab.jpg');
      4:
        Image3.Picture.LoadFromFile('Cody.jpg');
      5:
        Image3.Picture.LoadFromFile('German Shepard.jpg');
      6:
        Image3.Picture.LoadFromFile('koliHond.jpg');
      7:
        Image3.Picture.LoadFromFile('Kwaai Husk.jpg');
      8:
        Image3.Picture.LoadFromFile('Pug.jpg');
      9:
        Image3.Picture.LoadFromFile('ToiPom.jpg');
      10:
        Image3.Picture.LoadFromFile('Welkom Woef.jpg');
      11:
        Image3.Picture.LoadFromFile('Wit Lab.jpg');
    end;
  end;
end;

function TFrmHome.PicRand4: integer;
begin
  result := Random(11);
  begin
    case result of
      1:
        Image4.Picture.LoadFromFile('Wit husk.jpg');
      2:
        Image4.Picture.LoadFromFile('Alsation.jpg');
      3:
        Image4.Picture.LoadFromFile('Blom Lab.jpg');
      4:
        Image4.Picture.LoadFromFile('Cody.jpg');
      5:
        Image4.Picture.LoadFromFile('German Shepard.jpg');
      6:
        Image4.Picture.LoadFromFile('koliHond.jpg');
      7:
        Image4.Picture.LoadFromFile('Kwaai Husk.jpg');
      8:
        Image4.Picture.LoadFromFile('Pug.jpg');
      9:
        Image4.Picture.LoadFromFile('ToiPom.jpg');
      10:
        Image4.Picture.LoadFromFile('Welkom Woef.jpg');
      11:
        Image4.Picture.LoadFromFile('Wit Lab.jpg');
    end;
  end;
end;

procedure TFrmHome.PnlAdministrasieClick(Sender: TObject);
var
  toetsW: string;
  itry: integer;
  UserName: string;
begin
  itry := 3;
  Snaam := InputBox('Naam', 'Tik  jou naam', '');
  if Snaam <> 'Admin' then
    showmessage(Snaam +
        ' jy het nie die permisie om hierdie gedeelte te besoek nie.')
  else if FileExists(Snaam + '.txt') then
  begin
    toetsW := InputBox('Welkom', Snaam + ' tik asseblief jou wagwoord', '');
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
          toetsW := InputBox('Wagwoord is verkeerd',
            'Jy het ' + inttostr(itry) + ' kanse oor', '');
        until (sdata = toetsW) or (itry = 1);

      end;

    end;

    if toetsW = sdata then

    begin
      showmessage('Jy is in gelog');
      frmadmin.Show;
      FrmHome.Hide;

    end
    else

      if itry = 1 then
    begin
      showmessage('Jy het al jou kanse gebruik');
      Application.Terminate;
    end;

    { else
      AssignFile(SwoordText, Snaam + '.txt');
      Rewrite(SwoordText);
      Writeln(SwoordText, Snaam);
      CloseFile(SwoordText); }

  end;
end;

procedure TFrmHome.PnlDogSizeClick(Sender: TObject);
begin
  dGrote := InputBox('Grote', 'Watter grote hond wil jy he', '');
  redDogtype.Lines.Add('Grote : ' + dgrote)
end;

procedure TFrmHome.PnlFunksieClick(Sender: TObject);
begin
  Dfunksie := InputBox('Funksie',
    'Neem jy hierdie hond met n spisifieke doel?', '');
    redDogtype.Lines.Add('Funksie van hond neem : ' + dfunksie);
end;

procedure TFrmHome.pnlGeaardheidClick(Sender: TObject);
begin
  Dgeaard := InputBox('Geaardheid', 'Watter tiepe geaartheid met jou hond he',
    '');
    redDogtype.Lines.Add('Geaartheid : ' + DGEAARD);

end;

procedure TFrmHome.PnlLogTimeClick(Sender: TObject);
var
  k, ctime: integer;
  Source1: string;
  test: string;
begin
  redoutput.Clear;
  k := 3;
  test := EdtTime.Text;

  Source1 := copy(test, 12, 2);
  // ShowMessage('Tyd in gesleutel vandag was : ' + source1);

  // for ctime := 12 to 16 do
  wname := EdtName.Text;
  { AssignFile(swoordtext,wname + '.txt');
    CloseFile(swoordtext); } if EdtName.Text = '' then
    showmessage('Tik asseblief jou naam')
  else
  begin

    if FileExists(wname + '.txt') = false then
      redoutput.Lines.Add(wname +
          ' is nog nie n werknemer by ons onderneming nie, kontak asseblief die administrateur om deel te word van  die DBV')
    else
    begin

      // if then

      { if EdtName.Text = '' then
        showmessage('Tik asseblief jou naam')
        else }
      begin
        AssignFile(SwoordText, wname + '.txt');
        reset(SwoordText);
        Readln(SwoordText, cuser);
        Readln(SwoordText, ctoets);
        CloseFile(SwoordText);
        { if EdtName.Text = '' then
          showmessage('Tik asseblief jou naam'); }
        if FileExists(wname + '.txt') then
        begin
          ucode := InputBox('Unieke kode', 'Tik asseblief jou unieke kode', '');
          if ucode = ctoets then
          begin
            redoutput.Lines.Add(wname +
                ' jy is suksesfol in geteken, geniet asseblief jou dag by die werk.')
          end
          else
          begin
            repeat
              k := k - 1;

              showmessage('Jou unieke kode is verkeerd jy het ' + inttostr(k)
                  + ' kanse oor');
              ucode := InputBox('Unieke kode', 'Tik asseblief jou unieke kode',
                '');
            until (ucode = ctoets) or (k = 3);

            if (ucode = ctoets) then
            begin
              // if Source1 = 8 then

              redoutput.Lines.Add(wname +
                  ' jy is suksesfol in geteken, geniet asseblief jou dag by die werk.');
            end
            { begin
              repeat
              k := k  +1;

              showmessage('Jou unieke kode is verkeerd jy het ' + inttostr(k) + ' kanse oor');
              ucode := Inputbox('Unieke kode', 'Tik asseblief jou unieke kode', '');
              until (ucode=ctoets)or( k = 3) ;

              end; }
            { else if FileExists(wname + '.txt') {and (Source1 > '8:00') then
              begin
              AssignFile(SwoordText, wname + '.txt');
              Readln(SwoordText);
              Readln(SwoordText);
              Writeln(SwoordText, inttostr(+1) + 'keer laat');
              CloseFile(SwoordText);
              redoutput.Lines.Add('Jy is vandag laat vir werk'); }

          end;
        end;
      end;

    end;
  end;

end;

function TFrmHome.RndColorVal: integer;
begin
  result := Random(100000000)
end;

procedure TFrmHome.TimeEdtTimer(Sender: TObject);
begin
  EdtTime.Text := DateTimeToStr(now);

end;

procedure TFrmHome.Timer1Timer(Sender: TObject);
begin
  // RedDonasies.Lines.Add(edtEBedrag.text);
  Label1.font.Color := RndColorVal;
  { repeat
    if (PicRand1 = PicRand2) or (PicRand1 = PicRand3) or (PicRand1 = PicRand4)
    then
    PicRand1 := PicRand1 + 1;
    until (PicRand1 <> PicRand2) and (PicRand1 <> PicRand3) and
    (PicRand1 <> PicRand4) and (PicRand2 <> PicRand3) and
    (PicRand2 <> PicRand4) and (PicRand3 <> PicRand4); }

  PicRand1;
  PicRand2;
  PicRand3;
  PicRand4;
  if ComboBox1.ItemIndex = 1 then
  begin
    PnlHome.visible := false;
    PnlHome.Enabled := false;
    PnlKliente.visible := true;
    PnlKliente.Enabled := true;
  end
  else
  begin
    PnlHome.visible := true;
    PnlHome.Enabled := true;
    PnlKliente.visible := false;
    PnlKliente.Enabled := false;
  end;
end;

end.
