#!/bin/bash
rm -rf /usr/src/bizcoito/tmp/pids/server.pid

bundle install
rails s
