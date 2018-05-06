# frozen_string_literal: true

require 'rake/testtask'

task default: :test

Rake::TestTask.new do |t|
  t.warning = true
  t.verbose = false
  t.test_files = FileList['test/*_test.rb']
end
