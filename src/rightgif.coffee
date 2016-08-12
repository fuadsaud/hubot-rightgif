module.exports = (bot) ->
  bot.respond /gif( me)? (.+)/i, (msg) ->
   rightGif msg.match[2], (url) ->
     msg.send url

rightGif = (query, cb) ->
  url = 'https://rightgif.com/search/web'

  msg.http(url)
    .post(text: query) (err, res, body) ->
      if err or res.statusCode isnt 200
        msg.send 'I got an error from rightgif :()'
        return

      msg.send JSON.parse(response).url
