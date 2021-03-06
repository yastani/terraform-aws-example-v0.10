#--------------------------------------------------------------
# Common - Key
# Terraform 0.10.2 ではproviderでconditionを書けないので一旦この形にしている
#--------------------------------------------------------------
variable "key" {
  type = "map"

  default = {
    # default
    default.credentials_profile = "default"

    # prod
    prod.credentials_profile = "prod"

    # stage
    stage.credentials_profile = "stage"
  }
}

#--------------------------------------------------------------
# Common - Region
#--------------------------------------------------------------
variable "region" {
  type = "map"

  default = {
    default.region = "ap-northeast-1"
  }
}

#--------------------------------------------------------------
# Common - Prefix
#--------------------------------------------------------------
variable "prefix" {
  type = "map"

  default = {
    # prod
    prod.prefix = "prod-"

    # stage
    stage.prefix = "stage-"
  }
}

#--------------------------------------------------------------
# Common - Route53
#--------------------------------------------------------------
variable "route53" {
  type = "map"

  default = {
    # private

    ## local
    ### prod
    prod.zone_id = "ZXXXXX"

    ### stage
    stage.zone_id = "ZXXXXX"
  }
}

#--------------------------------------------------------------
# RDS
#--------------------------------------------------------------
variable "rds" {
  type = "map"

  default = {
    #--------------------------------------------------------------
    # backup retention period
    #--------------------------------------------------------------
    prod.backup_retention_period = 7

    default.backup_retention_period = 1

    #--------------------------------------------------------------
    # username
    #--------------------------------------------------------------
    default.username = "aurora_root"

    #--------------------------------------------------------------
    # instance count
    #--------------------------------------------------------------
    prod.count = 1

    stage.count    = 2

    #--------------------------------------------------------------
    # instance class
    #--------------------------------------------------------------
    prod.instance_class = "db.t2.small"

    stage.instance_class    = "db.r4.large"

    #--------------------------------------------------------------
    # maintenance window
    # Timezone is UTC
    #--------------------------------------------------------------
    default.preferred_maintenance_window = "Mon:05:00-Mon:08:00"

    #--------------------------------------------------------------
    # backup window
    # Timezone is UTC
    #--------------------------------------------------------------
    default.preferred_backup_window = "19:30-20:30"
  }
}

#--------------------------------------------------------------
# RDS - Parameter Group
#--------------------------------------------------------------
variable "parameter_group" {
  type = "map"

  default = {
    #--------------------------------------------------------------
    # db family
    #--------------------------------------------------------------
    default.db_family = "aurora5.6"

    #--------------------------------------------------------------
    # tx isolation
    #--------------------------------------------------------------
    default.tx_isolation = "READ-COMMITTED"

    #--------------------------------------------------------------
    # timezone
    #--------------------------------------------------------------
    default.timezone = "Asia/Tokyo"

    #--------------------------------------------------------------
    # auto commit
    #--------------------------------------------------------------
    prod.autocommit = 1

    default.autocommit = 1

    #--------------------------------------------------------------
    # innodb lock wait timeout
    #--------------------------------------------------------------
    prod.innodb_lock_wait_timeout = 10

    default.innodb_lock_wait_timeout = 10

    #--------------------------------------------------------------
    # innodb print all deadlocks
    #--------------------------------------------------------------
    prod.innodb_print_all_deadlocks = 1

    default.innodb_print_all_deadlocks = 1

    #--------------------------------------------------------------
    # interactive timeout
    #--------------------------------------------------------------
    prod.interactive_timeout = 60

    default.interactive_timeout = 60

    #--------------------------------------------------------------
    # max connections
    #--------------------------------------------------------------
    prod.max_connections = 16000

    default.max_connections = 16000

    #--------------------------------------------------------------
    # connect timeout
    #--------------------------------------------------------------
    prod.connect_timeout = 10

    default.connect_timeout = 10

    #--------------------------------------------------------------
    # wait timeout
    #--------------------------------------------------------------
    prod.wait_timeout = 60

    default.wait_timeout = 60

    #--------------------------------------------------------------
    # max allowed packet
    #--------------------------------------------------------------
    prod.max_allowed_packet = 1073741824

    default.max_allowed_packet = 1073741824

    #--------------------------------------------------------------
    # delayed insert timeout
    #--------------------------------------------------------------
    prod.delayed_insert_timeout = 300

    default.delayed_insert_timeout = 300
  }
}

#--------------------------------------------------------------
# Allow IP Addrs
#--------------------------------------------------------------
variable "all_ip_addrs" {
  default = "0.0.0.0/0"
}

variable "class_a_ip_addrs" {
  default = "10.0.0.0/8"
}
