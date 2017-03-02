#!/bin/bash

. `dirname $0`/demo.conf

PUSHD $WORK_DIR
    rm -fr cluster

    for i in domain host1 host2
    do
        mkdir -p cluster/$i
        cp -r jboss-eap-6.4/domain/* cluster/$i

        cp resources/$i/* cluster/$i/configuration

        PUSHD cluster/$i
            rm -fr data servers log tmp
        POPD
    done
POPD

echo
echo "Run each of the following commands in a separate terminal:"
echo
echo jboss-eap-6.4/bin/domain.sh --host-config=host-master.xml -Djboss.domain.base.dir=cluster/domain
echo jboss-eap-6.4/bin/domain.sh --host-config=host-slave.xml -Djboss.domain.base.dir=cluster/host1 -Djboss.domain.master.address=127.0.0.1
echo jboss-eap-6.4/bin/domain.sh --host-config=host-slave.xml -Djboss.domain.base.dir=cluster/host2 -Djboss.domain.master.address=127.0.0.1
echo
