class FlowersController < ApplicationController
  
    def create
        flower = Flower.create(flower_param)

        flower.save
        redirect_to garden_url(flower_param[:garden_id])
    end

    def destroy
        flower = Flower.find(params[:id])
        flower.destroy
        redirect_to garden_url(flower.garden_id)
    end


    private

    def flower_param
        self.params.require(:flower).permit(:flower_type, :gardener_id, :garden_id)
    end
end
