# lexical-analysis-using-lex-and-yacc
Designing a lexical and syntax analyzer for my own programming language using lex and yacc.

Substantially, the main goal of this project is preparing my own programming language and setting its rules. Lex and yacc is used for checking the correctness of syntax analysis according to my "myprog.mpl" file. In addition, semantic rules are not considered, just syntax rules are given.

myprogram.l --> Lex file  
myprogram.y --> Yacc file  
myprogram.mpl --> A code snippet from my own programming language (Its syntax belongs to me)

All the descriptions about the code can be found in the relevant pdf file.

Note: This project is built on Ubuntu v16.04.

To test the code, follow the steps below:  
$ lex mpl.l  
$ yacc mpl.y  
$ gcc -o mpl y.tab.c -lfl  
$ ./mpl < myprog.mpl  

In the last step, if there is no syntax error in "myprog.mpl", the program should give an "This is a correct form of your programming language!" message which you can edit. Otherwise it generates an error.
