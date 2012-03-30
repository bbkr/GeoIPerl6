class GeoIP;

use NativeCall;

has OpaquePointer $!db;

sub GeoIP_new ( Int ) returns OpaquePointer is native( '/opt/local/lib/libGeoIP.dylib' ) { * }
sub GeoIP_country_code_by_addr ( OpaquePointer, Str ) returns Str is native( '/opt/local/lib/libGeoIP.dylib' ) { * }

submethod BUILD {
    $!db = GeoIP_new( 0 );
}

method country_code_by_addr ( Str $ip ){
    return GeoIP_country_code_by_addr( $!db, $ip );
}
