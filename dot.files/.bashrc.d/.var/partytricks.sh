#!/bin/sh

# https://climagic.org/coolstuff/let-it-snow.html
let-it-snow(){

  clear;
  while :;
  do
    echo $LINES $COLUMNS $(($RANDOM%$COLUMNS));
    sleep 0.1;
  done|gawk '{a[$3]=0;for(x in a) {o=a[x];a[x]=a[x]+1;printf "\033[%s;%sH ",o,x;printf "\033[%s;%sH*\033[0;0H",a[x],x;}}'

}

let-it-snow-big(){

  clear;
  while :;
  do
    echo $LINES $COLUMNS $(($RANDOM%$COLUMNS)) $(printf "\u2744\n");
    sleep 0.1;
  done|gawk '{a[$3]=0;for(x in a) {o=a[x];a[x]=a[x]+1;printf "\033[%s;%sH ",o,x;printf "\033[%s;%sH%s \033[0;0H",a[x],x,$4;}}'

}

let-ti-snow-multichar(){
  F=( . "*" . "*" "*" o x O X );
  for((I=0;J=--I;))
  do
    clear;
    for((D=LINES;S=++J**3%COLUMNS,--D;))
    do
      printf %*s${F[$(( $S % 6 ))]}\\n $S;
    done;
    sleep .2;
  done
}

let-it-snow-perl() {
  yes $COLUMNS $LINES|pv -qL50|perl -ne'$|=1;($c,$r)=split;$s||=$"x($c*$r);print$s;$s=$"x$c.$s;substr$s,rand$c,1,"*";$s=substr$s,0,$c*$r+$c;'
}

let-it-snow-small(){
  for((I=0;J=--I;))do clear;for((D=LINES;S=++J**3%COLUMNS,--D;))do printf %*s.\\n $S;done;sleep 1;done
}
################################################################################