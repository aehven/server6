class ListComponent < BaseComponent
  def initialize(comp)
    @comp = comp
  end

  def header
    @comp.find("mat-card.list-header")
  end

  def items
    @comp.find_all("ion-item")
  end

  def item(index)
    items[index]
  end

  def [](index)
    items[index]
  end

  def check_item(index)
    items[index].find("mat-checkbox").click
  end

  def item_count
    items.count
  end

  def find_item(text)
    @comp.find("ion-item", text: text)
  end

  def new_item(klass)
    click_on "New #{klass}"
  end
end
