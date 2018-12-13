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
  X,                                                                            // Аргумент подинтегральной функции
  X_tab,                                                                        // Значение X для табулирования
  Dx,                                                                           // Шаг изменения аргумента
  X_low, X_top,                                                                 // Нижний и верхний пределы интегрирования
  X0, X1,                                                                       // Начальная и конечная граница табулирования
  T,                                                                            // "Текущее" полученное значение табулирования
  Eps,                                                                          // Относительная погрешность вычисления интеграла
  S_old, S_new,                                                                 // Старый и новый результат исчисления
  MaxX, MinX, MaxT, MinT,                                                       // Хранители максимального и минимального значений
  A,                                                                            // Переменная для хранения значения начала интервала функции
  B,                                                                            // Переменная для хранения значения конца интервала функции
  Gap,                                                                          // Переменная для хранения числа интервалов разбиения
  s2, s4            : double;                                                   // Переменные для интегрирования методом Симпсона
  i,                                                                            // Универсальный счётчик
  Tagert            : integer;                                                  // Счётчик для определения действия над функцией для вычисления шага
  Picture           : string;                                                   // Название диаграммы
  Cancel            : boolean;                                                  // Переменная для определения остановки программы

implementation

{$R *.dfm}

function TForm1.F(x: double): double;
begin
  F:=Exp(-0.1*X)*Sin(x);                                                        // Функция, используемая в расчётных формулах, например, в формуле шага
  {F:=(Sin(((2*X)*(2*X)*(2*X))+4)+(Cos(((3*X)*(3*X))-
      5*X)*(Cos(((3*X)*(3*X))-5*X))));}
end;

function TForm1.Func(x: double): double;
begin
  Func:=-sqr(X)+(8*X)-12;                                                       // Исследуемая функция
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Cancel:=False;                                                                // Кнопка "Остановить" по умолчанию не нажата
  Picture:='Диаграмма.jpg';
  Eps:=StrToFloat(Edit3.Text);                                                  // Относительная погрешность вычисления
  X0:=StrToFloat(Edit1.Text);                                                   // Ввод начального значения
  X1:=StrToFloat(Edit2.Text);                                                   // Ввод конечного значения
  STEP;                                                                         // Вызов процедуры, вычисляющей шаг
end;

procedure TForm1.N8Click(Sender: TObject);                                      // Процедура для изменения параметра Chacked у конпки в меню "Табулирование>Уменьшать шаг"
begin
  If N8.Checked then
    N8.Checked:=false
  else
    N8.Checked:=true;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
  Cancel:=True;                                                                 // Кнопка "Остановить" нажата
end;

procedure TForm1.N7Click(Sender: TObject);
begin
  Application.Terminate;                                                        // При закрытии приложения программа стерается из оперативной памяти
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;                                                        // При закрытии приложения программа стерается из оперативной памяти
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
    X0:=StrToFloat(Edit1.Text);                                                   // Ввод начального значения
end;

procedure TForm1.Edit2Change(Sender: TObject);
begin
  if (Edit2.Text<>'') And (Edit2.Text<>'-') then
    X1:=StrToFloat(Edit2.Text);                                                   // Ввод конечного значения
end;

procedure TForm1.Edit3Change(Sender: TObject);
begin
  if (Edit3.Text<>'') And (Edit3.Text<>'-') then
    Eps:=StrToFloat(Edit3.Text);                                                  // Относительная погрешность вычисления
end;

procedure TForm1.Chart1Click(Sender: TObject);
begin
  Chart1.Title.Text.Clear;
  Chart1.Title.Text.Add('График функции:   -sqr(T)+(8*T)-12');
  Chart1.SaveToBitmapFile(Picture);                                             //По клику на диаграмму изображение сохраняется в файл по адресу, который находится в переменной Picture
  Chart1.CopyToClipboardBitmap;                                                 //Изображение диаграммы помещается в буфер обмена
end;

procedure TForm1.Chart1MouseLeave(Sender: TObject);
begin
  Chart1.Title.Text.Clear;
  Chart1.Title.Text.Add('График функции:   -sqr(T)+(8*T)-12');
end;

procedure TForm1.Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Chart1.Title.Text.Clear;
  Chart1.Title.Text.Add('Чтобы сохранить изображение сделайте по нему клик');
end;

procedure TForm1.STEP;
var
  DxSTEP         : double;                                                      // Внутренний шаг, необходимый, чтобы случайно не испорить значение D в оперативной памяти
begin
  DxSTEP:=0;
  Randomize;                                                                    // Подключение библиотеки Randomize
  if (CheckBox2.Checked=True) and (Tagert=1) then                               // В случае, если поиск шага решено задавать случайно,                                                             // определяется выполняемое действие над функцией,
    DxSTEP:=(X_top-X_low)/(Random(500))                                         // соответствуя которому выполняется данная функция,
  else                                                                          // иначе
    DxSTEP:=0.25*abs(F(StrToFloat(Edit2.Text))/3);                              // выполняется данная функция.
  Dx:=DxSTEP;
  Label8.Caption:='Значение шага (Dx) = '+FloatToStr(Dx);                       // Вывод значения шага
end;

procedure TForm1.DeleteRow(Grid: TStringGrid; ARow: Integer);                   // Процедура удаления указанной ячейки указанной таблицы
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
  if StrToFloat(Edit1.Text)>=StrToFloat(Edit2.Text) then                        // Проверяется правильность ввода начальной и конечной границы интегрирования
    ShowMessage('Начальное значение больше, либо равно конечному!')             // В случае, если начальное значение больше конечного, программа оповещает пользователя
  else
    begin

      Tagert:=1;
      S_new:=1;                                                                 // Новый результат исчисления
      S_old:=1e10;                                                              // Старый результат исчисления
      X_low:=StrToFloat(Edit1.Text);                                            // Нижний предел интегрирования
      X_top:=StrToFloat(Edit2.Text);                                            // Верхний предел интегрирования
      STEP;                                                                     // Вызов процедуры, вычисляющей шаг
      i:=1;                                                                     // Начальный номер строки таблицы StringGrid
      StringGrid1.ColCount:=2;
      StringGrid1.Cells[0,0]:='N итерации';                                     // Заполнение шапки таблицы StringGrid
      StringGrid1.Cells[1,0]:='Новый результат';
      StringGrid1.Cells[2,0]:='Старый результат';
      Label7.Visible:=true;

      //-------------Вычисление значения интеграла------------------------------
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
              Label7.Caption:='Вычисление продолжается';                        // Вывод состояния исчисления
              Case RadioGroup1.ItemIndex of
                0: S_new:=S_new+Dx*F(X);                                        // Метод прямоугольников
                1: S_new:=S_new+Dx*(F(X)+F(X+Dx))/2;                            // Метод трапеций
                2: begin                                                        // Формула Симпсона
                     s4:=s4+4*F(X+Dx);
                     s2:=s2+2*F(X+2*Dx);
                     S_new:=Dx/3*(F(X_low)+s4+s2+F(X_top));
                     X:=X+Dx;
                   end;
              end;
              X:=X+Dx;                                                          // Увеличение X на шаг
              Label6.Caption:='Аргумент X = '+FloatToStr(X);                    // Вывод последнего X в Label
            end;

          StringGrid1.Cells[0,i]:=IntToStr(i);                                  // Заполнение таблицы StringGrid
          StringGrid1.Cells[1,i]:=FloatToStrF(S_new,ffFixed,15,8);
          StringGrid1.Cells[2,i]:=FloatToStrF(S_old,ffFixed,15,8);

          inc(i);                                                               // Инкрементация i (увеличение i на 1)
          StringGrid1.RowCount:=i;                                              // Установление количества строк таблицы согласно величине счётчика итераций
          Dx:=Dx/1.5;                                                           // Уменьшение шага

          Label4.Caption:='Значение I = '+FloatToStr(S_new);                    // Вывод более точного значения интеграла
          Label5.Caption:='Число итераций N = '+IntToStr(i-1);                  // Вывод количества итераций
        end;
        //----------------------------------------------------------------------

      Label7.Font.Color:=ClGreen;
      Label7.Caption:='Вычисление завершено';                                   // Вывод состояния исчисления
    end;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  if StrToFloat(Edit1.Text)>=StrToFloat(Edit2.Text) then                        // Проверяется правильность ввода начального и конечного значений
    ShowMessage('Начальное значение больше, либо равно конечному!')             // В случае, если начальное значение больше конечного, программа оповещает пользователя
  else
    begin

      Tagert:=2;
      Cancel:=False;                                                            // Кнопка "Остановить" не нажата
      Label7.Visible:=true;
      N12.Enabled:=true;
      N13.Enabled:=true;
      Chart1.Series[0].Clear;                                                   // Очистка графика
      StringGrid1.ColCount:=3;
      StringGrid1.RowCount:=trunc((X1-X0)/Dx)+2;                                // Определение количества строк в таблице (trunc делает вещественное число целым)
      StringGrid1.Cells[0,0]:='N итерации';                                     // Заполнение шапки таблицы StringGrid
      StringGrid1.Cells[1,0]:='Координата X';
      StringGrid1.Cells[2,0]:='Координата Y';
      T:=X0;                                                                    // Начальное значение X. Позднее оно будет меняться на размер шага

      for i:=1 to StringGrid1.RowCount-1 do                                     // Заполнение всех ячеек нулями в целях безопасности
        begin
          StringGrid1.Cells[0,i]:=FloatToStr(0);
          StringGrid1.Cells[1,i]:=FloatToStr(0);
          StringGrid1.Cells[2,i]:=FloatToStr(0);
        end;

      i:=1;                                                                     // Начальное значение счётчика

      if T<>0 then
        begin
          MaxX:=Func(T);
          MinX:=Func(T);
        end;

      //------------Табулирование функции---------------------------------------
      while T<=X1 do                                                            // Цикл, выполняющийся до момента, когда T (X0) будет больше конечного значения X
        begin
          if Cancel=False then                                                  // Проверка неотрицательности шага функции
            if Dx>0 then
              if T<>0 then                                                      // Проверка того, что кнопка "Остановить" не нажата
                begin
                  if CheckBox1.Checked=true then
                    Application.ProcessMessages;                                // Включение отображение выполненных действий

                  X:=Func(T);                                                   // Выполнить функцию для текущего T

                  StringGrid1.Cells[0,i]:=FloatToStr(i);                        // Занесение текущего значения T в текущую строку i
                  StringGrid1.Cells[1,i]:=FloatToStrF(T,ffFixed,15,8);          // Занесение текущего значения T в текущую строку i
                  StringGrid1.Cells[2,i]:=FloatToStrF(X,ffFixed,15,8);          // Занесение текущего значения X в текущую строку i

                  if X>=MaxX then
                    begin
                      MaxX:=X; MaxT:=T;                                         // Определение максимальных элементов СРЕДИ найденых при табулировании
                    end;
                  if X<=MinX then
                    begin
                      MinX:=X; MinT:=T;                                         // Определение минимальных элементов СРЕДИ найденых при табулировании
                    end;

                  Chart1.Series[0].AddXY(T,X);                                  // Добавления текущих точек T,X на график (где T-X, а X-Y в привычном обозначении)

                  Label7.Font.Color:=ClMaroon;
                  Label7.Caption:='Вычисление продолжается';                    // Вывод состояния исчисления

                  if N8.Checked then
                    Dx:=Dx-0.00001;                                             // Уменьшение шага в каждой новой итерации

                  T:=T+Dx;                                                      // Добавление к текущему T шаг
                  Inc(i);                                                       // Инкрементация i (увеличение i на 1)

                  Label11.Caption:='Количество значений при Dx>0 = '+           // Вывод количества значений по каждой итерации
                                    IntToStr(Chart1.Series[0].Count);
                  Label8.Caption:='Значение шага (Dx) = '+floattostr(Dx);       // Вывод значения шага по каждой итерации
                end
              else
                begin
                  Label7.Font.Color:=ClMaroon;
                  Label7.Caption:='Начальная граница не должна быть равна 0!';
                  Break;
                end
            else                                                                // В случае, если была нажата кнопка "Остановить", выполняется остановка программы (выход из цикла) и уведомление пользователя
              begin
                Label7.Font.Color:=ClMaroon;
                Label7.Caption:='Шаг принял отрицательное значение!';
                Break;
              end
          else                                                                  // В случае, если шаг принимает отрицательное значение, выполняется остановка программы и уведомление пользователя
            begin
              Label7.Font.Color:=ClMaroon;
              Label7.Caption:='Выполнение остановлено!';
              Break;
            end;
          Label7.Font.Color:=ClGreen;
          Label7.Caption:='Вычисление завершено';                               // Вывод состояния исчисления
        end;
        //----------------------------------------------------------------------
      Label12.Caption:='Максимальное значение X (MaxT) = '+FloatToStr(MaxT);    // Вывод значений Max & Min
      Label13.Caption:='Максимальное значение Y (MaxX) = '+FloatToStr(MaxX);
      Label14.Caption:='Минимальное значение X (MinT) = '+FloatToStr(MinT);
      Label15.Caption:='Минимальное значение Y (MinX) = '+FloatToStr(MinX);
    end;
end;

procedure TForm1.N12Click(Sender: TObject);
var
  MaxXz      : double;
begin
  Try

    Gap:=trunc((X1-X0)/Dx);                                                     // Число интервалов разбиения

    //------------Поиск экстремумов функции методом сужения интервала-----------
    while Abs(MaxX-MaxXz)>(Eps*MaxXz) do
      begin
        N3Click(Sender);
        MaxXz:=MaxX;                                                            // Помещаем новые значения в MaxXz
        X0:=MaxX-Dx;                                                            // Новое значение нижней границы
        X1:=MaxX+Dx;                                                            // Новое значение верхней границы
        Dx:=(X1-X0)/Gap;                                                        // Новое значение шага
        N3Click(Sender);
      end;
    //--------------------------------------------------------------------------

    X0:=StrToFloat(Edit1.Text);                                                 // Ввод начального значения
    X1:=StrToFloat(Edit2.Text);                                                 // Ввод конечного значения
    STEP;                                                                       // Вызов процедуры, вычисляющей шаг для того, чтобы вернуть переменной начальное значение
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
  G3, G4,                                                                       // G значит Gold. Используются для хранения параметров золотого сечения
  F2, F3         : Double;                                                      // Локальные переменные для сохранения значений функций
begin
  G1:=X0;
  G4:=X1;

  G2:=G1+0.382*(G4-G1);                                                         // Определение координат золотого сечения
  T:=G2;
  F2:=Func(T);

  G3:=G1+0.618*(G4-G1);
  T:=G3;
  F3:=Func(T);

  //--------------Поиск экстремумов функции методом золотого сечения------------
  while Abs(F2-F3)>(Abs(F2)*Eps) do
    begin
      if F2>F3 then                                                             // Сближение границ интервала G1 и G4,
        begin                                                                   // а также вычисление новых значений координат золотого сечения
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

  N3Click(Sender);                                                              // Запуск табулирования
  Label10.Visible:=true;
  Label10.Caption:='Экстремум функции, полученный методом '+
                   'золотого сечения =    '+FloatToStr(F2);                     // Вывод значения
  N12.Enabled:=false;
  N13.Enabled:=false;
end;

procedure TForm1.N16Click(Sender: TObject);
begin
  if StrToFloat(Edit1.Text)>=StrToFloat(Edit2.Text) then                        // Проверяется правильность ввода начального и конечного значений
    ShowMessage('Начальное значение больше, либо равно конечному!')             // В случае, если начальное значение больше конечного, программа оповещает пользователя
  else
    begin
      STEP;                                                                     // Вычисление Dx на случай, если эта переменная была изменена
      N3Click(Sender);
      A:=X0;                                                                    // Переменная получает значения начальной границы
      X:=A+Dx;
      StringGrid1.ColCount:=2;

      for i:=1 to StringGrid1.RowCount-1 do                                     // Заполнение всех ячеек нулями в целях безопасности
        begin
          StringGrid1.Cells[0,i]:=FloatToStr(0);
          StringGrid1.Cells[1,i]:=FloatToStr(0);
        end;

      i:=1;
      StringGrid1.Cells[0,0]:='Номер корня';
      StringGrid1.Cells[1,0]:='Значение корня';

      //---------Поиск корней функции методом половинного деления (дихотомии)---
      while X<X1 do
        begin
          if (Func(A)*Func(X))<=0 then                                          // Если произведение функций начальной и "текущей" границы имеет знак "-",
              begin                                                             // т.е. ниже нуля, значит, скорее всего, на этом промежутке она пересекает ось абцисс
                B:=X;
                  repeat                                                        // Повторение разбиения графика на две половины с поиском наиболее точных значений
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

      if i=1 then                                                               // Если i так и не изменилась, значит функция не пересекает ось абцисс
        begin
          Label16.Visible:=true;
          Label16.Caption:='Функция не имеет корней';
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
