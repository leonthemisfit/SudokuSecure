# frozen_string_literal: true

module Sudoku
  module Errors
    module SecureBoard
      class BadArgumentError < StandardError
        def initialize(msg = 'Provided hash missing fields')
          super
        end
      end

      class InsecureBoardError < StandardError
        def initialize(msg = 'Board provided failed security checks')
          super
        end
      end

      class KeyArgumentError < StandardError
        def initialize(msg = 'Key must be RSA object, path, or string')
          super
        end
      end

      class PrivKeyError < StandardError
        def initialize(msg = 'Provided key must have privkey for saving')
          super
        end
      end
    end
  end
end
