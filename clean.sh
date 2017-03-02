#!/bin/bash

. `dirname $0`/demo.conf

PUSHD ${WORK_DIR}
  if [ -f jboss-eap-${VER_INST_EAP}/Uninstaller/uninstaller.jar ]
  then
    java -jar jboss-eap-${VER_INST_EAP}/Uninstaller/uninstaller.jar
  
    while [ -d jboss-eap-${VER_INST_EAP} ]
    do
      sleep 2
    done
  fi
  
  rm -fr jboss-eap-${VER_INST_EAP} cluster *.xml
POPD
