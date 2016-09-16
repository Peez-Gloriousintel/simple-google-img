#
# @author: pj4dev.mit@gmail.com
#
package GoImgMod;

use base 'Exporter';
our @EXPORT = qw/getImgURL/;

use REST::Google;
use REST::Google::Search::Images;
use JSON;

sub getImgURL {
	my $query =  shift @_;
	# set service to use
	REST::Google->service('http://ajax.googleapis.com/ajax/services/search/web');
	# provide a valid http referer
	REST::Google->http_referer('http://www.google.com');
	my $res = REST::Google::Search::Images->new(
	        q => "$query",
	);
	print "Connect status from Google API = " . $res->responseStatus . "\n";
	return undef if $res->responseStatus != 200;
	my @urls = ();
	foreach my $result (@{$res->{responseData}->{results}}){
 		push @urls, $result->{url};
	}
	# return URLs
	return @urls;
}
