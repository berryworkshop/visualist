---
author:   Allan Berry
version:  1.0
---

notes
===
api first created with help from [an api tutorial online](https://x-team.com/blog/how-to-create-a-ruby-api-with-sinatra/)


start dev server
===
`shotgun server.rb`


insert records from json to db
===
`mongoimport --db visualist --collection events --file data/data_ingest/events.json --jsonArray --upsert --upsertFields slug`
