class CategoryUpdateAncestryService
  # TODO add error handler
  attr_reader :tree_nodes, :errors

  def self.execute(params)
    new(params).tap(&:update_categories)
  end

  def initialize(params)
    @tree_nodes = params[:categories]
  end

  def update_categories
    ActiveRecord::Base.transaction do
      update_nodes(tree_nodes)
    end
  end

  def success?
    !failure?
  end

  def failure?
  end

  private

  def update_nodes(tree_nodes, parent_node = nil)
    tree_nodes.each do |item|
      node = Category.find(item['id'].to_s)
      node.parent = parent_node || nil
      node.save!
      update_nodes(item['children'], node) if item.has_key?('children')
    end
  end

end