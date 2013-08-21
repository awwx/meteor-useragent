camelCase = (name) ->
  parts = name.split(' ')
  parts[0] = parts[0].toLowerCase()
  for i in [1...parts.length]
    parts[i] = parts[i].charAt(0).toUpperCase() + parts[i].substr(1)
  return parts.join('')


number = (x) ->
  if /^\d+$/.test(x) then +x else x


parse = (userAgent, parsers) ->
  return {} unless userAgent
  for parser in parsers
    if res = parser[0].exec(userAgent)
      if parser[1]
        res[1] = parser[1].replace('$1', res[1]);
      break

  return {} unless parser and res

  family = res[1]
  major = parser[2] or res[2]
  minor = parser[3] or res[3]
  patch = parser[4] or res[4]

  result = {}
  result.family = camelCase(family) if family?
  result.major = number(major) if major?
  result.minor = number(minor) if minor?
  result.patch = number(patch) if patch?
  return result


parseUseragent = (userAgent) ->
  return {
    browser: parse(userAgent, exports.browser)
    os: parse(userAgent, exports.os)
    device: parse(userAgent, exports.device)
  }


if Meteor.isClient
  Useragent = parseUseragent(window.navigator.userAgent)
