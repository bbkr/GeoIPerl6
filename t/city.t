BEGIN @*INC.unshift( 'lib' );

use Test;
use GeoIP::City;

plan( 5 );

my $geo;

lives_ok { $geo = GeoIP::City.new }, 'initialize free database';

ok $geo.info ~~ /GEO .* LITE .* \d ** 8/, 'info';

ok $geo.locate( 'bbkr.org' ), 'located by host';
ok $geo.locate( '91.192.78.63' ), 'located by IP';

ok !$geo.locate( '' ), 'not located';
