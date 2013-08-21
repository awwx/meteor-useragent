fs = require 'fs'
path = require 'path'
https = require 'https'

version = process.argv[2]

unless version?
  console.log "Usage: coffee build.coffee <version>"
  console.log "Where version is a tag from https://github.com/3rd-Eden/useragent/releases"
  process.exit(1)


url = "https://raw.github.com/3rd-Eden/useragent/#{version}/lib/regexps.js"


withFetchedRegexps = (regexps) ->

  regexps =
    "// Based on https://github.com/3rd-Eden/useragent\n\n" +
    "exports.version = " +
    JSON.stringify(version.replace(/^v/, "")) +
    ";\n\n" +
    regexps

  # older browsers don't support `Object.create`
  regexps = regexps.replace(
    /Object\.create\(null\)/g,
    "{}"
  )

  fs.writeFileSync(path.join(__dirname, 'regexps.js'), regexps, "utf8")
  console.log "regexps.js written"
  process.exit(0)


https.get(url, (response) ->
  response.setEncoding('utf8')
  regexps = ''
  response.on('data', (chunk) ->
    regexps += chunk
    return
  )
  response.on('end', ->
    withFetchedRegexps(regexps)
    return
  )
).on('error', (err) ->
  console.log "unable to fetch #{url}: #{err.message}"
  process.exit(1)
)
