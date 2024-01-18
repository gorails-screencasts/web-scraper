class Page < ApplicationRecord
  belongs_to :last_result, class_name: "Result", optional: true
  has_many :results

  validates :name, presence: true
  validates :url, presence: true
  validates :check_type, presence: true
  validates :selector, presence: true
  validates :match_text, presence: {if: ->{ check_type == "text" }}

  def check_and_notify
    check
    last_result.notify
  end

  def check
    scraper = Scraper.new(url)
    result = case check_type
             when "text"
               scraper.text(selector: selector).downcase == match_text.downcase
             when "exists"
               scraper.present?(selector: selector)
             when "not_exists"
               !scraper.present?(selector: selector)
             end
    result = results.create(success: result)
    update(last_result: result)
  end
end
