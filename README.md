# instance_variables_from [![[version]](https://badge.fury.io/rb/instance_variables_from.svg)](http://badge.fury.io/rb/instance_variables_from)  [![[travis]](https://travis-ci.org/janlelis/instance_variables_from.png)](https://travis-ci.org/janlelis/instance_variables_from)

Automatically turn bindings or hashes into instance variables. Instead of:

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

Copyright (C) 2010-2016 Jan Lelis <http://janlelis.com>. Released under the MIT license.
