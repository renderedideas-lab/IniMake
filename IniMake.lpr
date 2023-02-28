program IniMake;

uses IniMakeParser, SysUtils, crt;

begin
  try
    if ParamCount = 2 then
    begin
      if SysUtils.FileExists(paramstr(1)) then
      begin
        StartParse(paramstr(1),paramstr(2));
      end else
      if SysUtils.FileExists(paramstr(2)) then
      begin
        StartParse(paramstr(2),paramstr(1));
      end else
      begin
        raise Exception.Create('Error: No readable file specified.');
      end;
    end else
    begin
      raise Exception.Create('Error: Wrong number of parameters.');
    end;
    writeln;
    crt.TextBackground(crt.Green);
    write('Successfully finished...');
    crt.TextBackground(crt.Black);
    write(' ');
    writeln;
  except
    on E: Exception do
    begin
      writeln;
      crt.TextBackground(crt.Red);
      writeln(E.Message);
      write('Aborting...');
      crt.TextBackground(crt.Black);
      write(' ');
      writeln;
    end;
  end;
end.

