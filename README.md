## Mounting Adonis::Core


#### What is Adonis::Core

Adonis Core is a rails app that has been configured to be "mountable". This is called a "Rails Engine". The code to make the rails app turn into a rails engine lives in `lib/adonis/core`. However, the rest of the app is in the normal place (app, config, db, bin, lib, etc)

There is a "dummy" rails app located at `test/dummy`. The Adonis::Core Rails Engine cannot be started on its own, and therefore needs to be mounted into another rails app to be tested.

Adonis::Core will be bundled as a `gem`. `test/dummy` would include the `adonis/core` gem. 

To start this app, `rails server` must be run from `test/dummy`.

#### Where is the magic

`lib/adonis/core.rb`

Make Adonis::Core configurable

```
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
```

-----

`test/dummy/config/initializers/engines.rb`

Load the Adonis::Core rails engine into memory

```
require 'adonis/core'
```

Load the AddressService, defined in the dummy app at `test/dummy/lib/address_service.rb`, into memory.

```
require 'address_service'
```

Configure Adonis::Core use AddressService as its address service.

```
Adonis::Core.config do |config|
  config.address_service = AddressService
end
```

-----

`test/dummy/config/routes.rb`

Load the Adonis::Core routes within the `test/dummy` app.

```
Rails.application.routes.draw do
  mount Adonis::Core::Engine => "/"
end
```

-----

`app/controllers/adonis/core/address_controller.rb`

Use the injected AddressService within the Adonis::Core app.

```
require_dependency "adonis/core/application_controller"

module Adonis::Core
  class AddressController < ApplicationController
    def index
      Adonis::Core.address_service.lookup(params)
    end
  end
end
```