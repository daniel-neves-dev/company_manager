# See https://github.com/heartcombo/simple_form#custom-components to know more.

SimpleForm.setup do |config|

  # Only one :default wrapper should be defined
  config.wrappers :default, class: 'form-inputs',
                  hint_class: :field_with_hint, error_class: :field_with_errors, valid_class: :field_without_errors do |b|

    b.use :html5
    b.use :placeholder

    # Use each input component only once
    b.use :label, class: "text-gray-800 text-lg mb-2 w-full dark:text-white"
    b.use :input, class: "bg-gray-50 border-gray-600 text-gray-800 placeholder-gray-800 rounded-lg w-full"
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
