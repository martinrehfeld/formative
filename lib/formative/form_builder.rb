# encoding: utf-8

module Formative
  class FormBuilder < ::ActionView::Helpers::FormBuilder

    %w[text_field select collection_select password_field text_area date_select].each do |method_name|
      define_method(method_name) do |field_name, *args|
        content_tag(wrapper(*args), (field_label(field_name, *args) + super(field_name, *args) + unit(*args) + hint(*args)).html_safe, :class => wrapper_class(method_name, field_name))
      end
    end

    def check_box(field_name, options = {}, checked_value = "1", unchecked_value = "0")
      content_tag(wrapper(options), super + field_label(field_name, options) + unit(options) + hint(options).html_safe, :class => wrapper_class('check_box', field_name))
    end

    private

      def content_tag(tag, content, *args)
        return content unless tag
        @template.content_tag(tag, content, *args)
      end

      def field_label(field_name, *args)
        options = args.extract_options!
        return '' if options[:label] == false
        options.reverse_merge!(:required => field_required?(field_name))
        options[:label_class] = 'required' if options[:required]
        label(field_name, options[:label], :class => options[:label_class])
      end

      def hint(*args)
        options = args.extract_options!
        return '' if options[:hint] == false || options[:hint].blank?
        content_tag(:span, options[:hint], :class => 'hint')
      end

      def unit(*args)
        options = args.extract_options!
        return '' if options[:unit] == false || options[:unit].blank?
        content_tag(:span, options[:unit], :class => 'unit')
      end

      def field_required?(field_name)
        object.class.reflect_on_validations_for(field_name).map(&:macro).include?(:validates_presence_of) if object.class.respond_to?(:reflect_on_validations_for)
      end

      def wrapper(*args)
        options = args.extract_options!
        options[:wrapper] == false ? nil : (options[:wrapper] || :p)
      end

      def wrapper_class(method_name, field_name)
        "field #{method_name.to_s.dasherize} #{field_name.to_s.dasherize}"
      end

      def objectify_options(options)
        filter_custom_options(super)
      end

      def filter_custom_options(options)
        options.except(:label, :required, :label_class, :wrapper, :hint, :unit)
      end

  end
end
