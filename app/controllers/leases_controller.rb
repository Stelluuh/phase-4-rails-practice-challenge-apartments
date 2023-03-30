class LeasesController < ApplicationController

    def create
        new_lease = Lease.create!(lease_params)
        render json: new_lease, status: :created
    end

    def destroy
        lease = find_lease
        lease.destroy
        head :no_content
    end



    private

    def find_lease
        lease.find(params[:id])
    end

    def lease_params
        params.permit(:rent)
    end
end
