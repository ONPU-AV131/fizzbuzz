#! /bin/sh

BINDIR=$(dirname $0)
NOMFILE="${BINDIR}/nominal.txt"
RESFILE="${BINDIR}/result.txt"
NUM=42
NT=0

seq 1 ${NUM} | perl -aple 's/(\d+)/(($1%3?"":"Fizz").($1%5?"":"Buzz"))||$1/e' > ${NOMFILE}

for I in $(find $BINDIR -maxdepth 1 -type d); do
    rm -f ${RESFILE}
    LNAME=$(make -C ${I} -s name 2>/dev/null)
    make -C $I -s exe 1>/dev/null 2>&1 || continue
    TYPE=$(file -b "${I}/fizzbuzz" | cut -d' ' -f1)
    if [ ${TYPE} != "ELF" ]; then
	NT=$(expr ${NT} + 1)
	echo "not ok ${NT} - ${LNAME} not ELF"
	continue
    fi
    ${I}/fizzbuzz ${NUM} > ${RESFILE}
    if diff -q ${RESFILE} ${NOMFILE}; then
	NT=$(expr ${NT} + 1)
	echo "ok ${NT} - ${LNAME}"
	continue
    fi

    NT=$(expr ${NT} + 1)
    echo "not ok ${NT} - ${LNAME} make it wrong"
done
rm -f ${RESFILE} ${NOMFILE}

echo "1..${NT}"
