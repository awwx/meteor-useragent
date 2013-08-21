# useragent

Extract available browser, device, and OS version information from the
user agent string.

(While it is better to do feature detection when we can, sadly
sometimes we need to fall back on looking at version numbers to avoid
particular browser or device bugs).

The intent and purpose of this package is to return the *same*
information on both the client and the server.

Thus this package is by design limited to information available in
just the user agent string.  On the client often more information can
be obtained about the runtime environment... but, since that's not
available on the server, it's left to other client packages to make
additional client information available.


## Version

0.0.1

This package supports Meteor 0.6.5 and above.

Based on
[3rd-Eden/useragent](https://github.com/3rd-Eden/useragent)
version 2.0.7.


## User agent description

The user agent description object returned by the API is a plain
JavaScript value object, containing `browser`, `os`, and `device`
fields.

Each contains `family`, `major`, `minor`, and `patch`, *when available
in the user agent string*.  The family is a string in camel case (for
example, "mobileSafari"); while major, minor, and patch can either be
integers or occasionally strings (such as "beta").

For example, here is Chrome for iOS running on an iPad:

```
{
  browser: { family: 'chromeMobileIOS', major: 27, minor: 0, patch: 1453 },
  os: { family: 'ios', major: 5, minor: 1, patch: 1 },
  device: { family: 'ipad' }
}
```

Notice how we can distinguish between the operating system (iOS 5.1.1)
and the device the OS is running on (an iPad).

While here is Chrome running on Ubuntu:

```
{
  browser: { family: 'chromium', major: 28, minor: 0, patch: 1500 },
  os: { family: 'ubuntu' },
  device: {}
}
```

Less OS and device information is present in this user agent string.
(We get what the browser gives us).


## API

### parseUseragent

`parseUseragent(userAgent)`  *anywhere*

Parses the passed user agent string and returns the user agent
description.

On the server in a connect handler, the user agent string can be found
in `req.headers['user-agent']`.


### Useragent

`Useragent`  *client*

A user agent description object, created from
[window.navigator.userAgent](https://developer.mozilla.org/en-US/docs/Web/API/window.navigator.userAgent).


## Support

If you find this package useful,
[donate](https://www.gittip.com/awwx/) to support ongoing maintenance
and development.
