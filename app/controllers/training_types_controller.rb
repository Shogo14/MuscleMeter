class TrainingTypesController < ApplicationController
    helper SessionsHelper
    before_action :new_training_type, only: [:index]
    def index
        @training_types = TrainingType.all
    end

    def create
      @training_type = TrainingType.new(training_type_params)
      if @training_type.save
        flash[:success] = "新しいトレーニングメニューの登録が完了しました。"
        redirect_to training_types_url
      else
        flash[:info] = "失敗。"
        redirect_to training_types_url
      end
    end
  
    def destroy
      TrainingType.find(params[:id]).destroy
      flash[:success] = "トレーニング種類を削除しました。"
      redirect_to training_types_url
    end

    private
        def training_type_params
            params.require(:training_type).permit(:name)
        end
  
        def new_training_type
          @training_type = TrainingType.new
        end
end
