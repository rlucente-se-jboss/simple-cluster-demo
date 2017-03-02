#!/bin/bash

. `dirname $0`/demo.conf

PUSHD ${WORK_DIR}

  echo
  echo -n "Do you want to delete existing installations? <y/N> "
  read answer

  if [ "x$answer" = "xY" -o "x$answer" = "xy" ]
  then
    ./clean.sh
  fi
 
  echo -n "Install with installer app? <y/N> "
  read answer

  echo
  echo -n "Installing EAP ... "
  if [ "x$sanswer" = "xY" -o "x$answer" = "xy" ]
  then
    sed "s,_PUT_INSTALL_PATH_HERE_,${JBOSS_HOME},g" auto.xml.orig > auto.xml
    java -jar ${BIN_DIR}/jboss-eap-${VER_DIST_EAP}-installer.jar auto.xml -variablefile auto.xml.variables 2>&1 > /dev/null
  else
    unzip -q ${BIN_DIR}/jboss-eap-${VER_DIST_EAP}.zip
    ${JBOSS_HOME}/bin/add-user.sh --password 'admin1jboss!' --user admin --realm ManagementRealm --silent
  fi
  echo "[ OK ]"

  MINOR_RELEASE=`echo ${VER_PATCH_EAP} | rev | cut -d. -f2- | rev`
  CUMUL_RELEASE=`echo ${VER_PATCH_EAP} | rev | cut -d. -f1 | rev`

  if [ ${CUMUL_RELEASE} -gt 9 ]
  then
    echo -n "Applying patch ${MINOR_RELEASE}.9 ... "
    $JBOSS_HOME/bin/jboss-cli.sh --command="patch apply --override-all ${BIN_DIR}/jboss-eap-${MINOR_RELEASE}.9-patch.zip" 2>&1 > /dev/null
    echo "[ OK ]"
  fi

  echo -n "Applying patch ${VER_PATCH_EAP} ... "
  $JBOSS_HOME/bin/jboss-cli.sh --command="patch apply --override-all ${BIN_DIR}/jboss-eap-${VER_PATCH_EAP}-patch.zip" 2>&1 > /dev/null
  echo "[ OK ]"

  echo
POPD
