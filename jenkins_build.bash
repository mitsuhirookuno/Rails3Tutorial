#!/bin/bash
source ~/.bash_profile
bundle install --path vendor/bundler
bundle exec rspec
if [ $? -ne 0 ]; then
  exit 1
fi
bundle exec flay app lib -d > tmp/flay_report.txt
bundle exec brakeman -o tmp/brakeman-output.tabs
bundle exec rails_best_practices -f html --output-file tmp/rails_best_practices_output.html
find app/controllers -name "*.rb" | xargs bundle exec roodi1.9 | tee tmp/roodi_report.txt
find app/models -name "*.rb" | xargs bundle exec roodi1.9 | tee -a tmp/roodi_report.txt
find lib -name "*.rb" | xargs bundle exec roodi1.9 | tee -a tmp/roodi_report.txt
bundle exec yardoc --markup=markdown
