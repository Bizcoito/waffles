#!/bin/bash
rm -rf /usr/src/bizcoito/tmp/pids/server.pid

bundle check > /dev/null 2>&1 || bundle install

bundle install
rails s
