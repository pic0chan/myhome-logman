#!/bin/bash

SERVICE_DIR=/etc/dummy-gen/service-dir.conf
BASEDIR_DUMMYLOG=/var/log/dummy

for service_dir in `cat $SERVICE_DIR`; do
  DUMMY_FILES=`ls -l $service_dir | awk '{print $9}'`
  for gz_logfile in `echo $DUMMY_FILES`; do
    service_name=`basename ${service_dir}`
    mkdir -p ${BASEDIR_DUMMYLOG}/${service_name}
    echo '' > ${BASEDIR_DUMMYLOG}/${service_name}/${service_name}
    zcat ${service_dir}/${gz_logfile} > ${BASEDIR_DUMMYLOG}/${service_name}/${service_name}
  done
done

