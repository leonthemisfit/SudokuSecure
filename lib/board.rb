# frozen_string_literal: true

require 'sudoku_board'
require 'openssl'
require 'yaml'
require 'base64'

require_relative 'errors'

module Sudoku
  class Board
    include OpenSSL

    def self.verify(config)
      raise Errors::SecureBoard::BadArgumentError unless config.include?('pkey')
      raise Errors::SecureBoard::BadArgumentError unless config.include?('sig')
      raise Errors::SecureBoard::BadArgumentError unless config.include?('data')

      key = PKey::RSA.new(config['pkey'])
      dig = Digest::SHA256.new
      key.verify(dig, config['sig'], config['data'])
    end

    def self.load_file_secure(path)
      config = YAML.safe_load(File.read(path))

      raise Errors::SecureBoard::InsecureBoardError unless Board.verify(config)

      data = Base64.decode64(config['data'])
      Board.new(data, :binary)
    end

    def self.key_string_check(key)
      if File.exist?(key)
        PKey::RSA.new(File.read(key))
      else
        PKey::RSA.new(key)
      end
    end

    def self.key_check(key)
      if key.is_a?(PKey::RSA)
        key
      elsif key.is_a?(String)
        Board.key_string_check(key)
      else
        raise Errors::SecureBoard::KeyArgumentError
      end
    end

    def secure_data(key)
      key = Board.key_check(key)

      raise Errors::SecureBoard::PrivKeyError unless key.private?

      data = {}
      data['pkey'] = key.public_key.export
      data['data'] = Base64.encode64(serialize(:binary))
      dig = Digest::SHA256.new
      data['sig'] = key.sign(dig, data['data'])

      data
    end

    def save_secure(path, key)
      data = secure_data(key)
      yml = YAML.dump(data)
      File.open(path, 'w') { |f| f.write(yml) }
    end
  end
end
