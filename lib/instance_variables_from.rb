require_relative "instance_variables_from/version"

module Kernel
  private

  def instance_variables_from(obj, *only)
    iter = case obj
    when Binding
      obj.eval('local_variables').map{|e| [obj.eval("#{e}"), e] }
    when Hash
      obj.map{|k,v| [v,k] }
    else # Enumerable
      obj.each.with_index
    end

    ret = []
    iter.each{ |value, arg|
      arg = arg.to_s
      if only.include?(arg) || only.include?(arg.to_sym) || only.empty?
        arg = '_' + arg  if (48..57).member? arg.unpack('C')[0]  # 1.8+1.9
        ret << ivar = :"@#{arg}"
        self.instance_variable_set ivar, value
      end
    }
    ret
  end
end

