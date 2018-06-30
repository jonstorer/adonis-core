require "adonis/core/engine"

module Adonis
  module Core
    cattr_accessor :address_service

    def self.config(&block)
      block.call(self)
    end

    # Your code goes here...
  end
end
