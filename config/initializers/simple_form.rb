# See https://github.com/heartcombo/simple_form#custom-components to know more.

SimpleForm.setup do |config|

  # Only one :default wrapper should be defined
  config.wrappers :default, class: 'form-inputs',
                  hint_class: :field_with_hint, error_class: :field_with_errors, valid_class: :field_without_errors do |b|

    b.use :html5
    b.use :placeholder

    # Use each input component only once
    b.use :label, class: "text-white text-lg mb-2"
    b.use :input, class: "form-input mt-1 block w-full border-gray-300 rounded-md shadow-sm"
    b.use :error, wrap_with: { tag: 'span', class: 'text-red-500' }
    b.use :hint,  wrap_with: { tag: 'span', class: 'text-gray-600' }

    # Optional extensions can be added here as needed
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly

  end

  # The default wrapper to be used by the FormBuilder.
  config.default_wrapper = :default

  # Other configurations can stay as they are.
  config.boolean_style = :nested
  config.button_class = 'btn'
  config.error_notification_tag = :div
  config.error_notification_class = 'error_notification'
  config.browser_validations = false
  config.boolean_label_class = 'checkbox'
end
