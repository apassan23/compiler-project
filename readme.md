# Compiler Project

A switch case parser created with `bison` and `flex`.

## Syntax of switch

```c++
switch(expression){
    case constant-expression:
        statement(s);
        break; // optional
    case constant-expression:
        statement(s);
        break; // optional
    // you can have any number of case statements.
    default:
        statement(s);
}
```

### Compiling from Source

Run the following commands:

```shell
flex switch.l
bison -yd switch.y
gcc lex.yy.c y.tab.c -o switch
```

For the running the file, you can:

- You can give input from `stdin`

  ```shell
  ./switch
  ```

- You can give a file

  ```shell
  ./switch <file-name>
  ```
