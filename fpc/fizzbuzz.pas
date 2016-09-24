program Hello;

{$mode objfpc}

Uses sysutils;

const
    CMAX = 100;
var
    max, i : LongInt;
begin
    max := CMAX;

    if (ParamCount > 0) then
	try
            max := StrToInt(ParamStr(1));
	except
	    On E : EConvertError do max := CMAX;
	end;

    for i := 1 to max do
    begin
	if (i mod 3 = 0) then
	    Write('Fizz');
    	if (i mod 5 = 0) then
	    Write('Buzz');
        if ((i mod 3 <> 0) and (i mod 5 <> 0)) then
	    Write(i);

        WriteLn('');
    end;
end.
