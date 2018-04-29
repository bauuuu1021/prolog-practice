# Prolog practice
contributed by <`bauuuu1021`><br>
* All input number in these problems should end up with a `.`
* Excute `$ sudo apt-get install swi-prolog` in terminal to setup environment
## Problem 1
* [algorithm reference](https://stackoverflow.com/questions/5281779/c-how-to-test-easily-if-it-is-prime-number?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa)
## Problem 2
* Use `assert()` to build relationship. eg: 
    ```
    assert(parent(A,B)),
    parent(A,X),
    writeln(X).     %output B
    ```
* To get the top element of the tree.
    * check parent(NewY,Y)
        * if parent(New,Y), Y isn't the top
        * else not(parent(NewY,Y)), Y reach the top
## Problem 3
* The max distance to detect is limited.
    * need a more proper algorithm 
>[color=green]To do