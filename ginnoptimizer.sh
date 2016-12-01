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
}

function myRequest {
}

function setPersistentCnx {
}

function checkFlowControl {
}

function clusterDiscovery {
}

function databasesDiscovery {
}

function tablesDiscovery {
}

function optimizeTable {
}

function setTOI {
}

function setRSU {
}

function checkClusterState {
}

#main
