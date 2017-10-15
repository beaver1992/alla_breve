# frozen_string_literal: true

# == Schema Information
#
# Table name: writings
#
#  id             :integer          not null, primary key
#  name           :string
#  annotation     :text
#  active         :boolean          default(FALSE), not null
#  published_date :date
#  slug           :string
#  body           :text
#  type           :string
#  preview_data   :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Writing < ApplicationRecord
  include Slugable
  include PreviewUploader::Attachment.new(:preview)

  validates :name, :slug, :annotation, :body, presence: true

  scope :ordered, (-> { order(:published_date) })
  scope :show, (-> { where('published_date < ?', Time.now + 1.day).where(active: true).ordered })
end
