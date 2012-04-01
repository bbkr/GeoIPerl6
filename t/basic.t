BEGIN { @*INC.unshift('lib') }

use Test;
use GeoIP;

plan( 9 );

my $g;

lives_ok { $g = GeoIP.new }, 'initialize database';

is $g.country_code( 'perl.org' ), 'US', 'country_code found by host';
is $g.country_code( '207.171.7.63' ), 'US', 'country_code found by ip';
ok not $g.country_code( '0.0.0.0').defined, 'country_code missing';

is $g.country_code( 'perlgeek.de' ), 'DE', 'country_code found by host';
is $g.country_name( '213.95.10.24' ), 'Germany', 'country_name found ';
ok not $g.country_name( '0.0.0.0').defined, 'country_name missing';

is $g.continent_code( '91.192.78.63' ), 'EU', 'continent_code found by ip';
ok not $g.country_name( '0.0.0.0').defined, 'continent_code missing';

