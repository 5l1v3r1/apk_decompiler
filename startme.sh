PRG="$0"
while [ -h "$PRG" ] ; do
  ls=`ls -ld "$PRG"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '/.*' > /dev/null; then
    PRG="$link"
  else
    PRG=`dirname "$PRG"`/"$link"
  fi
done
PRGDIR=`dirname "$PRG"`
if [ -z "$1" ]
then
   echo "apk_decompiler example;"
   echo "usage: apk_decompiler [apk file]"
else
   "$PRGDIR/d2j-dex2jar.sh" $1  -o "$1.jar" 
    java -jar "$PRGDIR/cfr_0_115.jar" "$1.jar" --outputdir "$1.out"
    rm "$1.jar"
fi

