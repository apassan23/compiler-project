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
chmod +x run.sh
./run.sh
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
