Tinytest.add "useragent", (test) ->
  test.equal(
    parseUseragent(
      "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/28.0.1500.71 Chrome/28.0.1500.71 Safari/537.36"
    ),
    {
      browser: { family: 'chromium', major: 28, minor: 0, patch: 1500 },
      os: { family: 'ubuntu' },
      device: {}
    }
  )

  test.equal(
    parseUseragent(
      "Mozilla/5.0 (iPad; CPU OS 5_1_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9B206 Safari/7534.48.3"
    ),
    {
      browser: { family: 'mobileSafari', major: 5, minor: 1 },
      os: { family: 'ios', major: 5, minor: 1, patch: 1 },
      device: { family: 'ipad' }
    }
  )

  test.equal(
    parseUseragent(
      "Mozilla/5.0 (iPad; CPU OS 5_1_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) CriOS/27.0.1453.10 Mobile/9B206 Safari/7534.48.3 (8CC25720-7902-49DC-BE08-02AC893DDF14)"
    ),
    {
      browser: { family: 'chromeMobileIOS', major: 27, minor: 0, patch: 1453 },
      os: { family: 'ios', major: 5, minor: 1, patch: 1 },
      device: { family: 'ipad' }
    }
  )
