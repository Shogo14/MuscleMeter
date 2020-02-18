class WorkMenusController < ApplicationController
    before_action :index_work_menu, only: [:create, :index]
    before_action :work_menu_types, only: [:index]
    def index
        @work_menus = WorkMenu.all
    end

    def create
      @work_menu = WorkMenu.new(work_params)
      if @work_menu.save
        flash[:success] = "新しいトレーニングメニューの登録が完了しました。"
        redirect_to work_menus_url
      else
        # render 'new'
      end
    end

    private
        def index_work_menu
            @work_menu = WorkMenu.new
        end

        def work_params
            params.require(:work_menu).permit(:name, :work_type)
        end

        def work_menu_types
          @work_menu_types = WorkMenuType.all
        end
end
