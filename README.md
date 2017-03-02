# Simple Cluster Demo

## Prerequisites

Before running the command:

    ./install.sh

make sure that `demo.conf` contains the correct settings and that
the binaries are available in the `dist` directory.  The `README.md`
file in that directory lists what files are needed.

## Install a base EAP environment

Simply run the command:

    ./install.sh

To use the quickstarts, make sure to use the installer option since
it will install the various quickstarts.

## Simple Cluster Demo using Domain Mode

The simple cluster demo uses domain mode and port offsets to run
* Domain Controller
* Host1 with ServerA at http://localhost:8180/
* Host2 with ServerB at http://localhost:8280/

### Setup Clustering

To install it, simply type:

    ./setup-cluster-domain-demo.sh

This will provide the commands to start the domain controller and
the two host controllers.  Open three separate terminal windows and
issue each of the listed commands in its own window.

### Deploy the Application

Deploy the example cluster application by browsing to the domain
controller:

    http://localhost:9990

Use the credentials `admin/admin1jboss!` to login as an administrator.
Click on the `Deployments` tab and then click the `Add` button.
Browse to the resources directory for this demo and select the file
`cluster_test.war`.  Click `Next` and then `Save`.

Select the `cluster_test.war` in the table on the `Deployments` tab
then click the `Assign` button.  Check the box to add the application
to server group `group-station`, make sure that `Enable cluster_test.war`
is checked, and click the `Save` button.

The application will be deployed within each server as shown in the
separate terminal windows.

### Test the Application

Open the following URLs in two separate browser windows.  Each time
you hit refresh, the global count will increase by one.

    http://localhost:8180/cluster_test
    http://localhost:8280/cluster_test

## Simple Cluster Demo using Standalone Mode

The simple cluster demo uses standalone mode and port offsets to run
* Server 'host1' at http://localhost:8180/
* Server 'host2' at http://localhost:8280/

### Setup Clustering

To install it, simply type:

    ./setup-cluster-standalone-demo.sh

This will provide the commands to start the two application servers.
Open two separate terminal windows and issue each of the listed
commands in its own window.

### Deploy the Application

Deploy the example cluster application by browsing to each server
separately:

    http://localhost:10090
    http://localhost:10190

Use the credentials `admin/admin1jboss!` to login as an administrator.
Click on the `Deployments` tab and then click the `Add` button.
Browse to the resources directory for this demo and select the file
`cluster_test.war`.  Make sure that the `Enable` box is checked and
then Click `Next`.  Finally, click `Save`.

### Test the Application

Open the following URLs in two separate browser windows.  Each time
you hit refresh, the global count will increase by one.

    http://localhost:8180/cluster_test
    http://localhost:8280/cluster_test

## Clean everything up

To reset everything back to a clean slate, use the command

    ./clean.sh

