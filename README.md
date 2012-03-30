#GeoIP

Connect to MaxMind GeoIP database from Perl6.

##INFO

This is just proof-of-concept, currently working only on Mac OS X with GeoLiteCity free database.

##REQUIREMENTS

Install [NativeCall](https://github.com/jnthn/zavolaj).

Install GeoIP library and database from macports.

```bash
sudo port install libgeoip GeoLiteCity
```

##USAGE

```perl
use GeoIP;
my $g = GeoIP.new;

say $g.country_code_by_addr('91.192.78.63');
```

If everything is installed correctly it should print ```PL```.


##TODO

Everything :)
