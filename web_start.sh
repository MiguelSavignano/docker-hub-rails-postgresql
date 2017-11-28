bundle install
npm install
rm -f tmp/pids/server.pid
bundle exec rails server -p 3000 -b 0.0.0.0