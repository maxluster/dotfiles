class Api::AccountEventUsageController < Api::BaseController
  before_action :load_account
  before_action :ensure_admin
  # before_action :enforce_features

  def index
    event_usage = EventUsage::Timeline.new(@account.id, type: :account)
    event_usage = EventUsage.filter_rejected event_usage

    render json: event_usage.map { |e| AccountEventUsageApiView.new e }
  end

  private

  def load_account
    @account = model_for_auth_scope(Account, params[:organization_id])
    render(json: { errors: ['Organization not found'] }, status: :not_found) unless @account
  end

  def ensure_admin
    # only admins can access this information, if current_bugsnag_user is nil
    # then they are authenticated via the accounts api token
    if current_bugsnag_user && !current_bugsnag_user.is_account_admin?(@account)
      render json: { errors: ["Admin permissions on the organization required"] }, status: :forbidden
    end
  end

  def enforce_features
    unless @account.feature_enabled?("event-usage")
      render_error("Event Usage is not available on current plan", :forbidden)
    end
  end
end
