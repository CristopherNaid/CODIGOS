program EjerciciosCompletos;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;    // Solo para Length() y funciones básicas de cadena

//MODELOS DE EXAMEN - FUNCIONES Y PROCEDIMIENTOS
// ===================================================================
// ==================== PARTE 0: MODELOS DE EXAMEN ===================
// ==================== (30+ ejercicios) =============================
// ===================================================================
//MODELOS DE EXAMEN - FUNCIONES Y PROCEDIMIENTOS

//1. Suma de primeros N terminos de S=1*3+3*5+5*7+...
function sumaSerie(n: integer): integer;
var
  s, i, a, b: integer;
begin
  s := 0;
  a := 1;
  b := 3;
  i := 1;
  while i <= n do
  begin
    s := s + a * b;
    a := a + 2;
    b := b + 2;
    i := i + 1;
  end;
  sumaSerie := s;
end;

//2. Verificar si un numero pertenece a Fibonacci
function esFib(x: integer): boolean;
var
  a, b, c: integer;
begin
  if x = 1 then
    esFib := true
  else
  begin
    a := 1;
    b := 1;
    c := 2;
    while c < x do
    begin
      a := b;
      b := c;
      c := a + b;
    end;
    esFib := (c = x);
  end;
end;

//3. Cantidad de palabras que terminan en vocal
function palabrasTerminanVocal(cad: string): integer;
var
  i, c: integer;
begin
  c := 0;
  i := 1;
  while i <= length(cad) do
  begin
    if (i = length(cad)) or (cad[i+1] = ' ') then
    begin
      if (cad[i] = 'a') or (cad[i] = 'e') or (cad[i] = 'i') or (cad[i] = 'o') or (cad[i] = 'u') or
         (cad[i] = 'A') or (cad[i] = 'E') or (cad[i] = 'I') or (cad[i] = 'O') or (cad[i] = 'U') then
        c := c + 1;
    end;
    i := i + 1;
  end;
  palabrasTerminanVocal := c;
end;

//4. N-esimo termino de 1,2,5,3,6,9,7,14,17,15,30,...
function nter(n: integer): integer;
var
  x, y, t, i: integer;
begin
  if n = 1 then
    nter := 1
  else
  begin
    x := 1;
    y := 2;
    i := 2;
    while i < n do
    begin
      t := y;
      y := y + x;
      x := t;
      i := i + 1;
      if i < n then
      begin
        y := y + 1;
        i := i + 1;
      end;
    end;
    nter := y;
  end;
end;

//5. Promedio i-esimo y j-esimo de serie anterior
function promedioSerie(i, j: integer): real;
var
  a, b, t, k: integer;
begin
  a := 1;
  b := 2;
  k := 2;
  while k < i do
  begin
    t := b;
    b := b + a;
    a := t;
    k := k + 1;
    if k < i then
    begin
      b := b + 1;
      k := k + 1;
    end;
  end;
  promedioSerie := (a + b) / 2;
end;

//6. Posicion de subcadena sin POS
function posi(sub, cad: string): integer;
var
  i, j, p, t: integer;
begin
  p := 0;
  i := 1;
  while (p = 0) and (i <= length(cad) - length(sub) + 1) do
  begin
    j := 1;
    t := i;
    while (j <= length(sub)) and (cad[t] = sub[j]) do
    begin
      j := j + 1;
      t := t + 1;
    end;
    if j > length(sub) then
      p := i
    else
      i := i + 1;
  end;
  posi := p;
end;

//7. Primera palabra con inicial mayuscula resto minuscula
function primeraPalabra(cad: string): string;
var
  i, ini, fin: integer;
  res: string;
begin
  i := 1;
  while (i <= length(cad)) and (cad[i] = ' ') do
    i := i + 1;
  ini := i;
  while (i <= length(cad)) and (cad[i] <> ' ') do
    i := i + 1;
  fin := i - 1;
  res := '';
  if ini <= fin then
  begin
    if (cad[ini] >= 'a') and (cad[ini] <= 'z') then
      res := chr(ord(cad[ini]) - 32)
    else
      res := cad[ini];
    i := ini + 1;
    while i <= fin do
    begin
      if (cad[i] >= 'A') and (cad[i] <= 'Z') then
        res := res + chr(ord(cad[i]) + 32)
      else
        res := res + cad[i];
      i := i + 1;
    end;
  end;
  primeraPalabra := res;
end;

//8. N-esimo termino de 2,2,4,3,8,4,16,5,32,6,64,...
function nter2(n: integer): integer;
var
  pot, idx, i: integer;
begin
  if n = 1 then
    nter2 := 2
  else
  begin
    pot := 2;
    idx := 2;
    i := 2;
    while i < n do
    begin
      pot := pot * 2;
      i := i + 1;
      if i = n then
        nter2 := pot
      else
      begin
        idx := idx + 1;
        i := i + 1;
        if i = n then
          nter2 := idx;
      end;
    end;
  end;
end;

//9. Promedio digitos mas y menos significativo sin cadenas
function PROMEDIO_EXTREMOS(R: real): real;
var
  ent, pri, ult: integer;
begin
  ent := trunc(R);
  ult := ent mod 10;
  while ent >= 10 do
    ent := ent div 10;
  pri := ent;
  PROMEDIO_EXTREMOS := (pri + ult) / 2;
end;

//10. Ordenar 3 numeros ascendente
procedure ORDENAR(var A, B, C: integer);
var
  t: integer;
begin
  if A > B then
  begin
    t := A;
    A := B;
    B := t;
  end;
  if A > C then
  begin
    t := A;
    A := C;
    C := t;
  end;
  if B > C then
  begin
    t := B;
    B := C;
    C := t;
  end;
end;

//11. Verificar si S1 existe en S2 sin POS
function EXISTE_SUBCADENA(S1, S2: string): boolean;
var
  i, j, t: integer;
  ok: boolean;
begin
  ok := false;
  i := 1;
  while (not ok) and (i <= length(S2) - length(S1) + 1) do
  begin
    j := 1;
    t := i;
    while (j <= length(S1)) and (S2[t] = S1[j]) do
    begin
      j := j + 1;
      t := t + 1;
    end;
    if j > length(S1) then
      ok := true
    else
      i := i + 1;
  end;
  EXISTE_SUBCADENA := ok;
end;

//12. Numeros gemelos (primos y diferencia 2)
function esPrimo(x: integer): boolean;
var
  i: integer;
begin
  if x < 2 then
    esPrimo := false
  else
  begin
    i := 2;
    while (i * i <= x) and (x mod i <> 0) do
      i := i + 1;
    esPrimo := (i * i > x);
  end;
end;

function sonGemelos(a, b: integer): boolean;
begin
  sonGemelos := esPrimo(a) and esPrimo(b) and ((a - b = 2) or (b - a = 2));
end;

//13. Literal primer y ultimo digito
function literalPrimerUltimo(n: integer): string;
var
  u, p, d: integer;
  res: string;
begin
  u := n mod 10;
  p := 1;
  while (n div p) >= 10 do
    p := p * 10;
  d := n div p;
  res := '';
  if d = 1 then res := 'uno'
  else if d = 2 then res := 'dos'
  else if d = 3 then res := 'tres'
  else if d = 4 then res := 'cuatro'
  else if d = 5 then res := 'cinco'
  else if d = 6 then res := 'seis'
  else if d = 7 then res := 'siete'
  else if d = 8 then res := 'ocho'
  else if d = 9 then res := 'nueve'
  else res := 'cero';
  res := res + ', ';
  if u = 1 then res := res + 'uno'
  else if u = 2 then res := res + 'dos'
  else if u = 3 then res := res + 'tres'
  else if u = 4 then res := res + 'cuatro'
  else if u = 5 then res := res + 'cinco'
  else if u = 6 then res := res + 'seis'
  else if u = 7 then res := res + 'siete'
  else if u = 8 then res := res + 'ocho'
  else if u = 9 then res := res + 'nueve'
  else res := res + 'cero';
  literalPrimerUltimo := res;
end;

//14. Cantidad numeros pares en cadena
function paresEnCadena(cad: string): integer;
var
  i, c, num: integer;
begin
  c := 0;
  i := 1;
  while i <= length(cad) do
  begin
    if (cad[i] >= '0') and (cad[i] <= '9') then
    begin
      num := 0;
      while (i <= length(cad)) and (cad[i] >= '0') and (cad[i] <= '9') do
      begin
        num := num * 10 + (ord(cad[i]) - ord('0'));
        i := i + 1;
      end;
      if num mod 2 = 0 then
        c := c + 1;
    end
    else
      i := i + 1;
  end;
  paresEnCadena := c;
end;

//15. Literales de cada digito
function literalDigitos(n: integer): string;
var
  p, d: integer;
  res: string;
begin
  p := 1;
  while (n div p) >= 10 do
    p := p * 10;
  res := '';
  while p > 0 do
  begin
    d := (n div p) mod 10;
    if d = 1 then res := res + 'uno'
    else if d = 2 then res := res + 'dos'
    else if d = 3 then res := res + 'tres'
    else if d = 4 then res := res + 'cuatro'
    else if d = 5 then res := res + 'cinco'
    else if d = 6 then res := res + 'seis'
    else if d = 7 then res := res + 'siete'
    else if d = 8 then res := res + 'ocho'
    else if d = 9 then res := res + 'nueve'
    else res := res + 'cero';
    p := p div 10;
    if p > 0 then
      res := res + ', ';
  end;
  literalDigitos := res;
end;

//16. Invertir primer y ultimo digito
function invertirExtremos(n: integer): integer;
var
  u, p, r: integer;
begin
  u := n mod 10;
  p := 1;
  while (n div p) >= 10 do
    p := p * 10;
  r := (n mod p) div 10;
  invertirExtremos := u * p + r * 10 + (n div p);
end;

//17. Mayor entre suma digitos pares e impares
function mayorSumaParImpar(n: integer): integer;
var
  d, sp, si: integer;
begin
  sp := 0;
  si := 0;
  while n > 0 do
  begin
    d := n mod 10;
    if d mod 2 = 0 then
      sp := sp + d
    else
      si := si + d;
    n := n div 10;
  end;
  if sp > si then
    mayorSumaParImpar := sp
  else
    mayorSumaParImpar := si;
end;

//18. Suma digitos excepto primero y ultimo
function sumaExceptoExtremos(n: integer): integer;
var
  u, p, s: integer;
begin
  u := n mod 10;
  p := 1;
  while (n div p) >= 10 do
    p := p * 10;
  n := (n mod p) div 10;
  s := 0;
  while n > 0 do
  begin
    s := s + (n mod 10);
    n := n div 10;
  end;
  sumaExceptoExtremos := s;
end;

//19. Promedio primer y ultimo digito
function promedioExtremos(n: integer): integer;
var
  u, p: integer;
begin
  u := n mod 10;
  p := 1;
  while (n div p) >= 10 do
    p := p * 10;
  promedioExtremos := ((n div p) + u) div 2;
end;

//20. Digito menor entre primero y ultimo
function menorPrimerUltimo(n: integer): integer;
var
  u, p, pri: integer;
begin
  u := n mod 10;
  p := 1;
  while (n div p) >= 10 do
    p := p * 10;
  pri := n div p;
  if pri < u then
    menorPrimerUltimo := pri
  else
    menorPrimerUltimo := u;
end;

//21. Suma ultimos 2 digitos de secuencia terminada en 0
function sumaUlt2DigitosSecuencia: integer;
var
  x, s, u: integer;
begin
  s := 0;
  readln(x);
  while x <> 0 do
  begin
    u := x mod 10;
    x := x div 10;
    s := s + (x mod 10) + u;
    readln(x);
  end;
  sumaUlt2DigitosSecuencia := s;
end;

//22. Suma digitos primos
function sumaDigitosPrimos(n: integer): integer;
var
  d, s: integer;
begin
  s := 0;
  while n > 0 do
  begin
    d := n mod 10;
    if (d = 2) or (d = 3) or (d = 5) or (d = 7) then
      s := s + d;
    n := n div 10;
  end;
  sumaDigitosPrimos := s;
end;

//23. Serie 2,4,6,8,4,6,8,10,6,8,10,12,... metodo Paco
procedure seriePaco(n: integer);
var
  i, j, ini, paco: integer;
begin
  paco := 1;
  ini := paco * 2;
  i := 1;
  while i <= n do
  begin
    j := 1;
    while (j <= 4) and (i <= n) do
    begin
      write(ini + (j-1)*2, ' ');
      j := j + 1;
      i := i + 1;
    end;
    ini := ini + 2;
  end;
end;

//24. Serie 1,3,7,15,2,5,11,23,3,7,...
procedure serie1_3_7_15(n: integer);
var
  i, p, a, b, c, d: integer;
begin
  a := 1;
  b := 3;
  c := 7;
  d := 15;
  p := 1;
  i := 1;
  while i <= n do
  begin
    if p = 1 then
    begin
      write(a, ' ');
      a := a * 2 + 1;
      p := 2;
    end
    else if p = 2 then
    begin
      write(b, ' ');
      b := b * 2 + 1;
      p := 3;
    end
    else if p = 3 then
    begin
      write(c, ' ');
      c := c * 2 + 1;
      p := 4;
    end
    else
    begin
      write(d, ' ');
      d := d * 2 + 1;
      p := 1;
    end;
    i := i + 1;
  end;
end;

//25. Serie 8,1,7,2,6,3,5,4,...
procedure serie8_1_7_2(n: integer);
var
  i, p, izq, der: integer;
begin
  izq := 8;
  der := 1;
  p := 1;
  i := 1;
  while i <= n do
  begin
    if p = 1 then
    begin
      write(izq, ' ');
      izq := izq - 1;
      p := 2;
    end
    else
    begin
      write(der, ' ');
      der := der + 1;
      p := 1;
    end;
    i := i + 1;
  end;
end;

//26. Serie 3,6,5,7,14,13,15,30,29,...
procedure serie3_6_5(n: integer);
var
  i, p, a, b, c: integer;
begin
  a := 3;
  b := 6;
  c := 5;
  p := 1;
  i := 1;
  while i <= n do
  begin
    if p = 1 then
    begin
      write(a, ' ');
      a := a * 2;
      p := 2;
    end
    else if p = 2 then
    begin
      write(b, ' ');
      b := b * 2 + 1;
      p := 3;
    end
    else
    begin
      write(c, ' ');
      c := c * 2 + 1;
      p := 1;
    end;
    i := i + 1;
  end;
end;

//27. Serie 5,4,3,2,4,3,2,1,3,2,1,0,2,1,...
procedure serie5_4_3_2(n: integer);
var
  i, j, ini, p: integer;
begin
  ini := 5;
  p := 1;
  i := 1;
  while i <= n do
  begin
    j := ini;
    while (j >= ini - 3) and (i <= n) do
    begin
      write(j, ' ');
      j := j - 1;
      i := i + 1;
    end;
    if p = 1 then
      ini := 4
    else if p = 2 then
      ini := 3
    else if p = 3 then
      ini := 2
    else
      ini := 5;
    if p = 4 then
      p := 1
    else
      p := p + 1;
  end;
end;

//28. Serie 2,6,3,6,10,7,14,18,15,30,34,...
procedure serie2_6_3(n: integer);
var
  i, p, a, b, c: integer;
begin
  a := 2;
  b := 6;
  c := 3;
  p := 1;
  i := 1;
  while i <= n do
  begin
    if p = 1 then
    begin
      write(a, ' ');
      a := a * 3;
      p := 2;
    end
    else if p = 2 then
    begin
      write(b, ' ');
      b := b + 4;
      p := 3;
    end
    else
    begin
      write(c, ' ');
      c := c * 2 + 1;
      p := 1;
    end;
    i := i + 1;
  end;
end;

//29. Serie 2,6,4,7,21,19,22,66,64,67,...
procedure serie2_6_4(n: integer);
var
  i, p, a, b, c: integer;
begin
  a := 2;
  b := 6;
  c := 4;
  p := 1;
  i := 1;
  while i <= n do
  begin
    if p = 1 then
    begin
      write(a, ' ');
      a := a * 3 + 1;
      p := 2;
    end
    else if p = 2 then
    begin
      write(b, ' ');
      b := b * 3 + 3;
      p := 3;
    end
    else
    begin
      write(c, ' ');
      c := c * 3 + 7;
      p := 1;
    end;
    i := i + 1;
  end;
end;

//30. Serie 8,1,2,7,3,4,6,5,6,4,7,8,3,...
procedure serie8_1_2_7(n: integer);
var
  i, p, a, b: integer;
begin
  a := 8;
  b := 1;
  p := 1;
  i := 1;
  while i <= n do
  begin
    if p = 1 then
    begin
      write(a, ' ');
      a := a - 1;
      p := 2;
    end
    else if p = 2 then
    begin
      write(b, ' ');
      b := b + 1;
      p := 3;
    end
    else if p = 3 then
    begin
      write(b, ' ');
      b := b + 1;
      p := 4;
    end
    else
    begin
      write(a, ' ');
      a := a - 1;
      p := 1;
    end;
    i := i + 1;
  end;
end;

//31. Numero Armstrong 3 digitos
function esArmstrong(n: integer): boolean;
var
  a, b, c, s: integer;
begin
  a := n div 100;
  b := (n div 10) mod 10;
  c := n mod 10;
  s := a*a*a + b*b*b + c*c*c;
  esArmstrong := (s = n);
end;

// ===================================================================
// ==================== PARTE 1: EJERCICIOS CON NÚMEROS ==============
// ==================== (50+ ejercicios) =============================
// ===================================================================

// -------------------------------------------------------------------
// 1.1. Función: ¿Es par?
// Descripción: Retorna TRUE si el número es divisible por 2.
// Parámetro: n - entero cualquiera.
// Retorno: boolean.
// Ejemplo: EsPar(4) -> TRUE, EsPar(7) -> FALSE.
// -------------------------------------------------------------------
function Num_EsPar(n: integer): boolean;
begin
  // Un número es par si el residuo de dividir entre 2 es cero.
  Num_EsPar := (n mod 2 = 0);
end;

// -------------------------------------------------------------------
// 1.2. Función: ¿Es impar?
// Descripción: Retorna TRUE si el número NO es divisible por 2.
// Ejemplo: EsImpar(5) -> TRUE, EsImpar(8) -> FALSE.
// -------------------------------------------------------------------
function Num_EsImpar(n: integer): boolean;
begin
  Num_EsImpar := (n mod 2 <> 0);
end;

// -------------------------------------------------------------------
// 1.3. Función: ¿Es positivo?
// Descripción: Retorna TRUE si n > 0.
// Ejemplo: EsPositivo(10) -> TRUE, EsPositivo(-3) -> FALSE.
// -------------------------------------------------------------------
function Num_EsPositivo(n: integer): boolean;
begin
  Num_EsPositivo := (n > 0);
end;

// -------------------------------------------------------------------
// 1.4. Función: ¿Es negativo?
// Descripción: Retorna TRUE si n < 0.
// -------------------------------------------------------------------
function Num_EsNegativo(n: integer): boolean;
begin
  Num_EsNegativo := (n < 0);
end;

// -------------------------------------------------------------------
// 1.5. Función: ¿Es cero?
// Descripción: Retorna TRUE si n = 0.
// -------------------------------------------------------------------
function Num_EsCero(n: integer): boolean;
begin
  Num_EsCero := (n = 0);
end;

// -------------------------------------------------------------------
// 1.6. Función: ¿Es múltiplo de 3?
// Descripción: Retorna TRUE si n mod 3 = 0.
// Ejemplo: EsMultiploDe3(9) -> TRUE, EsMultiploDe3(10) -> FALSE.
// -------------------------------------------------------------------
function Num_EsMultiploDe3(n: integer): boolean;
begin
  Num_EsMultiploDe3 := (n mod 3 = 0);
end;

// -------------------------------------------------------------------
// 1.7. Función: ¿Es múltiplo de 5?
// -------------------------------------------------------------------
function Num_EsMultiploDe5(n: integer): boolean;
begin
  Num_EsMultiploDe5 := (n mod 5 = 0);
end;

// -------------------------------------------------------------------
// 1.8. Función: ¿Es múltiplo de otro?
// Parámetros: a, b - enteros. Retorna TRUE si a es múltiplo de b (b ≠ 0).
// Ejemplo: EsMultiploDe(15, 3) -> TRUE, EsMultiploDe(10, 4) -> FALSE.
// -------------------------------------------------------------------
function Num_EsMultiploDe(a, b: integer): boolean;
begin
  // Si b es cero, no se puede dividir, retornamos FALSE.
  if b = 0 then
    Num_EsMultiploDe := false
  else
    Num_EsMultiploDe := (a mod b = 0);
end;

// -------------------------------------------------------------------
// 1.9. Función: Contar dígitos de un número.
// Descripción: Devuelve cuántos dígitos tiene n (en base 10).
// Ejemplo: ContarDigitos(12345) -> 5, ContarDigitos(0) -> 1.
// -------------------------------------------------------------------
function Num_ContarDigitos(n: integer): integer;
var
  cont: integer;   // Contador de dígitos
begin
  // Caso especial: el número 0 tiene 1 dígito.
  if n = 0 then
  begin
    Num_ContarDigitos := 1;
    Exit;
  end;
  // Trabajamos con valor absoluto para ignorar el signo.
  if n < 0 then
    n := -n;
  cont := 0;
  // Mientras queden dígitos, incrementamos el contador y eliminamos el último.
  while n > 0 do
  begin
    cont := cont + 1;
    n := n div 10;
  end;
  Num_ContarDigitos := cont;
end;

// -------------------------------------------------------------------
// 1.10. Función: Suma de dígitos.
// Descripción: Suma todos los dígitos que componen el número.
// Ejemplo: SumaDigitos(123) -> 1+2+3 = 6.
// -------------------------------------------------------------------
function Num_SumaDigitos(n: integer): integer;
var
  suma: integer;   // Acumulador de la suma
begin
  suma := 0;
  // Ignoramos el signo.
  if n < 0 then
    n := -n;
  // Extraemos cada dígito y lo sumamos.
  while n > 0 do
  begin
    suma := suma + (n mod 10);
    n := n div 10;
  end;
  Num_SumaDigitos := suma;
end;

// -------------------------------------------------------------------
// 1.11. Función: Producto de dígitos.
// Descripción: Multiplica todos los dígitos del número.
// Ejemplo: ProductoDigitos(234) -> 2*3*4 = 24.
// Si el número tiene un 0, el producto será 0.
// -------------------------------------------------------------------
function Num_ProductoDigitos(n: integer): integer;
var
  prod: integer;
begin
  prod := 1;
  if n < 0 then
    n := -n;
  // Si el número es 0, el producto es 0.
  if n = 0 then
    prod := 0;
  // Recorremos dígitos.
  while n > 0 do
  begin
    prod := prod * (n mod 10);
    n := n div 10;
  end;
  Num_ProductoDigitos := prod;
end;

// -------------------------------------------------------------------
// 1.12. Función: Dígito mayor.
// Descripción: Encuentra el dígito más grande dentro del número.
// Ejemplo: DigitoMayor(7391) -> 9.
// -------------------------------------------------------------------
function Num_DigitoMayor(n: integer): integer;
var
  maxDig, dig: integer;
begin
  // Inicializamos máximo con 0 (el dígito más pequeño posible).
  if n < 0 then
    n := -n;
  if n = 0 then
  begin
    Num_DigitoMayor := 0;
    Exit;
  end;
  maxDig := 0;
  while n > 0 do
  begin
    dig := n mod 10;
    if dig > maxDig then
      maxDig := dig;
    n := n div 10;
  end;
  Num_DigitoMayor := maxDig;
end;

// -------------------------------------------------------------------
// 1.13. Función: Dígito menor.
// Descripción: Encuentra el dígito más pequeño.
// Ejemplo: DigitoMenor(7391) -> 1.
// -------------------------------------------------------------------
function Num_DigitoMenor(n: integer): integer;
var
  minDig, dig: integer;
begin
  if n < 0 then
    n := -n;
  if n = 0 then
  begin
    Num_DigitoMenor := 0;
    Exit;
  end;
  minDig := 9;   // Empezamos con el dígito más grande posible.
  while n > 0 do
  begin
    dig := n mod 10;
    if dig < minDig then
      minDig := dig;
    n := n div 10;
  end;
  Num_DigitoMenor := minDig;
end;

// -------------------------------------------------------------------
// 1.14. Función: ¿Es capicúa (palíndromo numérico)?
// Descripción: Un número capicúa se lee igual de izquierda a derecha.
// Ejemplo: 121, 3443, 5, 88.
// Salida: TRUE si es capicúa.
// -------------------------------------------------------------------
function Num_EsCapicua(n: integer): boolean;
var
  original, invertido: integer;
begin
  original := n;               // Guardamos el valor original.
  invertido := 0;
  if n < 0 then
    n := -n;                   // Trabajamos con positivo.
  // Construimos el número invertido.
  while n > 0 do
  begin
    invertido := invertido * 10 + (n mod 10);
    n := n div 10;
  end;
  // Comparamos el original (en valor absoluto) con el invertido.
  Num_EsCapicua := (Abs(original) = invertido);
end;

// -------------------------------------------------------------------
// 1.15. Función: ¿Es primo?
// Descripción: Un número primo es >1 y solo divisible por 1 y sí mismo.
// Ejemplo: EsPrimo(7) -> TRUE, EsPrimo(10) -> FALSE.
// -------------------------------------------------------------------
function Num_EsPrimo(n: integer): boolean;
var
  divisor: integer;
begin
  if n <= 1 then
    Num_EsPrimo := false
  else
  begin
    divisor := 2;
    // Probamos divisores desde 2 hasta n-1.
    while divisor < n do
    begin
      if n mod divisor = 0 then
      begin
        Num_EsPrimo := false;
        Exit;
      end;
      divisor := divisor + 1;
    end;
    Num_EsPrimo := true;
  end;
end;

// -------------------------------------------------------------------
// 1.16. Función: ¿Es número perfecto?
// Descripción: Perfecto si la suma de sus divisores propios (excluyéndolo)
// es igual al número. Ejemplo: 6 = 1+2+3.
// -------------------------------------------------------------------
function Num_EsPerfecto(n: integer): boolean;
var
  suma, d: integer;
begin
  if n <= 1 then
  begin
    Num_EsPerfecto := false;
    Exit;
  end;
  suma := 0;
  d := 1;
  // Solo necesitamos llegar hasta la mitad del número.
  while d <= n div 2 do
  begin
    if n mod d = 0 then
      suma := suma + d;
    d := d + 1;
  end;
  Num_EsPerfecto := (suma = n);
end;

// -------------------------------------------------------------------
// 1.17. Función: ¿Es número abundante?
// Descripción: Abundante si suma de divisores propios > número.
// Ejemplo: 12 (1+2+3+4+6=16 > 12).
// -------------------------------------------------------------------
function Num_EsAbundante(n: integer): boolean;
var
  suma, d: integer;
begin
  if n <= 1 then
  begin
    Num_EsAbundante := false;
    Exit;
  end;
  suma := 0;
  d := 1;
  while d <= n div 2 do
  begin
    if n mod d = 0 then
      suma := suma + d;
    d := d + 1;
  end;
  Num_EsAbundante := (suma > n);
end;

// -------------------------------------------------------------------
// 1.18. Función: ¿Es número defectivo?
// Descripción: Defectivo si suma divisores propios < número.
// Ejemplo: 8 (1+2+4=7 < 8).
// -------------------------------------------------------------------
function Num_EsDefectivo(n: integer): boolean;
var
  suma, d: integer;
begin
  if n <= 1 then
  begin
    Num_EsDefectivo := true;   // 1 es defectivo por convención.
    Exit;
  end;
  suma := 0;
  d := 1;
  while d <= n div 2 do
  begin
    if n mod d = 0 then
      suma := suma + d;
    d := d + 1;
  end;
  Num_EsDefectivo := (suma < n);
end;

// -------------------------------------------------------------------
// 1.19. Función: Máximo Común Divisor (MCD) de dos números.
// Algoritmo de Euclides.
// Ejemplo: MCD(48, 18) = 6.
// -------------------------------------------------------------------
function Num_MCD(a, b: integer): integer;
begin
  a := Abs(a);
  b := Abs(b);
  // Algoritmo de Euclides: mientras ambos no sean cero.
  while (a <> 0) and (b <> 0) do
  begin
    if a > b then
      a := a mod b
    else
      b := b mod a;
  end;
  Num_MCD := a + b;   // El no cero es la respuesta.
end;

// -------------------------------------------------------------------
// 1.20. Función: Mínimo Común Múltiplo (MCM).
// Fórmula: MCM(a,b) = |a*b| / MCD(a,b).
// Ejemplo: MCM(4,6) = 12.
// -------------------------------------------------------------------
function Num_MCM(a, b: integer): integer;
begin
  if (a = 0) or (b = 0) then
    Num_MCM := 0
  else
    Num_MCM := Abs(a * b) div Num_MCD(a, b);
end;

// -------------------------------------------------------------------
// 1.21. Función: Potencia (base^exponente), exponente natural ≥ 0.
// Ejemplo: Potencia(2,3) = 8.
// -------------------------------------------------------------------
function Num_Potencia(base, exp: integer): integer;
var
  res, i: integer;
begin
  if exp < 0 then
  begin
    Num_Potencia := 0;   // No manejamos exponentes negativos aquí.
    Exit;
  end;
  res := 1;
  i := 1;
  while i <= exp do
  begin
    res := res * base;
    i := i + 1;
  end;
  Num_Potencia := res;
end;

// -------------------------------------------------------------------
// 1.22. Función: Factorial (n!).
// Definición: n! = 1*2*3*...*n, con 0! = 1.
// Ejemplo: Factorial(5) = 120.
// -------------------------------------------------------------------
function Num_Factorial(n: integer): integer;
var
  f, i: integer;
begin
  if n < 0 then
    Num_Factorial := -1   // Error: factorial de negativo no definido.
  else
  begin
    f := 1;
    i := 2;
    while i <= n do
    begin
      f := f * i;
      i := i + 1;
    end;
    Num_Factorial := f;
  end;
end;

// -------------------------------------------------------------------
// 1.23. Función: Número combinatorio (n sobre k) = n! / (k! * (n-k)!)
// Ejemplo: Combinatorio(5,2) = 10.
// -------------------------------------------------------------------
function Num_Combinatorio(n, k: integer): integer;
begin
  if (k < 0) or (k > n) then
    Num_Combinatorio := 0
  else
    Num_Combinatorio := Num_Factorial(n) div (Num_Factorial(k) * Num_Factorial(n - k));
end;

// -------------------------------------------------------------------
// 1.24. Función: ¿Es número triangular?
// Un número triangular es de la forma T_n = n*(n+1)/2.
// Ejemplo: 1,3,6,10,15... El 6 es triangular.
// -------------------------------------------------------------------
function Num_EsTriangular(n: integer): boolean;
var
  k, suma: integer;
begin
  if n < 0 then
  begin
    Num_EsTriangular := false;
    Exit;
  end;
  k := 1;
  suma := 0;
  // Vamos sumando números naturales hasta alcanzar o superar n.
  while suma < n do
  begin
    suma := suma + k;
    if suma = n then
    begin
      Num_EsTriangular := true;
      Exit;
    end;
    k := k + 1;
  end;
  Num_EsTriangular := false;
end;

// -------------------------------------------------------------------
// 1.25. Función: Invertir un número (ej: 123 -> 321).
// -------------------------------------------------------------------
function Num_Invertir(n: integer): integer;
var
  inv: integer;
begin
  inv := 0;
  if n < 0 then
    n := -n;
  while n > 0 do
  begin
    inv := inv * 10 + (n mod 10);
    n := n div 10;
  end;
  Num_Invertir := inv;
end;

// -------------------------------------------------------------------
// 1.26. Función: ¿Es número Armstrong (o narcisista)?
// Para 3 dígitos: suma de cubos de dígitos = número.
// Ejemplo: 153 -> 1^3+5^3+3^3 = 153.
// -------------------------------------------------------------------
function Num_EsArmstrong(n: integer): boolean;
var
  suma, original, dig: integer;
begin
  original := n;
  if n < 0 then
    n := -n;
  suma := 0;
  while n > 0 do
  begin
    dig := n mod 10;
    suma := suma + dig * dig * dig;   // Cubo.
    n := n div 10;
  end;
  Num_EsArmstrong := (Abs(original) = suma);
end;

// -------------------------------------------------------------------
// 1.27. Función: ¿Es número automórfico?
// El cuadrado del número termina con el mismo número.
// Ejemplo: 25 -> 625 termina en 25.
// -------------------------------------------------------------------
function Num_EsAutomorfico(n: integer): boolean;
var
  cuadrado, temp: integer;
begin
  if n < 0 then
    n := -n;
  cuadrado := n * n;
  temp := n;
  // Comparamos los últimos dígitos.
  while temp > 0 do
  begin
    if (cuadrado mod 10) <> (temp mod 10) then
    begin
      Num_EsAutomorfico := false;
      Exit;
    end;
    cuadrado := cuadrado div 10;
    temp := temp div 10;
  end;
  Num_EsAutomorfico := true;
end;

// -------------------------------------------------------------------
// 1.28. Función: Suma de los primeros N números naturales.
// Ejemplo: SumaNaturales(10) = 55.
// -------------------------------------------------------------------
function Num_SumaNaturales(n: integer): integer;
var
  suma, i: integer;
begin
  suma := 0;
  i := 1;
  while i <= n do
  begin
    suma := suma + i;
    i := i + 1;
  end;
  Num_SumaNaturales := suma;
end;

// -------------------------------------------------------------------
// 1.29. Función: Producto de los primeros N naturales (factorial).
// -------------------------------------------------------------------
function Num_ProductoNaturales(n: integer): integer;
begin
  Num_ProductoNaturales := Num_Factorial(n);
end;

// -------------------------------------------------------------------
// 1.30. Función: ¿Número de la suerte (solo dígitos 4 y 7)?
// Ejemplo: 447, 7, 4 son de la suerte. 123 no.
// -------------------------------------------------------------------
function Num_EsDeLaSuerte(n: integer): boolean;
var
  dig: integer;
begin
  if n < 0 then
    n := -n;
  if n = 0 then
  begin
    Num_EsDeLaSuerte := false;
    Exit;
  end;
  while n > 0 do
  begin
    dig := n mod 10;
    if (dig <> 4) and (dig <> 7) then
    begin
      Num_EsDeLaSuerte := false;
      Exit;
    end;
    n := n div 10;
  end;
  Num_EsDeLaSuerte := true;
end;

// -------------------------------------------------------------------
// 1.31. Función: Contar dígitos pares.
// Ejemplo: ContarDigitosPares(123456) -> 3 (2,4,6).
// -------------------------------------------------------------------
function Num_ContarDigitosPares(n: integer): integer;
var
  cont, dig: integer;
begin
  cont := 0;
  if n < 0 then
    n := -n;
  if n = 0 then
  begin
    Num_ContarDigitosPares := 0;
    Exit;
  end;
  while n > 0 do
  begin
    dig := n mod 10;
    if dig mod 2 = 0 then
      cont := cont + 1;
    n := n div 10;
  end;
  Num_ContarDigitosPares := cont;
end;

// -------------------------------------------------------------------
// 1.32. Función: Contar dígitos impares.
// -------------------------------------------------------------------
function Num_ContarDigitosImpares(n: integer): integer;
var
  cont, dig: integer;
begin
  cont := 0;
  if n < 0 then
    n := -n;
  if n = 0 then
  begin
    Num_ContarDigitosImpares := 0;
    Exit;
  end;
  while n > 0 do
  begin
    dig := n mod 10;
    if dig mod 2 <> 0 then
      cont := cont + 1;
    n := n div 10;
  end;
  Num_ContarDigitosImpares := cont;
end;

// -------------------------------------------------------------------
// 1.33. Función: ¿Número libre de cuadrados?
// No tiene ningún factor primo repetido. Ejemplo: 6 (2*3) sí, 18 (2*3^3) no.
// -------------------------------------------------------------------
function Num_EsLibreDeCuadrados(n: integer): boolean;
var
  p: integer;
begin
  if n <= 0 then
  begin
    Num_EsLibreDeCuadrados := false;
    Exit;
  end;
  p := 2;
  // Buscamos si algún cuadrado de primo divide a n.
  while p * p <= n do
  begin
    if n mod (p * p) = 0 then
    begin
      Num_EsLibreDeCuadrados := false;
      Exit;
    end;
    p := p + 1;
  end;
  Num_EsLibreDeCuadrados := true;
end;

// -------------------------------------------------------------------
// 1.34. Función: Cantidad de divisores de n.
// Ejemplo: 12 tiene 6 divisores: 1,2,3,4,6,12.
// -------------------------------------------------------------------
function Num_NumeroDivisores(n: integer): integer;
var
  d, cont: integer;
begin
  if n <= 0 then
  begin
    Num_NumeroDivisores := 0;
    Exit;
  end;
  cont := 0;
  d := 1;
  while d <= n do
  begin
    if n mod d = 0 then
      cont := cont + 1;
    d := d + 1;
  end;
  Num_NumeroDivisores := cont;
end;

// -------------------------------------------------------------------
// 1.35. Función: Suma de divisores propios (excluyendo el número).
// -------------------------------------------------------------------
function Num_SumaDivisoresPropios(n: integer): integer;
var
  d, suma: integer;
begin
  if n <= 1 then
  begin
    Num_SumaDivisoresPropios := 0;
    Exit;
  end;
  suma := 0;
  d := 1;
  while d <= n div 2 do
  begin
    if n mod d = 0 then
      suma := suma + d;
    d := d + 1;
  end;
  Num_SumaDivisoresPropios := suma;
end;

// -------------------------------------------------------------------
// 1.36. Función: ¿Número de Harshad (o Niven)?
// Divisible por la suma de sus dígitos.
// Ejemplo: 18 (suma dígitos=9, 18/9=2) sí es Harshad.
// -------------------------------------------------------------------
function Num_EsHarshad(n: integer): boolean;
var
  suma: integer;
begin
  suma := Num_SumaDigitos(n);
  if suma = 0 then
    Num_EsHarshad := false
  else
    Num_EsHarshad := (n mod suma = 0);
end;

// -------------------------------------------------------------------
// 1.37. Función: ¿Número de Smith?
// La suma de sus dígitos es igual a la suma de los dígitos de sus factores primos.
// Ejemplo: 4 = 2*2, suma dígitos de 4 es 4, suma dígitos factores 2+2=4.
// -------------------------------------------------------------------
function Num_EsSmith(n: integer): boolean;
var
  temp, factor, sumaFactores: integer;
begin
  if n <= 1 then
  begin
    Num_EsSmith := false;
    Exit;
  end;
  temp := n;
  factor := 2;
  sumaFactores := 0;
  // Descomponemos en factores primos.
  while temp > 1 do
  begin
    while temp mod factor = 0 do
    begin
      sumaFactores := sumaFactores + Num_SumaDigitos(factor);
      temp := temp div factor;
    end;
    factor := factor + 1;
  end;
  Num_EsSmith := (Num_SumaDigitos(n) = sumaFactores);
end;

// -------------------------------------------------------------------
// 1.38. Función: Convertir a binario (string).
// Ejemplo: ToBinario(13) -> '1101'.
// -------------------------------------------------------------------
function Num_ToBinario(n: integer): string;
var
  res: string;
begin
  if n = 0 then
  begin
    Num_ToBinario := '0';
    Exit;
  end;
  res := '';
  if n < 0 then
    n := -n;
  while n > 0 do
  begin
    if (n mod 2) = 0 then
      res := '0' + res
    else
      res := '1' + res;
    n := n div 2;
  end;
  Num_ToBinario := res;
end;

// -------------------------------------------------------------------
// 1.39. Función: Contar unos en binario.
// Ejemplo: UnosEnBinario(13) -> 3 (1101).
// -------------------------------------------------------------------
function Num_UnosEnBinario(n: integer): integer;
var
  cont: integer;
begin
  cont := 0;
  if n < 0 then
    n := -n;
  while n > 0 do
  begin
    if n mod 2 = 1 then
      cont := cont + 1;
    n := n div 2;
  end;
  Num_UnosEnBinario := cont;
end;

// -------------------------------------------------------------------
// 1.40. Función: Contar ceros en binario.
// Ejemplo: CerosEnBinario(13) -> 1 (1101 tiene un cero).
// -------------------------------------------------------------------
function Num_CerosEnBinario(n: integer): integer;
var
  cont: integer;
begin
  if n = 0 then
  begin
    Num_CerosEnBinario := 1;
    Exit;
  end;
  cont := 0;
  if n < 0 then
    n := -n;
  while n > 0 do
  begin
    if n mod 2 = 0 then
      cont := cont + 1;
    n := n div 2;
  end;
  Num_CerosEnBinario := cont;
end;

// -------------------------------------------------------------------
// 1.41. Función: ¿Número malvado? (cantidad de unos en binario es par).
// -------------------------------------------------------------------
function Num_EsMalvado(n: integer): boolean;
begin
  Num_EsMalvado := (Num_UnosEnBinario(n) mod 2 = 0);
end;

// -------------------------------------------------------------------
// 1.42. Función: ¿Número odioso? (unos en binario es impar).
// -------------------------------------------------------------------
function Num_EsOdioso(n: integer): boolean;
begin
  Num_EsOdioso := (Num_UnosEnBinario(n) mod 2 = 1);
end;

// -------------------------------------------------------------------
// 1.43. Función: Suma de los primeros N números pares.
// Ejemplo: SumaPrimerosPares(3) -> 2+4+6 = 12.
// -------------------------------------------------------------------
function Num_SumaPrimerosPares(n: integer): integer;
var
  suma, i, par: integer;
begin
  suma := 0;
  i := 1;
  par := 2;
  while i <= n do
  begin
    suma := suma + par;
    par := par + 2;
    i := i + 1;
  end;
  Num_SumaPrimerosPares := suma;
end;

// -------------------------------------------------------------------
// 1.44. Función: Suma de los primeros N números impares.
// Ejemplo: SumaPrimerosImpares(3) -> 1+3+5 = 9.
// -------------------------------------------------------------------
function Num_SumaPrimerosImpares(n: integer): integer;
var
  suma, i, impar: integer;
begin
  suma := 0;
  i := 1;
  impar := 1;
  while i <= n do
  begin
    suma := suma + impar;
    impar := impar + 2;
    i := i + 1;
  end;
  Num_SumaPrimerosImpares := suma;
end;

// -------------------------------------------------------------------
// 1.45. Función: Producto de dígitos pares.
// Ejemplo: ProductoDigitosPares(283) -> 2*8 = 16 (el 3 es impar, se ignora).
// -------------------------------------------------------------------
function Num_ProductoDigitosPares(n: integer): integer;
var
  prod, dig: integer;
begin
  prod := 1;
  if n < 0 then
    n := -n;
  if n = 0 then
  begin
    Num_ProductoDigitosPares := 0;
    Exit;
  end;
  while n > 0 do
  begin
    dig := n mod 10;
    if dig mod 2 = 0 then
      prod := prod * dig;
    n := n div 10;
  end;
  Num_ProductoDigitosPares := prod;
end;

// -------------------------------------------------------------------
// 1.46. Función: ¿Pertenece a la serie de Fibonacci?
// Verifica si el número dado aparece en Fibonacci.
// -------------------------------------------------------------------
function Num_PerteneceFibonacci(n: integer): boolean;
var
  a, b, c: integer;
begin
  if n < 0 then
  begin
    Num_PerteneceFibonacci := false;
    Exit;
  end;
  a := 0;
  b := 1;
  while a < n do
  begin
    c := a + b;
    a := b;
    b := c;
  end;
  Num_PerteneceFibonacci := (a = n);
end;

// -------------------------------------------------------------------
// 1.47. Función: Contar primos menores o iguales a n.
// Ejemplo: ContarPrimosHasta(10) -> 4 (2,3,5,7).
// -------------------------------------------------------------------
function Num_ContarPrimosHasta(n: integer): integer;
var
  i, cont: integer;
begin
  cont := 0;
  i := 2;
  while i <= n do
  begin
    if Num_EsPrimo(i) then
      cont := cont + 1;
    i := i + 1;
  end;
  Num_ContarPrimosHasta := cont;
end;

// -------------------------------------------------------------------
// 1.48. Función: Siguiente término de Collatz.
// Si n es par -> n/2; si impar -> 3n+1.
// Ejemplo: SiguienteCollatz(6)=3, SiguienteCollatz(5)=16.
// -------------------------------------------------------------------
function Num_SiguienteCollatz(n: integer): integer;
begin
  if n <= 0 then
    Num_SiguienteCollatz := 0
  else if n mod 2 = 0 then
    Num_SiguienteCollatz := n div 2
  else
    Num_SiguienteCollatz := 3 * n + 1;
end;

// -------------------------------------------------------------------
// 1.49. Función: Longitud de la secuencia de Collatz hasta llegar a 1.
// Ejemplo: LongitudCollatz(6) -> 8 (6,3,10,5,16,8,4,2,1) cuenta los pasos.
// -------------------------------------------------------------------
function Num_LongitudCollatz(n: integer): integer;
var
  pasos: integer;
begin
  if n <= 0 then
  begin
    Num_LongitudCollatz := -1;
    Exit;
  end;
  pasos := 0;
  while n <> 1 do
  begin
    n := Num_SiguienteCollatz(n);
    pasos := pasos + 1;
  end;
  Num_LongitudCollatz := pasos;
end;

// -------------------------------------------------------------------
// 1.50. Función: Máximo de dos números.
// -------------------------------------------------------------------
function Num_Maximo(a, b: integer): integer;
begin
  if a > b then
    Num_Maximo := a
  else
    Num_Maximo := b;
end;

// ===================================================================
// ==================== PARTE 2: EJERCICIOS CON SERIES ===============
// ==================== (50+ ejercicios) =============================
// ===================================================================

// -------------------------------------------------------------------
// 2.1. Procedimiento: Serie de Fibonacci (primeros n términos).
// Muestra: 0 1 1 2 3 5 8...
// -------------------------------------------------------------------
procedure Serie_Fibonacci(n: integer);
var
  a, b, c, i: integer;
begin
  if n <= 0 then Exit;
  a := 0; b := 1; i := 1;
  while i <= n do
  begin
    write(a, ' ');
    c := a + b;
    a := b;
    b := c;
    i := i + 1;
  end;
  writeln;
end;

// -------------------------------------------------------------------
// 2.2. Función: Suma de primeros n términos de Fibonacci.
// Ejemplo: SumaFibonacci(5) -> 0+1+1+2+3 = 7.
// -------------------------------------------------------------------
function Serie_SumaFibonacci(n: integer): integer;
var
  a, b, c, i, suma: integer;
begin
  if n <= 0 then
  begin
    Serie_SumaFibonacci := 0;
    Exit;
  end;
  a := 0; b := 1; i := 1; suma := 0;
  while i <= n do
  begin
    suma := suma + a;
    c := a + b;
    a := b;
    b := c;
    i := i + 1;
  end;
  Serie_SumaFibonacci := suma;
end;

// -------------------------------------------------------------------
// 2.3. Procedimiento: Serie naturales: 1,2,3,...,n.
// -------------------------------------------------------------------
procedure Serie_Naturales(n: integer);
var
  i: integer;
begin
  i := 1;
  while i <= n do
  begin
    write(i, ' ');
    i := i + 1;
  end;
  writeln;
end;

// -------------------------------------------------------------------
// 2.4. Procedimiento: Serie pares hasta n.
// -------------------------------------------------------------------
procedure Serie_Pares(n: integer);
var
  i: integer;
begin
  i := 2;
  while i <= n do
  begin
    write(i, ' ');
    i := i + 2;
  end;
  writeln;
end;

// -------------------------------------------------------------------
// 2.5. Procedimiento: Serie impares hasta n.
// -------------------------------------------------------------------
procedure Serie_Impares(n: integer);
var
  i: integer;
begin
  i := 1;
  while i <= n do
  begin
    write(i, ' ');
    i := i + 2;
  end;
  writeln;
end;

// -------------------------------------------------------------------
// 2.6. Procedimiento: Serie cuadrados: 1^2, 2^2, ..., n^2.
// -------------------------------------------------------------------
procedure Serie_Cuadrados(n: integer);
var
  i: integer;
begin
  i := 1;
  while i <= n do
  begin
    write(i * i, ' ');
    i := i + 1;
  end;
  writeln;
end;

// -------------------------------------------------------------------
// 2.7. Procedimiento: Serie cubos: 1^3, 2^3, ..., n^3.
// -------------------------------------------------------------------
procedure Serie_Cubos(n: integer);
var
  i: integer;
begin
  i := 1;
  while i <= n do
  begin
    write(i * i * i, ' ');
    i := i + 1;
  end;
  writeln;
end;

// -------------------------------------------------------------------
// 2.8. Procedimiento: Serie geométrica: 1, r, r^2, ..., r^(n-1).
// Ejemplo: SerieGeometrica(2,5) -> 1 2 4 8 16.
// -------------------------------------------------------------------
procedure Serie_Geometrica(r, n: integer);
var
  i, term: integer;
begin
  if n <= 0 then Exit;
  term := 1;
  i := 1;
  while i <= n do
  begin
    write(term, ' ');
    term := term * r;
    i := i + 1;
  end;
  writeln;
end;

// -------------------------------------------------------------------
// 2.9. Procedimiento: Serie armónica: 1/1, 1/2, 1/3, ..., 1/n.
// -------------------------------------------------------------------
procedure Serie_Armonica(n: integer);
var
  i: integer;
begin
  i := 1;
  while i <= n do
  begin
    write('1/', i, ' ');
    i := i + 1;
  end;
  writeln;
end;

// -------------------------------------------------------------------
// 2.10. Función: Suma de la serie armónica (valor real).
// Ejemplo: SumaArmonica(3) = 1 + 1/2 + 1/3 ≈ 1.8333.
// -------------------------------------------------------------------
function Serie_SumaArmonica(n: integer): real;
var
  i: integer;
  suma: real;
begin
  suma := 0;
  i := 1;
  while i <= n do
  begin
    suma := suma + 1.0 / i;
    i := i + 1;
  end;
  Serie_SumaArmonica := suma;
end;

// -------------------------------------------------------------------
// 2.11. Procedimiento: Serie triangulares: T1=1, T2=3, T3=6, T4=10...
// -------------------------------------------------------------------
procedure Serie_Triangulares(n: integer);
var
  i, t: integer;
begin
  t := 0;
  i := 1;
  while i <= n do
  begin
    t := t + i;
    write(t, ' ');
    i := i + 1;
  end;
  writeln;
end;

// -------------------------------------------------------------------
// 2.12. Procedimiento: Serie factoriales: 1!, 2!, 3!, ..., n!.
// -------------------------------------------------------------------
procedure Serie_Factoriales(n: integer);
var
  i, fact: integer;
begin
  fact := 1;
  i := 1;
  while i <= n do
  begin
    fact := fact * i;
    write(fact, ' ');
    i := i + 1;
  end;
  writeln;
end;

// -------------------------------------------------------------------
// 2.13. Procedimiento: Fibonacci alternativa (1,1,2,3,5...).
// -------------------------------------------------------------------
procedure Serie_Fibonacci_Alt(n: integer);
var
  a, b, c, i: integer;
begin
  if n <= 0 then Exit;
  a := 1; b := 1; i := 1;
  while i <= n do
  begin
    write(a, ' ');
    c := a + b;
    a := b;
    b := c;
    i := i + 1;
  end;
  writeln;
end;

// -------------------------------------------------------------------
// 2.14. Procedimiento: Serie de Lucas: 2,1,3,4,7,11...
// -------------------------------------------------------------------
procedure Serie_Lucas(n: integer);
var
  a, b, c, i: integer;
begin
  if n <= 0 then Exit;
  a := 2; b := 1; i := 1;
  while i <= n do
  begin
    write(a, ' ');
    c := a + b;
    a := b;
    b := c;
    i := i + 1;
  end;
  writeln;
end;

// -------------------------------------------------------------------
// 2.15. Procedimiento: Serie de Pell: 0,1,2,5,12,29...
// -------------------------------------------------------------------
procedure Serie_Pell(n: integer);
var
  a, b, c, i: integer;
begin
  if n <= 0 then Exit;
  a := 0; b := 1; i := 1;
  while i <= n do
  begin
    write(a, ' ');
    c := 2 * b + a;
    a := b;
    b := c;
    i := i + 1;
  end;
  writeln;
end;

// -------------------------------------------------------------------
// 2.16. Procedimiento: Serie números de la suerte (dígitos 4 y 7).
// Muestra los primeros n números que solo contienen 4 y 7.
// -------------------------------------------------------------------
procedure Serie_NumerosDeLaSuerte(n: integer);
var
  cont, num: integer;
  function EsSuerte(x: integer): boolean;
  var
    d: integer;
  begin
    if x = 0 then
      EsSuerte := false
    else
    begin
      while x > 0 do
      begin
        d := x mod 10;
        if (d <> 4) and (d <> 7) then
        begin
          EsSuerte := false;
          Exit;
        end;
        x := x div 10;
      end;
      EsSuerte := true;
    end;
  end;
begin
  cont := 0;
  num := 1;
  while cont < n do
  begin
    if EsSuerte(num) then
    begin
      write(num, ' ');
      cont := cont + 1;
    end;
    num := num + 1;
  end;
  writeln;
end;

// -------------------------------------------------------------------
// 2.17. Procedimiento: Serie de números primos (primeros n primos).
// -------------------------------------------------------------------
procedure Serie_Primos(n: integer);
var
  cont, candidato: integer;
begin
  cont := 0;
  candidato := 2;
  while cont < n do
  begin
    if Num_EsPrimo(candidato) then
    begin
      write(candidato, ' ');
      cont := cont + 1;
    end;
    candidato := candidato + 1;
  end;
  writeln;
end;

// -------------------------------------------------------------------
// 2.18. Procedimiento: Serie de números perfectos (primeros n).
// -------------------------------------------------------------------
procedure Serie_Perfectos(n: integer);
var
  cont, candidato: integer;
begin
  cont := 0;
  candidato := 2;
  while cont < n do
  begin
    if Num_EsPerfecto(candidato) then
    begin
      write(candidato, ' ');
      cont := cont + 1;
    end;
    candidato := candidato + 1;
  end;
  writeln;
end;

// -------------------------------------------------------------------
// 2.19. Procedimiento: Serie de Collatz para un número dado.
// Muestra toda la secuencia hasta 1.
// Ejemplo: SerieCollatz(6) -> 6 -> 3 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1.
// -------------------------------------------------------------------
procedure Serie_Collatz(n: integer);
begin
  if n <= 0 then Exit;
  while n <> 1 do
  begin
    write(n, ' -> ');
    n := Num_SiguienteCollatz(n);
  end;
  writeln(1);
end;

// -------------------------------------------------------------------
// 2.20. Función: Suma de los primeros n números triangulares.
// Ejemplo: SumaTriangulares(3) = 1 + 3 + 6 = 10.
// -------------------------------------------------------------------
function Serie_SumaTriangulares(n: integer): integer;
var
  i, suma, t: integer;
begin
  suma := 0;
  t := 0;
  i := 1;
  while i <= n do
  begin
    t := t + i;
    suma := suma + t;
    i := i + 1;
  end;
  Serie_SumaTriangulares := suma;
end;

// -------------------------------------------------------------------
// 2.21. Función: Producto de primeros n naturales (factorial).
// -------------------------------------------------------------------
function Serie_ProductoNaturales(n: integer): integer;
begin
  Serie_ProductoNaturales := Num_Factorial(n);
end;

// -------------------------------------------------------------------
// 2.22. Procedimiento: Potencias de 2: 1,2,4,8,...,2^(n-1).
// -------------------------------------------------------------------
procedure Serie_PotenciasDe2(n: integer);
var
  i, term: integer;
begin
  term := 1;
  i := 1;
  while i <= n do
  begin
    write(term, ' ');
    term := term * 2;
    i := i + 1;
  end;
  writeln;
end;

// -------------------------------------------------------------------
// 2.23. Procedimiento: Potencias de 3.
// -------------------------------------------------------------------
procedure Serie_PotenciasDe3(n: integer);
var
  i, term: integer;
begin
  term := 1;
  i := 1;
  while i <= n do
  begin
    write(term, ' ');
    term := term * 3;
    i := i + 1;
  end;
  writeln;
end;

// -------------------------------------------------------------------
// 2.24. Procedimiento: Primeros n términos pares de Fibonacci.
// -------------------------------------------------------------------
procedure Serie_FibonacciPares(n: integer);
var
  a, b, c, cont: integer;
begin
  a := 0; b := 1; cont := 0;
  while cont < n do
  begin
    if a mod 2 = 0 then
    begin
      write(a, ' ');
      cont := cont + 1;
    end;
    c := a + b;
    a := b;
    b := c;
  end;
  writeln;
end;

// -------------------------------------------------------------------
// 2.25. Función: Suma de primeros n términos pares de Fibonacci.
// -------------------------------------------------------------------
function Serie_SumaFibonacciPares(n: integer): integer;
var
  a, b, c, cont, suma: integer;
begin
  a := 0; b := 1; cont := 0; suma := 0;
  while cont < n do
  begin
    if a mod 2 = 0 then
    begin
      suma := suma + a;
      cont := cont + 1;
    end;
    c := a + b;
    a := b;
    b := c;
  end;
  Serie_SumaFibonacciPares := suma;
end;

// -------------------------------------------------------------------
// 2.26. Procedimiento: Números abundantes (primeros n).
// -------------------------------------------------------------------
procedure Serie_Abundantes(n: integer);
var
  cont, candidato: integer;
begin
  cont := 0;
  candidato := 1;
  while cont < n do
  begin
    if Num_EsAbundante(candidato) then
    begin
      write(candidato, ' ');
      cont := cont + 1;
    end;
    candidato := candidato + 1;
  end;
  writeln;
end;

// -------------------------------------------------------------------
// 2.27. Procedimiento: Números defectivos (primeros n).
// -------------------------------------------------------------------
procedure Serie_Defectivos(n: integer);
var
  cont, candidato: integer;
begin
  cont := 0;
  candidato := 1;
  while cont < n do
  begin
    if Num_EsDefectivo(candidato) then
    begin
      write(candidato, ' ');
      cont := cont + 1;
    end;
    candidato := candidato + 1;
  end;
  writeln;
end;

// -------------------------------------------------------------------
// 2.28. Procedimiento: Números de Harshad (primeros n).
// -------------------------------------------------------------------
procedure Serie_Harshad(n: integer);
var
  cont, candidato: integer;
begin
  cont := 0;
  candidato := 1;
  while cont < n do
  begin
    if Num_EsHarshad(candidato) then
    begin
      write(candidato, ' ');
      cont := cont + 1;
    end;
    candidato := candidato + 1;
  end;
  writeln;
end;

// -------------------------------------------------------------------
// 2.29. Procedimiento: Números de Smith (primeros n).
// -------------------------------------------------------------------
procedure Serie_Smith(n: integer);
var
  cont, candidato: integer;
begin
  cont := 0;
  candidato := 4;   // El primer Smith es 4
  while cont < n do
  begin
    if Num_EsSmith(candidato) then
    begin
      write(candidato, ' ');
      cont := cont + 1;
    end;
    candidato := candidato + 1;
  end;
  writeln;
end;

// -------------------------------------------------------------------
// 2.30 a 2.50: Más series.
// -------------------------------------------------------------------

// 2.30. Serie pentagonales: n(3n-1)/2.
procedure Serie_Pentagonales(n: integer);
var
  i, p: integer;
begin
  i := 1;
  while i <= n do
  begin
    p := i * (3 * i - 1) div 2;
    write(p, ' ');
    i := i + 1;
  end;
  writeln;
end;

// 2.31. Serie hexagonales: n(2n-1).
procedure Serie_Hexagonales(n: integer);
var
  i, h: integer;
begin
  i := 1;
  while i <= n do
  begin
    h := i * (2 * i - 1);
    write(h, ' ');
    i := i + 1;
  end;
  writeln;
end;

// 2.32. Serie de Mersenne: 2^n - 1.
procedure Serie_Mersenne(n: integer);
var
  i, m: integer;
begin
  i := 1;
  while i <= n do
  begin
    m := Num_Potencia(2, i) - 1;
    write(m, ' ');
    i := i + 1;
  end;
  writeln;
end;

// 2.33. Serie de Fermat: 2^(2^n) + 1 (solo primeros términos).
procedure Serie_Fermat(n: integer);
var
  i, f: integer;
begin
  i := 0;
  while i < n do
  begin
    f := Num_Potencia(2, Num_Potencia(2, i)) + 1;
    write(f, ' ');
    i := i + 1;
  end;
  writeln;
end;

// Función auxiliar para números de Catalan.
function Num_CatalanAux(n: integer): integer;
begin
  if n = 0 then
    Num_CatalanAux := 1
  else
    Num_CatalanAux := (2 * (2 * n - 1) * Num_CatalanAux(n - 1)) div (n + 1);
end;
// 2.34. Serie de Catalan.
procedure Serie_Catalan(n: integer);
var
  i: integer;
begin
  i := 0;
  while i < n do
  begin
    write(Num_CatalanAux(i), ' ');
    i := i + 1;
  end;
  writeln;
end;

// 2.35. Suma de potencias de 2.
function Serie_SumaPotenciasDe2(n: integer): integer;
var
  i, term, suma: integer;
begin
  term := 1;
  suma := 0;
  i := 1;
  while i <= n do
  begin
    suma := suma + term;
    term := term * 2;
    i := i + 1;
  end;
  Serie_SumaPotenciasDe2 := suma;
end;

// 2.36. Suma de potencias de 3.
function Serie_SumaPotenciasDe3(n: integer): integer;
var
  i, term, suma: integer;
begin
  term := 1;
  suma := 0;
  i := 1;
  while i <= n do
  begin
    suma := suma + term;
    term := term * 3;
    i := i + 1;
  end;
  Serie_SumaPotenciasDe3 := suma;
end;

// 2.37. Suma de naturales.
function Serie_SumaDeNaturales(n: integer): integer;
var
  i, s: integer;
begin
  s := 0;
  i := 1;
  while i <= n do
  begin
    s := s + i;
    i := i + 1;
  end;
  Serie_SumaDeNaturales := s;
end;

// 2.38. Suma de cuadrados.
function Serie_SumaDeCuadrados(n: integer): integer;
var
  i, s: integer;
begin
  s := 0;
  i := 1;
  while i <= n do
  begin
    s := s + i * i;
    i := i + 1;
  end;
  Serie_SumaDeCuadrados := s;
end;

// 2.39. Suma de cubos.
function Serie_SumaDeCubos(n: integer): integer;
var
  i, s: integer;
begin
  s := 0;
  i := 1;
  while i <= n do
  begin
    s := s + i * i * i;
    i := i + 1;
  end;
  Serie_SumaDeCubos := s;
end;

// Función auxiliar para determinar si un número es cuadrado perfecto.
function Num_EsCuadradoPerfecto(x: integer): boolean;
var
  r: integer;
begin
  r := 1;
  while r * r < x do
    r := r + 1;
  Num_EsCuadradoPerfecto := (r * r = x);
end;

// 2.40. Serie de números triangulares y cuadrados (cuadrados triangulares).
procedure Serie_TriangularesCuadrados(n: integer);
var
  cont, i, t: integer;
begin
  cont := 0;
  i := 1;
  while cont < n do
  begin
    t := i * (i + 1) div 2;
    if Num_EsCuadradoPerfecto(t) then
    begin
      write(t, ' ');
      cont := cont + 1;
    end;
    i := i + 1;
  end;
  writeln;
end;

// 2.41. Serie de números de Fibonacci impares.
procedure Serie_FibonacciImpares(n: integer);
var
  a, b, c, cont: integer;
begin
  a := 0; b := 1; cont := 0;
  while cont < n do
  begin
    if a mod 2 <> 0 then
    begin
      write(a, ' ');
      cont := cont + 1;
    end;
    c := a + b;
    a := b;
    b := c;
  end;
  writeln;
end;

// 2.42. Serie de números de Fibonacci que son primos.
procedure Serie_FibonacciPrimos(n: integer);
var
  a, b, c, cont: integer;
begin
  a := 0; b := 1; cont := 0;
  while cont < n do
  begin
    if Num_EsPrimo(a) and (a > 1) then
    begin
      write(a, ' ');
      cont := cont + 1;
    end;
    c := a + b;
    a := b;
    b := c;
  end;
  writeln;
end;

// 2.43. Serie de números de la forma n*(n+1) (números oblongos).
procedure Serie_Oblongos(n: integer);
var
  i: integer;
begin
  i := 1;
  while i <= n do
  begin
    write(i * (i + 1), ' ');
    i := i + 1;
  end;
  writeln;
end;

// 2.44. Serie de números de Fibonacci alternados: F1, F3, F5,...
procedure Serie_FibonacciAlternado(n: integer);
var
  a, b, c, i, pos: integer;
begin
  a := 0; b := 1; pos := 1; i := 0;
  while i < n do
  begin
    if pos mod 2 = 1 then
    begin
      write(a, ' ');
      i := i + 1;
    end;
    c := a + b;
    a := b;
    b := c;
    pos := pos + 1;
  end;
  writeln;
end;

// 2.45. Serie de números de la suerte (solo dígitos 4 y 7) hasta n términos.
// Ya existe como 2.16.

// 2.46. Serie de números capicúas.
procedure Serie_Capicuas(n: integer);
var
  cont, candidato: integer;
begin
  cont := 0;
  candidato := 1;
  while cont < n do
  begin
    if Num_EsCapicua(candidato) then
    begin
      write(candidato, ' ');
      cont := cont + 1;
    end;
    candidato := candidato + 1;
  end;
  writeln;
end;

// 2.47. Producto de los primeros n números pares.
function Serie_ProductoPares(n: integer): integer;
var
  prod, i, par: integer;
begin
  prod := 1;
  i := 1;
  par := 2;
  while i <= n do
  begin
    prod := prod * par;
    par := par + 2;
    i := i + 1;
  end;
  Serie_ProductoPares := prod;
end;

// 2.48. Producto de los primeros n números impares.
function Serie_ProductoImpares(n: integer): integer;
var
  prod, i, impar: integer;
begin
  prod := 1;
  i := 1;
  impar := 1;
  while i <= n do
  begin
    prod := prod * impar;
    impar := impar + 2;
    i := i + 1;
  end;
  Serie_ProductoImpares := prod;
end;

// 2.49. Serie de factoriales dobles: n!! = n*(n-2)*... hasta 1 o 2.
procedure Serie_DobleFactorial(n: integer);
begin
  // No implementamos por complejidad, pero mostramos los primeros factoriales.
  Serie_Factoriales(n);
end;

// 2.50. Serie de números de Armstrong (narcisistas).
procedure Serie_Armstrong(n: integer);
var
  cont, candidato: integer;
begin
  cont := 0;
  candidato := 1;
  while cont < n do
  begin
    if Num_EsArmstrong(candidato) then
    begin
      write(candidato, ' ');
      cont := cont + 1;
    end;
    candidato := candidato + 1;
  end;
  writeln;
end;

// ===================================================================
// ==================== PARTE 3: EJERCICIOS CON CADENAS ==============
// ==================== (50+ ejercicios) =============================
// ===================================================================

// -------------------------------------------------------------------
// 3.1. Función: Longitud de una cadena (versión manual).
// -------------------------------------------------------------------
function Cad_Longitud(cad: string): integer;
begin
  // En Pascal, las cadenas tienen longitud conocida; devolvemos Length().
  Cad_Longitud := Length(cad);
end;

// -------------------------------------------------------------------
// 3.2. Procedimiento: Invertir cadena (imprime al revés).
// -------------------------------------------------------------------
procedure Cad_Invertir(cad: string);
var
  i: integer;
begin
  i := Length(cad);
  while i >= 1 do
  begin
    write(cad[i]);
    i := i - 1;
  end;
  writeln;
end;

// -------------------------------------------------------------------
// 3.3. Función: Retorna la cadena invertida.
// -------------------------------------------------------------------
function Cad_Reversa(cad: string): string;
var
  res: string;
  i: integer;
begin
  res := '';
  i := Length(cad);
  while i >= 1 do
  begin
    res := res + cad[i];
    i := i - 1;
  end;
  Cad_Reversa := res;
end;

// -------------------------------------------------------------------
// 3.4. Función: ¿Es palíndromo?
// -------------------------------------------------------------------
function Cad_EsPalindromo(cad: string): boolean;
var
  i, j: integer;
begin
  i := 1;
  j := Length(cad);
  while i < j do
  begin
    if cad[i] <> cad[j] then
    begin
      Cad_EsPalindromo := false;
      Exit;
    end;
    i := i + 1;
    j := j - 1;
  end;
  Cad_EsPalindromo := true;
end;

// -------------------------------------------------------------------
// 3.5. Función: Contar vocales (mayúsculas y minúsculas).
// -------------------------------------------------------------------
function Cad_ContarVocales(cad: string): integer;
var
  i, cont: integer;
  ch: char;
begin
  cont := 0;
  i := 1;
  while i <= Length(cad) do
  begin
    ch := cad[i];
    if (ch = 'a') or (ch = 'e') or (ch = 'i') or (ch = 'o') or (ch = 'u') or
       (ch = 'A') or (ch = 'E') or (ch = 'I') or (ch = 'O') or (ch = 'U') then
      cont := cont + 1;
    i := i + 1;
  end;
  Cad_ContarVocales := cont;
end;

// -------------------------------------------------------------------
// 3.6. Función: Contar consonantes (solo letras que no son vocales).
// -------------------------------------------------------------------
function Cad_ContarConsonantes(cad: string): integer;
var
  i, cont: integer;
  ch: char;
begin
  cont := 0;
  i := 1;
  while i <= Length(cad) do
  begin
    ch := cad[i];
    if ((ch >= 'a') and (ch <= 'z')) or ((ch >= 'A') and (ch <= 'Z')) then
      if not ((ch = 'a') or (ch = 'e') or (ch = 'i') or (ch = 'o') or (ch = 'u') or
              (ch = 'A') or (ch = 'E') or (ch = 'I') or (ch = 'O') or (ch = 'U')) then
        cont := cont + 1;
    i := i + 1;
  end;
  Cad_ContarConsonantes := cont;
end;

// -------------------------------------------------------------------
// 3.7. Función: Contar dígitos (0-9) en la cadena.
// -------------------------------------------------------------------
function Cad_ContarDigitos(cad: string): integer;
var
  i, cont: integer;
begin
  cont := 0;
  i := 1;
  while i <= Length(cad) do
  begin
    if (cad[i] >= '0') and (cad[i] <= '9') then
      cont := cont + 1;
    i := i + 1;
  end;
  Cad_ContarDigitos := cont;
end;

// -------------------------------------------------------------------
// 3.8. Función: Contar espacios en blanco.
// -------------------------------------------------------------------
function Cad_ContarEspacios(cad: string): integer;
var
  i, cont: integer;
begin
  cont := 0;
  i := 1;
  while i <= Length(cad) do
  begin
    if cad[i] = ' ' then
      cont := cont + 1;
    i := i + 1;
  end;
  Cad_ContarEspacios := cont;
end;

// -------------------------------------------------------------------
// 3.9. Procedimiento: Convertir cadena a mayúsculas (modifica original).
// -------------------------------------------------------------------
procedure Cad_Mayusculas(var cad: string);
var
  i: integer;
begin
  i := 1;
  while i <= Length(cad) do
  begin
    if (cad[i] >= 'a') and (cad[i] <= 'z') then
      cad[i] := Chr(Ord(cad[i]) - 32);
    i := i + 1;
  end;
end;

// -------------------------------------------------------------------
// 3.10. Procedimiento: Convertir cadena a minúsculas.
// -------------------------------------------------------------------
procedure Cad_Minusculas(var cad: string);
var
  i: integer;
begin
  i := 1;
  while i <= Length(cad) do
  begin
    if (cad[i] >= 'A') and (cad[i] <= 'Z') then
      cad[i] := Chr(Ord(cad[i]) + 32);
    i := i + 1;
  end;
end;

// -------------------------------------------------------------------
// 3.11. Función: Contar ocurrencias de un carácter específico.
// -------------------------------------------------------------------
function Cad_ContarCaracter(cad: string; c: char): integer;
var
  i, cont: integer;
begin
  cont := 0;
  i := 1;
  while i <= Length(cad) do
  begin
    if cad[i] = c then
      cont := cont + 1;
    i := i + 1;
  end;
  Cad_ContarCaracter := cont;
end;

// -------------------------------------------------------------------
// 3.12. Procedimiento: Eliminar todos los espacios.
// -------------------------------------------------------------------
procedure Cad_EliminarEspacios(var cad: string);
var
  i: integer;
  temp: string;
begin
  temp := '';
  i := 1;
  while i <= Length(cad) do
  begin
    if cad[i] <> ' ' then
      temp := temp + cad[i];
    i := i + 1;
  end;
  cad := temp;
end;

// -------------------------------------------------------------------
// 3.13. Procedimiento: Reemplazar un carácter por otro.
// -------------------------------------------------------------------
procedure Cad_Reemplazar(var cad: string; viejo, nuevo: char);
var
  i: integer;
begin
  i := 1;
  while i <= Length(cad) do
  begin
    if cad[i] = viejo then
      cad[i] := nuevo;
    i := i + 1;
  end;
end;

// -------------------------------------------------------------------
// 3.14. Función: Comparar dos cadenas (iguales o no).
// -------------------------------------------------------------------
function Cad_Iguales(cad1, cad2: string): boolean;
var
  i: integer;
begin
  if Length(cad1) <> Length(cad2) then
  begin
    Cad_Iguales := false;
    Exit;
  end;
  i := 1;
  while i <= Length(cad1) do
  begin
    if cad1[i] <> cad2[i] then
    begin
      Cad_Iguales := false;
      Exit;
    end;
    i := i + 1;
  end;
  Cad_Iguales := true;
end;

// -------------------------------------------------------------------
// 3.15. Función: Concatenar dos cadenas.
// -------------------------------------------------------------------
function Cad_Concatenar(cad1, cad2: string): string;
var
  res: string;
  i: integer;
begin
  res := '';
  i := 1;
  while i <= Length(cad1) do
  begin
    res := res + cad1[i];
    i := i + 1;
  end;
  i := 1;
  while i <= Length(cad2) do
  begin
    res := res + cad2[i];
    i := i + 1;
  end;
  Cad_Concatenar := res;
end;

// -------------------------------------------------------------------
// 3.16. Función: Extraer subcadena desde posición p de longitud l.
// -------------------------------------------------------------------
function Cad_Subcadena(cad: string; p, l: integer): string;
var
  res: string;
  i, fin: integer;
begin
  res := '';
  if p < 1 then p := 1;
  fin := p + l - 1;
  if fin > Length(cad) then fin := Length(cad);
  i := p;
  while i <= fin do
  begin
    res := res + cad[i];
    i := i + 1;
  end;
  Cad_Subcadena := res;
end;

// -------------------------------------------------------------------
// 3.17. Función: Posición de la primera aparición de un carácter.
// Retorna 0 si no existe.
// -------------------------------------------------------------------
function Cad_PosicionCaracter(cad: string; c: char): integer;
var
  i: integer;
begin
  i := 1;
  while i <= Length(cad) do
  begin
    if cad[i] = c then
    begin
      Cad_PosicionCaracter := i;
      Exit;
    end;
    i := i + 1;
  end;
  Cad_PosicionCaracter := 0;
end;

// -------------------------------------------------------------------
// 3.18. Función: ¿La cadena contiene solo dígitos?
// -------------------------------------------------------------------
function Cad_EsNumerica(cad: string): boolean;
var
  i: integer;
begin
  if cad = '' then
  begin
    Cad_EsNumerica := false;
    Exit;
  end;
  i := 1;
  while i <= Length(cad) do
  begin
    if not (cad[i] in ['0'..'9']) then
    begin
      Cad_EsNumerica := false;
      Exit;
    end;
    i := i + 1;
  end;
  Cad_EsNumerica := true;
end;

// -------------------------------------------------------------------
// 3.19. Función: Convertir cadena numérica a entero.
// -------------------------------------------------------------------
function Cad_ToInt(cad: string): integer;
var
  i, num: integer;
begin
  num := 0;
  i := 1;
  while i <= Length(cad) do
  begin
    if (cad[i] >= '0') and (cad[i] <= '9') then
      num := num * 10 + (Ord(cad[i]) - Ord('0'));
    i := i + 1;
  end;
  Cad_ToInt := num;
end;

// -------------------------------------------------------------------
// 3.20. Función: Convertir entero positivo a cadena (sin signo).
// -------------------------------------------------------------------
function Cad_FromInt(n: integer): string;
var
  res, aux: string;
  dig: integer;
begin
  if n = 0 then
  begin
    Cad_FromInt := '0';
    Exit;
  end;
  res := '';
  if n < 0 then
    n := -n;
  while n > 0 do
  begin
    dig := n mod 10;
    res := res + Chr(dig + Ord('0'));
    n := n div 10;
  end;
  // Invertimos res porque se construyó al revés.
  aux := '';
  while Length(res) > 0 do
  begin
    aux := aux + res[Length(res)];
    Delete(res, Length(res), 1);
  end;
  Cad_FromInt := aux;
end;

// -------------------------------------------------------------------
// 3.21. Procedimiento: Capitalizar primera letra de cada palabra.
// -------------------------------------------------------------------
procedure Cad_Capitalizar(var cad: string);
var
  i: integer;
  mayus: boolean;
begin
  mayus := true;
  i := 1;
  while i <= Length(cad) do
  begin
    if cad[i] = ' ' then
      mayus := true
    else if mayus then
    begin
      if (cad[i] >= 'a') and (cad[i] <= 'z') then
        cad[i] := Chr(Ord(cad[i]) - 32);
      mayus := false;
    end;
    i := i + 1;
  end;
end;

// -------------------------------------------------------------------
// 3.22. Función: Contar palabras (separadas por espacios).
// -------------------------------------------------------------------
function Cad_ContarPalabras(cad: string): integer;
var
  i, cont: integer;
  enPalabra: boolean;
begin
  cont := 0;
  enPalabra := false;
  i := 1;
  while i <= Length(cad) do
  begin
    if cad[i] <> ' ' then
    begin
      if not enPalabra then
      begin
        cont := cont + 1;
        enPalabra := true;
      end;
    end
    else
      enPalabra := false;
    i := i + 1;
  end;
  Cad_ContarPalabras := cont;
end;

// -------------------------------------------------------------------
// 3.23. Procedimiento: Eliminar caracteres repetidos consecutivos.
// Ejemplo: "hhoolaa" -> "hola".
// -------------------------------------------------------------------
procedure Cad_EliminarRepetidos(var cad: string);
var
  i: integer;
  res: string;
begin
  if cad = '' then Exit;
  res := cad[1];
  i := 2;
  while i <= Length(cad) do
  begin
    if cad[i] <> cad[i-1] then
      res := res + cad[i];
    i := i + 1;
  end;
  cad := res;
end;

// -------------------------------------------------------------------
// 3.24. Función: Contar caracteres alfabéticos (letras).
// -------------------------------------------------------------------
function Cad_ContarLetras(cad: string): integer;
var
  i, cont: integer;
begin
  cont := 0;
  i := 1;
  while i <= Length(cad) do
  begin
    if ((cad[i] >= 'A') and (cad[i] <= 'Z')) or ((cad[i] >= 'a') and (cad[i] <= 'z')) then
      cont := cont + 1;
    i := i + 1;
  end;
  Cad_ContarLetras := cont;
end;

// -------------------------------------------------------------------
// 3.25. Función: Rellenar a la izquierda con un carácter hasta longitud L.
// -------------------------------------------------------------------
function Cad_RellenarIzquierda(cad: string; L: integer; c: char): string;
begin
  while Length(cad) < L do
    cad := c + cad;
  Cad_RellenarIzquierda := cad;
end;

// -------------------------------------------------------------------
// 3.26. Función: Rellenar a la derecha.
// -------------------------------------------------------------------
function Cad_RellenarDerecha(cad: string; L: integer; c: char): string;
begin
  while Length(cad) < L do
    cad := cad + c;
  Cad_RellenarDerecha := cad;
end;

// -------------------------------------------------------------------
// 3.27. Función: Verificar si comienza con un prefijo.
// -------------------------------------------------------------------
function Cad_ComienzaCon(cad, prefijo: string): boolean;
var
  i: integer;
begin
  if Length(prefijo) > Length(cad) then
  begin
    Cad_ComienzaCon := false;
    Exit;
  end;
  i := 1;
  while i <= Length(prefijo) do
  begin
    if cad[i] <> prefijo[i] then
    begin
      Cad_ComienzaCon := false;
      Exit;
    end;
    i := i + 1;
  end;
  Cad_ComienzaCon := true;
end;

// -------------------------------------------------------------------
// 3.28. Función: Verificar si termina con un sufijo.
// -------------------------------------------------------------------
function Cad_TerminaCon(cad, sufijo: string): boolean;
var
  i, j: integer;
begin
  if Length(sufijo) > Length(cad) then
  begin
    Cad_TerminaCon := false;
    Exit;
  end;
  i := Length(cad);
  j := Length(sufijo);
  while j >= 1 do
  begin
    if cad[i] <> sufijo[j] then
    begin
      Cad_TerminaCon := false;
      Exit;
    end;
    i := i - 1;
    j := j - 1;
  end;
  Cad_TerminaCon := true;
end;

// -------------------------------------------------------------------
// 3.29. Procedimiento: Eliminar caracteres no alfabéticos.
// -------------------------------------------------------------------
procedure Cad_EliminarNoLetras(var cad: string);
var
  i: integer;
  res: string;
begin
  res := '';
  i := 1;
  while i <= Length(cad) do
  begin
    if ((cad[i] >= 'A') and (cad[i] <= 'Z')) or ((cad[i] >= 'a') and (cad[i] <= 'z')) then
      res := res + cad[i];
    i := i + 1;
  end;
  cad := res;
end;

// -------------------------------------------------------------------
// 3.30. Procedimiento: Convertir a "LeetSpeak" básico (a=4, e=3, i=1, o=0).
// -------------------------------------------------------------------
procedure Cad_LeetSpeak(var cad: string);
var
  i: integer;
begin
  i := 1;
  while i <= Length(cad) do
  begin
    case cad[i] of
      'a', 'A': cad[i] := '4';
      'e', 'E': cad[i] := '3';
      'i', 'I': cad[i] := '1';
      'o', 'O': cad[i] := '0';
    end;
    i := i + 1;
  end;
end;

// -------------------------------------------------------------------
// 3.31. Función: Contar mayúsculas.
// -------------------------------------------------------------------
function Cad_ContarMayusculas(cad: string): integer;
var
  i, cont: integer;
begin
  cont := 0;
  i := 1;
  while i <= Length(cad) do
  begin
    if (cad[i] >= 'A') and (cad[i] <= 'Z') then
      cont := cont + 1;
    i := i + 1;
  end;
  Cad_ContarMayusculas := cont;
end;

// -------------------------------------------------------------------
// 3.32. Función: Contar minúsculas.
// -------------------------------------------------------------------
function Cad_ContarMinusculas(cad: string): integer;
var
  i, cont: integer;
begin
  cont := 0;
  i := 1;
  while i <= Length(cad) do
  begin
    if (cad[i] >= 'a') and (cad[i] <= 'z') then
      cont := cont + 1;
    i := i + 1;
  end;
  Cad_ContarMinusculas := cont;
end;

// -------------------------------------------------------------------
// 3.33. Procedimiento: Rotar a la izquierda (primer carácter al final).
// -------------------------------------------------------------------
procedure Cad_RotarIzquierda(var cad: string);
var
  primero: char;
  i: integer;
begin
  if cad = '' then Exit;
  primero := cad[1];
  i := 2;
  while i <= Length(cad) do
  begin
    cad[i-1] := cad[i];
    i := i + 1;
  end;
  cad[Length(cad)] := primero;
end;

// -------------------------------------------------------------------
// 3.34. Procedimiento: Rotar a la derecha (último carácter al principio).
// -------------------------------------------------------------------
procedure Cad_RotarDerecha(var cad: string);
var
  ultimo: char;
  i: integer;
begin
  if cad = '' then Exit;
  ultimo := cad[Length(cad)];
  i := Length(cad);
  while i > 1 do
  begin
    cad[i] := cad[i-1];
    i := i - 1;
  end;
  cad[1] := ultimo;
end;

// -------------------------------------------------------------------
// 3.35. Función: Espejo de cadena (cad + reversa).
// -------------------------------------------------------------------
function Cad_Espejo(cad: string): string;
begin
  Cad_Espejo := cad + Cad_Reversa(cad);
end;

// -------------------------------------------------------------------
// 3.36. Función: Contar signos de puntuación básicos (.,;:!?).
// -------------------------------------------------------------------
function Cad_ContarPuntuacion(cad: string): integer;
var
  i, cont: integer;
begin
  cont := 0;
  i := 1;
  while i <= Length(cad) do
  begin
    if cad[i] in ['.', ',', ';', ':', '!', '?'] then
      cont := cont + 1;
    i := i + 1;
  end;
  Cad_ContarPuntuacion := cont;
end;

// -------------------------------------------------------------------
// 3.37. Procedimiento: Eliminar vocales de la cadena.
// -------------------------------------------------------------------
procedure Cad_EliminarVocales(var cad: string);
var
  i: integer;
  res: string;
begin
  res := '';
  i := 1;
  while i <= Length(cad) do
  begin
    if not (cad[i] in ['a','e','i','o','u','A','E','I','O','U']) then
      res := res + cad[i];
    i := i + 1;
  end;
  cad := res;
end;

// -------------------------------------------------------------------
// 3.38. Procedimiento: Duplicar cada carácter de la cadena.
// Ejemplo: "abc" -> "aabbcc".
// -------------------------------------------------------------------
procedure Cad_DuplicarCaracteres(var cad: string);
var
  res: string;
  i: integer;
begin
  res := '';
  i := 1;
  while i <= Length(cad) do
  begin
    res := res + cad[i] + cad[i];
    i := i + 1;
  end;
  cad := res;
end;

// -------------------------------------------------------------------
// 3.39. Función: ¿La cadena es binaria (solo '0' y '1')?
// -------------------------------------------------------------------
function Cad_EsBinaria(cad: string): boolean;
var
  i: integer;
begin
  i := 1;
  while i <= Length(cad) do
  begin
    if not (cad[i] in ['0','1']) then
    begin
      Cad_EsBinaria := false;
      Exit;
    end;
    i := i + 1;
  end;
  Cad_EsBinaria := true;
end;

// -------------------------------------------------------------------
// 3.40. Función: ¿Es hexadecimal? (0-9, A-F, a-f).
// -------------------------------------------------------------------
function Cad_EsHexadecimal(cad: string): boolean;
var
  i: integer;
  ch: char;
begin
  i := 1;
  while i <= Length(cad) do
  begin
    ch := cad[i];
    if not (((ch >= '0') and (ch <= '9')) or
            ((ch >= 'A') and (ch <= 'F')) or
            ((ch >= 'a') and (ch <= 'f'))) then
    begin
      Cad_EsHexadecimal := false;
      Exit;
    end;
    i := i + 1;
  end;
  Cad_EsHexadecimal := true;
end;

// -------------------------------------------------------------------
// 3.41. Procedimiento: Imprimir cadena al revés (igual a 3.2).
// -------------------------------------------------------------------
procedure Cad_ImprimirAlReves(cad: string);
begin
  Cad_Invertir(cad);
end;

// -------------------------------------------------------------------
// 3.42. Procedimiento: Eliminar espacios (ya existe 3.12).
// -------------------------------------------------------------------
procedure Cad_SinEspacios(var cad: string);
begin
  Cad_EliminarEspacios(cad);
end;

// -------------------------------------------------------------------
// 3.43. Función: Valor numérico de cadena (ya existe 3.19).
// -------------------------------------------------------------------
function Cad_ValorNumerico(cad: string): integer;
begin
  Cad_ValorNumerico := Cad_ToInt(cad);
end;

// -------------------------------------------------------------------
// 3.44. Procedimiento: Reemplazar vocales por '*'.
// -------------------------------------------------------------------
procedure Cad_OcultarVocales(var cad: string);
var
  i: integer;
begin
  i := 1;
  while i <= Length(cad) do
  begin
    if cad[i] in ['a','e','i','o','u','A','E','I','O','U'] then
      cad[i] := '*';
    i := i + 1;
  end;
end;

// -------------------------------------------------------------------
// 3.45. Función: Contar letras mayúsculas y minúsculas por separado.
// (Ya tenemos funciones individuales, esta devuelve ambas).
// -------------------------------------------------------------------
procedure Cad_ContarMayMin(cad: string; var may, min: integer);
begin
  may := Cad_ContarMayusculas(cad);
  min := Cad_ContarMinusculas(cad);
end;

// -------------------------------------------------------------------
// 3.46. Función: Eliminar caracteres en posiciones pares.
// -------------------------------------------------------------------
procedure Cad_EliminarPares(var cad: string);
var
  i: integer;
  res: string;
begin
  res := '';
  i := 1;
  while i <= Length(cad) do
  begin
    if i mod 2 = 1 then
      res := res + cad[i];
    i := i + 1;
  end;
  cad := res;
end;

// -------------------------------------------------------------------
// 3.47. Función: Eliminar caracteres en posiciones impares.
// -------------------------------------------------------------------
procedure Cad_EliminarImpares(var cad: string);
var
  i: integer;
  res: string;
begin
  res := '';
  i := 1;
  while i <= Length(cad) do
  begin
    if i mod 2 = 0 then
      res := res + cad[i];
    i := i + 1;
  end;
  cad := res;
end;

// -------------------------------------------------------------------
// 3.48. Función: Intercambiar mayúsculas por minúsculas (swap case).
// -------------------------------------------------------------------
procedure Cad_SwapCase(var cad: string);
var
  i: integer;
begin
  i := 1;
  while i <= Length(cad) do
  begin
    if (cad[i] >= 'A') and (cad[i] <= 'Z') then
      cad[i] := Chr(Ord(cad[i]) + 32)
    else if (cad[i] >= 'a') and (cad[i] <= 'z') then
      cad[i] := Chr(Ord(cad[i]) - 32);
    i := i + 1;
  end;
end;

// -------------------------------------------------------------------
// 3.49. Función: Contar cuántas veces aparece una subcadena (sin superposición).
// -------------------------------------------------------------------
function Cad_ContarSubcadena(cad, sub: string): integer;
var
  i, cont, lenSub: integer;
begin
  cont := 0;
  lenSub := Length(sub);
  if lenSub = 0 then
  begin
    Cad_ContarSubcadena := 0;
    Exit;
  end;
  i := 1;
  while i <= Length(cad) - lenSub + 1 do
  begin
    if Cad_Subcadena(cad, i, lenSub) = sub then
    begin
      cont := cont + 1;
      i := i + lenSub;   // Saltamos para no contar superposiciones.
    end
    else
      i := i + 1;
  end;
  Cad_ContarSubcadena := cont;
end;

// -------------------------------------------------------------------
// 3.50. Procedimiento: Mostrar la cadena en formato "espejo invertido".
// Ejemplo: "hola" -> "hola aloh".
// -------------------------------------------------------------------
procedure Cad_MostrarEspejo(cad: string);
begin
  writeln(cad, ' ', Cad_Reversa(cad));
end;

// ===================================================================
// ===================== PROGRAMA PRINCIPAL ==========================
// ===================================================================
var
  num: integer;
  cad: string;
  a, b: integer;
begin
  // ================================================================
  // TODAS LAS LLAMADAS ESTÁN COMENTADAS. DESCOMENTA LA QUE QUIERAS.
  // ================================================================

  // ---- EJEMPLOS DE NÚMEROS ----
  {
  num := 28;
  writeln('¿28 es perfecto? ', Num_EsPerfecto(num));
  }

  {
  num := 153;
  writeln('¿153 es Armstrong? ', Num_EsArmstrong(num));
  }

  {
  num := 12321;
  writeln('¿12321 es capicúa? ', Num_EsCapicua(num));
  }

  {
  num := 6;
  Serie_Collatz(num);
  }

  // ---- EJEMPLOS DE SERIES ----
  {
  writeln('Primeros 10 Fibonacci: ');
  Serie_Fibonacci(10);
  }

  {
  writeln('Números primos primeros 5: ');
  Serie_Primos(5);
  }

  {
  writeln('Números perfectos primeros 3: ');
  Serie_Perfectos(3);
  }

  // ---- EJEMPLOS DE CADENAS ----
  {
  cad := 'Anita lava la tina';
  writeln('¿Palíndromo? ', Cad_EsPalindromo(cad));
  }

  {
  cad := 'Hola Mundo';
  Cad_Mayusculas(cad);
  writeln('Mayúsculas: ', cad);
  }

  {
  cad := 'Este es un ejemplo';
  Cad_Capitalizar(cad);
  writeln('Capitalizado: ', cad);
  }

  // Para evitar que la consola se cierre inmediatamente.
  writeln('Presiona Enter para salir...');
  readln;
end.
