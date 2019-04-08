module CategoriesHelper
  def nested_categories(categories)
    content_tag(:ol, class: 'dd-list') do
      categories.map do |category, sub_categories|
        content_tag(:li, class: 'dd-item', data: {id: category.id} ) do
          render(category) + nested_categories(sub_categories)
        end
      end.join.html_safe
    end
  end

  def parent_category(category)
    category.parent.present? ? category.parent.id : nil
  end
end
