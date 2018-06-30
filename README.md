## Mounting Adonis::Core


#### What is Adonis::Core

Adonis Core is a rails app that has been configured to be "mountable". This is called a "Rails Engine". The code to make the rails app turn into a rails engine lives in `lib/adonis/core`. However, the rest of the app is in the normal place (app, config, db, bin, lib, etc)

There is a "dummy" rails app located at `test/dummy`. The Adonis::Core Rails Enginer cannot be started on its own, and therefor needs to be mounted into another rails app to be tested.

This means, to start this app, `rails server` must be run from `test/dummy`.

#### Where is the magic

In `test/dummy/config/initializers/engines.rb`

Load the Adonis::Core rails engine into memory

```
require 'adonis/core'
```

Load the AddressService, defined in the dummy app, into memory

```
require 'address_service'
```

Configure Adonis::Core use AddressService as its address service.

```
Adonis::Core.config do |config|
  config.address_service = AddressService
end
```

Use the injected AddressService within the Adonis::Core app.

```
# app/controllers/adonis/core/address_controller.rb

require_dependency "adonis/core/application_controller"

module Adonis::Core
  class AddressController < ApplicationController
    def index
      Adonis::Core.address_service.lookup(params)
    end
  end
end
```