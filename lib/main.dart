import 'package:calculator/func.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',

      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  num? Ans;
  bool Res=false;
  bool Res2=false;
  List num_list=[];
  num A=0;
  String? op;
  String? equation1  ;
  String? equation2 ;
  bool equ =false;
  num? result ;

  void memory(){
    reset_conditinaly();
    if(Ans != null )
    {
      if(equation1=='')
      {
        equation1="Ans";
        num_list=fill(n: Ans!);
      }
      else if(equation2 =='' && op!='')
      {
        equation2="Ans";
        num_list=fill(n: Ans!);
      }
    }
  }

  void memory_withop({required String c}){
    Res2=Res;
    reset_conditinaly();
    if(Res2)
    {
      memory();
      op='%';
      Res2=false;
    }
  }

  void reset_conditinaly(){

      if (Res==true)
      {
        clear(c: "ac", L: num_list);

        op='';
        A=0;
        equation2='';
        equation1='';
        Res=false;
        result=0;
        equ=false;
      }

  }

  @override

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       leading: IconButton(onPressed: (){},icon:
       Icon(Icons.settings ,color: Colors.white, size: 40,)),
       title: Text("calculator",),
       titleTextStyle: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),
centerTitle: true,

       backgroundColor: Colors.grey[900],
     ),
     backgroundColor: Colors.grey[900],
     body: Column(

children: [
  Container(
    height: 200,
    width: double.infinity,
    color: Colors.white10,
    
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${equation1 ?? ''}${op ?? ''}${equation2 ?? ''}",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40,color: Colors.white),),
            SizedBox(width: 10,)
          ],
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("${result ?? 0}",style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 80,color: Colors.yellowAccent),),
            SizedBox(width: 10,)
          ],
        ),
      ],
    ),
  ),
SizedBox(height: 20,),

Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Ink(
      height: 90,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.red,
      ),

      child: InkWell(
          splashColor: Colors.black54,
          borderRadius: BorderRadius.circular(50),
          onTap: (){
            setState(() {
              clear(c: 'ac', L: num_list);
              A=0;
              result=0;
              equation1='';
              equation2='';
              op='';
              equ=false;
            });


          },
          child: Center(
            child: Text("ac",style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),), )
      ),
    ),
    Ink(
      height: 90,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.redAccent,
      ),

      child: InkWell(
          splashColor: Colors.black54,
          borderRadius: BorderRadius.circular(50),
          onTap: (){

            setState(() {


              reset_conditinaly();
              if(num_list.isNotEmpty && !equ)
              {
                clear(c: 'c', L: num_list);
                equation1=equation1!.substring(0,equation1!.length-1);

              }
              else
              {
                if(( num_list.isEmpty ))
                {
                  op='';
                  equ=false;
                  num_list=fill(n: A);

                  A==0;
                }
                else
                  {
                    clear(c: 'c', L: num_list);
                    equation2=equation2!.substring(0,equation2!.length-1);
                    if(equation2=='')
                    {
                      num_list=[];
                    }
                  }
              }
            });
          },
          child: Center(
            child: Text("c",style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),), )
      ),
    ),
    Ink(
      height: 90,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey[200],
      ),

      child: InkWell(
          splashColor: Colors.black54,
          borderRadius: BorderRadius.circular(50),
          onTap: (){

            setState(() {
            memory_withop(c: '%');
              if(!num_list.isEmpty || A != 0)
              {
                op = '%';
                if(A == 0)
                {
                  A = next_number(c: '%', L: num_list);
                  num_list=[];

                }
                equ=true;

              }

            });
          },
          child: Center(
            child: Text("%",style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),), )
      )
    ),
    Ink(
      height: 90,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey[200],
      ),

      child: InkWell(
          splashColor: Colors.black54,
          borderRadius: BorderRadius.circular(50),
          onTap: (){
            setState(() {

              memory_withop(c: '/');
              if(!num_list.isEmpty || A != 0)
              {
              op = '/';
              if(A == 0)
              {
                A = next_number(c: '/', L: num_list);
              }
              equ=true;
              }
            });
          },
          child: Center(
            child: Text("÷",style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),), )
      ),
    ),
  ],
),

  SizedBox(height: 20,),



  Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Ink(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[200],
        ),

        child: InkWell(
            splashColor: Colors.black54,
            borderRadius: BorderRadius.circular(50),
            onTap: (){
              setState(() {
                reset_conditinaly();
                if(equation1!= "Ans" || op !='')
                {
                  enter_number(x: 7, L: num_list);
                  if(!equ)
                  {
                    if(equation1== null)
                    {
                      equation1='7';
                    }
                    else
                    {
                      equation1 = equation1! + '7';
                    }
                  }
                  else
                  {
                    if(equation2== null)
                    {
                      equation2='7';
                    }
                    else
                    {
                      equation2 = equation2! + '7';
                    }
                  }}
              });
            },
            child: Center(
              child: Text("7",style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),), )
        ),
      ),
      Ink(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[200],
        ),

        child: InkWell(

            splashColor: Colors.black54,
            borderRadius: BorderRadius.circular(50),
            onTap: (){
              setState(() {
                reset_conditinaly();
                if(equation1!= "Ans" || op !='')
                {enter_number(x: 8, L: num_list);

                if(!equ)
                {
                  if(equation1== null)
                  {
                    equation1='8';
                  }
                  else
                  {
                    equation1 = equation1! + '8';
                  }
                }
                else
                {
                  if(equation2== null)
                  {
                    equation2='8';
                  }
                  else
                  {
                    equation2 = equation2! + '8';
                  }
                } }

              });
            },
            child: Center(
              child: Text("8",style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),), )
        ),
      ),
      Ink(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[200],
        ),

        child: InkWell(
            splashColor: Colors.black54,
            borderRadius: BorderRadius.circular(50),
            onTap: (){
              setState(() {
                reset_conditinaly();
                if(equation1!= "Ans" || op !='')
                { enter_number(x: 9, L: num_list);
                if(!equ)
                {
                  if(equation1== null)
                  {
                    equation1='9';
                  }
                  else
                  {
                    equation1 = equation1! + '9';
                  }
                }
                else
                {
                  if(equation2== null)
                  {
                    equation2='9';
                  }
                  else
                  {
                    equation2 = equation2! + '9';
                  }
                } }

              });
            },
            child: Center(
              child: Text("9",style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),), )
        ),
      ),
      Ink(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[200],
        ),

        child: InkWell(
            splashColor: Colors.black54,
            borderRadius: BorderRadius.circular(50),
            onTap: (){
              setState(() {
                memory_withop(c: '*');
                if(!num_list.isEmpty || A != 0)
                {
                  op = '*';
                  if(A == 0)
                  {
                    A = next_number(c: '*', L: num_list);
                  }
                  equ=true;
                }
              });
            },
            child: Center(
              child: Text("x",style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),), )
        ),
      ),
    ],
  ),
  SizedBox(height: 20,),

  Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Ink(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[200],
        ),

        child: InkWell(
            splashColor: Colors.black54,
            borderRadius: BorderRadius.circular(50),
            onTap: (){
              setState(() {
                reset_conditinaly();
                if(equation1!= "Ans" || op !='')
                {  enter_number(x: 4, L: num_list);
                if(!equ)
                {
                  if(equation1== null)
                  {
                    equation1='4';
                  }
                  else
                  {
                    equation1 = equation1! + '4';
                  }
                }
                else
                {
                  if(equation2== null)
                  {
                    equation2='4';
                  }
                  else
                  {
                    equation2 = equation2! + '4';
                  }
                }}

              });

            },
            child: Center(
              child: Text("4",style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),), )
        ),
      ),
      Ink(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[200],
        ),

        child: InkWell(
            splashColor: Colors.black54,
            borderRadius: BorderRadius.circular(50),
            onTap: (){
              setState(() {
                reset_conditinaly();
                if(equation1!= "Ans" || op !='')
                {  enter_number(x: 5, L: num_list);
                if(!equ)
                {
                  if(equation1== null)
                  {
                    equation1='5';
                  }
                  else
                  {
                    equation1 = equation1! + '5';
                  }
                }
                else
                {
                  if(equation2== null)
                  {
                    equation2='5';
                  }
                  else
                  {
                    equation2 = equation2! + '5';
                  }
                }}

              });

            },
            child: Center(
              child: Text("5",style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),), )
        ),
      ),
      Ink(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[200],
        ),

        child: InkWell(
            splashColor: Colors.black54,
            borderRadius: BorderRadius.circular(50),
            onTap: (){
              setState(() {
                reset_conditinaly();
                if(equation1!= "Ans" || op !='')
                { enter_number(x: 6, L: num_list);
                if(!equ)
                {
                  if(equation1== null)
                  {
                    equation1='6';
                  }
                  else
                  {
                    equation1 = equation1! + '6';
                  }
                }
                else
                {
                  if(equation2== null)
                  {
                    equation2='6';
                  }
                  else
                  {
                    equation2 = equation2! + '6';
                  }
                } }

              });

            },
            child: Center(
              child: Text("6",style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),), )
        ),
      ),
      Ink(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[200],
        ),

        child: InkWell(
            splashColor: Colors.black54,
            borderRadius: BorderRadius.circular(50),
            onTap: (){
              setState(() {
                memory_withop(c: '-');
                if(!num_list.isEmpty || A != 0)
                {
                  op = '-';
                  if(A == 0)
                  {
                    A = next_number(c: '-', L: num_list);
                  }
                  equ=true;
                }
              });
            },
            child: Center(
              child: Text("-",style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),), )
        ),
      ),
    ],
  ),
  SizedBox(height: 20,),

  Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Ink(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[200],
        ),

        child: InkWell(
            splashColor: Colors.black54,
            borderRadius: BorderRadius.circular(50),
            onTap: (){
              setState(() {
                reset_conditinaly();
                if(equation1!= "Ans" || op !='')
                {  enter_number(x: 1, L: num_list);
                if(!equ)
                {
                  if(equation1== null)
                  {
                    equation1='1';
                  }
                  else
                  {
                    equation1 = equation1! + '1';
                  }
                }
                else
                {
                  if(equation2== null)
                  {
                    equation2='1';
                  }
                  else
                  {
                    equation2 = equation2! + '1';
                  }
                }}

              });

            },
            child: Center(
              child: Text("1",style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),), )
        ),
      ),
      Ink(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[200],
        ),

        child: InkWell(
            splashColor: Colors.black54,
            borderRadius: BorderRadius.circular(50),
            onTap: (){
              setState(() {
                reset_conditinaly();
                if(equation1!= "Ans" || op !='')
                {enter_number(x: 2, L: num_list);
                if(!equ)
                {
                  if(equation1!= "Ans")
                  { }
                  if(equation1== null)
                  {
                    equation1='2';
                  }
                  else
                  {
                    equation1 = equation1! + '2';
                  }
                }
                else
                {
                  if(equation2== null)
                  {
                    equation2='2';
                  }
                  else
                  {
                    equation2 = equation2! + '2';
                  }
                } }

              });

            },
            child: Center(
              child: Text("2",style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),), )
        ),
      ),
      Ink(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[200],
        ),

        child: InkWell(
            splashColor: Colors.black54,
            borderRadius: BorderRadius.circular(50),
            onTap: (){
              setState(() {
                reset_conditinaly();

                if(equation1!= "Ans" || op !='')
                {  enter_number(x: 3, L: num_list);
                if(!equ)
                {
                  if(equation1== null)
                  {
                    equation1='3';
                  }
                  else
                  {
                    equation1 = equation1! + '3';
                  }
                }
                else
                {
                  if(equation2== null)
                  {
                    equation2='3';
                  }
                  else
                  {
                    equation2 = equation2! + '3';
                  }
                }}

              });

            },
            child: Center(
              child: Text("3",style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),), )
        ),
      ),
      Ink(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[200],
        ),

        child: InkWell(
            splashColor: Colors.black54,
            borderRadius: BorderRadius.circular(50),
            onTap: (){
              setState(() {
                memory_withop(c: '+');
                if(!num_list.isEmpty || A != 0)
                {
                  op = '+';
                  if(A == 0)
                  {
                    A = next_number(c: '+', L: num_list);
                  }
                  equ=true;
                }
              });

            },
            child: Center(
              child: Text("+",style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),), )
        ),
      ),
    ],
  ),
  SizedBox(height: 20,),

  Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Ink(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[200],
        ),

        child: InkWell(
            splashColor: Colors.black54,
            borderRadius: BorderRadius.circular(50),
            onTap: (){
              setState(() {
              memory();
              });

            },
            child: Center(
              child: Text("ans",style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),), )
        ),
      ),
      Ink(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[200],
        ),

        child: InkWell(
            splashColor: Colors.black54,
            borderRadius: BorderRadius.circular(50),
            onTap: (){
              setState(() {
                reset_conditinaly();
                if(equation1!= "Ans" || op !='')
                  {
                enter_number(x: 0, L: num_list);
                if(!equ)
                {
                  if(equation1== null)
                  {
                    equation1='0';
                  }
                  else
                  {
                    equation1 = equation1! + '0';
                  }
                }
                else
                {
                  if(equation2== null)
                  {
                    equation2='0';
                  }
                  else
                  {
                    equation2 = equation2! + '0';
                  }
                }


                }
              });

            },
            child: Center(
              child: Text("0",style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),), )
        ),
      ),
      Ink(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[200],
        ),

        child: InkWell(
            splashColor: Colors.black54,
            borderRadius: BorderRadius.circular(50),
            onTap: (){},
            child: Center(
              child: Text(".",style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),), )
        ),
      ),
      Ink(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.amberAccent[700],
        ),

        child: InkWell(
            splashColor: Colors.black54,
            borderRadius: BorderRadius.circular(50),
            onTap: (){
              setState(() {

                if(op != null && num_list.isNotEmpty)
                {
                  result = equal(op: op!, a: A, L: num_list);
                  Res=true;
                  Ans=result;
                }
              });
            },
            child: Center(
              child: Text("=",style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),), )
        ),
      ),
    ],
  ),

],

     ),
   );
  }
}
