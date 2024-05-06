module ApplicationHelper
  def navbar_link(text, path)
    link_to I18n.t(text), path,
            class: " text-blueshadown py-2 px-3 md:text-white md:bg-transparent text-blue-300 hover:text-blue-700 md:p-0",
            aria: { current: "page" }
  end
end
