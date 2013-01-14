#!/bin/bash
source ~/.bash_profile
bundle install --path vendor/bundler
bundle exec rspec
bundle exec flay app > tmp/flay_report.txt
bundle exec brakeman -o tmp/brakeman-output.tabs
