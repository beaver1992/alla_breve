# frozen_string_literal: true

module Admin
  class ArticlesController < WritingsController
    private

    def writing_params
      params.require(:article).permit(
        :name,
        :annotation,
        :body,
        :published_date,
        :preview,
        :active
      )
    end
  end
end
