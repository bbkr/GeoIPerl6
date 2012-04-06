#GeoIP

![World](http://modules.perl6.org/logos/GeoIP.png)

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

say $g.country_code( '91.192.78.63' );
say $g.country_name( '91.192.78.63' );
say $g.continent_code( '91.192.78.63' );
```

If everything is installed correctly it should print:

```
PL
Poland
EU
```

Using host names is also allowed:

```perl
say $g.country_code( 'bbkr.org' );
```

##TODO

Everything :)

* other operating systems (waiting for [this issue](https://github.com/jnthn/zavolaj/issues/7) to be resolved)
* paid databases
* fetching whole record
* consistent interface
