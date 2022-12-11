#!/bin/bash
. /home/luisana/Escritorio/test-git-2130074/codigos/Ejercicio6/ejercicio5.sh #se le agrega la direccion para que mande a llamar el ejercicio5 ya que es necesario

validfloat()
{
  fvalue="$1"

  if [ ! -z $(echo $fvalue | sed 's/[^.]//g') ] ; then

    decimalPart="$(echo $fvalue | cut -d. -f1)"

    fractionalPart="${fvalue#*\.}"

    if [ ! -z $decimalPart ] ; then
      if ! validint "$decimalPart" "" "" ; then
        return 1
      fi
    fi

    if [ "${fractionalPart%${fractionalPart#?}}" = "-" ] ; then
      echo "Invalid floating-point number: '-' not allowed \
        after decimal point" >&2
      return 1
    fi
    if [ "$fractionalPart" != "" ] ; then
      if ! validint "$fractionalPart" "0" "" ; then
        return 1
      fi
    fi
  else
    if [ "$fvalue" = "-" ] ; then
      echo "Invalid floating-point format." >&2 ; return 1
    fi
    if ! validint "$fvalue" "" "" ; then
      return 1
    fi
  fi

  return 0
}

if validfloat $1 ; then
  echo "$1 is a valid floating-point value"
fi

exit 0
