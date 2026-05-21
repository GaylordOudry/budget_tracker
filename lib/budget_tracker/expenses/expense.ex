defmodule BudgetTracker.Expenses.Expense do
  use Ecto.Schema
  import Ecto.Changeset

  @moduledoc """
  Expense entries.

  An expense without a creator is considered available to all users.
  """

  schema "expenses" do
    field :name, :string
    field :description, :string
    field :date, :date
    field :amount, :decimal
    field :creator_id, :id

    timestamps()
  end

  @doc false
  def changeset(expense, attrs) do
    expense
    |> cast(attrs, [:name, :description, :date, :amount])
    |> validate_required([:name, :description, :date, :amount])
    |> validate_number(:amount, greater_than: 0)
    |> validate_length(:name, max: 100)
    |> validate_length(:description, max: 200)
  end

  def put_creator_id(expense, creator_id) do
    change(expense, creator_id: creator_id)
  end

  def global?(expense), do: is_nil(expense.creator_id)
end
