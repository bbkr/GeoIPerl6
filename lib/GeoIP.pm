use NativeCall;

class GeoIP is repr('CPointer');

# initialize database
sub GeoIP_new ( Int ) returns GeoIP is native( '/opt/local/lib/libGeoIP.dylib' ) { * }
sub GeoIP_set_charset (GeoIP, Int ) returns Int is native( '/opt/local/lib/libGeoIP.dylib' ) { * }

# HACK: obtain ID as intermediate level for calls
# because currently NativeCall segfaults on NULL pointers
sub GeoIP_id_by_addr ( GeoIP, Str ) returns Int is native( '/opt/local/lib/libGeoIP.dylib' ) { * }
sub GeoIP_id_by_name ( GeoIP, Str ) returns Int is native( '/opt/local/lib/libGeoIP.dylib' ) { * }

sub GeoIP_code_by_id( Int ) returns Str is native( '/opt/local/lib/libGeoIP.dylib' ) { * }
sub GeoIP_country_name_by_id( GeoIP, Int ) returns Str is encoded('utf8') is native( '/opt/local/lib/libGeoIP.dylib' ) { * };
sub GeoIP_name_by_id( Int ) returns Str is native( '/opt/local/lib/libGeoIP.dylib' ) { * };
sub GeoIP_continent_by_id( Int ) returns Str is native( '/opt/local/lib/libGeoIP.dylib' ) { * };

method new ( ) {
    my $g = GeoIP_new( 0 );
    
    # GeoIPCharset.GEOIP_CHARSET_UTF8 == 1
    GeoIP_set_charset( $g, 1 );
    
    return $g;
}

# avoid "_by_id"" or "_by_addr" suffixes from GeoIP.h
# and detect type using awesome Perl 6 signatures later
multi method id ( Str $ip where /^\d+\.\d+\.\d+\.\d+$/ ) {
    return GeoIP_id_by_addr( self, $ip );
}
multi method id ( Str $host ) {
    return GeoIP_id_by_name( self, $host );
}

method country_code ( $location ) {
    my $id = self.id( $location );
    
    return unless $id;
    return GeoIP_code_by_id( $id );
}

method country_name ( $location ) {
    my $id = self.id( $location );
    
    return unless $id;
    return GeoIP_country_name_by_id( self, $id );
}

method continent_code ( $location ) {
    my $id = self.id( $location );
    
    return unless $id;
    return GeoIP_continent_by_id( $id );
}