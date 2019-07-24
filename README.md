# Service Caller

### How to Use
* install gem
```
gem install service_caller-0.1.0.gem
```

* require gem
```ruby
require 'service_caller'
```

* define service & inherit from `ServiceCaller`
```ruby
class [Custom Service] < ServiceCaller
  def initialize(*args)
    ...
  end

  def call
    ...
  end
end
```

* call the service
```ruby
  service = [Custom Service].call(*args)
```

* check if success
```ruby
  service.success?
  service.failed?
```

* get success result if success
```ruby
  service.result
```

* get error if failed
```ruby
  service.error
```