class WorkOutsController < ApplicationController
    helper SessionsHelper
    before_action :training_menus
    def index
        @work_outs = WorkOut.where(user_id: current_user.id).order(params[:sort]).paginate(page: params[:page])
    end

    def new
        @work_out = WorkOut.new
    end

    def create
        @work_out = WorkOut.new(work_out_params)
        if @work_out.save
          flash[:info] = "登録完了！"
          redirect_to new_work_out_url
        else
          render 'new'
        end
    end

    private
        def training_menus
            @training_menus = TrainingMenu.all
        end

        def work_out_params
          params.require(:work_out).permit(:training_date, 
                                            :user_id, 
                                            :training_menu_id,
                                            :weight,
                                            :rep,
                                            :set)
        end
end
