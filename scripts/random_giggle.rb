#!/usr/bin/env ruby

require 'json'

words_list_file = File.join File.dirname(__FILE__), 'words.json'

words = JSON.parse(IO.read(words_list_file))['words']
puts words.sample
