#!/bin/bash
source ~/.bash_profile
bundle install --path vendor/bundler
bundle exec rspec
bundle exec flay app


