# bindings for https://github.com/maxmind/geoip-api-c

use NativeCall :ALL;

class GeoIP:auth<github:bbkr>:ver<1.0.2> is repr( 'CPointer' ) is export {

    enum Types is export (
        GEOIP_CITY_EDITION_REV1 => 2,
        GEOIP_CITY_EDITION_REV1_V6 => 30
    );
    
    class Record is repr( 'CStruct' ) is export {
        has Str $.country_code;
        has Str $.country_code3;
        has Str $.country_name;
        has Str $.region;
        has Str $.city;
        has Str $.postal_code;
        has num32 $.latitude;
        has num32 $.longitude;
        has int32 $.dma_code;
        has int32 $.area_code;
        has int32 $.charset;
        has Str $.continent_code;
        has int32 $.netmask;
    }

    
    sub libgeoip ( ) {
        
        # library location may be given as environment variable
        return $_ with %*ENV{ 'PERL6_LIBGEOIP' };
        
        # environment default 
        return guess_library_name( ( 'GeoIP', v1 ) );
    }

    sub GeoIP_setup_custom_directory ( CArray[ uint8 ] ) is native( &libgeoip ) is export { * }
    sub GeoIP_db_avail( int32 ) returns int32 is native( &libgeoip ) is export { * }
    sub GeoIP_open_type ( int32, int32 ) returns GeoIP is native( &libgeoip ) is export { * }
    sub GeoIP_set_charset ( GeoIP, int32 ) returns int32 is native( &libgeoip ) is export { * }
    sub GeoIP_database_info ( GeoIP ) returns Str is native( &libgeoip ) is export { * }
    sub GeoIP_record_by_addr ( GeoIP, Str ) returns Record is native( &libgeoip ) is export { * }
    sub GeoIP_record_by_addr_v6 ( GeoIP, Str ) returns Record is native( &libgeoip ) is export { * }
    sub GeoIP_region_name_by_code ( Str, Str ) returns Str is native( &libgeoip ) is export { * }
    sub GeoIP_time_zone_by_country_and_region ( Str, Str ) returns Str is native( &libgeoip ) is export { * }
    sub GeoIP_cleanup ( ) returns int32 is native( &libgeoip ) is export { * }
}
