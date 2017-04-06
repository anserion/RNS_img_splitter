unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Bevel1: TBevel;
    Bevel10: TBevel;
    Bevel11: TBevel;
    Bevel12: TBevel;
    Bevel13: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    BTN_img_load: TButton;
    BTN_IMG_to_RNS: TButton;
    BTN_save_RNS: TButton;
    BTN_load_RNS: TButton;
    BTN_img_save: TButton;
    BTN_RNS_to_IMG: TButton;
    BTN_clear: TButton;
    EDIT_p1: TEdit;
    EDIT_p2: TEdit;
    EDIT_p3: TEdit;
    EDIT_amp: TEdit;
    EDIT_filename: TEdit;
    IMG_bss: TImage;
    IMG_bss_red: TImage;
    IMG_bss_green: TImage;
    IMG_bss_blue: TImage;
    IMG_red_p1: TImage;
    IMG_green_p1: TImage;
    IMG_blue_p1: TImage;
    IMG_red_p2: TImage;
    IMG_green_p2: TImage;
    IMG_blue_p2: TImage;
    IMG_red_p3: TImage;
    IMG_green_p3: TImage;
    IMG_blue_p3: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure BTN_clearClick(Sender: TObject);
    procedure BTN_img_loadClick(Sender: TObject);
    procedure BTN_img_saveClick(Sender: TObject);
    procedure BTN_IMG_to_RNSClick(Sender: TObject);
    procedure BTN_load_RNSClick(Sender: TObject);
    procedure BTN_RNS_to_IMGClick(Sender: TObject);
    procedure BTN_save_RNSClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BTN_img_loadClick(Sender: TObject);
begin
  if OpenDialog1.Execute then IMG_bss.Picture.LoadFromFile(OpenDialog1.FileName);
end;

procedure TForm1.BTN_clearClick(Sender: TObject);
begin
  IMG_BSS.Picture.clear;
  IMG_bss_red.Picture.clear;
  IMG_bss_green.Picture.clear;
  IMG_bss_blue.Picture.clear;
  IMG_red_p1.Picture.clear;
  IMG_red_p2.Picture.clear;
  IMG_red_p3.Picture.clear;
  IMG_green_p1.Picture.clear;
  IMG_green_p2.Picture.clear;
  IMG_green_p3.Picture.clear;
  IMG_blue_p1.Picture.clear;
  IMG_blue_p2.Picture.clear;
  IMG_blue_p3.Picture.clear;
end;

procedure TForm1.BTN_img_saveClick(Sender: TObject);
begin
  if SaveDialog1.execute then IMG_bss.Picture.SaveToFile(SaveDialog1.FileName);
end;

procedure TForm1.BTN_IMG_to_RNSClick(Sender: TObject);
var p1,p2,p3,amp:LongInt;
    x,y:LongInt;
    r,g,b,C:LongInt;
begin
  for y:=0 to IMG_bss.Height-1 do
      for x:=0 to IMG_bss.Width-1 do
      begin
          C:=IMG_bss.Canvas.Pixels[y,x];
          r:=c mod 256;
          g:=((c-r)div 256) mod 256;
          b:=c div 65536;
          IMG_bss_red.canvas.Pixels[y,x]:=r;
          IMG_bss_green.canvas.Pixels[y,x]:=g*256;
          IMG_bss_blue.canvas.Pixels[y,x]:=b*65536;
      end;

  p1:=StrToInt(EDIT_p1.text);
  p2:=StrToInt(EDIT_p2.text);
  p3:=StrToInt(EDIT_p3.text);
  amp:=StrToInt(EDIT_amp.text);

  for y:=0 to IMG_bss_red.Height-1 do
      for x:=0 to IMG_bss_red.Width-1 do
      begin
        C:=IMG_bss_red.Canvas.Pixels[y,x];
        IMG_red_p1.Canvas.Pixels[y,x]:=(C mod p1)*amp;
        IMG_red_p2.Canvas.Pixels[y,x]:=(C mod p2)*amp;
        IMG_red_p3.Canvas.Pixels[y,x]:=(C mod p3)*amp;
      end;

  for y:=0 to IMG_bss_green.Height-1 do
      for x:=0 to IMG_bss_green.Width-1 do
      begin
        C:=IMG_bss_green.Canvas.Pixels[y,x] div 256;
        IMG_green_p1.Canvas.Pixels[y,x]:=256*(C mod p1)*amp;
        IMG_green_p2.Canvas.Pixels[y,x]:=256*(C mod p2)*amp;
        IMG_green_p3.Canvas.Pixels[y,x]:=256*(C mod p3)*amp;
      end;

  for y:=0 to IMG_bss_blue.Height-1 do
      for x:=0 to IMG_bss_blue.Width-1 do
      begin
        C:=IMG_bss_blue.Canvas.Pixels[y,x] div 65536;
        IMG_blue_p1.Canvas.Pixels[y,x]:=65536*(C mod p1)*amp;
        IMG_blue_p2.Canvas.Pixels[y,x]:=65536*(C mod p2)*amp;
        IMG_blue_p3.Canvas.Pixels[y,x]:=65536*(C mod p3)*amp;
      end;
end;

procedure TForm1.BTN_load_RNSClick(Sender: TObject);
begin
  IMG_red_p1.Picture.LoadFromFile(EDIT_filename.text+'_red_p1'+'.bmp');
  IMG_red_p2.Picture.LoadFromFile(EDIT_filename.text+'_red_p2'+'.bmp');
  IMG_red_p3.Picture.LoadFromFile(EDIT_filename.text+'_red_p3'+'.bmp');
  IMG_green_p1.Picture.LoadFromFile(EDIT_filename.text+'_green_p1'+'.bmp');
  IMG_green_p2.Picture.LoadFromFile(EDIT_filename.text+'_green_p2'+'.bmp');
  IMG_green_p3.Picture.LoadFromFile(EDIT_filename.text+'_green_p3'+'.bmp');
  IMG_blue_p1.Picture.LoadFromFile(EDIT_filename.text+'_blue_p1'+'.bmp');
  IMG_blue_p2.Picture.LoadFromFile(EDIT_filename.text+'_blue_p2'+'.bmp');
  IMG_blue_p3.Picture.LoadFromFile(EDIT_filename.text+'_blue_p3'+'.bmp');
end;

procedure TForm1.BTN_RNS_to_IMGClick(Sender: TObject);
var P,p1,p2,p3,b1,b2,b3,amp:LongInt;
    x,y,i:LongInt;
    C,C1,C2,C3:LongInt;
    r,g,b:LongInt;
begin
  p1:=StrToInt(EDIT_p1.text);
  p2:=StrToInt(EDIT_p2.text);
  p3:=StrToInt(EDIT_p3.text);
  amp:=StrToInt(EDIT_amp.text);

  P:=p1*p2*p3;
  for i:=0 to P-1 do
  begin
    if ((i mod p1)=1)and((i mod p2)=0)and((i mod p3)=0) then b1:=i;
    if ((i mod p1)=0)and((i mod p2)=1)and((i mod p3)=0) then b2:=i;
    if ((i mod p1)=0)and((i mod p2)=0)and((i mod p3)=1) then b3:=i;
  end;

  for y:=0 to IMG_bss_red.Height-1 do
      for x:=0 to IMG_bss_red.Width-1 do
      begin
        C1:=IMG_red_p1.Canvas.Pixels[y,x] div amp;
        C2:=IMG_red_p2.Canvas.Pixels[y,x] div amp;
        C3:=IMG_red_p3.Canvas.Pixels[y,x] div amp;
        C:=(C1*B1+C2*B2+C3*B3) mod P;
        IMG_bss_red.Canvas.Pixels[y,x]:=C;
      end;

  for y:=0 to IMG_bss_green.Height-1 do
      for x:=0 to IMG_bss_green.Width-1 do
      begin
        C1:=IMG_green_p1.Canvas.Pixels[y,x] div (amp*256);
        C2:=IMG_green_p2.Canvas.Pixels[y,x] div (amp*256);
        C3:=IMG_green_p3.Canvas.Pixels[y,x] div (amp*256);
        C:=(C1*B1+C2*B2+C3*B3) mod P;
        IMG_bss_green.Canvas.Pixels[y,x]:=C*256;
      end;

  for y:=0 to IMG_bss_blue.Height-1 do
      for x:=0 to IMG_bss_blue.Width-1 do
      begin
        C1:=IMG_blue_p1.Canvas.Pixels[y,x] div (amp*256*256);
        C2:=IMG_blue_p2.Canvas.Pixels[y,x] div (amp*256*256);
        C3:=IMG_blue_p3.Canvas.Pixels[y,x] div (amp*256*256);
        C:=(C1*B1+C2*B2+C3*B3) mod P;
        IMG_bss_blue.Canvas.Pixels[y,x]:=C*65536;
      end;

    for y:=0 to IMG_bss.Height-1 do
      for x:=0 to IMG_bss.Width-1 do
      begin
          r:=IMG_bss_red.canvas.Pixels[y,x];
          g:=IMG_bss_green.canvas.Pixels[y,x];
          b:=IMG_bss_blue.canvas.Pixels[y,x];
          IMG_bss.Canvas.Pixels[y,x]:=r+g+b;
      end;
end;

procedure TForm1.BTN_save_RNSClick(Sender: TObject);
begin
  IMG_red_p1.Picture.SaveToFile(EDIT_filename.text+'_red_p1'+'.bmp');
  IMG_red_p2.Picture.SaveToFile(EDIT_filename.text+'_red_p2'+'.bmp');
  IMG_red_p3.Picture.SaveToFile(EDIT_filename.text+'_red_p3'+'.bmp');
  IMG_green_p1.Picture.SaveToFile(EDIT_filename.text+'_green_p1'+'.bmp');
  IMG_green_p2.Picture.SaveToFile(EDIT_filename.text+'_green_p2'+'.bmp');
  IMG_green_p3.Picture.SaveToFile(EDIT_filename.text+'_green_p3'+'.bmp');
  IMG_blue_p1.Picture.SaveToFile(EDIT_filename.text+'_blue_p1'+'.bmp');
  IMG_blue_p2.Picture.SaveToFile(EDIT_filename.text+'_blue_p2'+'.bmp');
  IMG_blue_p3.Picture.SaveToFile(EDIT_filename.text+'_blue_p3'+'.bmp');
end;

end.

