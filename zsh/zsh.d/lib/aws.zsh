#!/bin/zsh

export JAVA_HOME=${JAVA_HOME:-$(/usr/libexec/java_home)}
export EC2_HOME=${HOME}/local/ec2-api-tools
export AWS_CLOUDFORMATION_HOME=${HOME}/local/cloud-formation
export EC2_AMITOOL_HOME=${HOME}/local/ec2-ami-tools
export EC2_ELASTIC_BEANSTALK_HOME=${HOME}/local/aws-elasticbeanstalk

export PATH=${EC2_HOME}/bin:${AWS_CLOUDFORMATION_HOME}/bin:${EC2_AMITOOL_HOME}/bin:${EC2_ELASTIC_BEANSTALK_HOME}/eb/macosx/python2.7:$PATH
