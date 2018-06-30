require_dependency "adonis/core/application_controller"

module Adonis::Core
  class AddressController < ApplicationController
    def index
      Adonis::Core.address_service.lookup(params)
    end
  end
end
