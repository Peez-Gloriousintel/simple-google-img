# Simple-Google-Img

Simple Google Image is a simple perl module created by applying Google REST API with Perl in order to search for images from a keyword.

### Dependencies
* REST Google 1.0.8 or similar
* JSON 2.90 or similar

### Usage
```
use GoImgMod;
...
@results = GoImgMod::getImgURL($keyword);
...
```
### Example
```
perl example.pl -s/tmp/test -n3 "pokemon"
```
