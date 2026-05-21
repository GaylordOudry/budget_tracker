defmodule BudgetTracker.Repo.Migrations.CreateExpense do
  use Ecto.Migration

  def change do
    create table(:expenses) do
      add :name, :string, null: false
      add :description, :string, null: false
      add :date, :date, null: false
      add :amount, :decimal, null: false
      add :creator_id, references(:users), null: true

      timestamps()
    end

    create index(:expenses, [:creator_id])
  end
end
