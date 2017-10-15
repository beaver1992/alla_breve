# frozen_string_literal: true

module Admin
  class WritingsController < BaseController
    before_action :set_type
    before_action :set_writing, expect: %i[index new create]

    def index
      @writings = @klass.ordered
    end

    def new
      @writing = @klass.new
    end

    def create
      @writing = Article.new(writing_params)
      if @writing.save
        redirect_to [:admin, @klass]
      else
        render :new
      end
    end

    def edit; end

    def update
      if @writing.update_attributes(writing_params)
        redirect_to [:admin, @klass], notice: 'Успех'
      else
        render :edit
      end
    end

    def destroy
      @writing.destroy
      redirect_to [:admin, @klass], notice: 'Успех'
    end

    private

    def set_writing
      @writing = @klass.find_by(id: params[:id])
    end

    def writing_params; end

    def set_type
      resource = request.path.split('/').reject { |r| r == 'admin' || r.blank? }.first
      @klass   = resource.singularize.capitalize.constantize
    end
  end
end
