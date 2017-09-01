# File::      <tt>common/redhat.pp</tt>
# Author::    UL HPC Team (hpc-sysadmins@uni.lu)
# Copyright:: Copyright (c) 2017 UL HPC Team
# License::   Apache-2.0
#
# ------------------------------------------------------------------------------
# = Class: slurm::common::redhat
#
# Specialization class for Redhat systems
class slurm::common::redhat inherits slurm::common {

  include ::epel
  include ::yum

  yum::group { $slurm::params::groupinstall:
    ensure  => 'present',
    timeout => 600,
    require => Class['::epel'],
  }

  # Resource default statements
  Package {
    require => Yum::Group[$slurm::params::groupinstall],
  }

}
