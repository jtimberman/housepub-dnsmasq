default['dnsmasq']['dhcp'].tap do |dhcp|
  dhcp['dhcp-range']     = "#{node['network']['default_interface']},10.13.37.100,10.13.37.254,12h"
  dhcp['interface']      = node['network']['default_interface']
  dhcp['dhcp-leasefile'] = case node['platform_family']
                           when 'rhel', 'fedora' then '/var/lib/dnsmasq/dnsmasq.leases'
                           when 'debian' then '/var/lib/misc/dnsmasq.leases'
                           end
end
