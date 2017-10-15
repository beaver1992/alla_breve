# frozen_string_literal: true

class RedactorImage < ApplicationRecord
  include RedactorImageUploader::Attachment.new(:image)
end
