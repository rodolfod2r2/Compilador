program Questao1;
var x,qtd,qtdpar,maior,menor:integer;
    soma,media:real;
begin
  qtd:=0;
  qtdpar:=0;
  soma:=0;
  maior:=0;
  repeat
    qtd:=qtd+1;
    if (x>=0) then
    begin
      if (x>maior) then
      begin
        maior:=x;
      end
      else
      begin
        menor:=x;
      end;
    end
    else
    begin
      if (x<maior) then
      begin
        maior:=x;
      end
      else
      begin
        menor:=x;
      end;
    end;
    if (x mod 2=0) then
    begin
      qtdpar:=qtdpar+1;
      soma:=soma+x;
    end;
  until (x<maior);
  media:=soma/qtdpar;
end.