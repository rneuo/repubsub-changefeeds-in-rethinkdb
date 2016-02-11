require 'rethinkdb'
require 'eventmachine'

include RethinkDB::Shortcuts

conn = r.connect(db: 'repubsub')
EventMachine.run do
  r.table('topics').changes().run(conn).each do |change|
    p change
  end
end
