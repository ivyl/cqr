# CQR

## Description
Command-line QR code generator.

CQR enables you to create and display QR Codes right from command-line.

## Installation

`gem install cqr`

## Tools

### cqr

`cqr` - Console QR

```
Usage: cqr [options] TEXT
    -m, --margin=MARGIN              margin size in characters (default 4)
    -i, --no-invert                  don't invert colors (for black on white terminals)
    -h, --help                       display this message

for stdin input pass "-" as TEXT
```

### qrotp

`qrotp` - QR One Time Password


```
Usage: qrotp [options]
    -l, --label=LABEL                [required] displayed label
    -s, --secret=SECRET              [required] OTP secret
    -m, --margin=MARGIN              margin size in characters (default 4)
    -b, --[no-]base32                secret is base32 encoded (default is hexadecimal)
    -i, --no-invert                  don't invert colors (for black on white terminals)
    -e, --echo                       don't hide stdin
        --issuer=ISSUER              issuer of the secret
    -d, --digits=DIGITS              hotp/totp, default to totp
    -c, --counter=COUNTER            counter state, required with hotp
    -t, --type=TYPE                  hotp/totp, default to totp
    -h, --help                       display this message

for stdin input pass "-" as NAME/SECRET
```


## Mandatory Screenshots

### cqr
![][screen-cqr]
[screen-cqr]: http://i.imgur.com/Bp32j1V.png

### qrotp
![][screen-qrotp]
[screen-qrotp]: http://i.imgur.com/yVITFXq.png
