class TrainingMenusController < ApplicationController
    helper SessionsHelper
    before_action :admin_user, only: [:destroy]
    def index
        @training_menus = TrainingMenu.all
    end

    def new
      @training_menu = TrainingMenu.new
      @training_types = TrainingMenu.group(:training_type).order(:training_type).pluck(:training_type)
      @body_parts = TrainingMenu.group(:body_part_main).order(:body_part_main).pluck(:body_part_main)
      @body_parts.push(TrainingMenu.group(:body_part_sub1).order(:body_part_sub1).pluck(:body_part_sub1)).push(TrainingMenu.group(:body_part_sub2).order(:body_part_sub2).pluck(:body_part_sub2))
      @body_parts.flatten!.uniq!
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
  
        # 管理者かどうか確認
        def admin_user
          redirect_to(root_url) unless current_user.admin?
        end
end
