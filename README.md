#GeoIP City

Connect to [MaxMind](http://www.maxmind.com/en/home) GeoIP City databases.

Compatible with Perl 6 [Rakudo](http://rakudo.org/) 2013.02+,

##REQUIREMENTS

####Ubuntu Linux

* In terminal enter `sudo apt-get install libgeoip1 geoip-database-contrib`

####Mac OS X

* Install [MacPorts](http://www.macports.org/).
* In terminal enter `sudo port install libgeoip GeoLiteCity`.
* Add `DYLD_LIBRARY_PATH=/opt/local/lib` to your `~/.profile` and relog.

####Microsoft Windows

?

####Other systems

* Follow [installation instructions](http://www.maxmind.com/en/installation?city=1) from MaxMind.

##USAGE

```perl
    use GeoIP::City;
    
    my $geo = GeoIP::City.new;
    
    say $geo.locate( 'bbkr.org' );
    say $geo.locate( '91.192.78.63' );
```

In both cases it should print following Hash:

```perl
    {
        "area_code" => 0,
        "city" => "Gdansk",
        "continent_code" => "EU",
        "country" => "Poland",
        "country_code" => "PL",
        "dma_code" => 0,
        "latitude" => "54.360802",
        "longitude" => "18.658300",
        "postal_code" => Str,
        "region" => "Pomorskie",
        "region_code" => "82",
        "time_zone" => "Europe/Warsaw"
    }
```

###Paid databases

If you own [paid database](http://www.maxmind.com/en/city) you can provide its location.

```perl
    my $geo = GeoIP::City.new( '/Users/bbkr/GeoIPCity.dat' );
```

###Info

You can get version and date of used database.

```perl
    say $geo.info;
```

Will print.

```
    GEO-533LITE 20110501 Build 1 Copyright (c) 2011 MaxMind Inc All Rights Reserved
```

## LICENSE

Released under [Artistic License 2.0](http://www.perlfoundation.org/artistic_license_2_0).

## CONTACT

You can find me (and many awesome people who helped me to develop this module)
on irc.freenode.net #perl6 channel as **bbkr**.
