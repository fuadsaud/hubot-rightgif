# Description:
#   Pulls gifs from rightgif.com
#
# Commands:
#   hubot gif [me] <search term>
#
# Author:
#   fuadsaud

module.exports = (bot) ->

  bot.respond /gif( me)? (.+)/i, (msg) ->
   rightGif msg, msg.match[2], (url) ->
     msg.send url

rightGif = (msg, query, cb) ->
  url = 'https://rightgif.com/search/web'
  data = JSON.stringify(text: query)

  msg.http(url)
    .header('Content-Type', 'application/json')
    .post(data) (err, res, body) ->
      if err or res.statusCode isnt 200
        msg.send 'I got an error from rightgif :('
        return

      msg.send JSON.parse(body).url
