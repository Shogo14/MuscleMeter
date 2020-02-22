class WorkMenusController < ApplicationController
    before_action :work_menu_types, only: [:create, :index, :new]
    before_action :training_body_parts, only: [:create, :index, :new]
    def index
        @work_menus = WorkMenu.all
    end

    def create
      @work_menu = WorkMenu.new(work_params)
      if @work_menu.save
        flash[:success] = "新しいトレーニングメニューの登録が完了しました。"
        redirect_to work_menus_url
      else
        flash[:info] = "失敗。"
        redirect_to work_menus_url
      end
    end

    def new
      @work_menu = WorkMenu.new
    end

    private
        def work_params
            params.require(:work_menu).permit(:name, :work_menu_type_id, :training_body_part_id)
        end

        def work_menu_types
          @work_menu_types = WorkMenuType.all
        end

        def training_body_parts
          @training_body_parts = TrainingBodyPart.all
        end
end
