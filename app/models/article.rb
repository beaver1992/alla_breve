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

class Article < Writing
end
