program fizzbuzz(output);
Uses sysutils;
var
i:integer;
counter:integer;
begin
if ParamCount = 0 then counter:=100
else counter:=StrToInt(ParamStr(1));
for i:=1 to counter do
if i mod 15 = 0 then
writeln('FizzBuzz')
else if i mod 3 = 0 then
writeln('Fizz')
else if i mod 5 = 0 then
writeln('Buzz')
else
writeln(i)
end.