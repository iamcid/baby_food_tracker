class BabyFoodsController < ApplicationController
    def new
        @baby_food = BabyFood.new
        @baby_food.build_category
    end

    def create
        @baby_food = BabyFood.new(baby_food_params)
        @baby_food.user_id = session[:user_id]

        if @baby_food.save
            flash[:message] = "Successful creation!"
            redirect_to baby_food_path(@baby_food)
        else
            flash[:message] = "Unsuccessful signup! Please try again!"
            @baby_food.build_user
            render :new
        end
    end

    def index
        @baby_foods = BabyFood.all
    end

    private

    def baby_food_params
        params.require(:baby_food).permit(:flavor, :description, :category_id, category_attributes: [:name])
    end
end
