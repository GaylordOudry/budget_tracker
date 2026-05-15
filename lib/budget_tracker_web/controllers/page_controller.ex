defmodule BudgetTrackerWeb.PageController do
  use BudgetTrackerWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
