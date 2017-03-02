#!/bin/bash

. `dirname $0`/demo.conf

PUSHD $WORK_DIR
    rm -fr cluster

    for i in host1 host2
    do
        mkdir -p cluster/$i/standalone
        cp -r jboss-eap-6.4/standalone/* cluster/$i/standalone

        PUSHD cluster/$i/standalone
            rm -fr data servers log tmp
        POPD
    done
POPD

echo
echo "Run each of the following commands in a separate terminal:"
echo
echo jboss-eap-6.4/bin/standalone.sh -c standalone-full-ha.xml -Djboss.server.base.dir=cluster/host1/standalone -Djboss.socket.binding.port-offset=100 -Djboss.node.name=host1
echo jboss-eap-6.4/bin/standalone.sh -c standalone-full-ha.xml -Djboss.server.base.dir=cluster/host2/standalone -Djboss.socket.binding.port-offset=200 -Djboss.node.name=host2
echo
