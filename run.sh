#!/bin/bash
# . /environment

# Setup AnalysisBase environment in the event "$@" doesn't create a new shell
. /release_setup.sh

echo $PATH
echo "========= all set up. ============"
ls
"$@"
