module EditableHelper
  def editor(ob, method, options = {})
    name = ob.class.to_s.underscore
    attrs = ""
    options.each do |k,v|
      attrs += " #{k}=\"#{v}\""
    end
    source = ob.send("#{method.to_s}_source".to_sym)
    "#{source.editor_assets}<textarea id=\"#{name}_#{method.to_s}\" name=\"#{name}[#{method.to_s}]\" class=\"#{name}\" #{attrs}>#{source.editable_data}</textarea>"
  end
end
