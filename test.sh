#! /bin/sh

BINDIR=$(dirname $0)
NOMFILE="${BINDIR}/nominal.txt"
RESFILE="${BINDIR}/result.txt"
NUM=42
NT=0

seq 1 ${NUM} | perl -aple 's/(\d+)/(($1%3?"":"Fizz").($1%5?"":"Buzz"))||$1/e' > ${NOMFILE}

for I in $(find $BINDIR -maxdepth 1 -mindepth 1 -type d -not -name ".*"); do
    rm -f ${RESFILE}

    #build if makefile provided?
    if [ -f ${I}/Makefile ]; then
        LNAME=$(make -C ${I} -s name 2>/dev/null)
        make -C $I -s exe 1>/dev/null 2>&1 || continue
    fi

    if [ -f ${I}/fizzbuzz ]; then
        chmod +x ${I}/fizzbuzz
    else
        NT=$(expr ${NT} + 1)
        echo "not ok ${NT} - no executable found @${I}"
        continue
    fi

    ${I}/fizzbuzz ${NUM} > ${RESFILE}
    if diff -q ${RESFILE} ${NOMFILE}; then
        NT=$(expr ${NT} + 1)
        echo "ok ${NT} - ${I}"
        continue
    fi

    NT=$(expr ${NT} + 1)
    echo "not ok ${NT} - ${I} make it wrong"
done
rm -f ${RESFILE} ${NOMFILE}

echo "1..${NT}"
