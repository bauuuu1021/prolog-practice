# Prolog practice
contributed by <`bauuuu1021`><br>
* All input number in these problems should end up with a `.`
* Excute `$ sudo apt-get install swi-prolog` in terminal to setup environment
## Problem 1
Input a even integer that larger than 2. Output two primes that sum of them is input.
* [algorithm reference](https://stackoverflow.com/questions/5281779/c-how-to-test-easily-if-it-is-prime-number?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa)
## Problem 2
Input relationship and query, output the lowest common ancestor.
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
Input edges of graph and query, output whether the query pair is connected or not.
* Use `connect(X,Y)` to represent X is connected to Y.
    * The result may be incorrect. <br>
    eg : 1 is connected to 2, 2 is connected to 3. So 1 should be connected with 3. But in this method, the result would be not connected.
    * Solution : add condition  `connect(X,Y):-connect(X,Z),connect(Z,Y).`
    * But it doesn't work if the distance is larger than 2.<br>
    eg : 1 is connected to 2, 2 is connected to 3, 3 is connected to 4. 1 and 4 are connected but can't detect.
    * The max distance to detect is limited.
* Use `group(X,Index)` to represent group index of `X` is `Index`
    * Nodes with same index number are connected.
    * Nodes with different index number, but they should be connected
        * Sol 1 : change index number of either t another one's
            * Couldn't find proper method to implement
        * Sol 2 : connect(index1,index2)
            * May face the same problem as `connect(X,Y)`