module Adonis
  module Core
    class Engine < ::Rails::Engine
      isolate_namespace Adonis::Core
      config.generators.api_only = true
    end
  end
end
