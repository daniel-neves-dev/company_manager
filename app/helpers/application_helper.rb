module ApplicationHelper
  def navbar_link(text, path)
    link_to I18n.t(text), path,
            class: "py-2 px-3 text-white bg-blue-700 rounded hover:bg-blue-800 md:bg-transparent md:text-blue-300 md:hover:text-blue-500 md:p-0", aria: { current: "page" }
  end
end
