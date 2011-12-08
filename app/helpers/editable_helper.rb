module EditableHelper
  # include ActionView::Helpers::AssetTagHelper::JavascriptTagHelpers::ClassMethods
  def editor(ob, method, options = {})
    name = ob.class.to_s.underscore
    attrs = ""
    options.each do |k,v|
      attrs += " #{k}=\"#{v}\""
    end
    source = ob.send("#{method.to_s}_source".to_sym)
    "#{editable_assets(source.processor)}<textarea id=\"#{name}_#{method.to_s}\" name=\"#{name}[#{method.to_s}]\" class=\"#{name}\" #{attrs}>#{source.editable_data}</textarea>"
  end
  
  def editable_assets(processor)
    file = Editable::Source::ASSETS[processor]
    return javascript_include_tag("javascripts/editable/#{file}") unless file.nil?
    return nil
  end
end
