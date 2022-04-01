echo 'Removing old files...'

rm -rfv lex.* y.* switch

echo 'Building files...'

flex switch.l &&
bison -yd switch.y && 
gcc lex.yy.c y.tab.c -o switch &&

echo 'Running File...' &&

./switch