require 'rethinkdb'
require_relative 'repubsub'

include RethinkDB::Shortcuts

exchange = Repubsub::Exchange.new(:topics, db: :repubsub, host: 'localhost', port: 28015)
queue = exchange.queue{|topic| topic.match('topics.subtopics.*')}

queue.subscription.each do |topic,payload|
  puts "I got the topic: #{topic}"
  puts "With the message: #{payload}"
end

