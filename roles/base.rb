name "base"
description "Base Chef node role"

attrs = {
  :collectd => {
    :use_fqdn => false,
    :hostname => '%%HOSTNAME%%',
    :interval => 60
  },
  :collectd_librato => {
    :api_token => "",
    :email => ""
  },
}

default_attributes(attrs)

run_list(["recipe[apt]",
          "recipe[misc::github_whitelist]",
          "recipe[misc::apt_upgrade]",
          "role[ssh]",
          "recipe[ec2::nodename]",
          "recipe[ec2::tools]",
          "recipe[ntp]",
          "recipe[postfix::forward]",
          "recipe[collectd]",
          "recipe[collectd-librato::build]",
          "recipe[misc::collectd]",
          "recipe[papertrail]",
          "recipe[basenode::setup_firstboot]"
          ])