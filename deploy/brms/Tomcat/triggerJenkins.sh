#!/bin/bash

# triggers a Jenkins Job

wget --no-check-certificate 'https://brms-jenkins.rhev-ci-vms.eng.rdu2.redhat.com/buildByToken/build?job=6.2.x-daily-build&token=012345'
