class TasksController < ApplicationController
	before_action :set_task, only: [:show, :edit, :update, :destroy]

	def index
		# Taskモデルを用いて、DBの全データを抽出
		@tasks = Task.all
	end
	
	def create
		# new のページから送信されるフォームを処理
		@task = Task.new(task_params)
		
		if @task.save
			flash[:success] = 'Taskが正常に登録されました.'
			# redirect_to でcreateアクション後にshowアクションを実行し、show.html.erbを呼び出す.
			redirect_to @task
		else
			flash.now[:danger] = 'Taskが登録されませんでした.'
			render :new
		end
	end
	
	def new
		# フォームの入力項目のためにインスタンスを作成
		@task = Task.new
	end
	
	def show
		# @task = Task.find(params[:id])
		# set_task
	end
	
	def update
		# @task = Task.find(params[:id])
		# set_task
		if @task.update(task_params)
			flash[:success] = 'Task は正常に更新されました'
			redirect_to @task
		else
			flash.now[:danger] = 'Task は更新されませんでした'
			render :edit
		end
	end
	
	def destroy
		# @task = Task.find(params[:id])
		# set_task
		@task.destroy
		
		flash[:success] = 'Task は正常に削除されました'
		redirect_to tasks_url
	end
	
	def edit
		# @task = Task.find(params[:id])
		# set_task
	end

	private
	
	def set_task
		@task = Task.find(params[:id])
	end
	
	# Strong Parameter
	def task_params
		#レコードからcontentのみを取り出す
		#params.require(:task).permit(:content)
		params.require(:task).permit(:content, :status)
	end

end

