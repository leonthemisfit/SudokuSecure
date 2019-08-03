# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = 'sudoku_secure'
  s.version = '0.0.1'
  s.license = 'MIT'
  s.summary = 'Add-on library for sudoku_board to add security to serialization'
  s.author = 'leonthemisfit'
  s.email = 'leonthemisfit@gmail.com'
  s.files = [
    'lib/board.rb',
    'lib/errors.rb',
    'lib/sudoku_secure.rb'
  ]
  s.add_runtime_dependency 'sudoku_board', '~> 0.0', '>= 0.0.1'
end
