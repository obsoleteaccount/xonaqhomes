class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @rooms = @user.rooms

    #display all the guest reviews to host (if this user is a host)
    @guest_reviews = Review.where(type: "GuestReview", host_id: @user.id)

    #display all the host reviews to host (if this user is a host)
    @host_reviews = Review.where(type: "HostReview", guest_id: @user.id)
  end
end
