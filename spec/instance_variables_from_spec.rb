require_relative "../lib/instance_variables_from"
require "minitest/autorun"

describe 'Kernel#instance_variables_from' do
  it 'transforms the given parameter to instance variables when in it is a binding' do
    def example_method(a = 1, b = 2)
      instance_variables_from binding
    end

    example_method
    assert_equal 1, @a
    assert_equal 2, @b
  end

  it 'transforms the given parameter to instance variables when in it is a hash' do
    params = { c: 3, d: 4 }
    instance_variables_from params

    assert_equal 3, @c
    assert_equal 4, @d
  end

  it 'transforms the given parameter to instance variables when in it is an array' do
    list = %w[instance variable]
    instance_variables_from list
    assert_equal "instance", @_0
    assert_equal "variable", @_1
  end

  it 'takes a whitelist as splat param' do
    params = { c: 3, d: 4 }
    instance_variables_from params, :c

    assert_equal 3, @c
    assert_equal false, instance_variables.include?(:@d)
  end

  it 'returns the instance variable names assigned' do
    assert_equal [:@c, :@d], instance_variables_from({ c: 3, d: 4 })
  end
end
