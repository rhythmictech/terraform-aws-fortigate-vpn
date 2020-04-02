config vpn ipsec phase1-interface
 edit "${shortname}1"
  set interface "${wan_interface}"
  set dpd enable
  set local-gw ${customer_ip_address}
  set dhgrp 2
  set proposal aes128-sha1
  set keylife 28800
  set remote-gw ${tunnel1_address}
  set psksecret PSK1
  set dpd-retryinterval 10
  set comments "${account_name}<->${customer_name}1"
 next
end

config vpn ipsec phase2-interface
 edit "${shortname}1"
  set phase1name "${shortname}1"
  set proposal aes128-sha1
  set dhgrp 2
  set pfs enable
  set keylifeseconds 3600
 next
end

config system interface
 edit "${shortname}1"
  set vdom "root"
  set ip ${tunnel1_inside_address_customer} 255.255.255.255
  set allowaccess ping
  set type tunnel
  set tcp-mss 1379
  set remote-ip ${tunnel1_inside_address_amazon} 255.255.255.255
  set comments "${account_name}<->${customer_name}1"
  set interface "${wan_interface}"
 next
end

config router bgp
  config neighbor
    edit ${tunnel1_inside_address_amazon}
      set capability-graceful-restart enable
      set soft-reconfiguration enable
      set remote-as ${amazon_bgp_asn}
    next
  end
end

config vpn ipsec phase1-interface
edit "${shortname}2"
  set interface "${wan_interface}"
  set dpd enable
  set local-gw ${customer_ip_address}
  set dhgrp 2
  set proposal aes128-sha1
  set keylife 28800
  set remote-gw ${tunnel2_address}
  set psksecret PSK2
  set dpd-retryinterval 10
  set comments "${account_name}<->${customer_name}2"
 next
end

config vpn ipsec phase2-interface
 edit "${shortname}2"
  set phase1name "${shortname}2"
  set proposal aes128-sha1
  set dhgrp 2
  set pfs enable
  set keylifeseconds 3600
 next
end

config system interface
 edit "${shortname}2"
  set vdom "root"
  set ip ${tunnel2_inside_address_customer} 255.255.255.255
  set allowaccess ping
  set type tunnel
  set tcp-mss 1379
  set remote-ip ${tunnel2_inside_address_amazon} 255.255.255.255
  set interface "${wan_interface}"
  set description "${account_name}<->${customer_name}2"
 next
end

config router bgp
  config neighbor
    edit ${tunnel2_inside_address_amazon}
      set capability-graceful-restart enable
      set soft-reconfiguration enable
      set remote-as ${amazon_bgp_asn}
    next
  end
end
