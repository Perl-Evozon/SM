use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";
use Test::More qw(no_plan);

use Chargemonk::Test::Mechanize;


my $uri = '/admin/gateway';

my $mech = Chargemonk::Test::Mechanize->new( catalyst_app => 'Chargemonk' );
$mech->post( '/login', {email => '___test_admin', password => '___test_admin'}, 'Valid login' );
$mech->get_ok($uri);

# we are on the admin page now, yoohoo
$mech->base_like(qr/$uri/);

# existing gateways are there
$mech->content_contains('braintree');
$mech->content_contains('google_checkout');
$mech->content_contains('stripe');

# change default gateway
$mech->post( $uri, {selected_gateway => 'braintree'} );

$mech->get($uri);

# braintree is default now
$mech->content_contains('value="braintree" checked="true"');
