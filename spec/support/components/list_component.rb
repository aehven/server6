class ListComponent < BaseComponent
  def initialize(comp)
    @comp = comp
  end

  def header
    @comp.find("mat-card.list-header")
  end

  def items
    @comp.find_all("mat-card.list-item")
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
    @comp.find("mat-card.list-item", text: text)
  end

  def new_item(klass)
    click_on "New #{klass}"
  end

  def per_page
    @comp.find(".mat-select-value").text
  end
  def per_page=(value)
    @comp.find(".mat-select-value").click
    @comp.find(".mat-option-text", text: value, match: :prefer_exact).click
    wait
  end

  def next_page
    @comp.find(".mat-paginator-navigation-next").click
    wait
  end

  def previous_page
    @comp.find(".mat-paginator-navigation-previous").click
    wait
  end
end
