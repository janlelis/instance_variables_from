# Kernel#instance_variables_from [![[version]](https://badge.fury.io/rb/instance_variables_from.svg)](http://badge.fury.io/rb/instance_variables_from) [![[ci]](https://github.com/janlelis/instance_variables_from/workflows/Test/badge.svg)](https://github.com/janlelis/instance_variables_from/actions?query=workflow%3ATest)

Automatically turn bindings, hashes or arrays into instance variables. Instead of:

```ruby
def initialize(a, b)
  @a = a
  @b = b
end
```

You can write:

```ruby
def initialize(a, b)
  instance_variables_from binding # will assign @a and @b
end
```

It also works with hashes:

```ruby
params = { c: 3, d: 4 }
instance_variables_from params # will assign @c and @d
```

It also works with arrays:

```ruby
list = %w[instance variable]
instance_variables_from list # will assign @_0 and @_1
```

When you pass additional arguments, they will be interpreted as whitelist:

```ruby
params = { c: 3, d: 4 }
instance_variables_from params, :c # will only assign @c
```

## Setup

Add to your `Gemfile`:

```ruby
gem 'instance_variables_from'
```


## MIT License

Copyright (C) 2010-2016 Jan Lelis <https://janlelis.com>. Released under the MIT license.
