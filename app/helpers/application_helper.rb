module ApplicationHelper

  CASH_ACCOUNT = -1
  BANK_ACCOUNT = -2
  BUDGET_ACCOUNT = 0

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "DIE BIERLISTE"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end