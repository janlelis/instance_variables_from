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
end
