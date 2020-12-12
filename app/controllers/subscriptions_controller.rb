class SubscriptionsController < ApplicationController
  before_action :set_event, only: [:create, :destroy]
  before_action :set_subscription, only: [:destroy]

  # POST /subscriptions
  def create
    @new_subscription = @event.subscriptions.build(subscription_params)
    @new_subscription.user = current_user unless @event.user == current_user

    if @new_subscription.save
      redirect_to @event, notice: I18n.t('pages.subscriptions.create.created')
    else
      render 'events/show', alert: I18n.t('pages.subscriptions.create.not_created')
    end
  end

  # DELETE /subscriptions/1
  def destroy
    message = nil
    if current_user_can_edit?(@subscription)
      @subscription.destroy
      message = {notice: I18n.t('pages.subscriptions.destroy.destroyed')}
    else
      message = {alert: I18n.t('pages.subscriptions.destroy.not_destroyed')}
    end

    redirect_to @event, message
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_subscription
    @subscription = @event.subscriptions.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  # Only allow a trusted parameter "white list" through.
  def subscription_params
    params.fetch(:subscription, {}).permit(:user_email, :user_name)
  end
end
