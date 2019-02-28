#!/bin/bash
propertyFile=$1

if [ "$propertyFile" == "" ]
  then
  echo "The property file is empty"
  exit 1
fi

. ${propertyFile}

beeline -u "${beeline_url}/${db_name}" –hiveconf i_table_name=${table_name} -f hql/select_table.hql

hadoop fs -ls /tmp/test/$env/

echo "Completed"
