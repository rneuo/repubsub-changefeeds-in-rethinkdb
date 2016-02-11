require 'rethinkdb'
require_relative 'repubsub'

include RethinkDB::Shortcuts

exchange = Repubsub::Exchange.new(:topics, db: :repubsub, host: 'localhost', port: 28015)
exchange.topic("topics.subtopics").publish({ notice: "topic changed" })
