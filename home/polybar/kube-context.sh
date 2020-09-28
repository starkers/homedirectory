#!/bin/sh


FOO="$(/home/starkers/.software/bin/kubectl config current-context 2>&1)"

RC="$?"

if [ ! "X${RC}" == X0 ]; then
  echo kube: no cluster
else
  echo kube: ${FOO}
fi

