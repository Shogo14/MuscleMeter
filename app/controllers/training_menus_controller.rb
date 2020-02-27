class TrainingMenusController < ApplicationController
    helper SessionsHelper
    before_action :new_training_menu, only: [:index]
    before_action :training_types, only: [:create, :index]
    before_action :body_parts, only: [:create, :index]
    before_action :admin_user, only: [:destroy]
    def index
        @training_menus = TrainingMenu.all
    end
  
    def create
      @training_menu = TrainingMenu.new(training_menu_params)
      if @training_menu.save
        flash[:success] = "新しいトレーニングメニューの登録が完了しました。"
        redirect_to training_menus_url
      else
        flash[:info] = "失敗。"
        redirect_to training_menus_url
      end
    end
  
    def destroy
      TrainingMenu.find(params[:id]).destroy
      flash[:success] = "トレーニングを削除しました。"
      redirect_to training_menus_url
    end
  
    private
        def training_menu_params
            params.require(:training_menu).permit(:name, :training_type_id, :body_part_id)
        end
  
        def new_training_menu
          @training_menu = TrainingMenu.new
        end
  
        def training_types
          @training_types = TrainingType.all
        end
  
        def body_parts
          @body_parts = BodyPart.all
        end
  
        # 管理者かどうか確認
        def admin_user
          redirect_to(root_url) unless current_user.admin?
        end
end
