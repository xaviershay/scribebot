ScribeBot
=========

A quick and dirty slack bot! Tell it things and it remembers them.

Set up as an outgoing webhook integration. Assumes `DATABASE_URL` env var
points at your database (which it does on heroku).

    heroku run rake db:migrate
    heroku config:set SLACK_TOKEN=yourtoken

Commands:

    xavier> scribe record this message
    scribebot> ✓
    xavier> scribe another one
    scribebot> ✓
    xavier> scribe stats
    scribebot> 2 messages recorded in last week
    xavier> scribe recent
    scribebot>
    2015-09-25 20:24:32 UTC xavier: another one
    2015-09-25 20:38:50 UTC xavier: record this message
