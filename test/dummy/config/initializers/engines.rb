
require "adonis/core"

require 'address_service'

Adonis::Core.config do |config|
  config.address_service = AddressService
end
