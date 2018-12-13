unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.Menus, VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs,
  VCLTee.Chart;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    StringGrid1: TStringGrid;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    CheckBox1: TCheckBox;
    Label7: TLabel;
    CheckBox2: TCheckBox;
    Label8: TLabel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Chart1: TChart;
    N4: TMenuItem;
    Label11: TLabel;
    Series1: TLineSeries;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    GroupBox3: TGroupBox;
    Label15: TLabel;
    Label14: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    Panel1: TPanel;
    Label9: TLabel;
    N13: TMenuItem;
    Label10: TLabel;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    Label16: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N8Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Chart1Click(Sender: TObject);
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Chart1MouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    function F(x:double):double;
    function Func(x:double):double;
    procedure STEP;
    procedure DeleteRow(Grid: TStringGrid; ARow: Integer);
    { Public declarations }
  end;

var
  Form1: TForm1;
  X,                                                                            // �������� ��������������� �������
  X_tab,                                                                        // �������� X ��� �������������
  Dx,                                                                           // ��� ��������� ���������
  X_low, X_top,                                                                 // ������ � ������� ������� ��������������
  X0, X1,                                                                       // ��������� � �������� ������� �������������
  T,                                                                            // "�������" ���������� �������� �������������
  Eps,                                                                          // ������������� ����������� ���������� ���������
  S_old, S_new,                                                                 // ������ � ����� ��������� ����������
  MaxX, MinX, MaxT, MinT,                                                       // ��������� ������������� � ������������ ��������
  A,                                                                            // ���������� ��� �������� �������� ������ ��������� �������
  B,                                                                            // ���������� ��� �������� �������� ����� ��������� �������
  Gap,                                                                          // ���������� ��� �������� ����� ���������� ���������
  s2, s4            : double;                                                   // ���������� ��� �������������� ������� ��������
  i,                                                                            // ������������� �������
  Tagert            : integer;                                                  // ������� ��� ����������� �������� ��� �������� ��� ���������� ����
  Picture           : string;                                                   // �������� ���������
  Cancel            : boolean;                                                  // ���������� ��� ����������� ��������� ���������

implementation

{$R *.dfm}

function TForm1.F(x: double): double;
begin
  F:=Exp(-0.1*X)*Sin(x);                                                        // �������, ������������ � ��������� ��������, ��������, � ������� ����
  {F:=(Sin(((2*X)*(2*X)*(2*X))+4)+(Cos(((3*X)*(3*X))-
      5*X)*(Cos(((3*X)*(3*X))-5*X))));}
end;

function TForm1.Func(x: double): double;
begin
  Func:=-sqr(X)+(8*X)-12;                                                       // ����������� �������
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Cancel:=False;                                                                // ������ "����������" �� ��������� �� ������
  Picture:='���������.jpg';
  Eps:=StrToFloat(Edit3.Text);                                                  // ������������� ����������� ����������
  X0:=StrToFloat(Edit1.Text);                                                   // ���� ���������� ��������
  X1:=StrToFloat(Edit2.Text);                                                   // ���� ��������� ��������
  STEP;                                                                         // ����� ���������, ����������� ���
end;

procedure TForm1.N8Click(Sender: TObject);                                      // ��������� ��� ��������� ��������� Chacked � ������ � ���� "�������������>��������� ���"
begin
  If N8.Checked then
    N8.Checked:=false
  else
    N8.Checked:=true;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
  Cancel:=True;                                                                 // ������ "����������" ������
end;

procedure TForm1.N7Click(Sender: TObject);
begin
  Application.Terminate;                                                        // ��� �������� ���������� ��������� ��������� �� ����������� ������
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;                                                        // ��� �������� ���������� ��������� ��������� �� ����������� ������
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9','-',',',#8]) then
    Key:=#0;
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9','-',',',#8]) then
    Key:=#0;
end;

procedure TForm1.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9','-',',',#8]) then
    Key:=#0;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  if (Edit1.Text<>'') And (Edit1.Text<>'-') then
    X0:=StrToFloat(Edit1.Text);                                                   // ���� ���������� ��������
end;

procedure TForm1.Edit2Change(Sender: TObject);
begin
  if (Edit2.Text<>'') And (Edit2.Text<>'-') then
    X1:=StrToFloat(Edit2.Text);                                                   // ���� ��������� ��������
end;

procedure TForm1.Edit3Change(Sender: TObject);
begin
  if (Edit3.Text<>'') And (Edit3.Text<>'-') then
    Eps:=StrToFloat(Edit3.Text);                                                  // ������������� ����������� ����������
end;

procedure TForm1.Chart1Click(Sender: TObject);
begin
  Chart1.Title.Text.Clear;
  Chart1.Title.Text.Add('������ �������:   -sqr(T)+(8*T)-12');
  Chart1.SaveToBitmapFile(Picture);                                             //�� ����� �� ��������� ����������� ����������� � ���� �� ������, ������� ��������� � ���������� Picture
  Chart1.CopyToClipboardBitmap;                                                 //����������� ��������� ���������� � ����� ������
end;

procedure TForm1.Chart1MouseLeave(Sender: TObject);
begin
  Chart1.Title.Text.Clear;
  Chart1.Title.Text.Add('������ �������:   -sqr(T)+(8*T)-12');
end;

procedure TForm1.Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Chart1.Title.Text.Clear;
  Chart1.Title.Text.Add('����� ��������� ����������� �������� �� ���� ����');
end;

procedure TForm1.STEP;
var
  DxSTEP         : double;                                                      // ���������� ���, �����������, ����� �������� �� �������� �������� D � ����������� ������
begin
  DxSTEP:=0;
  Randomize;                                                                    // ����������� ���������� Randomize
  if (CheckBox2.Checked=True) and (Tagert=1) then                               // � ������, ���� ����� ���� ������ �������� ��������,                                                             // ������������ ����������� �������� ��� ��������,
    DxSTEP:=(X_top-X_low)/(Random(500))                                         // ������������ �������� ����������� ������ �������,
  else                                                                          // �����
    DxSTEP:=0.25*abs(F(StrToFloat(Edit2.Text))/3);                              // ����������� ������ �������.
  Dx:=DxSTEP;
  Label8.Caption:='�������� ���� (Dx) = '+FloatToStr(Dx);                       // ����� �������� ����
end;

procedure TForm1.DeleteRow(Grid: TStringGrid; ARow: Integer);                   // ��������� �������� ��������� ������ ��������� �������
var
  i, j: Integer;
begin
with Grid do
  begin
    for i:=ARow+1 to RowCount-1 do
      for j:=0 to ColCount-1 do
        Cells[j, i-1]:=Cells[j, i];
    for i:=0 to ColCount-1 do
      Cells[i, RowCount-1]:='';
    RowCount:=RowCount-1;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if StrToFloat(Edit1.Text)>=StrToFloat(Edit2.Text) then                        // ����������� ������������ ����� ��������� � �������� ������� ��������������
    ShowMessage('��������� �������� ������, ���� ����� ���������!')             // � ������, ���� ��������� �������� ������ ���������, ��������� ��������� ������������
  else
    begin

      Tagert:=1;
      S_new:=1;                                                                 // ����� ��������� ����������
      S_old:=1e10;                                                              // ������ ��������� ����������
      X_low:=StrToFloat(Edit1.Text);                                            // ������ ������ ��������������
      X_top:=StrToFloat(Edit2.Text);                                            // ������� ������ ��������������
      STEP;                                                                     // ����� ���������, ����������� ���
      i:=1;                                                                     // ��������� ����� ������ ������� StringGrid
      StringGrid1.ColCount:=2;
      StringGrid1.Cells[0,0]:='N ��������';                                     // ���������� ����� ������� StringGrid
      StringGrid1.Cells[1,0]:='����� ���������';
      StringGrid1.Cells[2,0]:='������ ���������';
      Label7.Visible:=true;

      //-------------���������� �������� ���������------------------------------
      while abs(S_old-S_new)>(Eps*abs(S_old)) do
        begin
          s2:=0;
          s4:=0;
          if CheckBox1.Checked=true then
            Application.ProcessMessages;
          S_old:=S_new;
          X:=X_low;
          S_new:=0;
          while X<=X_top do
            begin
              Label7.Font.Color:=ClMaroon;
              Label7.Caption:='���������� ������������';                        // ����� ��������� ����������
              Case RadioGroup1.ItemIndex of
                0: S_new:=S_new+Dx*F(X);                                        // ����� ���������������
                1: S_new:=S_new+Dx*(F(X)+F(X+Dx))/2;                            // ����� ��������
                2: begin                                                        // ������� ��������
                     s4:=s4+4*F(X+Dx);
                     s2:=s2+2*F(X+2*Dx);
                     S_new:=Dx/3*(F(X_low)+s4+s2+F(X_top));
                     X:=X+Dx;
                   end;
              end;
              X:=X+Dx;                                                          // ���������� X �� ���
              Label6.Caption:='�������� X = '+FloatToStr(X);                    // ����� ���������� X � Label
            end;

          StringGrid1.Cells[0,i]:=IntToStr(i);                                  // ���������� ������� StringGrid
          StringGrid1.Cells[1,i]:=FloatToStrF(S_new,ffFixed,15,8);
          StringGrid1.Cells[2,i]:=FloatToStrF(S_old,ffFixed,15,8);

          inc(i);                                                               // ������������� i (���������� i �� 1)
          StringGrid1.RowCount:=i;                                              // ������������ ���������� ����� ������� �������� �������� �������� ��������
          Dx:=Dx/1.5;                                                           // ���������� ����

          Label4.Caption:='�������� I = '+FloatToStr(S_new);                    // ����� ����� ������� �������� ���������
          Label5.Caption:='����� �������� N = '+IntToStr(i-1);                  // ����� ���������� ��������
        end;
        //----------------------------------------------------------------------

      Label7.Font.Color:=ClGreen;
      Label7.Caption:='���������� ���������';                                   // ����� ��������� ����������
    end;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  if StrToFloat(Edit1.Text)>=StrToFloat(Edit2.Text) then                        // ����������� ������������ ����� ���������� � ��������� ��������
    ShowMessage('��������� �������� ������, ���� ����� ���������!')             // � ������, ���� ��������� �������� ������ ���������, ��������� ��������� ������������
  else
    begin

      Tagert:=2;
      Cancel:=False;                                                            // ������ "����������" �� ������
      Label7.Visible:=true;
      N12.Enabled:=true;
      N13.Enabled:=true;
      Chart1.Series[0].Clear;                                                   // ������� �������
      StringGrid1.ColCount:=3;
      StringGrid1.RowCount:=trunc((X1-X0)/Dx)+2;                                // ����������� ���������� ����� � ������� (trunc ������ ������������ ����� �����)
      StringGrid1.Cells[0,0]:='N ��������';                                     // ���������� ����� ������� StringGrid
      StringGrid1.Cells[1,0]:='���������� X';
      StringGrid1.Cells[2,0]:='���������� Y';
      T:=X0;                                                                    // ��������� �������� X. ������� ��� ����� �������� �� ������ ����

      for i:=1 to StringGrid1.RowCount-1 do                                     // ���������� ���� ����� ������ � ����� ������������
        begin
          StringGrid1.Cells[0,i]:=FloatToStr(0);
          StringGrid1.Cells[1,i]:=FloatToStr(0);
          StringGrid1.Cells[2,i]:=FloatToStr(0);
        end;

      i:=1;                                                                     // ��������� �������� ��������

      if T<>0 then
        begin
          MaxX:=Func(T);
          MinX:=Func(T);
        end;

      //------------������������� �������---------------------------------------
      while T<=X1 do                                                            // ����, ������������� �� �������, ����� T (X0) ����� ������ ��������� �������� X
        begin
          if Cancel=False then                                                  // �������� ����������������� ���� �������
            if Dx>0 then
              if T<>0 then                                                      // �������� ����, ��� ������ "����������" �� ������
                begin
                  if CheckBox1.Checked=true then
                    Application.ProcessMessages;                                // ��������� ����������� ����������� ��������

                  X:=Func(T);                                                   // ��������� ������� ��� �������� T

                  StringGrid1.Cells[0,i]:=FloatToStr(i);                        // ��������� �������� �������� T � ������� ������ i
                  StringGrid1.Cells[1,i]:=FloatToStrF(T,ffFixed,15,8);          // ��������� �������� �������� T � ������� ������ i
                  StringGrid1.Cells[2,i]:=FloatToStrF(X,ffFixed,15,8);          // ��������� �������� �������� X � ������� ������ i

                  if X>=MaxX then
                    begin
                      MaxX:=X; MaxT:=T;                                         // ����������� ������������ ��������� ����� �������� ��� �������������
                    end;
                  if X<=MinX then
                    begin
                      MinX:=X; MinT:=T;                                         // ����������� ����������� ��������� ����� �������� ��� �������������
                    end;

                  Chart1.Series[0].AddXY(T,X);                                  // ���������� ������� ����� T,X �� ������ (��� T-X, � X-Y � ��������� �����������)

                  Label7.Font.Color:=ClMaroon;
                  Label7.Caption:='���������� ������������';                    // ����� ��������� ����������

                  if N8.Checked then
                    Dx:=Dx-0.00001;                                             // ���������� ���� � ������ ����� ��������

                  T:=T+Dx;                                                      // ���������� � �������� T ���
                  Inc(i);                                                       // ������������� i (���������� i �� 1)

                  Label11.Caption:='���������� �������� ��� Dx>0 = '+           // ����� ���������� �������� �� ������ ��������
                                    IntToStr(Chart1.Series[0].Count);
                  Label8.Caption:='�������� ���� (Dx) = '+floattostr(Dx);       // ����� �������� ���� �� ������ ��������
                end
              else
                begin
                  Label7.Font.Color:=ClMaroon;
                  Label7.Caption:='��������� ������� �� ������ ���� ����� 0!';
                  Break;
                end
            else                                                                // � ������, ���� ���� ������ ������ "����������", ����������� ��������� ��������� (����� �� �����) � ����������� ������������
              begin
                Label7.Font.Color:=ClMaroon;
                Label7.Caption:='��� ������ ������������� ��������!';
                Break;
              end
          else                                                                  // � ������, ���� ��� ��������� ������������� ��������, ����������� ��������� ��������� � ����������� ������������
            begin
              Label7.Font.Color:=ClMaroon;
              Label7.Caption:='���������� �����������!';
              Break;
            end;
          Label7.Font.Color:=ClGreen;
          Label7.Caption:='���������� ���������';                               // ����� ��������� ����������
        end;
        //----------------------------------------------------------------------
      Label12.Caption:='������������ �������� X (MaxT) = '+FloatToStr(MaxT);    // ����� �������� Max & Min
      Label13.Caption:='������������ �������� Y (MaxX) = '+FloatToStr(MaxX);
      Label14.Caption:='����������� �������� X (MinT) = '+FloatToStr(MinT);
      Label15.Caption:='����������� �������� Y (MinX) = '+FloatToStr(MinX);
    end;
end;

procedure TForm1.N12Click(Sender: TObject);
var
  MaxXz      : double;
begin
  Try

    Gap:=trunc((X1-X0)/Dx);                                                     // ����� ���������� ���������

    //------------����� ����������� ������� ������� ������� ���������-----------
    while Abs(MaxX-MaxXz)>(Eps*MaxXz) do
      begin
        N3Click(Sender);
        MaxXz:=MaxX;                                                            // �������� ����� �������� � MaxXz
        X0:=MaxX-Dx;                                                            // ����� �������� ������ �������
        X1:=MaxX+Dx;                                                            // ����� �������� ������� �������
        Dx:=(X1-X0)/Gap;                                                        // ����� �������� ����
        N3Click(Sender);
      end;
    //--------------------------------------------------------------------------

    X0:=StrToFloat(Edit1.Text);                                                 // ���� ���������� ��������
    X1:=StrToFloat(Edit2.Text);                                                 // ���� ��������� ��������
    STEP;                                                                       // ����� ���������, ����������� ��� ��� ����, ����� ������� ���������� ��������� ��������
    N12.Enabled:=false;
    N13.Enabled:=false;
  Except
    STEP;
    N12Click(Sender);
  End;
end;

procedure TForm1.N13Click(Sender: TObject);
var
  G1, G2,
  G3, G4,                                                                       // G ������ Gold. ������������ ��� �������� ���������� �������� �������
  F2, F3         : Double;                                                      // ��������� ���������� ��� ���������� �������� �������
begin
  G1:=X0;
  G4:=X1;

  G2:=G1+0.382*(G4-G1);                                                         // ����������� ��������� �������� �������
  T:=G2;
  F2:=Func(T);

  G3:=G1+0.618*(G4-G1);
  T:=G3;
  F3:=Func(T);

  //--------------����� ����������� ������� ������� �������� �������------------
  while Abs(F2-F3)>(Abs(F2)*Eps) do
    begin
      if F2>F3 then                                                             // ��������� ������ ��������� G1 � G4,
        begin                                                                   // � ����� ���������� ����� �������� ��������� �������� �������
          G1:=G2;
          F2:=F3;
          G2:=G3;
          G3:=G1+0.618*(G4-G1);
          T:=G3;
          F3:=Func(T);
        end
      else
        begin
          G4:=G3;
          F3:=F2;
          G3:=G2;
          G2:=G1+0.382*(G4-G1);
          T:=G2;
          F2:=Func(T);
        end;
    end;
  //----------------------------------------------------------------------------

  N3Click(Sender);                                                              // ������ �������������
  Label10.Visible:=true;
  Label10.Caption:='��������� �������, ���������� ������� '+
                   '�������� ������� =    '+FloatToStr(F2);                     // ����� ��������
  N12.Enabled:=false;
  N13.Enabled:=false;
end;

procedure TForm1.N16Click(Sender: TObject);
begin
  if StrToFloat(Edit1.Text)>=StrToFloat(Edit2.Text) then                        // ����������� ������������ ����� ���������� � ��������� ��������
    ShowMessage('��������� �������� ������, ���� ����� ���������!')             // � ������, ���� ��������� �������� ������ ���������, ��������� ��������� ������������
  else
    begin
      STEP;                                                                     // ���������� Dx �� ������, ���� ��� ���������� ���� ��������
      N3Click(Sender);
      A:=X0;                                                                    // ���������� �������� �������� ��������� �������
      X:=A+Dx;
      StringGrid1.ColCount:=2;

      for i:=1 to StringGrid1.RowCount-1 do                                     // ���������� ���� ����� ������ � ����� ������������
        begin
          StringGrid1.Cells[0,i]:=FloatToStr(0);
          StringGrid1.Cells[1,i]:=FloatToStr(0);
        end;

      i:=1;
      StringGrid1.Cells[0,0]:='����� �����';
      StringGrid1.Cells[1,0]:='�������� �����';

      //---------����� ������ ������� ������� ����������� ������� (���������)---
      while X<X1 do
        begin
          if (Func(A)*Func(X))<=0 then                                          // ���� ������������ ������� ��������� � "�������" ������� ����� ���� "-",
              begin                                                             // �.�. ���� ����, ������, ������ �����, �� ���� ���������� ��� ���������� ��� ������
                B:=X;
                  repeat                                                        // ���������� ��������� ������� �� ��� �������� � ������� �������� ������ ��������
                    X:=(A+B)/2;
                    if (Func(A)*Func(X))<=0 then
                      B:=X
                    else
                      A:=X;
                  until Abs(A-B)<=Abs(Eps*B);
                StringGrid1.Cells[0,i]:=IntToStr(i);
                StringGrid1.Cells[1,i]:=FloatToStrF(A,ffFixed,15,8);
                Inc(i);
                StringGrid1.RowCount:=i;
              end;
        A:=X;
        X:=X+Dx;
        end;
      //------------------------------------------------------------------------

      if i=1 then                                                               // ���� i ��� � �� ����������, ������ ������� �� ���������� ��� ������
        begin
          Label16.Visible:=true;
          Label16.Caption:='������� �� ����� ������';
        end
      else
        Label16.Visible:=false;
    end;
      for i:=1 to StringGrid1.RowCount do
        begin
          if StringGrid1.Cells[1,i]=StringGrid1.Cells[1,i+1] then
            begin
              StringGrid1.Cells[0,i]:='';
              StringGrid1.Cells[1,i]:='';
              {DeleteRow(StringGrid1, i);}
            end;
        end;
end;

end.
