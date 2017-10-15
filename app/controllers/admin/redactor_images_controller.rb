# frozen_string_literal: true

module Admin
  class RedactorImagesController < ApplicationController
    def create
      r_img = RedactorImage.new(r_image_params)

      respond_to do |format|
        if r_img.save
          data = {
            image_url: r_img.image_url
          }
          format.json { render json: data.to_json, status: :created }
        else
          format.json { render json: r_img.errors, status: :unprocessable_entity }
        end
      end
    end

    private

    def r_image_params
      params.require(:redactor_image).permit(:image)
    end
  end
end
