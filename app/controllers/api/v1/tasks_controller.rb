# app/controllers/api/v1/tasks_controller.rb
module Api
  module V1
    class TasksController < ApplicationController
      before_action :set_task, only: [ :show, :update, :destroy ]

      def index
        tasks = Task.all
                    .by_status(params[:status])
                    .by_title(params[:title])
                    .by_description(params[:description])
                    .by_created_at(params[:created_at])
                    .by_due_date(params[:due_date])
        render json: tasks
      end

      def show
        render json: @task
      end

      def create
        task = Task.new(task_params)

        return render json: task if task.save!

        render json: task.errors, status: :unprocessable_entity
      end

      def update
        return  render json: @task if @task.update(task_params)

        render json: @task.errors, status: :unprocessable_entity
      end

      def destroy
        @task.update(status: "cancelled")
        render json: @task
      end

      private

      def set_task
        @task = Task.find(params[:id])
      end

      def task_params
        params.require(:task).permit(:title, :description, :status, :due_date)
      end
    end
  end
end
