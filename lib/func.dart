


void enter_number({required num x,required List L})
{

L.add(x);

}

// when selecting the operation this function will
num next_number({required String c ,required List L})
{



  num x=0;

  for(int i = 0; i < L.length ;i++)
  {
    x= (x*10) + L[i];

  }
  L.clear();
  return x;
}

List fill({required num n})
{

  List L=[];

int x=10;
  while( n != 0 )
    {
      L.add(n % x * 10 / x);
      n=n- (n % x);
      x=x*10;


    }
 L=L.reversed.toList();
  return L;
}








void clear({required String c,required List L})
{
if(c == 'ac') // clear all caracters
{
L.clear();
}
else
   // c = 'c' // clear one caracter
{

L.removeLast();

}

}



num equal({required String op ,required num a , required List L})
{

  List L1=L;
if(op == '+')
  {
    return a + next_number(c: '=', L: L1);
  }
 else if (op == '-')
   {
     return a - next_number(c: '=', L: L1);
   }
 else if (op == '*')
 {
   return a * next_number(c: '=', L: L1);
 }
 else if( op == '/')
   {
     return num.parse((a / next_number(c: '=', L: L1)).toStringAsFixed(2));
   }
 else
 {
   return a % next_number(c: '=', L: L1);
 }

}