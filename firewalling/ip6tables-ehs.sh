#!/bin/bash

# Specify a drop policy (default drop)
ip6tables -P INPUT ACCEPT
ip6tables -P FORWARD ACCEPT
ip6tables -P OUTPUT ACCEPT

# Drop packets with Hop-by-Hop Options
ip6tables -A INPUT -m ipv6header --header  hop --soft  -j DROP
ip6tables -A OUTPUT -m ipv6header --header  hop --soft -j DROP
ip6tables -A FORWARD -m ipv6header --header  hop --soft  -j DROP

# Drop packets with Destination Options
ip6tables -A INPUT -m ipv6header --header  dst --soft  -j DROP
ip6tables -A OUTPUT -m ipv6header --header  dst --soft  -j DROP
ip6tables -A FORWARD -m ipv6header --header  dst --soft  -j DROP

# Drop packets with Routing Headers
ip6tables -A INPUT -m ipv6header --header  route --soft -j DROP
ip6tables -A OUTPUT -m ipv6header --header route --soft -j DROP
ip6tables -A FORWARD -m ipv6header --header route --soft -j DROP


# Allow packets that employ fragmentation
ip6tables -A INPUT -m ipv6header --header frag --soft  -j ACCEPT
ip6tables -A OUTPUT -m ipv6header --header frag --soft -j ACCEPT
ip6tables -A FORWARD -m ipv6header --header frag --soft -j ACCEPT

# Allow packets that employ IPsec AH
ip6tables -A INPUT -m ipv6header --header auth --soft -j ACCEPT
ip6tables -A OUTPUT -m ipv6header --header  auth --soft -j ACCEPT
ip6tables -A FORWARD -m ipv6header --header auth --soft -j ACCEPT

# Allow packets that employ IPsec ESP
ip6tables -A INPUT -m ipv6header --header esp --soft -j ACCEPT
ip6tables -A OUTPUT -m ipv6header --header esp --soft -j ACCEPT
ip6tables -A FORWARD -m ipv6header --header esp --soft -j ACCEPT


