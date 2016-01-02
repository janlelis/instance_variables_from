require_relative "instance_variables_from/version"

module Kernel
  private

  def instance_variables_from(obj, *whitelist)
    values_to_assign = case obj
    when Binding
      obj.eval('local_variables').map{ |e| [obj.eval("#{e}"), e] }
    when Hash
      obj.map{|k,v| [v,k] }
    when Array
      obj.each.with_index
    end

    unless whitelist.empty?
      values_to_assign.select!{ |value, key| whitelist.include? key.to_sym }
    end

    values_to_assign.map{ |value, key|
      key = key.to_s
      ivar_name = :"@#{'_' if key =~ /\A\d/}#{key}"
      instance_variable_set(ivar_name, value)
      ivar_name
    }
  end
end

