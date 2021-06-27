#!/usr/bin/perl

@users = `ls -1 /usr/local/directadmin/data/users`;
chomp(@users);

foreach $users(@users){

        print "$users: 1602956378\n";

        #@domains = `cat /usr/local/directadmin/data/users/$users/domains.list`;
        #chomp(@domains);

        #foreach $domains(@domains){

        #        print "$domains\n";

        #}

        #print "\n";
}
