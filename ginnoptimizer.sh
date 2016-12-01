#!/usr/bin/bash

#algorithme :
#[+] getting arguments
#[+] Trying to connect to MySQL/MariaDB instance...OK
#[+] Getting databases...OK
#[+] Checking current Galera state... 
#  -> wsrep_ready status...OK
#  -> wsrep_cluster status...OK
#  -> wsrep_connected status...OK
#  -> wsrep_desync status...OK
#  -> wsrep_OSU_method status...OK
#[+] Getting list of tables in databases...OK
#[+] Enabling RSU mode...OK
#[+] Starting optimization on database1 database... 
#  -> wsrep_flow_control_paused status > 0.3...OK
#  -> optimizing tablename in progress...OK
#[+] Restoring TOI mode...OK
#[+] Getting list of all tables in database2 database...OK
#[+] Enabling RSU mode...OK
#[+] Starting optimization on database2 database... 
#  -> wsrep_flow_control_paused status > 0.3...OK
#  -> optimizing tablename1 in progress...OK
#  -> wsrep_flow_control_paused status > 0.3...OK
#  -> optimizing tablename2 in progress...OK
#[+] Restoring TOI mode...OK
#Done !

function setLog {
}

function getArgs {
  for i in "$@"
  do
    case $i in
        -v|--version)
        VERSION=1
        ;;
        -u=*|--user=*)
        USER="${i#*=}"
        ;;
        -p=*|--password=*)
        PASSWORD="${i#*=}"
        ;;
        -n=*|--nodes=*)
        NODES="${i#*=}"
        ;;
        -d=*|--databases=*)
        DATABASES="${i#*=}"
        ;;
        -c|--cluster)
        CLUSTER=1
        ;;
        -h|--help)
        HELP=1
        ;;
       *)
             # unknown option
       ;;
    esac
  done
}

function debug {

}

function myRequest {
}

function checkFlowControl {
}

function waitForEmptySlaveQueue {
        queue=1
        until [ "$queue" -eq 0 ]; do
            queue=$(mysql -u "$backupuser" -p"$backuppass" -ss -e "show global status like 'wsrep_local_recv_queue';" | awk '{ print $2 }')
            sleep 10
        done
}

function clusterDiscovery {
        queue=1
        until [ "$queue" -eq 0 ]; do
            queue=$(mysql -u "$backupuser" -p"$backuppass" -ss -e "show global status like 'wsrep_local_recv_queue';" | awk '{ print $2 }')
            sleep 10
        done
}

function databasesDiscovery {
        queue=1
        until [ "$queue" -eq 0 ]; do
            queue=$(mysql -u "$backupuser" -p"$backuppass" -ss -e "show databases;" | awk '{ print $2 }')
            sleep 10
        done
}

function tablesDiscovery {
        queue=1
        until [ "$queue" -eq 0 ]; do
            queue=$(mysql -u "$backupuser" -p"$backuppass" -ss -e "use $database; show tables;" | awk '{ print $2 }')
            sleep 10
        done
}

function optimizeTable {
}

function setTOI {
}

function setRSU {
}

function checkCNodeState {
}

#main
#getArgs

#checkNodeState

#if allnodes ClusterDiscovery
#else node
  #foreach node
    #if alldatabases databasesDiscovery
    #else databases
      #foreach database
        #if alltables tablesDiscovery
        #else tables
          #setRSU
          #foreach table
            #checkFlowControl
            #optimizeTable
      #waitForEmptySlaveQueue
      #setTOI
  #waitForEmptySlaveQueue
  #setTOI
