class WorkOutsController < ApplicationController
  helper SessionsHelper
  before_action :new_work_out, only: [:index]
  before_action :training_types, only: [:create, :index]
  before_action :body_parts, only: [:create, :index]
  before_action :admin_user, only: [:destroy]
  def index
      @work_outs = WorkOut.all
  end

  def create
    @work_out = WorkOut.new(work_params)
    if @work_out.save
      flash[:success] = "新しいトレーニングメニューの登録が完了しました。"
      redirect_to work_outs_url
    else
      flash[:info] = "失敗。"
      redirect_to work_outs_url
    end
  end

  def destroy
    WorkOut.find(params[:id]).destroy
    flash[:success] = "トレーニングを削除しました。"
    redirect_to work_outs_url
  end

  private
      def work_params
          params.require(:work_out).permit(:name, :training_type_id, :body_part_id)
      end

      def new_work_out
        @work_out = WorkOut.new
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
