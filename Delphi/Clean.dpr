﻿program Clean;

{$APPTYPE CONSOLE}

{$R *.res}


uses
  System.SysUtils,
  Clean.Main in 'Source\Clean.Main.pas',
  Clean.Utils in 'Source\Clean.Utils.pas';

var
  Cln: TClean;
  yes: UString;

begin
  Cln := TClean.Create;
  try
    try
      Cln.Print;
      Writeln('Confirm delete? Y/N (Y = yes & N = no)');

      repeat
        Readln(yes);
      until (yes = 'Y') or (yes = 'y') or (yes = 'N') or (yes = 'n');

      if (yes = 'Y') or (yes = 'y') then
      begin
        Cln.ExecuteClean;
      end;

      DrawLineProgramEnd;
      Writeln(END_OF_PROGRAM_EN);
      Readln;
    except
      on E: Exception do
        Writeln(E.ClassName, ': ', E.Message);
    end;
  finally
    FreeAndNil(Cln);
  end;

end.
