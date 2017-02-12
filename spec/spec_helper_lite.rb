require 'rr'
# https://groups.google.com/d/msg/objects-on-rails/cZS32NT-t1U/IaR3lsDsVpQJ
def stub_class(full_name)
  full_name.to_s.split(/::/).inject(Object) do |context, name|
    begin
      context.const_get(name)
    rescue
      context.const_set(name, Class.new{def initialize(*args); end })
    end
  end
end

def stub_module(full_name)
  full_name.to_s.split(/::/).inject(Object) do |context, name|
    begin
      context.const_get(name)
    rescue NameError
      context.const_set(name, Module.new)
    end
  end
end
