#!/bin/bash

#
# Move to the directory containing this script so we can source the env.sh
# properties that follow
#
cd `dirname $0`

#
# Common properties shared by scripts
#
. env.sh

if [ -z "$VERBOSE_OPTION" ]; then
	exec_cmd "./target/$PROJECT -Djava.library.path=/usr/lib/x86_64-linux-gnu/jni"
else
	exec_cmd "./target/$PROJECT -Dprism.verbose=true -Djavafx.verbose=true -Djavafx.verbose=true -Djava.library.path=/usr/lib/x86_64-linux-gnu/jni"
fi
