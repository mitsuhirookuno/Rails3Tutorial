#!/bin/bash
source ~/.bash_profile
ruby -v
bundle install --path vendor/bundler
bundle exec rspec


